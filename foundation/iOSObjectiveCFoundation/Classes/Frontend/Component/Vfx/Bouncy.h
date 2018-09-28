// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef Bouncy_h
#define Bouncy_h
#import <Foundation/Foundation.h>
@interface Bouncy : NSObject
@property float gravity;
@property float velocity;
@property float originVelocity;
- (id)init:(float)velocity rate:(float)rate;
- (float)update;
- (void)restore;
@end
#endif /* Bouncy_h */
