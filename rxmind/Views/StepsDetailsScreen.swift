import SwiftUI
import HealthKit
import HealthKitUI
import Foundation

enum TimeIntervalOption: String, CaseIterable {
    case hour = "Hour"
    case day = "Day"
    case week = "Week"
    case month = "Month"
}

struct StepData {
    let date: Date
    let steps: Double
}

struct StepsDetailsScreen: View {
    
    
    @ObservedObject var manager:  HealthKitManager = HealthKitManager()
    
    @State private var stepCount: Double?
    
    @State private var isAnimating = true
    @State private var progress: Double = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPresented = false // Added state variable for animation
    @State private var inputData = ""
    
    let healthStore = HKHealthStore()
    
    @State private var selectedInterval: TimeIntervalOption = .day
    @State private var stepData: [StepData] = []
    
    private let stepDataGenerator = StepDataGenerator()

    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        UISegmentedControl.appearance().backgroundColor = .white
    }
    let currentDate = Date()
    
    //        For the date picker
    
    //  Date picker
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            //        2nd VStack
            Image("b").resizable()
            
         
            VStack{
                ZStack{
                    Color.black.opacity(0.5).cornerRadius(100)
                    HStack{
                        
                        Image("steps")
                            .resizable()
                            .frame(width: 40, height: 60)
                        
                        Text("Your   Steps")
                            .font(.system(size: 16)).fontWeight(.black)
                            .foregroundColor(.white)
                            .padding()
                    }.padding()
                }.padding(.top,-80).frame(width: 300, height: 20)
  
                
                ZStack{
                    Color.black.opacity(0.5).cornerRadius(12)
                    VStack{
                        HStack{
                            
                            Text("Average steps taken")
                                .font(.system(size: 14)).fontWeight(.light)
                                .foregroundColor(Color.white).padding(.leading,5)
                            Spacer()
                            Text("Thus far")
                                .font(.system(size: 14)).fontWeight(.light)
                                .foregroundColor(Color.white).padding()
                            
                            if let stepCount = stepCount {
                                            Text("\(Int(stepCount))")
                                              .font(.system(size: 14)).fontWeight(.black)
                                                .foregroundColor(Color(#colorLiteral(red: 0.3568627536, green: 0.2274509817, blue: 0.850980401, alpha: 1))).padding(.leading,-3)
                                        } else {
                                            Text("Fetching step count...")
                                                .font(.title)
                                        }
                                
                            
                        }.padding(.top,-10)
                        
                        HStack{
                            
                            // Picker for time interval selection
                            Picker("Select Interval", selection: $selectedInterval) {
                                ForEach(TimeIntervalOption.allCases, id: \.self) { option in
                                    Text(option.rawValue).tag(option)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle()).frame(width: 280, height: 40).padding(.top,10)
                            .onChange(of: selectedInterval, perform: { _ in
                                loadStepData()
                            })
                            
                        }
                        VStack{
                            //                      Bar chart here
                            BarChartView(stepData: stepData, selectedInterval: selectedInterval)
                                .onAppear(perform: loadStepData)
                            
                        }.padding(.all, 4).frame(width: 200, height: 300)
                        
                    }.padding(.horizontal)
                }.padding(1).frame(width: 300, height: 500)
                    .onAppear {
                        // Fetch step count data when the view appears
                        manager.fetchStepCountData { result, error in
                            if let stepCount = result {
                                self.stepCount = stepCount
                            } else if let error = error {
                                print("Error fetching step count: \(error.localizedDescription)")
                            }
                        }
                    }.padding(.top,10)
            }
        }
   
        .ignoresSafeArea()
    }
    
//      Fucntions hiere
    private func loadStepData() {
            // Request HealthKit authorization
            healthStore.requestAuthorization(toShare: nil, read: [HKObjectType.quantityType(forIdentifier: .stepCount)!]) { success, error in
                if success {
                    // Access granted, retrieve step data
                    self.retrieveStepData()
                } else if let error = error {
                    print("HealthKit authorization error: \(error.localizedDescription)")
                }
            }
        }
        
    private func retrieveStepData() {
            let calendar = Calendar.current
            let endDate = Date()
            var startDate: Date
            
            switch selectedInterval {
            case .hour:
                startDate = calendar.date(byAdding: .hour, value: -24, to: endDate)!
            case .day:
                startDate = calendar.date(byAdding: .day, value: -7, to: endDate)!
            case .week:
                startDate = calendar.date(byAdding: .weekOfYear, value: -4, to: endDate)!
            case .month:
                startDate = calendar.date(byAdding: .month, value: -6, to: endDate)!
            }
            
            let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
            let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
            
            let query = HKSampleQuery(
                sampleType: stepType,
                predicate: predicate,
                limit: HKObjectQueryNoLimit,
                sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: true)]
            ) { query, results, error in
                if let samples = results as? [HKQuantitySample], error == nil {
                    // Process and update the step data
                    self.stepData = samples.map { sample in
                        return StepData(date: sample.startDate, steps: sample.quantity.doubleValue(for: .count()))
                    }
                } else if let error = error {
                    print("Error retrieving step data: \(error.localizedDescription)")
                }
            }
            
            healthStore.execute(query)
        }
 
}
    struct StepsDetailsScreen_Previews: PreviewProvider {
        static var previews: some View {
            StepsDetailsScreen()
        }
    }

struct BarChartView: View {
    let stepData: [StepData]
 // Adjust this value as needed
    
    let selectedInterval: TimeIntervalOption
    var body: some View {
        HStack{
            ScrollView(.horizontal) {
                VStack{
                    GeometryReader { geometry in
                        HStack(alignment: .bottom, spacing: 1) {
                            ForEach(stepData, id: \.date) { data in
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .fill(Color.purple).cornerRadius(12)
                                        .frame(width: 8, height: self.scaleHeight(data.steps, in: geometry.size.height * 0.8))
                                    Spacer()
                                    Spacer()

                                    HStack(alignment: .bottom){
                                        Text("\(Int(data.steps))")
                                            .font(.caption).foregroundColor(Color.white).font(.system(size: 14)).fontWeight(.medium)
                                    
                                    }
                                    Spacer()
                                    
                                    HStack{
                                        Text(self.formatDate(data.date)).foregroundColor(Color.purple).font(.system(size: 14))
                                    }.padding(.top,20)
                                }
                                
                            }
                        }
                        .frame(width: 250 ,height: geometry.size.height + 0.8) // Ensure bars fill the available height
                    }
                }
                .padding()
                
            }.frame(width: 250 )
        }.frame(width: 300)
    }
    private func scaleHeight(_ value: Double, in availableHeight: CGFloat) -> CGFloat {
            // Scale the value to fit within the available height
            let maxSteps = stepData.map { $0.steps }.max() ?? 1.0
            let scaleFactor = maxSteps > 0 ? CGFloat(value / maxSteps) : 0.0
            return availableHeight * scaleFactor
        }
    private func formatDate(_ date: Date) -> String {
            // Format the date based on the selected interval
            let dateFormatter = DateFormatter()
            switch selectedInterval {
            case .hour:
                dateFormatter.dateFormat = "HH:mm"
            case .day:
                dateFormatter.dateFormat = "dd"
            case .week:
                dateFormatter.dateFormat = "MMM dd"
            case .month:
                dateFormatter.dateFormat = "MMM"
            }
            return dateFormatter.string(from: date)
        }
}



//struct BarView: View {
//    let value: Double
//
//    var body: some View {
//        VStack {
//            Spacer()
//            Rectangle()
//                .fill(Color.blue)
//                .frame(width: 4, height: CGFloat(value) * 0.1)
//            Text("\(Int(value))")
//                .font(.caption).foregroundColor(Color.white)   .font(.system(size: 8))
//        }
//    }
//}
extension DateFormatter {
    static var shortDateAndTime: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}
struct StepDataGenerator {
    func generateStepData(for interval: TimeIntervalOption) -> [StepData] {
        // Simulate step data based on the selected interval
        let currentDate = Date()
        var data: [StepData] = []
        
        switch interval {
        case .hour:
            for i in 0..<24 {
                let date = Calendar.current.date(byAdding: .hour, value: -i, to: currentDate)!
                let steps = Double.random(in: 1000...5000)
                data.append(StepData(date: date, steps: steps))
            }
        case .day:
            for i in 0..<7 {
                let date = Calendar.current.date(byAdding: .day, value: -i, to: currentDate)!
                let steps = Double.random(in: 5000...10000)
                data.append(StepData(date: date, steps: steps))
            }
        case .week:
            for i in 0..<4 {
                let date = Calendar.current.date(byAdding: .weekOfYear, value: -i, to: currentDate)!
                let steps = Double.random(in: 20000...40000)
                data.append(StepData(date: date, steps: steps))
            }
        case .month:
            for i in 0..<6 {
                let date = Calendar.current.date(byAdding: .month, value: -i, to: currentDate)!
                let steps = Double.random(in: 80000...150000)
                data.append(StepData(date: date, steps: steps))
            }
        }
        
        return data
    }
}



//@main
//struct YourApp: App {
//    var body: some Scene {
//        WindowGroup {
//            StepGraphView()
//        }
//    }
//}




    
