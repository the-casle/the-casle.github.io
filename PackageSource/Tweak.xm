/*
To do list:
Get them sliders going @done
Test if my "fix" causes more bugs @done
Beta test @done
Bug fixes
Media text
Background cc image
More features - ccnofloating?
Status bar based color?

*/


#define PLIST_PATH @"/private/var/mobile/Library/Preferences/com.thecasle.ccdarkprefs.plist" 
 
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline double GetPrefSlider(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] doubleValue];
}

@interface CCUIButtonModule
-(BOOL) isEnabled;
@end

@interface CCUISettingModule : CCUIButtonModule
@end

@interface CCUISettingButtonController
@property (nonatomic, retain) CCUISettingModule *module;
@property (nonatomic, assign) UIView *view;
@end

double sliderValue = 0.0;

inline int GetKeys(NSString *prefKey){
int myBool= 0;
sliderValue = GetPrefSlider([@"kS" stringByAppendingString: prefKey]);
if(GetPrefBool([@"k" stringByAppendingString: prefKey])) {
myBool = 1;
}
return myBool;
}


%hook NCMaterialSettings
//Blurs CC background
-(void) setBlurRadius: (double) arg1 {
if (GetKeys(@"BlurRadius")){
%orig(sliderValue);
} else {
%orig;
} 
}

-(void) setDarkenedWhiteAlpha: (double) arg1 {
if (GetKeys(@"DarkenedWhiteAlpha")){
%orig(sliderValue);
} else {
%orig;
}
}


-(void) setSaturation: (double) arg1 {
if (GetKeys(@"Saturation")){
%orig(sliderValue);
} else {
%orig;
}
}

-(void) setCutOutOverlayAlpha: (double) arg1{
if(GetKeys(@"CutOutOverlayAlpha")){
%orig(sliderValue);
} else {
%orig;
}
}

-(void) setCutOutOverlayWhite: (double) arg1 {
if(GetKeys(@"CutOutOverlayWhite")){
%orig(sliderValue);
} else {
%orig;
} 
}

-(void) setCcWhiteOverlayAlpha: (double) arg1 {
if(GetKeys(@"CcWhiteOverlayAlpha")){
%orig(sliderValue);
} else {
%orig;
} 
}
%end

%hook CCUIControlCenterVisualEffect
-(id) initWithPrivateStyle: (long long) arg1 {
if(GetKeys(@"PrivateStyle")){
return %orig(sliderValue);
} else {
return %orig;
}
}
%end

%hook CCUIControlCenterSlider
-(void) setMinimumValueImage: (id) arg1{
if (GetKeys(@"VolumeImage")){
//nothing
} else {
%orig;
}
}

-(void) setMaximumValueImage: (id) arg1{
if (GetKeys(@"VolumeImage")){
//nothing
} else {
%orig;
}
}
%end

%hook CCUIControlCenterButton
-(void) _updateBackgroundForStateChange{
if (GetKeys(@"BubbleBackground")){
//nothing
} else {
%orig;
}
}
%end

%hook CCUISettingButtonController
-(void) viewDidLayoutSubviews{
%orig;
if(GetKeys(@"GlyphAlpha")){
if(self.module != nil){

if([self.module isEnabled] == false){
self.view.alpha = .4;
} else{
self.view.alpha = 1;
}
}
}
}
-(void) _updateButtonState {
%orig;
if(GetKeys(@"GlyphAlpha")){
if(self.module != nil){
if([self.module isEnabled] == false){
self.view.alpha = .4;
} else{
self.view.alpha = 1;
}
}
}
}
%end
