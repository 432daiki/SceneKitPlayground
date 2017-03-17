//: Playground - noun: a place where people can play

import UIKit
import SpriteKit
import PlaygroundSupport

var str = "Hello, playground"

final class TestScene: SKScene {

    override func didMove(to view: SKView) {
        super.didMove(to: view)

        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

        for i in 0..<50 {
//            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.5) {
                let apple = SKSpriteNode(imageNamed: "apple")
                apple.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
                apple.size = CGSize(width: 30, height: 30 * (apple.size.height / apple.size.width))
                self.addChild(apple)

                apple.physicsBody = SKPhysicsBody(rectangleOf: apple.size)
//            }
        }
    }
}

final class SpriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let viewSize = CGSize(width: 375.0, height: 667.0)

        let scene = TestScene(size: viewSize)
        scene.backgroundColor = .clear

        let skView = SKView(frame: CGRect(origin: .zero, size: viewSize))
        skView.backgroundColor = SKColor.clear
        skView.presentScene(scene)
        skView.showsFPS = true
        skView.showsNodeCount = true
        view.addSubview(skView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        print(touches)
    }
}


let vc = SpriteViewController()
vc.view.frame = CGRect(x: 0.0, y: 0.0, width: 375.0, height: 667.0)
PlaygroundPage.current.liveView = vc
PlaygroundPage.current.needsIndefiniteExecution = true
