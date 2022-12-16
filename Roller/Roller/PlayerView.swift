//
//  PlayerView.swift
//  Roller
//
//  Created by Cédric Bahirwe on 16/12/2022.
//

import SwiftUI

struct PlayerView: View {
    let size: CGSize
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                Spacer()

            }
            .overlay(
                VStack {
                    Triangle()
                        .fill(Color.red)
                        .frame(width: size.height/3, height: size.height/3/2)

                }
                    .frame(width: size.height/3, height: size.height/3, alignment: .bottom)
                    .rotationEffect(.degrees(90))
            )

            .overlay(
                VStack {
                    Triangle()
                        .fill(Color.green)
                        .frame(width: size.height/3, height: size.height/3/2)

                }
                    .frame(width: size.height/3, height: size.height/3, alignment: .bottom)
                    .rotationEffect(.degrees(0))
            )

            .overlay(
                VStack {
                    Triangle()
                        .fill(Color.blue)
                        .frame(width: size.height/3, height: size.height/3/2)

                }
                    .frame(width: size.height/3, height: size.height/3, alignment: .bottom)
                    .rotationEffect(.degrees(180))
            )

            .overlay(
                VStack {
                    Triangle()
                        .fill(Color.yellow)
                        .frame(width: size.height/3, height: size.height/3/2)

                }
                    .frame(width: size.height/3, height: size.height/3, alignment: .bottom)
                    .rotationEffect(.degrees(-90))
            )

        }
        .frame(width: size.height/3, height: size.height/3)
    }
}
