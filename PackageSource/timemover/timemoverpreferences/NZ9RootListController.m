#include "NZ9RootListController.h"

@implementation NZ9RootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)reset {
	CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("NZ9TimeMoverResetNotification"), NULL, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)twitter {
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/NeinZedd9"]];
}


@end
