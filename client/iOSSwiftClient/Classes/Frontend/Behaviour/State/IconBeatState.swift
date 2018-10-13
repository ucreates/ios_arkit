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
class IconBeatState: FiniteState<IconBehaviour> {
    var bouncy: Bouncy!
    open override func create() -> Void {
        self.bouncy = Bouncy(velocity: 0.25, rate: 0.025)
        return
    }
    open override func update(delta: TimeInterval) -> Void {
        if (0.05 > self.bouncy.originVelocity) {
            self.owner.node.scale = SCNVector3Make(IconBehaviour.ICON_SCALE, IconBehaviour.ICON_SCALE, IconBehaviour.ICON_SCALE)
            let notifier: Notifier = Notifier.getInstance()
            notifier.notify(message: NotifyMessage.OnActionComplete)
            self.complete = true
            return
        }
        let rate: Float = self.bouncy.update()
        if (rate <= 0.0) {
            self.bouncy.restore()
        }
        let scale: Float = IconBehaviour.ICON_SCALE + rate
        self.owner.node.scale = SCNVector3Make(scale, scale, scale)
        return
    }
}
