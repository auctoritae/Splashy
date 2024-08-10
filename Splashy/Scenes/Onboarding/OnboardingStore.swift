//
//  OnboardingStore.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 8/8/24.
//

import SwiftUI
import Observation

@Observable
final class OnboardingStore {
    var state: OnboardingState
    private let reducer: OnboardingReducer
    
    init(
        state: OnboardingState,
        reducer: OnboardingReducer
    ) {
        self.state = state
        self.reducer = reducer
    }
    
    public func send(action: OnboardingAction) {
        state = reducer.reduce(state: &state, action: action)
    }
}
