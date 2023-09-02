import SwiftUI

struct DashView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPresented = false // Added state variable for animation
    @State private var inputData = ""
    
    
    //        For the date picker
           
    //  Date picker
    
    var body: some View {

        ZStack {
            //        2nd VStack
            Image("b").resizable()
            ZStack{
                VStack {
                    HStack {
                        Text("Flex Goal").font(.title).fontWeight(.bold)
                            .frame(width: 120).padding().foregroundColor(Color(#colorLiteral(red: 0.850980401, green: 0.850980401, blue: 0.850980401, alpha: 1))) // Set the text color
                        // Add padding as needed
                        Spacer() // Pushes "Profile" to the right
                        
                        Image("i").resizable().frame(width: 50, height: 50).padding(.leading)
                        
                      
                    }.padding(.trailing) // Add padding as needed
                    Spacer()
                    HStack {
                        
             
                    } // Add padding as needed
                    Spacer()
                    VStack{
                        HStack{
                            Text("It's a matter of time and effort. It all depends on you. Success and failure. Keep track of your mental and body state. ").font(.system(size: 12)).fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading ).padding(.horizontal).foregroundColor(Color(#colorLiteral(red: 0.850980401, green: 0.850980401, blue: 0.850980401, alpha: 1))) // Set the text color
                            Spacer()
                            Spacer()
                        } // Add padding as needed
                        
                        HStack{
                            
                            Text("Set your goal date below and keep on moving, for you").frame(maxWidth: .infinity, alignment: .leading ).padding(.horizontal).foregroundColor(Color(#colorLiteral(red: 0.850980401, green: 0.850980401, blue: 0.850980401, alpha: 1))) // Set the text color
                        }.padding(.top)
                  
                        
                        HStack{
                            TimePickerView().foregroundColor(.white).accentColor(.white)
                            
                        }.padding(.top)
                        
                    }
                    VStack {
//              Time Picker Component here
                     
                        Spacer()
                        Spacer()
                        Spacer()
                    }.padding()
                  
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
                    {
                        
                    }
                    
                }
            }
            //        2nd VStack
            
           
        .opacity(isPresented ? 1 : 0) // Use opacity for a fade-in effect
            .ignoresSafeArea()
        }
        
}
    
        struct DashView_Previews: PreviewProvider {
            static var previews: some View {
                DashView()
            }
        }

    
