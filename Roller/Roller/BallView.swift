//
//  BallView.swift
//  Roller
//
//  Created by Cédric Bahirwe on 16/12/2022.
//

import SwiftUI

struct BallView: View {
    init(_ color: Color, size: CGFloat) {
        self.color = color
        self.size = size
    }

    private let color: Color
    private let size: CGFloat
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
            .shadow(color: .gray, radius: 2)
    }
}


struct BallView_Previews: PreviewProvider {
    static var previews: some View {
        BallView(.red, size: 100)
    }
}
