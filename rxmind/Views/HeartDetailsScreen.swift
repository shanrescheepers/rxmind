import SwiftUI

struct HeartDetialsScreen: View {
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
                    Spacer()
                }.padding(.top,40)
            }
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
                    }.padding(.horizontal)
                }.padding(1).frame(width: 300, height: 100)
                
                
                ZStack{
                    Color.black.opacity(0.5).cornerRadius(12)
                    VStack{
                        HStack{
                            
                            Text("Avg BPM")
                                .font(.system(size: 14)).fontWeight(.light)
                                .foregroundColor(Color.white).padding(.leading,5)
                            Spacer()
                            Text("Current")
                                .font(.system(size: 14)).fontWeight(.light)
                                .foregroundColor(Color.white).padding(.horizontal)
                            Text("88")
                                .font(.system(size: 14)).fontWeight(.black)
                                .foregroundColor(Color(#colorLiteral(red: 0.3568627536, green: 0.2274509817, blue: 0.850980401, alpha: 1))).padding(.horizontal, -3)
                        }.padding(.top,-33)
                        HStack{
                            
                            Image("heart")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            Text("Your Heart")
                                .font(.system(size: 16)).fontWeight(.black)
                                .foregroundColor(Color(.sRGB, red: 0xCC / 255, green: 0x3A / 255, blue: 0x5D / 255, opacity: 1.0)).padding(.horizontal)
                        }
                        HStack{
                            
                            Image("heart")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                          
                        }
                    }.padding(.horizontal)
                }.padding(1).frame(width: 300, height: 200)
                
                ZStack{
                    Color.black.opacity(0.5).cornerRadius(12)
                    HStack{
                        
                        Image("heart")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        Text("Your Heart")
                            .font(.system(size: 16)).fontWeight(.black)
                            .foregroundColor(Color(.sRGB, red: 0xCC / 255, green: 0x3A / 255, blue: 0x5D / 255, opacity: 1.0)).padding(.horizontal)
                    }
                }.padding(1).frame(width: 300, height: 200)
                
            }
        }
   
        .ignoresSafeArea()
    }
      

}
    struct HeartDetialsScreen_Previews: PreviewProvider {
        static var previews: some View {
            HeartDetialsScreen()
        }
    }

    
