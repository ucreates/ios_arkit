// ======================================================================
// Project Name    : ios_arkit
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "iOSObjectiveCFoundation.h"
#import "IconBeatState.h"
static const float kIconScale = 0.05f;
@implementation IconBeatState
- (id)init {
    self = [super init];
    self->bouncy = [[Bouncy alloc] init:0.05f rate:0.025f];
    return self;
}
- (void)create {
    self->bouncy = [[Bouncy alloc] init:0.05f rate:0.025f];
    return;
}
- (void)update:(NSTimeInterval)delta {
    if (0.05f > self->bouncy.originVelocity) {
        self.owner.node.scale = SCNVector3Make(kIconScale, kIconScale, kIconScale);
        Notifier* notifier = [Notifier getInstance];
        [notifier notify:OnActionComplete];
        self.complete = YES;
        return;
    }
    float rate = [self->bouncy update];
    if (rate <= 0.0f) {
        [self->bouncy restore];
    }
    float scale = kIconScale + rate;
    self.owner.node.scale = SCNVector3Make(scale, scale, scale);
    return;
}
@end
