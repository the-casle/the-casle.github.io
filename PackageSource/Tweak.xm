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

BOOL isDone = 0;
BOOL isNextDone = 0;

BOOL playingBool = 0;

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
if(playingBool){
myImage = self.artworkImage;
NSLog(@"got the art image");
}
artBool = self.activated;
%orig;
}
%end

%hook CCUIControlCenterPagePlatterView
-(void) layoutSubviews {
%orig;
artBounds= MSHookIvar<UIView *>(self, "_baseMaterialView");
artView = [[UIView alloc] init];
artView.frame = artBounds.bounds;
imageView = [[UIImageView alloc] initWithImage:myImage];

}


%end

%hook CCUIControlCenterPageContainerViewController
-(void)  viewDidLayoutSubviews{
if(isDone == 0 && artBool == 1){
NSLog(@"playingBool1 && isDone0 && artBool1");
imageView.frame = artView.bounds;
self.view.clipsToBounds = YES;
blurEffect = [UIBlurEffect effectWithStyle: UIBlurEffectStyleLight];
artView.layer.cornerRadius = 13;
artView.layer.masksToBounds = YES;
[artView addSubview:imageView];
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = artView.bounds;
[artView addSubview:visualEffectView];
[self.view addSubview:artView];
[self.view sendSubviewToBack: artView];
NSLog(@"ayy setup that art!");
isDone = YES;
artView.hidden = YES;
}
if(playingBool){
artView.hidden = NO;
NSLog(@"not hidden");
}
if(playingBool == 0 && isDone == YES){
artView.hidden = YES;
NSLog(@"SECRET IS FOUND");
}
%orig;
} 
%end


