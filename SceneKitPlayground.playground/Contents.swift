import UIKit
import PlaygroundSupport
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scnView = SCNView(frame: CGRect(origin: .zero, size: CGSize(width: 375.0, height: 667.0)))
        scnView.backgroundColor = .red
        scnView.allowsCameraControl = true
        view.addSubview(scnView)

        let scene = SCNScene()
        scnView.scene = scene

        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 4)
        scene.rootNode.addChildNode(cameraNode)

        let light = SCNLight()
        light.type = .omni
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: 10, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)

        let cubeGeometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.1)
        let cubeNode = SCNNode(geometry: cubeGeometry)
        cubeNode.rotation = SCNVector4(x: 1.0, y: 1.0, z: 0.0, w: Float(M_PI * 0.25));
        scene.rootNode.addChildNode(cubeNode)
    }
}

let vc = ViewController()
vc.view.frame = CGRect(origin: .zero, size: CGSize(width: 375.0, height: 667.0))
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = vc
