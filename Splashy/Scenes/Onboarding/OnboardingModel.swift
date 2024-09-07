//
//  OnboardingModel.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 8/8/24.
//

import Foundation

enum ItemType: String {
    case background
    case weather
}

struct ChoosenItem: Identifiable {
    let id = UUID()
    let key: ItemType
    let value: String
}

struct OnboardingItem: Hashable {
    let id = UUID()
    let key: ItemType
    let title: String
    let options: [String]
}
