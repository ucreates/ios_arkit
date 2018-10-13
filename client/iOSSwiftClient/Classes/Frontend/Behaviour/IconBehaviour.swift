// ======================================================================
// Project Name    : ios_arkit
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import SceneKit
import iOSSwiftFoundation
class IconBehaviour: BaseBehaviour, INotifyDelegate {
    public static let ICON_SCALE: Float = 0.05
    public var stateMachine: FiniteStateMachine<IconBehaviour>!
    public var defaultPosition: SCNVector3!
    public var node: SCNNode!
    public override init() {
        super.init()
        self.defaultPosition = SCNVector3Zero
        self.stateMachine = FiniteStateMachine<IconBehaviour>()
        self.stateMachine.owner = self
        self.stateMachine.add(stateName: "show", state: IconShowState())
        self.stateMachine.add(stateName: "beat", state: IconBeatState())
        self.stateMachine.add(stateName: "jump", state: IconJumpState())
        self.stateMachine.stop()
        let notifier: Notifier = Notifier.getInstance()
        notifier.add(inotify: (self as INotifyDelegate))
    }
    open override func onCreate(paramter: Parameter) -> Void {
        let rootNode: SCNNode? = paramter.get(parameterName: "node")
        let scene: SCNScene? = SCNScene(named: "art.scnassets/apple.obj")
        let light: SCNLight = SCNLight()
        let lightNode: SCNNode = SCNNode()
        light.type = SCNLight.LightType.omni
        light.color = UIColor.white
        light.intensity = 1000.0
        lightNode.light = light
        lightNode.position = SCNVector3Make(0, 30, 0)
        lightNode.eulerAngles = SCNVector3Make(-90, 0, 0)
        self.node = scene?.rootNode.childNodes[0]
        self.node.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        self.node.scale = SCNVector3Zero
        self.node.isHidden = true
        self.defaultPosition = self.node.position
        DispatchQueue.main.async {
            rootNode?.addChildNode(self.node)
            rootNode?.addChildNode(lightNode)
            self.stateMachine.change(stateName: "show")
            self.stateMachine.play()
        }
        return
    }
    open override func onUpdate(delta: TimeInterval) -> Void {
        self.stateMachine.update(delta: delta)
        return
    }
    func onNotify(message: NotifyMessage, parameter: Parameter?) {
        if (NotifyMessage.OnRaycastHit != message) {
            return
        }
        let i: Int = Int(arc4random_uniform(11))
        if (0 == i % 2) {
            self.stateMachine.change(stateName: "beat")
        } else {
            self.stateMachine.change(stateName: "jump")
        }
        self.stateMachine.play()
        return
    }
}
