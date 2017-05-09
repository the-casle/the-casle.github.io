#include "XXXRootListController.h"

@implementation XXXRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)respring {
         system("killall -9 SpringBoard");
      }
- (void)debug {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://docs.google.com/forms/d/e/1FAIpQLSckxR46yc3gHzX1Ok0y6EDhNg-x9W0KlFMmqft_nbSPJ-6FVA/viewform?usp=sf_link"]];
}

@end
