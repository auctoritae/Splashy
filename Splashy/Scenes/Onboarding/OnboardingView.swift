//
//  OnboardingView.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 8/8/24.
//

import SwiftUI

struct OnboardingView: View, OnboardingPageProtocol {
    private enum Appearance {
        enum Button {
            static let width: CGFloat = 250
            static let heigh: CGFloat = 50
            static let bottomOffset: CGFloat = 90
            static let shadow: CGFloat = 12
            static let padding: CGFloat = 16
        }
    }
    
    @Environment(OnboardingStore.self) private var store
    
    var body: some View {
        LazyVStack {
            ScrollViewReader { value in
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(store.state.models, id: \.self) { model in
                            OnboardingPageView(model: model, delegate: self)
                                .containerRelativeFrame([.horizontal, .vertical], alignment: .leading
                                )
                        }
                    }
                    .onAppear {
                        store.send(action: .start)
                    }
                }
                .onChange(of: store.state.pageIndex) {
                    withAnimation {
                        value.scrollTo(
                            store.state.models[store.state.pageIndex],
                            anchor: .leading
                        )
                    }
                }
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .scrollDisabled(true)
            }
            
            Button(action: {
                store.send(action: .complete)
                /// add navigation here
            }, label: {
                Text(StaticTexts.completed.uppercased())
                    .frame(minWidth: Appearance.Button.width, alignment: .center)
                    .padding(Appearance.Button.padding)
                    .font(.system(.body))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .background(.red)
                    .clipShape(.capsule)
            })
            .shadow(radius: Appearance.Button.shadow)
            .padding(.bottom, Appearance.Button.bottomOffset)
            .animation(.easeIn) { view in
                view.opacity(store.state.showButton ? 1 : 0)
            }
        }
    }
    
    func chooseItem(_ model: OptionItem) {
        store.send(action: .select(model))
    }
}

#Preview {
    OnboardingView()
        .environment(OnboardingStore(
            state: OnboardingState(models: [], choosen: [], pageIndex: 0, showButton: false),
            reducer: OnboardingReducer())
        )
}
