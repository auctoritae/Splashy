//
//  OnboardingModel.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 8/8/24.
//

import Foundation

struct ChoosenItem: Identifiable {
    let id: String
    let key: String
    let value: String
}

struct OnboardingItem: Identifiable {
    let id = UUID()
    let key: ItemType
    let title: String
    let options: [String]
    
    enum ItemType: String {
        case background
        case weather
    }
}
