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
UIImageView *imageCopy = nil;

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
-(void) setArtworkImage: (id) arg1 {
// -(void) layoutSubviews{
%orig;
artBool = self.activated;
// if(artBool || isUpdating){
NSLog(@"got the art image");
myImage = self.artworkImage;
// }

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
NSLog(@"hook into the original view");
}
%end

%hook NCMaterialView
-(void)layoutSubviews{
%orig;
backgroundView = MSHookIvar<UIView *>(self, "_backdropView");
}
%end

%hook CCUIControlCenterPageContainerViewController
-(void)  viewDidLayoutSubviews{
if(isDone == 0 && artBool == 1){
NSLog(@"art image is activated");
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
NSLog(@"First initialization of artView");

artView.hidden = NO;
artBackground.hidden = YES;
//[self.view addSubview: backgroundView];
isDone = YES;
}

if(playingBool == 1 && isDone == YES){
// artView.hidden = YES;
NSLog(@"artView is not hidden, background hidden");
artView.hidden = NO;
artBackground.hidden = YES;
//[artView removeFromSuperview];
} else {
NSLog(@"new view is hidden");
artBackground.hidden = NO;
artView.hidden = YES;
}
%orig;
} 
%end

%hook SBMediaController
-(void)_nowPlayingInfoChanged{
%orig;
NSLog(@"set the new UIImageView with new art");
isUpdating = 1;
[imageView removeFromSuperview];
imageView = nil;
imageView = [[UIImageView alloc] initWithImage:myImage];
// imageView.frame = CGRectMake(-26.5,0,357,357);
imageView.frame = artBackground.bounds;
[artView addSubview: imageView];
[artView addSubview:visualEffectView];
}
%end