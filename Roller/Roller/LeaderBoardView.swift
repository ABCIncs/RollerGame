//
//  LeaderBoardView.swift
//  Roller
//
//  Created by Cédric Bahirwe on 16/12/2022.
//

import SwiftUI

struct LeaderBoardView: View {
    let score: Int
    let bestScore: Int
    var body: some View {
        HStack {
            Text("Score: ")
                .font(.system(size: 14, weight: .regular, design: .monospaced))
            + Text(score.description)
            Spacer()
            Text("Best: ").font(.system(size: 14, weight: .regular, design: .monospaced))
            + Text(bestScore.description)
        }
        .foregroundColor(Color.white)
        .padding(.horizontal)
        .offset(y: -10)
    }
}
