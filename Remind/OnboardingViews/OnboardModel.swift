//
//  PageModel.swift
//  SlidingIntroScreen
//
//  Created by Federico on 18/03/2022.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "", imageUrl: "Onboard_1", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "", description: "", imageUrl: "Onboard_1", tag: 0),
        Page(name: "", description: "", imageUrl: "Onboard_2", tag: 1),
        Page(name: "", description: "", imageUrl: "Onboard_3", tag: 2),
    ]
}
