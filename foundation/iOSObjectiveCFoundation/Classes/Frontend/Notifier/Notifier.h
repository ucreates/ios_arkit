// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef Notifier_h
#define Notifier_h
#import <Foundation/Foundation.h>
#import "INotifyDelegate.h"
#import "NotifyMessage.h"
#import "Parameter.h"
@interface Notifier : NSObject
@property NSMutableDictionary<NSString*, id<INotifyDelegate>>* notifierDictionary;
+ (Notifier*)getInstance;
- (void)notify:(NotifyMessage)message;
- (void)notify:(NotifyMessage)message parameter:(Parameter*)parameter;
- (BOOL)add:(id<INotifyDelegate>)notify;
@end
#endif /* Notifier_h */
