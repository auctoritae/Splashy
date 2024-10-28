//
//  OnboardingModel.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 8/8/24.
//

import Foundation

enum OptionItemType {
    case background
    case weather
}

struct OptionItem: Identifiable, Hashable {
    let id = UUID()
    let key: OptionItemType
    let value: String
}

struct OnboardingItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let options: [OptionItem]
}
