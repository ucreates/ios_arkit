// ======================================================================
// Project Name    : ios_arkit
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import UIKit
import SceneKit
import ARKit
import iOSSwiftFoundation
class ViewController: UIViewController, ARSCNViewDelegate, SCNSceneRendererDelegate, UIGestureRecognizerDelegate, INotifyDelegate {
    var behaviour: IconBehaviour!
    var lastTime: TimeInterval = 0
    var enableTouch: Bool
    required init?(coder aDecoder: NSCoder) {
        self.enableTouch = true
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.onTouch(_:)))
        let sceneView: ARSCNView! = self.view as? ARSCNView
        sceneView?.delegate = self
        sceneView?.preferredFramesPerSecond = 30
        sceneView?.showsStatistics = false
        sceneView?.scene = SCNScene()
        sceneView?.addGestureRecognizer(gesture)
        self.enableTouch = false
        self.lastTime = 0.0
        self.behaviour = IconBehaviour()
        let notifier: Notifier = Notifier.getInstance()
        notifier.add(inotify: (self as INotifyDelegate?))
        return
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = ARWorldTrackingConfiguration.PlaneDetection.horizontal
        let sceneView: ARSCNView? = self.view as? ARSCNView
        sceneView?.session.run(configuration)
        return
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let sceneView: ARSCNView? = self.view as? ARSCNView
        sceneView?.session.pause()
        return
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        return
    }
    public func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if (0.0 == self.lastTime) {
            self.lastTime = time
        }
        let delta: TimeInterval = time - self.lastTime
        self.behaviour.onUpdate(delta: delta)
        self.lastTime = time
        return
    }
    public func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        let parameter: Parameter = Parameter()
        parameter.set(parameterName: "node", parameter: node)
        self.behaviour.onCreate(paramter: parameter)
        return
    }
    public func renderer(_ renderer: SCNSceneRenderer, willUpdate node: SCNNode, for anchor: ARAnchor) {
        return
    }
    public func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        return
    }
    public func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        return
    }
    func session(_ session: ARSession, didFailWithError error: Error) {
        ConsoleStream.write(val: error.localizedDescription)
        return
    }
    func sessionWasInterrupted(_ session: ARSession) {
        return
    }
    func sessionInterruptionEnded(_ session: ARSession) {
        return
    }
    func onNotify(message: NotifyMessage, parameter: Parameter?) {
        if (NotifyMessage.OnTrackingFound == message || NotifyMessage.OnActionComplete == message) {
            self.enableTouch = true
        }
        return
    }
    @objc func onTouch(_ sender: UITapGestureRecognizer) -> Void {
        if (false == self.enableTouch) {
            return
        }
        let sceneView: ARSCNView? = self.view as? ARSCNView
        let point: CGPoint = sender.location(in: sceneView)
        let hitTestResults: [ARHitTestResult]? = sceneView?.hitTest(point, types: ARHitTestResult.ResultType.existingPlaneUsingExtent)
        if (0 == hitTestResults?.count) {
            return
        }
        let notifier: Notifier = Notifier.getInstance()
        notifier.notify(message: NotifyMessage.OnRaycastHit)
        self.enableTouch = false
        return
    }
}
