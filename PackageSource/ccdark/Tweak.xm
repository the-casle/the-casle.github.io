#define PLIST_PATH @"/private/var/mobile/Library/Preferences/com.thecasle.ccdarkprefs.plist" 
 
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

@interface CCUIControlCenterSettings
@end

@interface NCMaterialSettings
@end

@interface CCUIControlCenterSlider
@end

@interface CCUIControlCenterVisualEffect
@end

%hook CCUIControlCenterSettings

-(void) setBackgroundDarkening: (double) arg1 {
if(GetPrefBool(@"kBackgroundDarkening")) {
%orig(0.3);
} else {
%orig;
}}
%end

%hook NCMaterialSettings
-(void) setDarkenedWhiteAlpha: (double) arg1 {
if(GetPrefBool(@"kDarkenedWhiteAlpha")) {
%orig(0);
} else {
%orig;
}
}
-(void) setBlurRadius: (double) arg1 {
if(GetPrefBool(@"kBlurRadius")) {
%orig(80);
} else {
%orig;
}
}
-(void) setSaturation: (double) arg1 {
if(GetPrefBool(@"kSaturation")) {
%orig(2);
} else {
%orig;
}
}
-(void) setCutOutOverlayAlpha: (double) arg1 {
if(GetPrefBool(@"kCutOutOverlayAlpha")) {
%orig(0);
} else {
%orig;
}
}
-(void) setCutOutOverlayWhite: (double) arg1 {
if(GetPrefBool(@"kCutOutOverlayWhite")) {
%orig(1);
} else {
%orig;
}
}
-(void) setCcWhiteOverlayAlpha: (double) arg1 {
if(GetPrefBool(@"kCcWhiteOverlayAlpha")) {
%orig(0);
} else {
%orig;
}
}
%end

%hook CCUIControlCenterVisualEffect
-(id) initWithPrivateStyle: (long long) arg1{
if(GetPrefBool(@"kPrivateStyle")) {
%orig(1);
return %orig(1);
} else {
%orig;
return %orig;
}
}
%end


%hook CCUIControlCenterSlider
-(void) setMinimumValueImage: (id) arg1{
if(GetPrefBool(@"kVolumeImage")) {

} else {
%orig;
}
}

-(void) setMaximumValueImage: (id) arg1{
if(GetPrefBool(@"kVolumeImage")) {

} else {
%orig;
}
}
-(void) _setTrackImage: (id) arg1{
}
%end