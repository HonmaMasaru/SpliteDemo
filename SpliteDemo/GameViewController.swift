//
//  GameViewController.swift
//  SpliteDemo
//
//  Created by 本間 on 2022/03/23.
//

import UIKit
import SpriteKit

final class GameViewController: UIViewController {
    /// SpliteKitシーンのアウトレット
    @IBOutlet weak var gameView: SKView!

    /// SpliteKitシーン
    private var gameScene: GameScene!

    /// https://developer.apple.com/documentation/uikit/uiviewcontroller/1621495-viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// https://developer.apple.com/documentation/uikit/uiviewcontroller/1621398-viewdidlayoutsubviews
    override func viewDidLayoutSubviews() {
        gameScene = GameScene(size: view.frame.size)
        gameView.presentScene(gameScene)
        gameView.showsFPS = true
        gameView.showsNodeCount = true
    }

    /// clearボタンのハンドラ
    /// - Parameter sender: 呼び出し元
    @IBAction func onTapClear(_ sender: UIButton) {
        gameScene.reset()
    }

    /// https://developer.apple.com/documentation/uikit/uiviewcontroller/1621419-shouldautorotate
    override var shouldAutorotate: Bool {
        true
    }

    // https://developer.apple.com/documentation/uikit/uiviewcontroller/1621435-supportedinterfaceorientations
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        UIDevice.current.userInterfaceIdiom == .phone ? .allButUpsideDown : .all
    }
}
