// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef INotifyDelegate_h
#define INotifyDelegate_h
#import <Foundation/Foundation.h>
#import "NotifyMessage.h"
#import "Parameter.h"
@protocol INotifyDelegate<NSObject>
@required
- (void)onNotify:(NotifyMessage)notifyMessage parameter:(Parameter*)parameter;
@end
#endif /* INotifyDelegate_h */
