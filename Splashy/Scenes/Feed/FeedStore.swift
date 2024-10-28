//
//  FeedStore.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 10/28/24.
//

import SwiftUI
import Observation

@Observable
final class FeedStore {
    private(set) var state: FeedState
    private let reducer: FeedReducer
    
    init(
        state: FeedState,
        reducer: FeedReducer
    ) {
        self.state = state
        self.reducer = reducer
    }
    
    public func send(action: FeedAction) {
        state = reducer.reduce(state: &state, action: action)
    }
}
