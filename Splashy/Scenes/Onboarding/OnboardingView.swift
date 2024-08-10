//
//  OnboardingView.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 8/8/24.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(OnboardingStore.self) private var store
    
    var body: some View {
        VStack {
            
        }
        .onAppear {
            store.send(action: .start)
            debugPrint(store.state.models)
        }
    }
}

#Preview {
    OnboardingView()
        .environment(OnboardingStore(
            state: OnboardingState(models: [], choosen: []),
            reducer: OnboardingReducer())
        )
}
