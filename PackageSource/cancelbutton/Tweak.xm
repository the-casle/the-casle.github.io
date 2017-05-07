static BOOL SCisEnabled = yes
status NSString* SCtext = nil;

@interface SPUISearchHeader : UIView
@end

%hook SPUISearchHeader
-(void) layoutSubviews {
%orig;
UIButton *button = MSHookIvar<UIButton *>(self, "_cancelButton");
[button setTitle: @("@%", SCtext) forState:UIControlStateNormal];
}
%end
static void loadPrefs()
{
NSMutableDictionary * prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.thecasle.cancelbuttonpref.plist"];
if(prefs)
{
SCisEnabled = ( [prefs objectForKey:@"SCisEnabled"] ? [[prefs objectForKey:@"SCisEnabled"] boolValue] : SCisEnabled );
SCtext = ( [prefs objectForKey:@"SCtext"] ? [prefs objectForKey:@"SCtext"] : SCtext );
[SCtext retain];
}
[prefs release];
}

%ctor
{
CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.thecasle.cancelbuttonpref/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
loadPrefs();
}