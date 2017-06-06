#import "ControlCenterUI.h"
#import "ControlCenterUIKit.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <notify.h>
#import <substrate.h>

@interface SBWallpaperController : NSObject
+ (id)sharedInstance;
- (NSInteger)variation;
- (UIColor *)averageColorForVariant:(NSInteger)variant;
@end 

@interface SBIcon : NSObject
- (UIImage *)getIconImage:(NSInteger)type;
- (BOOL)isFolderIcon;
- (void)noteBadgeDidChange;
@end

@interface SBIconImageView : UIView
@end

@interface SBIconView : UIView {
	CGPoint _wallpaperRelativeCloseBoxCenter;
	CGRect _visibleImageRect;
}
+ (CGSize)defaultIconImageSize;
@property(assign, nonatomic) CGPoint wallpaperRelativeImageCenter;
- (int)location;
- (CGPoint)_centerForCloseBoxRelativeToVisibleImageFrame:(CGRect)visibleImageFrame;
- (SBIcon *)icon;
- (SBIconImageView *)_iconImageView;
@end

@interface SBIconModel : NSObject
- (NSArray *)leafIcons;
@end

@interface SBIconController : NSObject
+ (id)sharedInstance;
- (SBIconModel *)model;
@end

@interface SBFolderIconView : SBIconView
@end

@interface SBIconBadgeView : UIView
- (BOOL)displayingAccessory;
- (void)setWallpaperRelativeCenter:(CGPoint)center;
@end

@interface SBIconBlurryBackgroundView : UIView
- (void)setWallpaperRelativeCenter:(CGPoint)center;
@end

@interface SBIconAccessoryImage : UIImage
@end

@interface SBDarkeningImageView : UIImageView
@end


@interface MPUControlCenterMediaControlsViewController : UIView
@property  (nonatomic, assign) UIView *view;
@end

@interface NCMaterialView : UIView
@end

@interface SBMediaController
@property BOOL isPlaying;
//-(void)_nowPlayingInfoChanged;
@end


@interface MPUNowPlayingArtworkView
@property  (nonatomic, assign) UIImage *artworkImage;
@property (nonatomic, assign, readwrite) BOOL activated;
@end

struct pixel {
    unsigned char r, g, b, a;
};

static UIColor *dominantColorFromIcon(UIImage *theArt)
{
	UIImage *iconImage = theArt;
	NSUInteger red = 0;
	NSUInteger green = 0;
	NSUInteger blue = 0;
	CGImageRef iconCGImage = iconImage.CGImage;
	struct pixel *pixels = (struct pixel *)calloc(1, iconImage.size.width * iconImage.size.height * sizeof(struct pixel));
	if (pixels != nil)
    {
		CGContextRef context = CGBitmapContextCreate((void *)pixels, iconImage.size.width, iconImage.size.height, 8, iconImage.size.width * 4, CGImageGetColorSpace(iconCGImage), kCGImageAlphaPremultipliedLast);
		if (context != NULL) {
			CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, iconImage.size.width, iconImage.size.height), iconCGImage);
			NSUInteger numberOfPixels = iconImage.size.width * iconImage.size.height;
			for (int i = 0; i < numberOfPixels; i++) {
				red += pixels[i].r;
				green += pixels[i].g;
				blue += pixels[i].b;
			}
			red /= numberOfPixels;
			green /= numberOfPixels;
			blue /= numberOfPixels;
			CGContextRelease(context);
		}
		free(pixels);
	}
	return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
}
@interface _UIBackdropView
@end


UIImage *myImage = nil;
BOOL artBool;
UIColor *color;
NCMaterialView *artView = nil;
UIView *artBounds;
UIImageView *imageView;
UIVisualEffect *blurEffect;
UIVisualEffectView *visualEffectView;
UIView *artBackground = nil;
BOOL isDone = 0;
UIImageView *imageCopy = nil;
NCMaterialView *materialView;
_UIBackdropView *backdropView;
NSArray *platterViews;
CCUIControlCenterPagePlatterView *platterView;
SBMediaController *artUpdate;


BOOL playingBool = 0;
UIView *backgroundView = nil;


%hook SBMediaController
-(BOOL)isPlaying {
  playingBool = MSHookIvar<BOOL>(self, "_lastNowPlayingAppIsPlaying");
  return %orig;
}
-(BOOL)isPaused {
  playingBool = MSHookIvar<BOOL>(self, "_lastNowPlayingAppIsPlaying");
  return %orig;
}
%end

%hook MPUNowPlayingArtworkView
- (void)setArtworkImage:(id)arg1 {
  %orig;
  artBool = self.activated;
  NSLog(@"update art image ");
  myImage = self.artworkImage;
  color = dominantColorFromIcon(myImage);
  
  NSLog(@"setting updated image");
  [imageView removeFromSuperview];
  imageView = nil;
  //[artUpdate setArtworkImage:nil];
  imageView = [[UIImageView alloc] initWithImage:myImage];
  imageView.frame = artBackground.bounds;
  [artView addSubview: imageView];
  [artView addSubview:visualEffectView];
}
%end

%hook CCUIControlCenterPagePlatterView
- (void)layoutSubviews {
  %orig;

  UIImageView* whiteCrap = MSHookIvar<UIImageView*>(self, "_whiteLayerView");
  whiteCrap.alpha = 0;
  whiteCrap.hidden = YES;

  artBounds = MSHookIvar<NCMaterialView *>(self, "_baseMaterialView");
  artBackground = MSHookIvar<NCMaterialView *>(self, "_baseMaterialView");
/*
  UIView *farBack = MSHookIvar<UIView *>(artBounds, "_backdropView");
  farBack.backgroundColor = [UIColor redColor];
  farBack.layer.cornerRadius = 13;
    farBack.layer.masksToBounds = YES;
*/
  artBackground.frame = artBounds.bounds;

  if(isDone == 0 && artBool == 1){
    //self.view.clipsToBounds = YES;
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
    [self addSubview:artView];
    [self sendSubviewToBack: artView];
    artView.layer.cornerRadius = 13;
    artView.layer.masksToBounds = YES;
    artView.hidden = NO;
    isDone = YES;
    NSLog(@"should have updated");
/*
    materialView = MSHookIvar<NCMaterialView *>(self, "_baseMaterialView");
    backdropView = MSHookIvar<_UIBackdropView * >(materialView, "_backdropView");
    [materialView addSubview:imageView];
*/
  }
  if(playingBool == 1 && isDone == YES){
    artBackground.hidden = YES;
    artView.hidden = NO;
  } else {
    artBackground.hidden = NO;
    artView.hidden = YES;
  }
  %orig;
}
%end

%hook NCMaterialView
-(void)layoutSubviews{
  %orig;
  backgroundView = MSHookIvar<UIView *>(self, "_backdropView");
}
%end
BOOL newBool = 1;
%hook CCUIControlCenterContainerView
- (void)controlCenterWillPresent {
  %orig;
  platterViews = [[self delegate] pagePlatterViewsForContainerView:self];

  for (platterView in platterViews) {
      if([artView superview] == NO){
isDone = NO;
      [platterView layoutSubviews];
      NSLog(@"Repeat setting");
      }
}
}
%end

%hook CCUIControlCenterLabel
-(void) _updateEffects{
%orig;
NSLog(@"text color update");
self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
}
%end