import SwiftUI
import HealthKit
import HealthKitUI

struct DashView: View {
    @State private var isDetailViewActive = false
    
    @ObservedObject var manager:  HealthKitManager = HealthKitManager()
    @State private var isAnimating = true
    @State private var progress: Double = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPresented = false // Added state variable for animation
    @State private var inputData = ""
    
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
                Image("b").resizable()
                
                ZStack{
                    
                    VStack {
                        
                        HStack{
                            Spacer()
                            Image("rlogo").resizable().frame(width: 110, height: 30)
                            Spacer()
                            Image("menubar").resizable().frame(width: 30, height: 30)
                            
                            
                        }.padding()
                        HStack(alignment: .top) {
                            //                        Text("Flex Goal").font(.title).fontWeight(.bold)
                            //                            .frame(width: 120).padding().foregroundColor(Color(#colorLiteral(red: 0.850980401, green: 0.850980401, blue: 0.850980401, alpha: 1))) // Set the text color
                            Text(" \(formattedDate)")
                                .font(.system(size: 14))
                                .foregroundColor(.white) // Customize text color
                            Spacer()
                            // Add padding as needed
                            Spacer() // Pushes "Profile" to the
                        }// Add padding as needed
                        Spacer()
                        // Add padding as needed
                        Spacer()
                        VStack{
                            HStack(alignment: .top){
                                Text("It's a matter of time and effort. It all depends on you. Success and failure. Keep track of your mental and body state. ").font(.system(size: 14)).fontWeight(.medium).lineSpacing(4)
                                    .frame(width: 340, height: 100, alignment: .leading ).foregroundColor(Color(#colorLiteral(red: 0.850980401, green: 0.850980401, blue: 0.850980401, alpha: 1))) // Set the text color
                                Spacer()
                                Spacer()
                            } // Add padding as needed
                            Spacer()
                            HStack{
                                TimePickerView().foregroundColor(.white).accentColor(.white)
                            }.padding(.top).frame(height: 200)
                        }
                        Spacer()
                        
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
                                        .font(.system(size: 16)).fontWeight(.black)
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
                                        .frame(width: 80, height: 80)
                                        .padding(.leading)
                                    
                                    Circle()
                                        .trim(from: 0.0, to: CGFloat(min(self.progress / 1000, 1.0)))
                                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                                        .foregroundColor(Color(#colorLiteral(red: 0.3568627536, green: 0.2274509817, blue: 0.850980401, alpha: 1)))
                                        .rotationEffect(Angle(degrees: 270.0))
                                        .frame(width: 80, height: 80)
                                        .padding(.leading)
                                        .animation(.easeIn(duration: 3.5))
                                        .onAppear {
                                            
                                            // Fetch HealthKit data when the view appears
                                            fetchHealthData()
                                        }
                                    Text("\(Int(progress))")
                                        .font(.system(size: 16)).foregroundColor(Color.white)
                                        .fontWeight(.bold).padding(.leading)
                                }.frame(width: 200, height: 100).padding(.top,40)
                            }
                            
                            // Bottom stack with image, two buttons, and aligned right
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
                                        }
                                        Text("Daily average Steps")
                                            .font(.system(size: 12)).fontWeight(.light)
                                            .foregroundColor(Color(#colorLiteral(red: 0.3568627536, green: 0.2274509817, blue: 0.850980401, alpha: 1))).padding(.top,20)
                                        //                                        Spacer()
                                    }
                                    
                                }
                                .padding()
                            }
                            NavigationLink("", destination: StepsDetailsScreen(), isActive: $isDetailViewActive)
                                .opacity(0) // Make the link invisible
                        
                        //                            .fullScreenCover(isPresented: $isDetailViewActive) {
                        //                                // Present the SignUpView as a full screen cover
                        //                                StepsDetailsScreen()
                        //
                        //                                    .navigationBarHidden(false)
                        //
                        //                                    .navigationBarBackButtonHidden(false)
                        //                            }
                    
                        }.frame(width: 350, height: 160).padding(.vertical,10)
                        
                        
                        // STEPS
                        
                        
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
                                        .font(.system(size: 16)).fontWeight(.black)
                                        .foregroundColor(Color(.sRGB, red: 0xCC / 255, green: 0x3A / 255, blue: 0x5D / 255, opacity: 1.0)).padding(.horizontal)
                                }.padding()
                                Spacer()
          
                            }
                            VStack (alignment: .center) {
                      
                                ZStack{
                                    
                                    Text("\(Int(progress))")
                                        .font(.system(size: 16)).foregroundColor(Color.white)
                                        .fontWeight(.bold).padding(.leading)
                                }.frame(width: 200, height: 100).padding(.top,40)
                            }
                            
                            // Bottom stack with image, two buttons, and aligned right
                            VStack {
                                
                                HStack {
                                    
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Button(action: {
                                            // Add action for the first button
                                        }) {
                                            Text("Button 1")
                                                .foregroundColor(.white)
                                        }
                                        
                                        Button(action: {
                                            // Add action for the second button
                                        }) {
                                            Text("Button 2")
                                                .foregroundColor(.white)
                                        }.padding()
                                        Text("Average BPM")
                                            .font(.system(size: 12)).fontWeight(.light)
                                            .foregroundColor(Color(.sRGB, red: 0xCC / 255, green: 0x3A / 255, blue: 0x5D / 255, opacity: 1.0)).padding(.top,20)
                                        Spacer()
                                    }
                                    
                                }
                                .padding()
                            }
                        }.frame(width: 350, height: 160).padding(.vertical,10)
                    }// Add padding as needed
                    Spacer()
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 2.5)) {
                        isPresented = true
                        // Fade in and scale up when the screen appears
                        self.opacity(1)
                        self.scaleEffect(1)
                    }
                }
      
                .frame(width: 340, height: 720 ).onAppear
                {
                    withAnimation(.easeInOut(duration: 0.5))
                    {  }
                }
            }
            //        2nd VStack
            
            .opacity(isPresented ? 1 : 0) // Use opacity for a fade-in effect
            .ignoresSafeArea()
            .navigationBarHidden(false)
        
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

    
