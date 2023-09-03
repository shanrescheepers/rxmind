import SwiftUI

struct Profile: View {
    @State private var isAuthenticationEnabled = UserDefaults.standard.bool(forKey: "isAuthenticationEnabled")

    var body: some View {
        ZStack{
            //        2nd VStack
            Image("profile").resizable()
                .ignoresSafeArea()
            VStack {
                Text("Enable or Disable Face ID here").font(.system(size: 16)).fontWeight(.bold).lineSpacing(4).padding(10).foregroundColor(Color.black).padding(.bottom).padding(.horizontal,10)
                
                Toggle("Enable Authentication", isOn: $isAuthenticationEnabled)
                    .padding().foregroundColor(Color(red: 0.4117647059, green: 0.5294117647, blue: 0.537254902, opacity: 1.0)).padding(.bottom).padding(.horizontal,10)
                    .onChange(of: isAuthenticationEnabled, perform: { newValue in
                        UserDefaults.standard.set(newValue, forKey: "isAuthenticationEnabled")
                    })
                Button("Reset Onboarding") {
                    UserDefaults.standard.set(false, forKey: "onboarding")
                }
                
                Spacer()
            }.padding(.top,50)
            .navigationBarTitle("Profile")
        }
        
//        .hideNavigationBar()
    }
    
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
