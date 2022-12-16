//
//  ContentView.swift
//  Roller
//
//  Created by Cédric Bahirwe on 16/12/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameEngine = GameEngine()
    var body: some View {
        GeometryReader { geo in
            VStack {
                BallView(gameEngine.ballColor, size: 60)
                    .offset(gameEngine.ballOffset)
                    .zIndex(10)

                Spacer()

                PlayerView(size: geo.size)

                    .rotationEffect(.degrees(gameEngine.playerRotationAngle))
                    .onTapGesture {
                        gameEngine.rotate()
                    }
            }
            .frame(width: geo.size.width, height: geo.size.height)

            .background(Color.black.opacity(0.9))
            .onReceive(gameEngine.timer) { _ in
                gameEngine.handleLayoutUpdates(in: geo.size)
            }

            .overlay(alignment: .top) {
                LeaderBoardView(score: gameEngine.currentScore, bestScore: gameEngine.bestScore)
            }
            .alert(isPresented: $gameEngine.showAlert) {
                Alert(title: Text("You Failed"),
                      message: Text("Try again to go over your best score"),
                      dismissButton: .cancel(Text("Try again"),
                                             action: gameEngine.restartGame))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}
