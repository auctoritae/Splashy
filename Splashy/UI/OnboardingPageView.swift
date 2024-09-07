//
//  OnboardingItemView.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 8/8/24.
//

import SwiftUI

protocol OnboardingPageProtocol {
    func chooseItem(_ model: ChoosenItem)
}

struct OnboardingPageView: View {
    private enum Appearance {
        static let fontSize: CGFloat = 80
        static let padding: CGFloat = 16
    }
    
    var model: OnboardingItem
    var delegate: OnboardingPageProtocol?
    
    var body: some View {
        LazyVStack(alignment: .center) {
            Text(model.title.uppercased())
                .font(.system(.largeTitle))
                .fontWeight(.heavy)
                .padding(Appearance.padding)
            
            ForEach(model.options, id: \.self) { item in
                Text(item)
                    .font(.system(size: Appearance.fontSize))
                    .padding(Appearance.padding)
                    .onTapGesture {
                        delegate?.chooseItem(
                            ChoosenItem(key: model.key, value: item)
                        )
                    }
            }
        }
        .padding(.all, Appearance.padding)
    }
}

#Preview {
    OnboardingPageView(model: OnboardingItem(
        key: .weather, 
        title: "Choose your fav weather",
        options: ["☀️", "⛈️", "❄️"])
    )
}
