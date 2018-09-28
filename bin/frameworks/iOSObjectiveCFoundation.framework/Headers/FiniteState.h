// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef FiniteState_h
#define FiniteState_h
#import <Foundation/Foundation.h>
#import "FiniteStateMachine.h"
#import "Parameter.h"
#import "TimeLine.h"
@class FiniteStateMachine<T>;
@interface FiniteState<__covariant T> : NSObject
@property T owner;
@property FiniteStateMachine<T>* stateMachine;
@property TimeLine* timeLine;
@property BOOL persistent;
@property BOOL complete;
@property BOOL wait;
@property BOOL initialize;
@property BOOL emitCallback;
@property BOOL dump;
- (id)init;
- (void)create;
- (void)create:(Parameter*)parameter;
- (void)update:(NSTimeInterval)delta;
@end
#endif /* FiniteState_h */
