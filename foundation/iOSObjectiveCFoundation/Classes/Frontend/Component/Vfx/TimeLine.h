// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef TimeLine_h
#define TimeLine_h
#import <Foundation/Foundation.h>
@interface TimeLine : NSObject
@property float currentFrame;
@property float currentTime;
@property float rate;
- (id)init;
- (void)next:(NSTimeInterval)delta;
- (void)next:(NSTimeInterval)delta multipleRate:(float)multipleRate;
- (void)restore;
@end
#endif /* TimeLine_h */
