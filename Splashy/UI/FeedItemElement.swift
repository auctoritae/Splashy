//
//  FeedItemElement.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 10/29/24.
//

import SwiftUI

struct FeedItemElement: View {
    private enum Appearance {
        static let cornerRadius: CGFloat = 20
    }
    
    let model: FeedModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: Appearance.cornerRadius)
            .foregroundStyle(model.color)
    }
}

#Preview {
    FeedItemElement(model: FeedModel(color: .orange))
}
