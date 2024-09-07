//
//  SplashyApp.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 8/7/24.
//

import SwiftUI

@main
struct SplashyApp: App {
    @AppStorage(AppStorageKeys.onboardingCompleted) var onboardingCompleted: Bool = false
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environment(OnboardingStore(
                    state: OnboardingState(models: [], choosen: [], pageIndex: 0, showButton: false),
                    reducer: OnboardingReducer())
                )
        }
    }
}
