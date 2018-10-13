// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
open class BaseBehaviour: NSObject {
    public var id: Int!
    public var intersect: Bool!
    public var destroy: Bool!
    public override init() {
        super.init()
        self.destroy = false
        self.intersect = false
    }
    open func onCreate() -> Void {
        return
    }
    open func onCreate(paramter: Parameter) -> Void {
        return
    }
    open func onUpdate(delta: TimeInterval) -> Void {
        return
    }
    open func onRender() -> Void {
        return
    }
    open func onCollisionEnter(behaviour: BaseBehaviour) -> Void {
        return
    }
    open func onCollisionStay(behaviour: BaseBehaviour) -> Void {
        return
    }
    open func onCollisionExit(behaviour: BaseBehaviour) -> Void {
        return
    }
}
