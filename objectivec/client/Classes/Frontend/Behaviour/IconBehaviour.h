// ======================================================================
// Project Name    : ios_arkit
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef IconBehaviour_h
#define IconBehaviour_h
#import <SceneKit/SceneKit.h>
#import "iOSObjectiveCFoundation.h"
@interface IconBehaviour : BaseBehaviour
@property FiniteStateMachine<IconBehaviour*>* stateMachine;
@property SCNNode* node;
@property SCNVector3 defaultPosition;
- (id)init;
- (void)onCreate:(Parameter*)parameter;
- (void)onUpdate:(NSTimeInterval)delta;
@end
#endif /* IconBehaviour_h */
