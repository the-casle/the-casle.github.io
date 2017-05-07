#line 1 "Tweak.xm"
static BOOL SCisEnabled = yes
status NSString* SCtext = nil;

@interface SPUISearchHeader : UIView
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SPUISearchHeader; 
static void (*_logos_orig$_ungrouped$SPUISearchHeader$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SPUISearchHeader* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SPUISearchHeader$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SPUISearchHeader* _LOGOS_SELF_CONST, SEL); 

#line 7 "Tweak.xm"

static void _logos_method$_ungrouped$SPUISearchHeader$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SPUISearchHeader* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
_logos_orig$_ungrouped$SPUISearchHeader$layoutSubviews(self, _cmd);
UIButton *button = MSHookIvar<UIButton *>(self, "_cancelButton");
[button setTitle: @("@%", SCtext) forState:UIControlStateNormal];
}

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

static __attribute__((constructor)) void _logosLocalCtor_8e296a06(int __unused argc, char __unused **argv, char __unused **envp)
{
CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.thecasle.cancelbuttonpref/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
loadPrefs();
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SPUISearchHeader = objc_getClass("SPUISearchHeader"); MSHookMessageEx(_logos_class$_ungrouped$SPUISearchHeader, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SPUISearchHeader$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SPUISearchHeader$layoutSubviews);} }
#line 31 "Tweak.xm"
