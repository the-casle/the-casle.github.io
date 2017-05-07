#include "substrate.h"
#define dol @"/var/mobile/Library/Preferences/customsafariprefs.plist"

NSMutableDictionary *customerror = [[NSMutableDictionary alloc] initWithContentsOfFile:dol];
inline bool yon(NSString *key) {return [[[NSDictionary dictionaryWithContentsOfFile:dol] valueForKey:key] boolValue];}

@interface TabExplanationView
-(id)initWithTitle:(id)arg message:(id)arg2;
@end


%hook TabExplanationView
-(id)initWithTitle:(id)arg message:(id)arg2 {
	if(yon(@"kCustom") && !yon(@"kDescription")) {
		return %orig([customerror objectForKey:@"customtext"],arg2);
	} else if(!yon(@"kCustom") && yon(@"kDescription")) {
		return %orig(arg,[customerror objectForKey:@"customtext2"]);
	} else if(yon(@"kDescription") && yon(@"kCustom")) {
		return %orig([customerror objectForKey:@"customtext"],[customerror objectForKey:@"customtext2"]);
	} else if(yon(@"kCustom") && yon(@"kDescription")) {
		return %orig([customerror objectForKey:@"customtext"],[customerror objectForKey:@"customtext2"]);
	}
	return %orig;
}
%end

