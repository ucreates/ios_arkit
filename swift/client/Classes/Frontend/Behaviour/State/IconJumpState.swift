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
class IconJumpState: FiniteState<IconBehaviour> {
    var parabora: Parabora!
    open override func create() -> Void {
        self.parabora = Parabora()
        self.parabora.velocity = 1.0
        self.parabora.mass = 1.0
        self.parabora.radian = Angle.toRadian(degree: 90.0)
        self.timeLine.restore()
        self.timeLine.rate = 0.1
        return
    }
    open override func update(delta: TimeInterval) -> Void {
        let position: SCNVector3 = self.parabora.create(currentFrame: self.timeLine.currentFrame)
        if (0.0 > position.y) {
            self.owner.node.position = self.owner.defaultPosition
            let notifier: Notifier = Notifier.getInstance()
            notifier.notify(message: NotifyMessage.OnActionComplete)
            self.complete = true
            return
        } else {
            let nx: Float = self.owner.node.position.x
            let ny: Float = position.y
            let nz: Float = self.owner.node.position.z
            self.owner.node.position = SCNVector3Make(nx, ny, nz)
        }
        self.timeLine.next(delta: delta)
        return
    }
}
