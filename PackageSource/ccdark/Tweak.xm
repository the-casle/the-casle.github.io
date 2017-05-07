@interface CCUIControlCenterSettings
@end

@interface NCMaterialSettings
@end

@interface CCUIControlCenterSlider
@end

@interface UIStatusBar : CCUIControlCenterVisualEffect
@end


@interface CCUIControlCenterVisualEffect
@end

%hook CCUIControlCenterSettings
-(void) setBackgroundDarkening: (double) arg1{
%orig(0.3);
}
%end

%hook NCMaterialSettings
-(void) setDarkenedWhiteAlpha: (double) arg1 {
%orig(0);
}
-(void) setBlurRadius: (double) arg1 {
%orig(80);
}
-(void) setSaturation: (double) arg1 {
%orig(2);
}
-(void) setCutOutOverlayAlpha: (double) arg1 {
%orig(0);
}
-(void) setCutOutOverlayWhite: (double) arg1 {
%orig(1);
}
-(void) setCcWhiteOverlayAlpha: (double) arg1 {
%orig(0);
}
%end

 
%hook CCUIControlCenterVisualEffect
-(id) initWithPrivateStyle: (long long) arg1{
%orig(1);
return %orig(1);
}
%end

%hook CCUIControlCenterSlider
-(void) setMinimumValueImage: (id) arg1{
}

-(void) setMaximumValueImage: (id) arg1{
}

-(void) _setTrackImage: (id) arg1{
}
%end
