// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef Quadratic_h
#define Quadratic_h
#import <Foundation/Foundation.h>
#import "FiniteState.h"
@interface Quadratic : NSObject
+ (float)easeIn:(float)currentTime totalTime:(float)totalTime start:(float)start end:(float)end;
+ (float)easeOut:(float)currentTime totalTime:(float)totalTime start:(float)start end:(float)end;
+ (float)easeInOut:(float)currentTime totalTime:(float)totalTime start:(float)start end:(float)end;
@end
#endif /* Quadratic_h */
