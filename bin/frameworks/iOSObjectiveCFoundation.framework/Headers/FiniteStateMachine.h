// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef FiniteStateMachine_h
#define FiniteStateMachine_h
#import <Foundation/Foundation.h>
#import "Parameter.h"
#import "FiniteState.h"
#import "FiniteStateEntity.h"
@class FiniteState<T>;
@class FiniteStateEntity<T>;
@interface FiniteStateMachine<__covariant T> : NSObject
@property FiniteStateEntity<T>* finiteStateEntity;
@property NSMutableDictionary<NSString*, FiniteState<T>*>* stateList;
@property NSMutableDictionary<NSString*, FiniteState<T>*>* persistentStateList;
@property Parameter* paramter;
@property T owner;
@property BOOL enableFrameSkip;
@property int frameSkipCounter;
- (id)init:(id)owner;
- (void)change:(NSString*)newStateName;
- (void)change:(NSString*)newStateName update:(BOOL)update;
- (void)change:(NSString*)newStateName parameter:(Parameter*)parameter update:(BOOL)update;
- (void)update:(NSTimeInterval)delta;
- (void)play;
- (void)pause;
- (void)stop;
- (BOOL)add:(NSString*)stateName state:(FiniteState<T>*)state;
@end
#endif /* FiniteStateMachine_h */
