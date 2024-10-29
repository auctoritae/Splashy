//
//  FeedView.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 10/28/24.
//

import SwiftUI

struct FeedView: View {
    private enum Appearance {
        static let elementHeight: CGFloat = 450
        static let elementPadding: CGFloat = 16
    }
    
    var store: FeedStore
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(store.state.models, id: \.id) { model in
                        NavigationLink(value: model) {
                            FeedItemElement(model: model)
                                .frame(height: Appearance.elementHeight)
                                .padding(Appearance.elementPadding)
                        }
                    }
                }
                .onAppear {
                    store.send(action: .start)
                }
            }
            .navigationDestination(for: FeedModel.self) { model in
                FeedItemView(model: model)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    FeedView(store: FeedStore(state: FeedState(models: []), reducer: FeedReducer()))
}
