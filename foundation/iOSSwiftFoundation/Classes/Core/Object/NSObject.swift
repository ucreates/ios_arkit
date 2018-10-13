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
public extension NSObject {
    func uniqId() -> String {
        let uuid: CFUUID = CFUUIDCreate(nil)
        let uuidStr: CFString = CFUUIDCreateString(nil, uuid)
        return uuidStr as String
    }
}
