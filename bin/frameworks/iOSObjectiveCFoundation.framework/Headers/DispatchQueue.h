// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef Dispatcher_h
#define Dispatcher_h
#import <Foundation/Foundation.h>
@interface DispatchQueue : NSObject
+ (void)async:(dispatch_block_t)block;
@end
#endif /* Dispatcher_h */
