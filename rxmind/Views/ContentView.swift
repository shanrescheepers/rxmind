import SwiftUI

struct ContentView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    @State private var isSignUpActive = false
    @State private var isAuthenticationEnabled = UserDefaults.standard.bool(forKey: "isAuthenticationEnabled")

    var body: some View {
        ZStack{
            
                TabView(selection: $pageIndex) {
                    ForEach(pages) { page in
                        ZStack {
                            OnboardingScreensView(page: page)
                            VStack {
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                ZStack {
                            Spacer()
                                    if page == pages.last {
                                        Button("Get reminded!", action: {
                                            isSignUpActive = true
                                            UserDefaults.standard.set(true, forKey: "onboarding")
                                            
                                        })
                                        .padding(.top,-120)
                                    } else {
                                        Button("Next", action: incrementPage)
                                            .padding(.top,-120).frame(height: 100, alignment: .bottomLeading)
                                        Spacer()
                                    }
                                    Spacer()
                                    Spacer()
                                }
                                Spacer(minLength: 100)

                                
                            }
                        }
                        .tag(page.tag)
                        .background(Color(red: 0x2C / 255, green: 0x39 / 255, blue: 0x3A / 255))

                    }
                }
                .fullScreenCover(isPresented: $isSignUpActive) {
                    if  isAuthenticationEnabled {
                        AuthView()
                        
                    }else{
                        DashView()
                    }
                    
                }
            }
        }
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToZero() {
        pageIndex = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
