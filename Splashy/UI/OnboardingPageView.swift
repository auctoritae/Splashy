//
//  OnboardingItemView.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 8/8/24.
//

import SwiftUI

protocol OnboardingPageProtocol {
    func chooseItem(_ model: OptionItem)
}

struct OnboardingPageView: View {
    private enum Appearance {
        static let fontSize: CGFloat = 80
        static let padding: CGFloat = 16
    }
    
    let model: OnboardingItem
    var delegate: OnboardingPageProtocol?
    
    var body: some View {
        LazyVStack(alignment: .center) {
            Text(model.title.uppercased())
                .font(.system(.largeTitle))
                .fontWeight(.heavy)
                .padding(Appearance.padding)
            
            ForEach(model.options, id: \.self) { item in
                Text(item.value)
                    .font(.system(size: Appearance.fontSize))
                    .padding(Appearance.padding)
                    .onTapGesture {
                        delegate?.chooseItem(item)
                    }
            }
        }
        .padding(.all, Appearance.padding)
    }
}

#Preview {
    OnboardingPageView(model: OnboardingItem(
        title: "Choose your fav weather",
        options: [
            OptionItem(key: .weather, value: "☀️"),
            OptionItem(key: .weather, value: "⛈️"),
            OptionItem(key: .weather, value: "❄️")
        ])
    )
}
