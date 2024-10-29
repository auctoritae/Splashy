//
//  FeedReducer.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 10/28/24.
//

import SwiftUI

final class FeedReducer {
    
    func reduce(state: inout FeedState, action: FeedAction) -> FeedState {
        var state = state
        
        switch action {
            case .start:
            state.models = [
                FeedModel(color: .indigo),
                FeedModel(color: .pink),
                FeedModel(color: .cyan),
                FeedModel(color: .orange),
                FeedModel(color: .mint)
            ]
        }
        
        return state
    }
}
