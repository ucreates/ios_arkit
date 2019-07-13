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
class IconShowState: FiniteState<IconBehaviour> {
    fileprivate static let ROTATE_DEGREE: Float = 360.0 * 10.0
    fileprivate static let ANIMATION_TIME: Float = 5.0
    public override init() {
        super.init()
    }
    open override func create() -> Void {
        self.owner.node.scale = SCNVector3Make(IconBehaviour.ICON_SCALE, IconBehaviour.ICON_SCALE, IconBehaviour.ICON_SCALE)
        self.owner.node.isHidden = false
        return
    }
    open override func update(delta: TimeInterval) -> Void {
        if (IconShowState.ANIMATION_TIME < self.timeLine.currentTime) {
            self.owner.node.scale = SCNVector3Make(IconBehaviour.ICON_SCALE, IconBehaviour.ICON_SCALE, IconBehaviour.ICON_SCALE)
            self.owner.node.eulerAngles = SCNVector3Zero
            let notifier: Notifier = Notifier.getInstance()
            notifier.notify(message: NotifyMessage.OnTrackingFound)
            self.complete = true
            return
        }
        let scale: Float = Quadratic.easeOut(currentTime: self.timeLine.currentTime, totalTime: IconShowState.ANIMATION_TIME, start: 0.0, end: IconBehaviour.ICON_SCALE)
        let rotate: Float = IconShowState.ROTATE_DEGREE - Quadratic.easeOut(currentTime: self.timeLine.currentTime, totalTime: IconShowState.ANIMATION_TIME, start: 0.0, end: IconShowState.ROTATE_DEGREE)
        self.owner.node.scale = SCNVector3Make(scale, IconBehaviour.ICON_SCALE, scale)
        self.owner.node.eulerAngles = SCNVector3Make(0.0, -1.0 * rotate, 0.0)
        self.timeLine.next(delta: delta)
        return
    }
}
