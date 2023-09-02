//
//  HealthViewScreen.swift
//  Remind
//
//  Created by Mac on 2023/08/09.
//

import SwiftUI

struct HealthViewScreen: View {
    @State private var showDash = false
    
    @ObservedObject var manager:  HealthKitManager = HealthKitManager()
    
    var body: some View {

        VStack{
          Text("Tracking Data being displayed here")
            
            ForEach(manager.activities){activity in
                
                Text(activity.title)
                Text(activity.amount)
                Image(systemName: activity.image).foregroundColor(activity.color)
                
                
            }
        }
        Spacer()
//        action: {
        
//        showSignUp = true
             
//         }
        Button(action: {showDash = true}, label: {
            HStack(spacing: 0) {
                Text("Go To Dash")
                    .font(FontScheme
                        .kAveriaSerifLibreRegular(size: getRelativeHeight(32.0)))
                    .fontWeight(.regular)
                    .padding(.horizontal, getRelativeWidth(70.0))
                    .padding(.vertical, getRelativeHeight(19.0))
                    .foregroundColor(ColorConstants.Gray300)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                       
        
            }
        }).fullScreenCover(isPresented: $showDash) {
            // Present the SignUpView as a full screen cover
//                                DashView()
            DashView()
            
                .navigationBarHidden(true)
            
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct HealthViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        HealthViewScreen()
    }
}
