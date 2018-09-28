// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef FiniteStateEntity_h
#define FiniteStateEntity_h
#import <Foundation/Foundation.h>
#import "FiniteState.h"
@class FiniteState<T>;
@interface FiniteStateEntity<__covariant T> : NSObject
@property BOOL isNewState;
@property FiniteState<T>* state;
@property NSString* currentStateName;
@property NSString* previousStateName;
@property NSString* nextStateName;
- (void)update:(NSString*)nextStateName nextState:(FiniteState<T>*)nextState;
@end
#endif /* FiniteStateEntity_h */
