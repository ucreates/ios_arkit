// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef Parabora_h
#define Parabora_h
#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
@interface Parabora : NSObject
@property float mass;
@property float velocity;
@property float radian;
- (id)init;
- (SCNVector3)create:(float)currentFrame;
@end
#endif /* Parabora_h */
