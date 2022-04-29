//
//  GameViewController.swift
//  SpliteDemo
//
//  Created by 本間 on 2022/03/23.
//

import UIKit
import SpriteKit

final class GameViewController: UIViewController {
    @IBOutlet weak var gameView: SKView!
    private var gameScene: GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        gameScene = SKScene(fileNamed: "GameScene") as? GameScene
        gameView.presentScene(gameScene)
        gameView.showsFPS = true
        gameView.showsNodeCount = true
    }

    @IBAction func onTapClear(_ sender: UIButton) {
        gameScene.reset()
    }

    override var shouldAutorotate: Bool {
        true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        UIDevice.current.userInterfaceIdiom == .phone ? .allButUpsideDown : .all
    }
}
