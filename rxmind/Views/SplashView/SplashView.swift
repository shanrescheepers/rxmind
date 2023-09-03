import SwiftUI

struct SplashView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showDashView = false // Step 1: State variable
    
    @State private var isPresented = false // Added state variable for animation
    @ObservedObject var authController = AuthController()
    @State private var isAuthenticationEnabled = UserDefaults.standard.bool(forKey: "isAuthenticationEnabled")
    @State private var isOnboardingEnabled = UserDefaults.standard.bool(forKey: "onboarding")

    
    var body: some View {
        VStack {
            
            ZStack {
                //        2nd VStack
                Image("b").resizable()
                ZStack {
                  
                    
                        VStack {
                            HStack {
                                Image("rlogo")
                                    .resizable()
                                    .frame(width: getRelativeWidth(201.0),
                                           height: getRelativeHeight(62.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.vertical, getRelativeHeight(28.0))
                                Spacer()
                                Image("i")
                                    .resizable()
                                    .frame(width: getRelativeWidth(70.0),
                                           height: getRelativeHeight(70.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                            }
                            .frame(width: getRelativeWidth(285.0), height: getRelativeHeight(201.0),
                                   alignment: .trailing)
                            .padding(.leading, getRelativeWidth(10.0))
                            Image("img_group")
                                .resizable()
                                .frame(width: getRelativeWidth(293.0), height: getRelativeHeight(200.0),
                                       alignment: .center)
                                .scaledToFit()
                                .clipped()
                                .padding(.top, getRelativeHeight(112.0))
                                .padding(.trailing, getRelativeWidth(10.0))
                    }
                   
                }.frame(width: 300, height: 700 ).padding(.all, 2).onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        // Fade in and scale up when the screen appears
                    }
                }
                //        2nd VStack
                   
                .opacity(isPresented ? 1 : 0) // Use opacity for a fade-in effect
                
            }
         
         
        
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.Bluegray900)
        .ignoresSafeArea()
        .hideNavigationBar()
        .onAppear {
            withAnimation(.easeInOut(duration: 2.5)) {
                isPresented = true
                // Fade in and scale up when the screen appears
                self.opacity(1)
                self.scaleEffect(1)
            }
                    // Step 3: Set a timer to toggle the showDashView variable after 2 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.showDashView = true
                    }
                }
        .ignoresSafeArea()
        .hideNavigationBar()
        .fullScreenCover(isPresented: $showDashView){
            ZStack{
                HStack{
//                    ContentView()
//                   DashView()
                    if  isOnboardingEnabled {
                   
                        if  isAuthenticationEnabled {
                            AuthView()
                            
                        }else{
                            DashView()
                        }
                    }else{
                        ContentView()
                    }
                    
//                    StepsDetailsScreen()
                }
            }
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()

    }
}
