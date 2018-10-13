// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import Foundation
open class FiniteState<T>: NSObject {
    public var owner: T!
    public var stateMachine: FiniteStateMachine<T>?
    public var timeLine: TimeLine!
    public var persistent: Bool!
    public var complete: Bool!
    public var wait: Bool!
    public var initialize: Bool!
    public var emitCallback: Bool!
    public var dump: Bool!
    public override init() {
        super.init()
        self.persistent = false
        self.complete = false
        self.wait = false
        self.timeLine = TimeLine()
    }
    open func create() -> Void {
        return
    }
    open func create(parameter: Parameter?) -> Void {
        return
    }
    open func update(delta: (TimeInterval)) -> Void {
        return
    }
}
