//
//  OnboardingScreensView.swift
//  Remind
//
//  Created by Mac on 2023/08/06.
//

import SwiftUI

struct OnboardingScreensView: View {
    var page: Page
       
       var body: some View {
           VStack(spacing: 10) {
               Image("\(page.imageUrl)")
                   
                   .scaledToFit()
                   .padding()
                   .cornerRadius(30)
               
                   .cornerRadius(10)
                   .padding()
           }
             
       }
}

struct OnboardingScreensView_Previews: PreviewProvider {
    static var previews: some View {
    OnboardingScreensView(page: Page.samplePage)
    }
}
