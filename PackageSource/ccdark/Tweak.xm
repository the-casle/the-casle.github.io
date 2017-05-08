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
//this one works, change background .3
-(void) setBackgroundDarkening: (double) arg1 {
if(GetPrefBool(@"kBackgroundDarkening")) {
double sliderValue = GetPrefSlider(@"kSBackgroundDarkening");
%orig(sliderValue);
} else {
%orig;
} }
%end

%hook NCMaterialSettings
//0 darkens all cc background color
-(void) setDarkenedWhiteAlpha: (double) arg1 {
if(GetPrefBool(@"kDarkenedWhiteAlpha")) {
double sliderValue = GetPrefSlider(@"kSDarkenedWhiteAlpha");
%orig(sliderValue);
} else {
%orig;
} }

//this one works (basically blur) 80
-(void) setBlurRadius: (double) arg1 {
if(GetPrefBool(@"kBlurRadius")) {
double sliderValue = GetPrefSlider(@"kSBlurRadius");
%orig(sliderValue);
} else {
%orig;
} }
//Bubble color, later deal with 2
-(void) setSaturation: (double) arg1 {
if(GetPrefBool(@"kSaturation")) {
double sliderValue = GetPrefSlider(@"kSSaturation");
%orig(sliderValue);
} else {
%orig;
} }

//White circles lol, works 0
-(void) setCutOutOverlayAlpha: (double) arg1 {
if(GetPrefBool(@"kCutOutOverlayAlpha")) {
double sliderValue = GetPrefSlider(@"kSCutOutOverlayAlpha");
%orig(sliderValue);
} else {
%orig;
} }

//No background anymore for buttons 0
-(void) setCutOutOverlayWhite: (double) arg1 {
if(GetPrefBool(@"kCutOutOverlayWhite")) {
double sliderValue = GetPrefSlider(@"kSCutOutOverlayWhite");
%orig(sliderValue);
} else {
%orig;
} }
//assuming it works 1
-(void) setCcWhiteOverlayAlpha: (double) arg1 {
if(GetPrefBool(@"kCcWhiteOverlayAlpha")) {
double sliderValue = GetPrefSlider(@"kSCcWhiteOverlayAlpha");
%orig(sliderValue);
} else {
%orig;
} }

%end
//this one works
%hook CCUIControlCenterVisualEffect
-(id) initWithPrivateStyle: (long long) arg1{
if(GetPrefBool(@"kPrivateStyle")) {
double sliderValue = GetPrefSlider(@"kSPrivateStyle");
%orig(sliderValue);
return %orig(sliderValue);
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