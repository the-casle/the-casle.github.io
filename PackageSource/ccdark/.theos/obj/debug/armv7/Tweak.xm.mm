#line 1 "Tweak.xm"
@interface CCUIControlCenterSettings
@end

@interface UIStatusBar
@end

@interface NCMaterialSettings
@end

@interface CCUIControlCenterSlider
@end

@implementation CCUIControlCenterVisualEffect{






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

@class CCUIControlCenterSettings; @class UIStatusBar; @class CCUIControlCenterSlider; @class NCMaterialSettings; 
static void (*_logos_orig$_ungrouped$CCUIControlCenterSettings$setBackgroundDarkening$)(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$CCUIControlCenterSettings$setBackgroundDarkening$(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$_ungrouped$NCMaterialSettings$setDarkenedWhiteAlpha$)(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$NCMaterialSettings$setDarkenedWhiteAlpha$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$_ungrouped$NCMaterialSettings$setBlurRadius$)(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$NCMaterialSettings$setBlurRadius$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$_ungrouped$NCMaterialSettings$setSaturation$)(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$NCMaterialSettings$setSaturation$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$_ungrouped$NCMaterialSettings$setCutOutOverlayAlpha$)(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$NCMaterialSettings$setCutOutOverlayAlpha$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$_ungrouped$NCMaterialSettings$setCutOutOverlayWhite$)(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$NCMaterialSettings$setCutOutOverlayWhite$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$_ungrouped$NCMaterialSettings$setCcWhiteOverlayAlpha$)(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$NCMaterialSettings$setCcWhiteOverlayAlpha$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$_ungrouped$UIStatusBar$setForegroundColor$)(_LOGOS_SELF_TYPE_NORMAL UIStatusBar* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UIStatusBar$setForegroundColor$(_LOGOS_SELF_TYPE_NORMAL UIStatusBar* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$CCUIControlCenterSlider$setMinimumValueImage$)(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSlider* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$CCUIControlCenterSlider$setMinimumValueImage$(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSlider* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$CCUIControlCenterSlider$setMaximumValueImage$)(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSlider* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$CCUIControlCenterSlider$setMaximumValueImage$(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSlider* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$CCUIControlCenterSlider$_setTrackImage$)(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSlider* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$CCUIControlCenterSlider$_setTrackImage$(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSlider* _LOGOS_SELF_CONST, SEL, id); 

#line 19 "Tweak.xm"
-(id) initWithPrivateStyle: (long long)  } @end   static void _logos_method$_ungrouped$CCUIControlCenterSettings$setBackgroundDarkening$(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1){
_logos_orig$_ungrouped$CCUIControlCenterSettings$setBackgroundDarkening$(self, _cmd, 0.3);
}



static void _logos_method$_ungrouped$NCMaterialSettings$setDarkenedWhiteAlpha$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
_logos_orig$_ungrouped$NCMaterialSettings$setDarkenedWhiteAlpha$(self, _cmd, 0);
}
static void _logos_method$_ungrouped$NCMaterialSettings$setBlurRadius$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
_logos_orig$_ungrouped$NCMaterialSettings$setBlurRadius$(self, _cmd, 80);
}
static void _logos_method$_ungrouped$NCMaterialSettings$setSaturation$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
_logos_orig$_ungrouped$NCMaterialSettings$setSaturation$(self, _cmd, 2);
}
static void _logos_method$_ungrouped$NCMaterialSettings$setCutOutOverlayAlpha$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
_logos_orig$_ungrouped$NCMaterialSettings$setCutOutOverlayAlpha$(self, _cmd, 0);
}
static void _logos_method$_ungrouped$NCMaterialSettings$setCutOutOverlayWhite$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
_logos_orig$_ungrouped$NCMaterialSettings$setCutOutOverlayWhite$(self, _cmd, 1);
}
static void _logos_method$_ungrouped$NCMaterialSettings$setCcWhiteOverlayAlpha$(_LOGOS_SELF_TYPE_NORMAL NCMaterialSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
_logos_orig$_ungrouped$NCMaterialSettings$setCcWhiteOverlayAlpha$(self, _cmd, 0);
}



static void _logos_method$_ungrouped$UIStatusBar$setForegroundColor$(_LOGOS_SELF_TYPE_NORMAL UIStatusBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id color){
_logos_orig$_ungrouped$UIStatusBar$setForegroundColor$(self, _cmd, color);
initWithPrivateStyle(color);
}











static void _logos_method$_ungrouped$CCUIControlCenterSlider$setMinimumValueImage$(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSlider* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
}

static void _logos_method$_ungrouped$CCUIControlCenterSlider$setMaximumValueImage$(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSlider* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
}

static void _logos_method$_ungrouped$CCUIControlCenterSlider$_setTrackImage$(_LOGOS_SELF_TYPE_NORMAL CCUIControlCenterSlider* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CCUIControlCenterSettings = objc_getClass("CCUIControlCenterSettings"); MSHookMessageEx(_logos_class$_ungrouped$CCUIControlCenterSettings, @selector(setBackgroundDarkening:), (IMP)&_logos_method$_ungrouped$CCUIControlCenterSettings$setBackgroundDarkening$, (IMP*)&_logos_orig$_ungrouped$CCUIControlCenterSettings$setBackgroundDarkening$);Class _logos_class$_ungrouped$NCMaterialSettings = objc_getClass("NCMaterialSettings"); MSHookMessageEx(_logos_class$_ungrouped$NCMaterialSettings, @selector(setDarkenedWhiteAlpha:), (IMP)&_logos_method$_ungrouped$NCMaterialSettings$setDarkenedWhiteAlpha$, (IMP*)&_logos_orig$_ungrouped$NCMaterialSettings$setDarkenedWhiteAlpha$);MSHookMessageEx(_logos_class$_ungrouped$NCMaterialSettings, @selector(setBlurRadius:), (IMP)&_logos_method$_ungrouped$NCMaterialSettings$setBlurRadius$, (IMP*)&_logos_orig$_ungrouped$NCMaterialSettings$setBlurRadius$);MSHookMessageEx(_logos_class$_ungrouped$NCMaterialSettings, @selector(setSaturation:), (IMP)&_logos_method$_ungrouped$NCMaterialSettings$setSaturation$, (IMP*)&_logos_orig$_ungrouped$NCMaterialSettings$setSaturation$);MSHookMessageEx(_logos_class$_ungrouped$NCMaterialSettings, @selector(setCutOutOverlayAlpha:), (IMP)&_logos_method$_ungrouped$NCMaterialSettings$setCutOutOverlayAlpha$, (IMP*)&_logos_orig$_ungrouped$NCMaterialSettings$setCutOutOverlayAlpha$);MSHookMessageEx(_logos_class$_ungrouped$NCMaterialSettings, @selector(setCutOutOverlayWhite:), (IMP)&_logos_method$_ungrouped$NCMaterialSettings$setCutOutOverlayWhite$, (IMP*)&_logos_orig$_ungrouped$NCMaterialSettings$setCutOutOverlayWhite$);MSHookMessageEx(_logos_class$_ungrouped$NCMaterialSettings, @selector(setCcWhiteOverlayAlpha:), (IMP)&_logos_method$_ungrouped$NCMaterialSettings$setCcWhiteOverlayAlpha$, (IMP*)&_logos_orig$_ungrouped$NCMaterialSettings$setCcWhiteOverlayAlpha$);Class _logos_class$_ungrouped$UIStatusBar = objc_getClass("UIStatusBar"); MSHookMessageEx(_logos_class$_ungrouped$UIStatusBar, @selector(setForegroundColor:), (IMP)&_logos_method$_ungrouped$UIStatusBar$setForegroundColor$, (IMP*)&_logos_orig$_ungrouped$UIStatusBar$setForegroundColor$);Class _logos_class$_ungrouped$CCUIControlCenterSlider = objc_getClass("CCUIControlCenterSlider"); MSHookMessageEx(_logos_class$_ungrouped$CCUIControlCenterSlider, @selector(setMinimumValueImage:), (IMP)&_logos_method$_ungrouped$CCUIControlCenterSlider$setMinimumValueImage$, (IMP*)&_logos_orig$_ungrouped$CCUIControlCenterSlider$setMinimumValueImage$);MSHookMessageEx(_logos_class$_ungrouped$CCUIControlCenterSlider, @selector(setMaximumValueImage:), (IMP)&_logos_method$_ungrouped$CCUIControlCenterSlider$setMaximumValueImage$, (IMP*)&_logos_orig$_ungrouped$CCUIControlCenterSlider$setMaximumValueImage$);MSHookMessageEx(_logos_class$_ungrouped$CCUIControlCenterSlider, @selector(_setTrackImage:), (IMP)&_logos_method$_ungrouped$CCUIControlCenterSlider$_setTrackImage$, (IMP*)&_logos_orig$_ungrouped$CCUIControlCenterSlider$_setTrackImage$);} }
#line 70 "Tweak.xm"
