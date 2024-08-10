//
//  OnboardingReducer.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 8/8/24.
//

import SwiftUI

final class OnboardingReducer {
    @AppStorage(AppStorageKeys.onboardingCompleted) var onboardingCompleted: Bool?
    
    func reduce(state: inout OnboardingState, action: OnboardingAction) -> OnboardingState {
        var state = state
        
        switch action {
        case .start:
            state.choosen = []
            state.models = [
                OnboardingItem(key: .background, title: "Choose background color", options: ["🖤", "🩶", "🤍"]),
                OnboardingItem(key: .weather, title: "Choose your fav weather", options: ["☀️", "⛈️", "❄️"])
            ]
        case let .select(item):
            state.choosen.append(item)
        case .complete:
            onboardingCompleted = true
        }
        
        return state
    }
}
    
