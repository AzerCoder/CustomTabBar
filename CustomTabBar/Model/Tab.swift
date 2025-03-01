//
//  Tab.swift
//  CustomTabBar
//
//  Created by A'zamjon Abdumuxtorov on 01/03/25.
//


import Foundation

enum Tab: String,CaseIterable {
    case home = "home"
    case time = "prayertimes"
    case loked = "favorite"
    case audio = "listen_to_quran"
    
    var imageName: String {
        switch self {
        case .home:
            return "house.fill"
        case .time:
            return "clock.fill"
        case .loked:
            return "heart.fill"
        case .audio:
            return "beats.headphones"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
    
    
    
}
