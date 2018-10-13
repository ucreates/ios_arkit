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
public class Parameter {
    public var parameterDictionary: [String: Any]!
    public init() {
        self.parameterDictionary = [String: Any]()
    }
    open func get<T>(parameterName: String) -> T? {
        if (nil != self.parameterDictionary[parameterName]) {
            return self.parameterDictionary[parameterName] as? T
        }
        return nil
    }
    open func set<T>(parameterName: String, parameter: T) -> Void {
        if (nil != self.parameterDictionary[parameterName]) {
            return
        }
        self.parameterDictionary[parameterName] = parameter
        return
    }
}
