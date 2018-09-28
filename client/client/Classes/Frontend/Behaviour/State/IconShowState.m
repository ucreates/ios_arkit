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
#import "IconShowState.h"
static const float kIconScale = 0.05f;
static const float kRotateDegree = 360.0f * 10.0f;
static const float kAnimationTime = 5.0f;
@implementation IconShowState
- (void)create {
    self.owner.node.scale = SCNVector3Zero;
    self.owner.node.hidden = NO;
    return;
}
- (void)update:(NSTimeInterval)delta {
    if (kAnimationTime < self.timeLine.currentTime) {
        self.owner.node.scale = SCNVector3Make(kIconScale, kIconScale, kIconScale);
        self.owner.node.eulerAngles = SCNVector3Zero;
        Notifier* notifier = [Notifier getInstance];
        [notifier notify:OnTrackingFound];
        self.complete = YES;
        return;
    }
    float scale = [Quadratic easeOut:self.timeLine.currentTime totalTime:kAnimationTime start:0.0f end:kIconScale];
    float rotate = kRotateDegree - [Quadratic easeOut:self.timeLine.currentTime totalTime:kAnimationTime start:0.0f end:kRotateDegree];
    self.owner.node.scale = SCNVector3Make(scale, kIconScale, scale);
    self.owner.node.eulerAngles = SCNVector3Make(0.0f, -1.0f * rotate, 0.0f);
    [self.timeLine next:delta];
    return;
}
@end
