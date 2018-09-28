// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "BaseBehaviour.h"
@implementation BaseBehaviour
@synthesize id;
@synthesize intersect;
@synthesize destroy;
- (void)onCreate {
    return;
}
- (void)onCreate:(Parameter*)parameter {
    return;
}
- (void)onUpdate:(NSTimeInterval)delta {
    return;
}
- (void)onRender {
    return;
}
- (void)onCollisionEnter:(BaseBehaviour*)behaviour {
    return;
}
- (void)onCollisionStay:(BaseBehaviour*)behaviour {
    return;
}
- (void)onCollisionExit:(BaseBehaviour*)behaviour {
    return;
}
@end
