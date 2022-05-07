//
//  GameScene.swift
//  SpliteDemo
//
//  Created by 本間 on 2022/03/23.
//

import SpriteKit

final class GameScene: SKScene {
    /// カラースキーム
    private let colors: [UIColor] = [
        .init(red: 140.0 / 255.0, green:   3.0 / 255.0, blue:  39.0 / 255.0, alpha: 1),
        .init(red: 217.0 / 255.0, green:  85.0 / 255.0, blue: 133.0 / 255.0, alpha: 1),
        .init(red:  75.0 / 255.0, green: 137.0 / 255.0, blue: 191.0 / 255.0, alpha: 1),
        .init(red:  65.0 / 255.0, green: 119.0 / 255.0, blue: 166.0 / 255.0, alpha: 1),
        .init(red: 166.0 / 255.0, green: 155.0 / 255.0, blue: 124.0 / 255.0, alpha: 1)
    ]

    /// 円のサイズ (ランダムの範囲)
    private let nodeSize: ClosedRange<CGFloat> = 10...30

    /// インデックス
    private var i: UInt32 = 1

    /// クリックされたポジションのバッファー
    private var newPosition: CGPoint = .zero

    /// https://developer.apple.com/documentation/spritekit/skscene/1519607-didmove
    /// - Parameter view: ビュー
    override func didMove(to view: SKView) {
        setEdge()
    }

    /// https://developer.apple.com/documentation/uikit/uiresponder/1621084-touchesended
    /// - Parameters:
    ///   - touches: タッチ
    ///   - event: イベント
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        newPosition = touches.first?.location(in: view) ?? .zero
    }

    /// https://developer.apple.com/documentation/spritekit/skscene/1519802-update
    /// - Parameter currentTime: システムタイム
    override func update(_ currentTime: TimeInterval) {
        guard newPosition != .zero else { return }
        view?.scene?.addChild(makeCircle(position: newPosition))
        newPosition = .zero
        i += 1
    }

    /// シーンのリセット
    func reset() {
        view?.scene?.removeAllChildren()
        i = 1
        setEdge()
    }

    /// 境界の設定
    private func setEdge() {
        physicsBody = .init(edgeLoopFrom: frame)
        physicsBody?.collisionBitMask = UInt32(0)
    }

    /// 円の作成
    /// - Parameters:
    ///   - mask: マスクID
    ///   - position: 初期の位置
    /// - Returns: 円のシェイプ
    private func makeCircle(position: CGPoint) -> SKShapeNode {
        let size = CGFloat.random(in: nodeSize)
        let ball = SKShapeNode(circleOfRadius: size)
        ball.fillColor = colors.randomElement() ?? .white
        ball.position = convertPoint(fromView: position) // ポイントの変換 (UIView -> SKScene)
        ball.physicsBody = .init(circleOfRadius: size)
        ball.physicsBody?.collisionBitMask = i
        return ball
    }
}
