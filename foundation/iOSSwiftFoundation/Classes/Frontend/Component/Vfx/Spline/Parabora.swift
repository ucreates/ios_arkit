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
import SceneKit
public class Parabora {
    fileprivate static let GRAVITY: Float = 0.98
    public var mass: Float!
    public var velocity: Float!
    public var radian: Float!
    public init() {
        self.velocity = 1.0
        self.mass = 1.0
        self.radian = 0.0
    }
    open func create(currentFrame: Float) -> SCNVector3 {
        let sin: Float = sinf(self.radian)
        let cos: Float = cosf(self.radian)
        let nx: Float = self.velocity * cos * currentFrame
        let ny: Float = (self.velocity * sin * currentFrame) - (Parabora.GRAVITY * powf(currentFrame, 2.0) / 2.0)
        return SCNVector3Make(nx, ny, 0.0)
    }
}
