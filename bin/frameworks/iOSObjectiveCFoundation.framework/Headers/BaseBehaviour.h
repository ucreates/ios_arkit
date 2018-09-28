// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef BaseBehaviour_h
#define BaseBehaviour_h
#import <Foundation/Foundation.h>
#import "FiniteStateMachine.h"
#import "Parameter.h"
@interface BaseBehaviour : NSObject
@property int id;
@property BOOL intersect;
@property BOOL destroy;
- (void)onCreate;
- (void)onUpdate:(NSTimeInterval)delta;
- (void)onRender;
- (void)onCollisionEnter:(BaseBehaviour*)behaviour;
- (void)onCollisionStay:(BaseBehaviour*)behaviour;
- (void)onCollisionExit:(BaseBehaviour*)behaviour;
@end
#endif /* BaseBehaviour_h */
