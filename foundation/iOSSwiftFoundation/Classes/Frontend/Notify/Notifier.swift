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
public class Notifier {
    fileprivate static var instance: Notifier?
    public var notifierDictionary: [String: INotifyDelegate]!
    fileprivate init() {
        self.notifierDictionary = [String: INotifyDelegate]()
    }
    public static func getInstance() -> Notifier! {
        if (nil == Notifier.instance) {
            Notifier.instance = Notifier()
        }
        return Notifier.instance!
    }
    public func notify(message: NotifyMessage) -> Void {
        self.notify(message: message, parameter: nil)
        return
    }
    public func notify(message: NotifyMessage, parameter: Parameter?) -> Void {
        for id in self.notifierDictionary.keys {
            let inotify: INotifyDelegate! = self.notifierDictionary[id]
            inotify.onNotify(message: message, parameter: parameter)
        }
        return
    }
    @discardableResult
    public func add(inotify: INotifyDelegate!) -> Bool {
        let inotifyObject: NSObject = inotify as! NSObject
        let uniqId: String = inotifyObject.uniqId()
        if (nil == self.notifierDictionary[uniqId]) {
            self.notifierDictionary[uniqId] = inotify
            return true
        }
        return false
    }
}
