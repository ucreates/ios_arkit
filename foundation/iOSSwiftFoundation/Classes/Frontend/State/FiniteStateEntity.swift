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
public class FiniteStateEntity<T> {
    public var isNewState: Bool!
    public var state: FiniteState<T>?
    public var currentStateName: String!
    public var previousStateName: String!
    public var nextStateName: String!
    public init() {
        self.isNewState = false
        self.state = nil
        self.currentStateName = nil
        self.previousStateName = nil
        self.nextStateName = nil
    }
    open func update(nextStateName: String!, nextState: FiniteState<T>?) -> Void {
        if (self.currentStateName != nextStateName) {
            self.previousStateName = self.currentStateName
            self.currentStateName = nextStateName
            self.state = nextState
        }
        self.isNewState = true
        return
    }
}
