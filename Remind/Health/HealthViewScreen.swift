//
//  HealthViewScreen.swift
//  Remind
//
//  Created by Mac on 2023/08/09.
//

import SwiftUI

struct HealthViewScreen: View {
    
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
    }
}

struct HealthViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        HealthViewScreen()
    }
}
