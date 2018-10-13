// ======================================================================
// Project Name    : ios_arkit
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import <iOSObjectiveCFoundation/iOSObjectiveCFoundation.h>
#import "IconJumpState.h"
@implementation IconJumpState
- (id)init {
    self = [super init];
    self->parabora = [[Parabora alloc] init];
    return self;
}
- (void)create {
    self->parabora.velocity = 1.0f;
    self->parabora.mass = 1.5f;
    self->parabora.radian = [Angle toRadian:90.0f];
    [self.timeLine restore];
    self.timeLine.rate = 0.1f;
    return;
}
- (void)update:(NSTimeInterval)delta {
    SCNVector3 position = [self->parabora create:self.timeLine.currentFrame];
    if (0.0f > position.y) {
        self.owner.node.position = self.owner.defaultPosition;
        Notifier* notifier = [Notifier getInstance];
        [notifier notify:OnActionComplete];
        self.complete = YES;
        return;
    } else {
        float nx = self.owner.node.position.x;
        float ny = position.y;
        float nz = self.owner.node.position.z;
        self.owner.node.position = SCNVector3Make(nx, ny, nz);
    }
    [self.timeLine next:delta];
    return;
}
@end
