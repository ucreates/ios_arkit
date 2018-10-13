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
public class Bouncy {
    fileprivate static let GRAVITY: Float = 0.98
    fileprivate static let E: Float = 0.5
    public var gravity: Float!
    public var velocity: Float!
    public var originVelocity: Float!
    public init(velocity: Float, rate: Float) {
        self.velocity = velocity
        self.originVelocity = velocity
        self.gravity = Bouncy.GRAVITY * rate
    }
    open func update() -> Float {
        self.velocity -= self.gravity
        return self.velocity
    }
    open func restore() -> Void {
        self.originVelocity *= Bouncy.E
        self.velocity = self.originVelocity
        return
    }
}
