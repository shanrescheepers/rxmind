import SwiftUI

struct SplashView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showDashView = false // Step 1: State variable
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Image("img_group14")
                        .resizable(capInsets: EdgeInsets(top: 0.0, leading: 3.0, bottom: 0.0, trailing: 0.0))
                        .frame(width: getRelativeWidth(143.0), height: getRelativeHeight(201.0),
                               alignment: .bottom)
                        .scaledToFit()
                        .clipped()
                        .padding(.leading, getRelativeWidth(10.0))
                    Image("img_maskgroup")
                        .resizable(capInsets: EdgeInsets(top: 0.0, leading: 4.0, bottom: 0.0, trailing: 0.0))
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading, 9.0)
                        .frame(width: getRelativeWidth(322.0), height: getRelativeHeight(98.0),
                               alignment: .center)
                        .scaledToFit()
                        .clipped()
                        .padding(.top, getRelativeHeight(215.0))
                        .padding(.horizontal, getRelativeWidth(50.0))
                    Image("img_group13")
                        .resizable()
                        .frame(width: getRelativeWidth(168.0), height: getRelativeHeight(201.0),
                               alignment: .top)
                   
                        .clipped()
                        .padding(.top, getRelativeHeight(216.0))
                        .padding(.trailing, getRelativeWidth(10.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                       alignment: .topLeading)
                .background(ColorConstants.Bluegray900)
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .background(ColorConstants.Bluegray900)
            .padding(.top, getRelativeHeight(30.0))
            .padding(.bottom, getRelativeHeight(10.0))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.Bluegray900)
        .ignoresSafeArea()
        .hideNavigationBar()
        .onAppear {
                    // Step 3: Set a timer to toggle the showDashView variable after 2 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.showDashView = true
                    }
                }
     
        .fullScreenCover(isPresented: $showDashView){
            ZStack{
                HStack{
//                    ContentView()
                    HealthViewScreen()
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
