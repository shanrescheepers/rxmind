//
//  Activity.swift
//  Remind
//
//  Created by Mac on 2023/08/09.
//

import Foundation
import SwiftUI

struct Activity : Identifiable {
    let id = UUID()
    let title: String
    let amount: String
    let image: String
    let color: Color
}
