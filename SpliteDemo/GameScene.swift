//
//  GameScene.swift
//  SpliteDemo
//
//  Created by 本間 on 2022/03/23.
//

import SpriteKit

final class GameScene: SKScene {
    private let colors: [UIColor] = [.red, .green, .blue, .cyan, .magenta, .yellow]
    private var i: UInt32 = 1
    private var newPosition: CGPoint = .zero

    override func didMove(to view: SKView) {
        setEdge()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        newPosition = touches.first?.location(in: view) ?? .zero
    }

    override func update(_ currentTime: TimeInterval) {
        if newPosition != .zero {
            view?.scene?.addChild(makeCircle(mask: i, position: newPosition))
            newPosition = .zero
            i += 1
        }
    }

    func reset() {
        view?.scene?.removeAllChildren()
        i = 1
        setEdge()
    }

    private func setEdge() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.isDynamic = true
        physicsBody?.affectedByGravity = false
        physicsBody?.collisionBitMask = UInt32(0)
    }

    private func makeCircle(mask: UInt32, position: CGPoint) -> SKShapeNode {
        let size = CGFloat.random(in: 30...80)
        let ball = SKShapeNode(circleOfRadius: size)
        ball.fillColor = (colors.randomElement() ?? .white)
        ball.position = convertPoint(fromView: position)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: size)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.collisionBitMask = mask
        return ball
    }
}
