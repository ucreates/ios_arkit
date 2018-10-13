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
public class TimeLine {
    public var currentFrame: Float!
    public var currentTime: Float!
    public var rate: Float!
    public init() {
        self.currentTime = 0.0
        self.currentFrame = 0.0
        self.rate = 1.0
    }
    open func next(delta: TimeInterval) -> Void {
        self.next(delta: delta, multipleRate: 1.0)
        return
    }
    open func next(delta: TimeInterval, multipleRate: Float) -> Void {
        self.currentFrame += self.rate
        self.currentTime += (Float(delta) * multipleRate)
        return
    }
    open func restore() -> Void {
        self.currentFrame = 0.0
        self.currentTime = 0.0
        return
    }
}
