// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "Notifier.h"
#import "NSObject+Override.h"
@implementation Notifier
@synthesize notifierDictionary;
+ (Notifier*)getInstance {
    static Notifier* instance = nil;
    if (nil == instance) {
        instance = [[Notifier alloc] init];
    }
    return instance;
}
- (id)init {
    self = [super init];
    self.notifierDictionary = [[NSMutableDictionary<NSString*, id<INotifyDelegate>> alloc] init];
    return self;
}
- (void)notify:(NotifyMessage)message {
    [self notify:message parameter:nil];
    return;
}
- (void)notify:(NotifyMessage)message parameter:(Parameter*)parameter {
    for (NSString* key in [self.notifierDictionary allKeys]) {
        id<INotifyDelegate> inotify = [self.notifierDictionary objectForKey:key];
        if (NO != [inotify respondsToSelector:@selector(onNotify:parameter:)]) {
            [inotify onNotify:message parameter:parameter];
        }
    }
    return;
}
- (BOOL)add:(id<INotifyDelegate>)notify {
    NSString* uniqId = [(NSObject*)notify uniqId];
    if (NO == [self.notifierDictionary.allKeys containsObject:uniqId]) {
        [self.notifierDictionary setObject:notify forKey:uniqId];
        return YES;
    }
    return NO;
}
@end
