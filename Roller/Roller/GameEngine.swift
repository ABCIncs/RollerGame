//
//  GameEngine.swift
//  Roller
//
//  Created by Cédric Bahirwe on 16/12/2022.
//

import SwiftUI

final class GameEngine: ObservableObject {
    @Published var showAlert = false

    @Published private(set) var currentScore = 0
    @Published private(set) var bestScore = 0

    @Published private(set) var ballOffset = CGSize.zero
    @Published private(set) var ballColor = Color.yellow
    @Published private(set) var ballSpeed = 10

    @Published private(set) var nearestPlayerFaceIndex = 0
    @Published private(set) var playerRotationAngle = 0.0
    private let ballColors: [Color] = [.blue, .red, .green, .yellow]

    @Published private(set) var timer = Timer.publish(every: 0.085, on: .main, in: .common).autoconnect()

    private let defaultInterval: TimeInterval = 0.05

    func restartGame() {
        timer = Timer.publish(every: defaultInterval,
                              on: .current,
                              in: .common).autoconnect()
    }

    func restartTimer(with interval: TimeInterval) {
        timer = Timer.publish(every: interval,
                              on: .current,
                              in: .common).autoconnect()
    }

    func handleLayoutUpdates(in size: CGSize) {

        if (0...100).contains(currentScore) {
            ballSpeed = 15
        } else if (101...250).contains(currentScore) {
            ballSpeed = 25
        } else if (251...350).contains(currentScore) {
            ballSpeed = 35
        } else if (351...).contains(currentScore)  {
            ballSpeed = 40
        }

        withAnimation {
            if ballOffset.height >= ((2 * size.height/3) - 40) { // some weird calculation
                timer.upstream.connect().cancel()

                if ballColors[nearestPlayerFaceIndex] == ballColor {
                    currentScore += 10
                    ballOffset = .zero
                    ballColor = randomBallColor()
                    restartTimer(with: 0.1)

                } else {
                    currentScore = 0
                    ballOffset = .zero
                    ballColor = randomBallColor()
                    showAlert = true
                }
                bestScore = currentScore > bestScore ? currentScore : bestScore
            } else {
                ballOffset.height += CGFloat(ballSpeed)
            }
        }
    }


    func rotate() {
        if nearestPlayerFaceIndex < ballColors.count-1 {
            nearestPlayerFaceIndex += 1
        } else {
            nearestPlayerFaceIndex = 0
        }
        withAnimation {
            playerRotationAngle += 90.0
        }
    }

    func randomBallColor() -> Color {
        ballColors.randomElement() ?? .white
    }
}
