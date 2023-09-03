import SwiftUI
import HealthKit
import HealthKitUI

struct DashView: View {
    @State private var isDetailViewActive = false
    @State private var isProfileViewActive = false
    @State private var isHeartDetailViewActive = false
    
    @ObservedObject var manager:  HealthKitManager = HealthKitManager()
    
    @State private var timer: Timer?
    
    @State private var isAnimating = true
    @State private var progress: Double = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPresented = false // Added state variable for animation
    @State private var inputData = ""
    
    
    @State private var heartRate: Double?
    
    
    // Selected date state
    @State private var selectedDate: Date = Date()
    
    private let healthStore = HKHealthStore()
    @State private var todaySteps: Double = 0
    @State private var yesterdaySteps: Double = 0
    
    // Progress circle variables
    //        @State private var progress: Double = 0.0
    //        @State private var isAnimating: Bool = false
    
    
    
    let currentDate = Date()
    
    //        For the date picker
    
    //  Date picker
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .center) {
                //        2nd VStack
                Image("b").resizable().padding(.top,10)
                    .ignoresSafeArea()
                ZStack{
                    
                    VStack {
                        
                   
                        HStack{
                            Image("rlogo")
                                                  .resizable()
                                                  .frame(width: 90, height: 20)
                                                  .padding(.top, -20)
                                                  .padding(.horizontal)
                        }
                        
                        
                        HStack {
                         
                            Text("` \(formattedDate)`")
                                .font(.system(size: 14))
                                .foregroundColor(.white).padding(.horizontal) // Customize text color
                            VStack(alignment: .leading){
                                Button("Profile") {
                                    isProfileViewActive = true // Activate navigation
                                }.padding(.top,2).padding(.leading,110)
                                
                                NavigationLink("", destination: Profile(), isActive: $isProfileViewActive)
                                    .opacity(0) // Make the link invisible
                            }
                            //                        Text("Flex Goal").font(.title).fontWeight(.bold)
                            //                            .frame(width: 120).padding().foregroundColor(Color(#colorLiteral(red: 0.850980401, green: 0.850980401, blue: 0.850980401, alpha: 1))) // Set the text color
                    
//                            Spacer()
                            // Add padding as needed
//                            Spacer() // Pushes "Profile" to the
                        }// Add padding as needed
//                        Spacer()
                        // Add padding as needed
//                        Spacer()
                        VStack{
                            HStack(alignment: .center){
                                Text("It's a matter of your time and fucking effort. It all depends on you. Successes and failures. Keep priority & track of your mental and body state. ").font(.system(size: 14)).fontWeight(.medium).lineSpacing(4).padding(.leading,50).multilineTextAlignment(SwiftUI.TextAlignment.leading)
                                    .frame(width: 340, height: 100, alignment: .center ).foregroundColor(Color(#colorLiteral(red: 0.850980401, green: 0.850980401, blue: 0.850980401, alpha: 1))) // Set the text color
                                Spacer()
//                                Spacer()
                            } // Add padding as needed
                            Spacer()
                            HStack{
                                TimePickerView().foregroundColor(.white).accentColor(.white)
                            }.padding(.top,20).frame(height: 200)
                        }
                        Spacer()
                        Spacer(minLength: 10)
                        //STEPS
                        
                        ZStack (alignment: .leading){
                            
                            //              Time Picker Component here
                            
                            Color.black.opacity(0.5).cornerRadius(12)
                            
                            // Top stack with image and text aligned left
                            VStack(alignment: .leading) {
                                HStack{
                                    Image("steps")
                                        .resizable()
                                        .frame(width: 25, height: 40)
                                    Text("Your Steps")
                                        .font(.system(size: 20)).fontWeight(.black)
                                        .foregroundColor(.white).padding(.horizontal)
                                }.padding()
                                Spacer()
                                //                                       Text("Your Text")
                                //                                           .font(.system(size: 14))
                                //                                           .foregroundColor(.white).padding()
                            }
                            VStack (alignment: .center) {
                                //                            HStack (alignment: .top) {
                                //                                Image("steps")
                                //                                    .resizable()
                                //                                    .frame(width: 100, height: 80).padding(.top,40)
                                //                            }.padding(.leading,20)
                                ZStack{
                                    Circle()
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 20)
                                        .frame(width: 60, height: 60)
                                        .padding(.leading)
                                    
                                    Circle()
                                        .trim(from: 0.0, to: CGFloat(min(self.progress / 1000, 1.0)))
                                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                                        .foregroundColor(Color(#colorLiteral(red: 0.3568627536, green: 0.2274509817, blue: 0.850980401, alpha: 1)))
                                        .rotationEffect(Angle(degrees: 270.0))
                                        .frame(width: 60, height: 60)
                                        .padding(.leading)
                                        .animation(.easeIn(duration: 3.5))
                                        .onAppear {
                                            startTimer()
                                            // Fetch HealthKit data when the view appears
                                            fetchHealthData()
                                        }
                                    Text("\(Int(progress))")
                                        .font(.system(size: 16)).foregroundColor(Color.white)
                                        .fontWeight(.bold).padding(.leading)
                                }.frame(width: 200, height: 100).padding(.top,50)
                                Text("Daily average Steps")
                                    .font(.system(size: 12)).fontWeight(.medium)
                                    .foregroundColor(Color(red: 0.4117647059, green: 0.5294117647, blue: 0.537254902, opacity: 1.0)).padding(.bottom,15).padding(.leading).padding(.top,-5)
                            }
                            
                    
                            VStack {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Button(action: {
                                            // Set the selected date to "Today"
                                            selectedDate = Date()
                                            fetchHealthData()
                                        }) {
                                            Text("Today")
                                                .font(.system(size: 14))
                                                .foregroundColor(.white)
                                                .padding()
                                        }
                                        Button(action: {
                                            // Set the selected date to "Yesterday"
                                            selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
                                            fetchHealthData()
                                        }) {
                                            Text("Yesterday")
                                                .font(.system(size: 14))
                                                .foregroundColor(.white)
                                                .padding()
                                        }
                                        
                                        Button("Details") {
                                            isDetailViewActive = true // Activate navigation
                                        }.padding(.top,15)
                                
                                    }
                                    
                                }
                                .padding()
                            }
                            NavigationLink("", destination: StepsDetailsScreen(), isActive: $isDetailViewActive)
                                .opacity(0) // Make the link invisible
              
                        }.frame(width: 350, height: 160).padding(.vertical,10)
                        
                        
                        // STEPS
                        Spacer(minLength: 20)
//                        Spacer()
                        ZStack (alignment: .leading){
                            //              Time Picker Component here
                            
                            Color.black.opacity(0.5).cornerRadius(12)
                            
                            // Top stack with image and text aligned left
                            VStack(alignment: .leading) {
                                HStack{
                                    Image("heart")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    
                                    Text("Your Heart")
                                        .font(.system(size: 20)).fontWeight(.black)
                                        .foregroundColor(Color(.sRGB, red: 0xCC / 255, green: 0x3A / 255, blue: 0x5D / 255, opacity: 1.0)).padding(.horizontal)
                                }.padding()
                                Spacer()
                            }
                            VStack (alignment: .center) {
                                ZStack{
                                        // GO TO HEART DETAILS
                                    if let heartRate = heartRate {
                                                    Text(" \(Int(heartRate)) BPM")
                                            .font(.title).foregroundColor(Color.white).fontWeight(.bold)
                                                } else {
                                                    Text("Fetching heart rate...")
                                                        .font(.title)
                                                }
                                    
                                }.frame(width: 200, height: 100).padding(.top,40).padding(.horizontal)
                                Text("Current BPM")
                                    .font(.system(size: 12)).fontWeight(.medium)
                                    .foregroundColor(Color(red: 0.4117647059, green: 0.5294117647, blue: 0.537254902, opacity: 1.0)).padding(.bottom).padding(.horizontal,10)
                            }
                            // Bottom stack with image, two buttons, and aligned right
                            VStack {
                                HStack {
                                    Spacer()
                                    Spacer(minLength: 40)
                                    VStack {
                                        Spacer(minLength: 40)
                                        Button("Details") {
                                            isHeartDetailViewActive = true // Activate navigation
                                        }.padding(.horizontal)
                                    }
                                }
                                .padding()
                            }
                            NavigationLink("", destination: HeartDetialsScreen(), isActive: $isHeartDetailViewActive)
                                .opacity(0) // Make the link invisible
                        }.frame(width: 350, height: 160).padding(.vertical,10)
                    }// Add padding
                    Spacer()
                }
                .onAppear {
                    manager.fetchHeartRateData { result, error in
                                   if let heartRate = result {
                                       self.heartRate = heartRate
                                       print("heart rate:\(heartRate)")
                                   } else if let error = error {
                                       print("Error fetching heart rate: \(error.localizedDescription)")
                                   }
                               }
                    withAnimation(.easeInOut(duration: 2.5)) {
                        isPresented = true
                        // Fade in and scale up when the screen appears
                        self.opacity(1)
                        self.scaleEffect(1)
                    }
                    // Fetch heart rate data when the view appears
                }
                .frame(width: 340, height: 720 ).onAppear
                {
                    withAnimation(.easeInOut(duration: 0.5))
                    {  }
                }
            }
            //        2nd VStack
            .opacity(isPresented ? 1 : 0) // Use opacity for a fade-in effect
     
            .navigationBarHidden(false)
            .background(Color(#colorLiteral(red: 0.11764705882352941, green: 0.13725490196078433, blue: 0.1607843137254902, alpha: 1.0)))
            .navigationBarBackButtonHidden(false)
        }
    }
        // Function to fetch today and yesterday's step counts from HealthKit
        public func fetchHealthData() {
            // Check if step count data is available
            guard let stepType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
                return
            }
            
            // Predicate for the selected date
            let startOfDay = Calendar.current.startOfDay(for: selectedDate)
            let endOfDay = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: selectedDate) ?? selectedDate
            let datePredicate = HKQuery.predicateForSamples(withStart: startOfDay, end: endOfDay, options: .strictStartDate)
            
            let query = HKStatisticsQuery(quantityType: stepType,
                                          quantitySamplePredicate: datePredicate,
                                          options: .cumulativeSum) { (_, result, _) in
                guard let result = result, let sum = result.sumQuantity() else {
                    return
                }
                progress = sum.doubleValue(for: .count())
            }
            
            healthStore.execute(query)
        }
        
        
        
        var formattedDate: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            return dateFormatter.string(from: currentDate)
        }
        
    func startTimer() {
        
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                // This closure also runs every second
                fetchHealthData()
               // Run your function here
            }
        }
     

    }


//struct DetailsView: View {
//    var body: some View {
//        Text("Details Screen Content")
//            .navigationBarTitle("Details")
//    }
//}
struct DashView_Previews: PreviewProvider {
            static var previews:
    some View {
                DashView()
    }
}

    
