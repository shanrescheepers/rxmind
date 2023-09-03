//
//  rxmind_widget.swift
//  rxmind_widget
//
//  Created by Mac on 2023/09/03.
//

import WidgetKit
import SwiftUI
import Intents

import HealthKit

let healthStore = HKHealthStore()

func requestHealthKitAuthorization() {
    let typesToRead: Set<HKSampleType> = [HKObjectType.quantityType(forIdentifier: .heartRate)!]

    healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
        if success {
            // Authorization granted, you can now access heart rate data.
        } else if let error = error {
            // Handle the error appropriately.
            print("HealthKit authorization error: \(error.localizedDescription)")
        }
    }
}

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct rxmind_widgetEntryView : View {
    var entry: Provider.Entry
    @AppStorage("heartRate") private var heartRate: String = "0"
    @AppStorage("stepsCount") private var stepsCount: String = "0"

    var body: some View {
        ZStack {
            
            VStack {
                    ZStack{
                        Text(" \(Int(heartRate) ?? 0) BPM")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .fontWeight(.medium).padding(.horizontal)
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                            .frame(width: 80, height: 80)
                           
                        
                        Circle()
                            .trim(from: 0.0, to: CGFloat(min((Double(heartRate) ?? 0) / 200, 1.0)))
                        
                            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color(#colorLiteral(red: 0.3568627536, green: 0.2274509817, blue: 0.850980401, alpha: 1)))
                            .rotationEffect(Angle(degrees: 270.0))
                            .frame(width: 80, height: 80)
                         
                            .animation(.easeIn(duration: 3.5))
                            .onAppear {
                             
                            }
                        
                       
                    }.frame(width: 200, height: 100).padding(.top,0)
                HStack{
                    Text("your")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .fontWeight(.medium).padding(.bottom,3)
                    Image("h").resizable().frame(width: 13, height: 13)
                     .padding(.bottom,3)
                    
                    Text("x breathe")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .fontWeight(.bold).padding(.bottom,3)
                }
            }
        }
        .frame(width: 200, height: 160)
        .background(Color(red: 0.173, green: 0.224, blue: 0.227))
        .onAppear {
            // Fetch the heart rate data and daily steps when the view appears
            fetchHeartRate()
            fetchDailySteps()
            
            // Update the heart rate and daily steps every one second
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                fetchHeartRate()
                fetchDailySteps()
            }
        }
    }
    
    // HealthKit Manager
    private let healthStore = HKHealthStore()
    
    // Function to fetch heart rate data
    private func fetchHeartRate() {
        let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
       
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
       
        let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { query, results, error in
            if let heartRateSample = results?.first as? HKQuantitySample {
                let heartRateValue = heartRateSample.quantity.doubleValue(for: HKUnit.count().unitDivided(by: HKUnit.minute()))
               
                // Update the @AppStorage property
                self.heartRate = String(format: "%.0f", heartRateValue)
            } else if let error = error {
                // Handle the error appropriately.
                print("Error fetching heart rate data: \(error.localizedDescription)")
            }
        }
       
        healthStore.execute(query)
    }
    
    // Function to fetch daily steps data
    private func fetchDailySteps() {
        let stepsType = HKObjectType.quantityType(forIdentifier: .stepCount)!
       
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
       
        let calendar = NSCalendar.current
        let now = Date()
        let components = calendar.dateComponents([.year, .month, .day], from: now)
        let startDate = calendar.date(from: components)!
        let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
       
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
       
        let query = HKSampleQuery(sampleType: stepsType, predicate: predicate, limit: 1, sortDescriptors: [sortDescriptor]) { query, results, error in
            if let stepsSample = results?.first as? HKQuantitySample {
                let stepsCountValue = stepsSample.quantity.doubleValue(for: HKUnit.count())
               
                // Update the @AppStorage property
                self.stepsCount = String(format: "%.0f", stepsCountValue)
            } else if let error = error {
                // Handle the error appropriately.
                print("Error fetching daily steps data: \(error.localizedDescription)")
            }
        }
       
        healthStore.execute(query)
    }
}





struct rxmind_widget: Widget {
    let kind: String = "rxmind_widget"
    

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            rxmind_widgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct rxmind_widget_Previews: PreviewProvider {
    static var previews: some View {
        rxmind_widgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
