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
public class ConsoleStream: NSObject {
    public static let IDENTIFIER: String = "IOS_FOUNDATION"
    public static func write(val: String) -> Void {
        let log: String = String(format: "%@,%@", arguments: [ConsoleStream.IDENTIFIER, val])
        print(log)
        return
    }
    public static func log(val: [GLchar]) -> Void {
        let info: String = String(validatingUTF8: val)!
        ConsoleStream.write(val: info)
        return
    }
}
