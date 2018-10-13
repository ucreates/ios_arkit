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
public class Quadratic {
    public static func easeIn(currentTime: Float, totalTime: Float, start: Float, end: Float) -> Float {
        let diff: Float = end - start
        var rate: Float = currentTime / totalTime
        if (rate > 1.0) {
            rate = 1.0
        }
        return diff * powf(rate, 2.0) + start
    }
    public static func easeOut(currentTime: Float, totalTime: Float, start: Float, end: Float) -> Float {
        let diff: Float = end - start
        var rate: Float = currentTime / totalTime
        if (rate > 1.0) {
            rate = 1.0
        }
        return -1.0 * diff * rate * (rate - 2) + start
    }
    public static func easeInOut(currentTime: Float, totalTime: Float, start: Float, end: Float) -> Float {
        let switchType: Bool = currentTime / totalTime >= 0.5
        if (false == switchType) {
            return Quadratic.easeIn(currentTime: currentTime, totalTime: totalTime, start: start, end: end)
        } else {
            return Quadratic.easeOut(currentTime: currentTime, totalTime: totalTime, start: start, end: end)
        }
    }
}
