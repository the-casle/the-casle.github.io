/*
To do list:
Get them sliders going
Test if my "fix" causes more bugs
Beta test
More features - ccnofloating?
Status bar based color?

*/


#define PLIST_PATH @"/private/var/mobile/Library/Preferences/com.thecasle.ccdarkprefs.plist" 
 
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefSlider(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
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
//this one works, change background
-(void) setBackgroundDarkening: (double) arg1 {
if(GetPrefBool(@"kBackgroundDarkening")) {
double sliderValue = GetPrefSlider(@"kSBackgroundDarkening");
%orig(sliderValue);
} else {
%orig;
} }
%end

%hook NCMaterialSettings
//works, darkens all cc background color
-(void) setDarkenedWhiteAlpha: (double) arg1 {
if(GetPrefBool(@"kDarkenedWhiteAlpha")) {
%orig(0);
} else {
%orig;
} }

//this one works (basically blur)
-(void) setBlurRadius: (double) arg1 {
if(GetPrefBool(@"kBlurRadius")) {
%orig(80);
} else {
%orig;
} }
//Bubble color, later deal with
-(void) setSaturation: (double) arg1 {
if(GetPrefBool(@"kSaturation")) {
%orig(2);
} else {
%orig;
} }

//White circles lol, works
-(void) setCutOutOverlayAlpha: (double) arg1 {
if(GetPrefBool(@"kCutOutOverlayAlpha")) {
%orig(0);
} else {
%orig;
} }

//No background anymore for buttons 
-(void) setCutOutOverlayWhite: (double) arg1 {
if(GetPrefBool(@"kCutOutOverlayWhite")) {
%orig(0);
} else {
%orig;
} }
//assuming it works
-(void) setCcWhiteOverlayAlpha: (double) arg1 {
if(GetPrefBool(@"kCcWhiteOverlayAlpha")) {
%orig(1);
} else {
%orig;
} }

%end
//this one works
%hook CCUIControlCenterVisualEffect
-(id) initWithPrivateStyle: (long long) arg1{
if(GetPrefBool(@"kPrivateStyle")) {
%orig(1);
return %orig(1);
} else {
%orig;
return %orig;
} }
%end

//this one works 
%hook CCUIControlCenterSlider
-(void) setMinimumValueImage: (id) arg1{
if(GetPrefBool(@"kVolumeImage")) {

} else {
%orig;
} }
//this one works
-(void) setMaximumValueImage: (id) arg1{
if(GetPrefBool(@"kVolumeImage")) {

} else {
%orig;
} }
//this one works
-(void) _setTrackImage: (id) arg1{
}
%end