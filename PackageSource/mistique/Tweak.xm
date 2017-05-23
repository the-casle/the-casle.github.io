@interface CCUIControlCenterPageContainerViewController : UIView
@property  (nonatomic, assign) UIView *view;
@end

@interface MPUControlCenterMediaControlsViewController : UIView
@property  (nonatomic, assign) UIView *view;
@end

@interface NCMaterialView : UIView
@end

@interface MPUNowPlayingArtworkView
@property  (nonatomic, assign) UIImage *artworkImage;
@property (nonatomic, assign, readwrite) BOOL activated;

@end

UIImage *myImage = nil;
BOOL artBool;

UIView *artView = nil;
UIView *artBounds;
UIImageView *imageView;
UIVisualEffect *blurEffect;
UIVisualEffectView *visualEffectView;
UIView *artBackground = nil;
BOOL isDone = 0;
BOOL isUpdating = 0;

BOOL playingBool = 0;
UIView *backgroundView = nil;
@interface SBMediaController
@property BOOL isPlaying;
@end

%hook SBMediaController
-(BOOL) isPlaying{
playingBool = MSHookIvar<BOOL>(self, "_lastNowPlayingAppIsPlaying");
return %orig;
NSLog(@"update playingBool");
}
-(BOOL) isPaused{
playingBool = MSHookIvar<BOOL>(self, "_lastNowPlayingAppIsPlaying");
return %orig;
NSLog(@"update playingBool");
}
%end

%hook MPUNowPlayingArtworkView
-(void) layoutSubviews{
artBool = self.activated;
if(artBool || isUpdating){
NSLog(@"got the art image");
myImage = self.artworkImage;
}

%orig;
}
%end

%hook CCUIControlCenterPagePlatterView
-(void) layoutSubviews {
%orig;
artBounds= MSHookIvar<UIView *>(self, "_baseMaterialView");
artBackground = MSHookIvar<UIView *>(self, "_baseMaterialView");
//artView = [[UIView alloc] init];
artBackground.frame = artBounds.bounds;
}
%end

%hook NCMaterialView
-(void)layoutSubviews{
%orig;
NSLog(@"it worked");
backgroundView = MSHookIvar<UIView *>(self, "_backdropView");
}
%end

%hook CCUIControlCenterPageContainerViewController
-(void)  viewDidLayoutSubviews{
if(isDone == 0 && artBool == 1){
NSLog(@"playingBool1 && isDone0 && artBool1");
self.view.clipsToBounds = YES;
artBackground.layer.cornerRadius = 13;
artBackground.layer.masksToBounds = YES;
artView = [NSKeyedUnarchiver unarchiveObjectWithData: [NSKeyedArchiver archivedDataWithRootObject:artBounds]];
blurEffect = [UIBlurEffect effectWithStyle: UIBlurEffectStyleLight];
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
visualEffectView.frame = artView.bounds;
imageView = [[UIImageView alloc] initWithImage:myImage];
imageView.frame = artBackground.bounds;
[artView addSubview:imageView];
[artView addSubview:visualEffectView];
[self.view addSubview:artView];
[self.view sendSubviewToBack: artView];
artView.layer.cornerRadius = 13;
artView.layer.masksToBounds = YES;
NSLog(@"ayy setup that art!");

artView.hidden = NO;
artBackground.hidden = YES;
//[self.view addSubview: backgroundView];
isDone = YES;
}
if(playingBool){
NSLog(@"not hidden");
}
if(playingBool == 1 && isDone == YES){
// artView.hidden = YES;
NSLog(@"SECRET IS FOUND");
artView.hidden = NO;
artBackground.hidden = YES;
//[artView removeFromSuperview];
} else {
artBackground.hidden = NO;
artView.hidden = YES;
}
%orig;
} 
%end


%hook SBMediaController
-(void)_nowPlayingInfoChanged{
%orig;
NSLog(@"set the new art");
isUpdating = 1;
imageView = nil;
imageView = [[UIImageView alloc] initWithImage:myImage];
imageView.frame = artBackground.bounds;
[imageView removeFromSuperview];
[artView addSubview: imageView];
[artView addSubview:visualEffectView];
}
%end