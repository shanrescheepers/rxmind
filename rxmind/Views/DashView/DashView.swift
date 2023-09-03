import SwiftUI

struct DashView: View {
    @ObservedObject var manager:  HealthKitManager = HealthKitManager()
    @State private var isAnimating = true
    @State private var progress: Double = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPresented = false // Added state variable for animation
    @State private var inputData = ""
    let currentDate = Date()
    
    //        For the date picker
           
    //  Date picker
    
    var body: some View {

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
                                                  .frame(width: 80, height: 80).padding(.leading)
                                              
                                              Circle()
                                                  .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                                                  .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                                                  .foregroundColor(Color(#colorLiteral(red: 0.3568627536, green: 0.2274509817, blue: 0.850980401, alpha: 1)))
                                                  .rotationEffect(Angle(degrees: 270.0))
                                                  .frame(width: 80, height: 80).padding(.leading)
                                                  .animation(.easeIn(duration: 3.5))
                                                  .onAppear {
                                                                          if isAnimating {
                                                                              withAnimation {
                                                                                  progress = Double.random(in: 0.0...1.0)
                                                                              }
                                                                          }
                                                                      }
                                              Text("\(Int(progress * 100))%")
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
                                               Text("Daily average Steps")
                                                   .font(.system(size: 12)).fontWeight(.light)
                                                   .foregroundColor(Color(#colorLiteral(red: 0.3568627536, green: 0.2274509817, blue: 0.850980401, alpha: 1))).padding(.top,20)
                                               Spacer()
                                           }
                                           
                                       }
                                       .padding()
                                   }
                    }.frame(width: 350, height: 160).padding(.vertical,10)
                    
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
                                                  .frame(width: 80, height: 80).padding(.leading)
                                              
                                              Circle()
                                                  .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                                                  .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                                                  .foregroundColor(Color(.sRGB, red: 0xCC / 255, green: 0x3A / 255, blue: 0x5D / 255, opacity: 1.0))
                                                  .rotationEffect(Angle(degrees: 270.0))
                                                  .frame(width: 80, height: 80).padding(.leading)
                                                  .animation(.easeIn(duration: 3.5))
                                                  .onAppear {
                                                                          if isAnimating {
                                                                              withAnimation {
                                                                                  progress = Double.random(in: 0.0...1.0)
                                                                              }
                                                                          }
                                                                      }
                                              Text("\(Int(progress * 100))%")
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
                .hideNavigationBar()
                .frame(width: 340, height: 720 ).onAppear
                {
                    withAnimation(.easeInOut(duration: 0.5))
                    {  }
                }
        }
            //        2nd VStack
            
        .opacity(isPresented ? 1 : 0) // Use opacity for a fade-in effect
        .ignoresSafeArea()
    }
    var formattedDate: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            return dateFormatter.string(from: currentDate)
        }
}
    
        struct DashView_Previews: PreviewProvider {
            static var previews: some View {
                DashView()
            }
        }

    
