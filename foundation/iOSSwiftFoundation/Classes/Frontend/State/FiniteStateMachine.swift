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
public class FiniteStateMachine<T> {
    public var finiteStateEntity: FiniteStateEntity<T>
    public var stateList: [String: FiniteState<T>]!
    public var persistentStateList: [String: FiniteState<T>]!
    public var paramter: Parameter?
    public var owner: T?
    public var enableFrameSkip: Bool
    public var frameSkipCounter: Int
    public init() {
        self.finiteStateEntity = FiniteStateEntity<T>()
        self.stateList = [String: FiniteState<T>]()
        self.persistentStateList = [String: FiniteState<T>]()
        self.paramter = nil
        self.owner = nil
        self.enableFrameSkip = false
        self.frameSkipCounter = 0
    }
    open func change(stateName: String) -> Void {
        self.change(stateName: stateName, parameter: nil, update: false)
        return
    }
    open func change(stateName: String, update: Bool) -> Void {
        self.change(stateName: stateName, parameter: nil, update: update)
        return
    }
    open func change(stateName: String, parameter: Parameter?, update: Bool) -> Void {
        self.paramter = parameter
        let nextState: FiniteState<T>? = self.get(newStateName: stateName)
        if (nil == nextState) {
            return
        }
        self.finiteStateEntity.update(nextStateName: stateName, nextState: nextState)
        return
    }
    open func update(delta: TimeInterval) -> Void {
        if (nil != self.finiteStateEntity.state && false == self.finiteStateEntity.state?.complete) {
            if (false != self.finiteStateEntity.isNewState) {
                if (nil != self.paramter) {
                    self.finiteStateEntity.state?.create(parameter: self.paramter)
                } else {
                    self.finiteStateEntity.state?.create()
                }
                self.finiteStateEntity.isNewState = false
            }
            if (nil != self.finiteStateEntity.state && false == self.finiteStateEntity.state?.complete && false == self.finiteStateEntity.state?.wait) {
                self.finiteStateEntity.state?.update(delta: delta)
            }
        }
        for stateName in self.persistentStateList.keys {
            let state: FiniteState<T>! = self.persistentStateList[stateName]
            state.update(delta: delta)
        }
        return
    }
    open func play() -> Void {
        for stateName in self.stateList.keys {
            let state: FiniteState<T>! = self.stateList[stateName]
            state.wait = false
            state.complete = false
        }
        for stateName in self.persistentStateList.keys {
            let state: FiniteState<T>! = self.persistentStateList[stateName]
            state.wait = true
            state.complete = true
        }
        return
    }
    open func pause() -> Void {
        for stateName in self.stateList.keys {
            let state: FiniteState<T>! = self.stateList[stateName]
            state.wait = true
        }
        return
    }
    open func stop() -> Void {
        for stateName in self.stateList.keys {
            let state: FiniteState<T>! = self.stateList[stateName]
            state.complete = true
        }
        for stateName in self.persistentStateList.keys {
            let state: FiniteState<T>! = self.persistentStateList[stateName]
            state.complete = true
        }
        return
    }
    @discardableResult
    open func add(stateName: String, state: FiniteState<T>!) -> Bool {
        if (false == state?.persistent) {
            if (nil == self.stateList[stateName]) {
                state.owner = self.owner
                state.stateMachine = self
                self.stateList[stateName] = state
                return true
            }
        } else {
            if (nil == self.persistentStateList[stateName]) {
                state.owner = self.owner
                state.stateMachine = self
                self.persistentStateList[stateName] = state
                return true
            }
        }
        return false
    }
    func get(newStateName: String) -> FiniteState<T>? {
        var ret: FiniteState<T>? = nil
        if (nil != self.stateList[newStateName]) {
            ret = self.stateList[newStateName]
        } else if (nil != self.persistentStateList[newStateName]) {
            ret = self.persistentStateList[newStateName]
        }
        return ret
    }
}
