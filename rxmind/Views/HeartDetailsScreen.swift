import SwiftUI
import HealthKit
import HealthKitUI
import Foundation


struct HeartRateData {
    let date: Date
    let heart: Double
}
struct HeartDetialsScreen: View {
    enum StressLevel {
            case low
            case medium
            case high

            var description: String {
                switch self {
                case .low: return "LOW"
                case .medium: return "MEDIUM"
                case .high: return "HIGHT"
                }
            }
        }
    @State private var stressLevel: StressLevel = .low
    
    @ObservedObject var manager:  HealthKitManager = HealthKitManager()
    @State private var isAnimating = true
    @State private var progress: Double = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPresented = false // Added state variable for animation
    @State private var inputData = ""
    
    @State private var heartRate: Double?
    @State private var hrv: Double?

    
    @State private var selectedInterval: TimeIntervalOption = .day
    
    
    @State private var heartrateData: [HeartRateData] = []
    
    
    let healthStore = HKHealthStore()
    let currentDate = Date()
    
    //        For the date picker
    
    //  Date picker
    
    var body: some View {
        
        ZStack(alignment: .center) {
            //        2nd VStack
            Image("b").resizable()
            
            ZStack{
             
               
            }
            Spacer(minLength: 40)
            VStack{
                ZStack{
                    Color.black.opacity(0.5).cornerRadius(100)
                    HStack{
                        
                        Image("heart")
                            .resizable()
                            .frame(width: 60, height: 60).padding(.top,5)
                        
                        Text("Your   Heart")
                            .font(.system(size: 16)).fontWeight(.black)
                            .foregroundColor(.white)
                    .padding()
                    }.padding()
               
                }.frame(width: 300, height: 100).padding(.top,80)
                
                
           
                ZStack{
                 Spacer()
                    Color.black.opacity(0.5).cornerRadius(12)
                    Spacer()
                    VStack{
                        HStack{
                            
                            Text("Avg BPM")
                                .font(.system(size: 14)).fontWeight(.light)
                                .foregroundColor(Color.white).padding(.leading,5)
                            Spacer()
                            Text("Current")
                                .font(.system(size: 14)).fontWeight(.light)
                                .foregroundColor(Color.white).padding(.horizontal)
                           
                            if let heartRate = heartRate {
                                            Text(" \(Int(heartRate)) BPM")
                                    .font(.system(size: 14)).fontWeight(.black) .foregroundColor(Color(.sRGB, red: 0xCC / 255, green: 0x3A / 255, blue: 0x5D / 255, opacity: 1.0)).padding(.horizontal, -3)
                                        } else {
                                            Text("Fetching heart rate...")
                                                .font(.title)
                                        }
                        }.padding(.top,20)
                     
                        HStack{
                            
                            HStack{
                                
                                // Picker for time interval selection
                                Picker("Select Interval", selection: $selectedInterval) {
                                    ForEach(TimeIntervalOption.allCases, id: \.self) { option in
                                        Text(option.rawValue).tag(option)
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle()).frame(width: 280, height: 40).padding(.top,10)
                                .onChange(of: selectedInterval, perform: { _ in
                                    loadHeartRateData()
                                })
                            }
                        }
                        VStack{
                            //                      Bar chart here
                            HeartBarChartView(selectedInterval: selectedInterval, heartRateData: heartrateData)
                                .onAppear(perform: loadHeartRateData).frame(width: 300, height: 200)
                            
                        }.padding(.all, 4).frame(width: 300, height: 200)
                    }.padding(.horizontal)
                    Spacer()
                }.padding(.top,50).frame(width: 300, height: 300)
            
                ZStack{
                    Color.black.opacity(0.5).cornerRadius(12)
              
                    VStack(alignment: .center){
                        Text("Look after your heart - some things aren't worth the stress")
                            .font(.system(size: 12)).fontWeight(.light)
                            .foregroundColor(Color.white).padding(.horizontal)        .multilineTextAlignment(.center).padding(.top,-10)
                        HStack{
                            Text("Heart Rate Variability: \(Int(hrv ?? 0))") // Display HRV in a text field
                                            .font(.system(size: 16))
                                            .foregroundColor(Color.white)
                                            .fontWeight(.bold)
                                            .padding(.leading).multilineTextAlignment(.leading)
                            Spacer()
                            Image("hrv")
                                .resizable()
                                .frame(width: 60, height: 60).padding(.trailing)
                        }.padding(.leading,20)
                        HStack{
                            Text("Stress Level:      \(stressLevel.description)") // Display stress level in a text field
                                            .font(.system(size: 16))
                                            .foregroundColor(Color.white)
                                            .fontWeight(.bold)
                                            .padding(.leading).multilineTextAlignment(.leading)
                            Spacer()
                            Image("stress")
                                .resizable()
                                .frame(width: 60, height: 60).padding(.trailing)
                        }.padding(.leading,20)
                    }
                }.padding(.top,58).frame(width: 300, height: 300)
                
            }
            .onAppear {
                loadHRVData()
                manager.fetchHeartRateData { result, error in
                    if let heartRate = result {
                        self.heartRate = heartRate
                        print("heart rate:\(heartRate)")
                    } else if let error = error {
                        print("Error fetching heart rate: \(error.localizedDescription)")
                    }
                }
            }
            
        }
   
        .ignoresSafeArea()
        .background(Color(#colorLiteral(red: 0.11764705882352941, green: 0.13725490196078433, blue: 0.1607843137254902, alpha: 1.0)))
    }
      //Funcs
    private func loadHRVData() {
            guard let hrvType = HKQuantityType.quantityType(forIdentifier: .heartRateVariabilitySDNN) else {
                return
            }
            
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
   

            let lowThreshold: Double = 50.0
            let mediumThreshold: Double = 70.0
           
        
            let query = HKSampleQuery(sampleType: hrvType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { _, results, error in
                guard let result = results?.first as? HKQuantitySample else {
                    return
                }
                self.hrv = result.quantity.doubleValue(for: HKUnit(from: "ms"))
                // Calculate stress level based on HRV data
                if let hrvValue = self.hrv {
                            if hrvValue < lowThreshold {
                                self.stressLevel = .low
                            } else if hrvValue < mediumThreshold {
                                self.stressLevel = .medium
                            } else {
                                self.stressLevel = .high
                            }
                        }
            }
            
            healthStore.execute(query)
        }
    
    private func calculateStressLevel(from hrv: Double) -> Double {
        // Calculate stress level based on HRV data
        // You can replace this with your own formula
        return (hrv - 50) * 2 // Example formula (adjust as needed)
    }
    
    private func loadHeartRateData() {
        // Request HealthKit authorization for heart rate data
        healthStore.requestAuthorization(toShare: nil, read: [HKObjectType.quantityType(forIdentifier: .heartRate)!]) { success, error in
            if success {
                // Access granted, retrieve heart rate data
                self.retrieveHeartRateData()
            } else if let error = error {
                print("HealthKit authorization error: \(error.localizedDescription)")
            }
        }
    }

    private func retrieveHeartRateData() {
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

        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)

        let query = HKSampleQuery(
            sampleType: heartRateType,
            predicate: predicate,
            limit: HKObjectQueryNoLimit,
            sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: true)]
        ) { query, results, error in
            if let samples = results as? [HKQuantitySample], error == nil {
                // Process and update the heart rate data
                self.heartrateData = samples.map { sample in
                    return HeartRateData(date: sample.startDate, heart: sample.quantity.doubleValue(for: .init(from: "count/min")))
                }
            } else if let error = error {
                print("Error retrieving heart rate data: \(error.localizedDescription)")
            }
        }
        

        healthStore.execute(query)
    }


}

struct HeartBarChartView: View {
    let selectedInterval: TimeIntervalOption
    let heartRateData: [HeartRateData] // Replace HeartRateData with your actual data structure

    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                GeometryReader { geometry in
                    HStack(alignment: .bottom, spacing: 1) {
                        ForEach(heartRateData, id: \.date) { data in
                            VStack {
                                Spacer()
                                Rectangle()
                                    .fill(Color.purple)
                                    .cornerRadius(12)
                                    .frame(width: 1, height: self.scaleHeight(data.heart, in: geometry.size.height - 6))
                                Spacer()
                                Spacer()

                                HStack(alignment: .bottom) {
                                    Text("\(Int(data.heart))")
                                        .font(.caption)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 10))
                                        .fontWeight(.medium)
                                }
                                Spacer()

                                HStack {
                                    Text(self.formatDate(data.date))
                                        .foregroundColor(Color.purple)
                                        .font(.system(size: 10))
                                }
                                .padding(.top, 20)
                            }
                        }
                    }
                    .frame(width: 300, height: geometry.size.height - 0.8) // Ensure bars fill the available height
                } .frame(width: 300)
            } .frame(width: 300)
            .padding()
        }
        .frame(width: 300)
    }
    private func scaleHeight(_ value: Double, in availableHeight: CGFloat) -> CGFloat {
            // Scale the value to fit within the available height
            let maxSteps = heartRateData.map { $0.heart }.max() ?? 1.0
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

    struct HeartDetialsScreen_Previews: PreviewProvider {
        static var previews: some View {
            HeartDetialsScreen()
        }
    }

    
