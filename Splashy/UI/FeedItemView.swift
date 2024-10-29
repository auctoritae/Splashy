//
//  FeedItemView.swift
//  Splashy
//
//  Created by Alexander Lobanoff on 10/29/24.
//

import SwiftUI

struct FeedItemView: View {

    let model: FeedModel
    
    var body: some View {
        Rectangle()
            .edgesIgnoringSafeArea(.all)
            .foregroundStyle(model.color)
            .navigationBarBackButtonHidden()
    }
}

#Preview {
    FeedItemView(model: FeedModel(color: .mint))
}
