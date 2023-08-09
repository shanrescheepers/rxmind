import SwiftUI

struct ContentView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    @State private var isSignUpActive = false
    
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
                                        Button("Sign up!", action: { isSignUpActive = true })
                                            .padding()
                                    } else {
                                        Button("Next", action: incrementPage)
                                            .padding().frame(height: 100, alignment: .bottomLeading)
                                        Spacer()
                                    }
                                    Spacer()
                                    Spacer()
                                }
                                Spacer(minLength: 100)

                                
                            }
                        }
                        .tag(page.tag)
                    }
                }
                .fullScreenCover(isPresented: $isSignUpActive) {
                    SignUpView()
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
