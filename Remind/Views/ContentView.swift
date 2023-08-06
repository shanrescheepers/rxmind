//
//  ContentView.swift
//  SlidingIntroScreen
//
//  Created by Federico on 18/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    @State private var isSignUpActive = false
    
    var body: some View {
        TabView(selection: $pageIndex) {
  
            ForEach(pages) { page in
                VStack {
           
                    OnboardingScreensView(page: page)
        
                    if page == pages.last {
                        Button("Sign up!", action:{ isSignUpActive = true})
                            
                    } else {
                        Button("next", action: incrementPage)
                       
                    }
        
                }
                .tag(page.tag)
            }
        }
        .fullScreenCover(isPresented: $isSignUpActive, content: {
                   SignUpView()
               })
       Color("Bluegray900")
        .animation(.easeInOut, value: pageIndex)// 2
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
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
