static NSUserDefaults *settings;



static void nz9_prefChanged() {
  if (settings) {
    [settings release];
  }
  settings = [[NSUserDefaults  alloc] initWithSuiteName:@"com.neinzedd9.TimeMover"];
  [settings registerDefaults:@{
      @"enableSwitch": @NO,
      @"editSwitch": @NO,
      @"vibrantSwitch": @NO,
      @"disableScrollingSwitch": @NO,
			@"fineTuneSwitch": @NO,
      @"pinnedFrame": @"{{0, 0}, {0, 0}}",
      @"pinnedBounds": @"{{0, 0}, {0, 0}}",
      @"pinnedCenter": @"{0, 0}",
      @"pinnedTransform": @"[1, 0, 0, 1, 0, 0]"
  }];
}



static void nz9_resetPinnedFrame() {
  [settings setObject:@"{0, 0}" forKey: @"pinnedCenter"];
}

static BOOL nz9_isTweakEnabled() {
  return [settings boolForKey:@"enableSwitch"];
}

static BOOL nz9_isEditModeEnabled() {
  return [settings boolForKey:@"editSwitch"];
}

static BOOL nz9_isLockscreenScrollingDisabled() {
  return [settings boolForKey:@"disableScrollingSwitch"];
}

static BOOL nz9_isVibrantModeEnabled() {
  return [settings boolForKey:@"vibrantSwitch"];
}

static BOOL nz9_isFineTuneModeEnabled() {
	return [settings boolForKey:@"fineTuneSwitch"];
}



%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)nz9_prefChanged, CFSTR("NZ9TimeMoverPreferencesChangedNotification"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)nz9_resetPinnedFrame, CFSTR("NZ9TimeMoverResetNotification"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	nz9_prefChanged();
}



@interface NZ9_UIGestureRecognizerDelegate : NSObject <UIGestureRecognizerDelegate>

- (void)nz9_pan:(UIPanGestureRecognizer *)sender;
- (void)nz9_pinch:(UIPinchGestureRecognizer *)sender;
- (void)nz9_rotate:(UIRotationGestureRecognizer *)sender;


- (void)savePinnedFrame:(UIView *)view;
- (void)setPinnedFrame:(UIView *)view;

@end

@implementation NZ9_UIGestureRecognizerDelegate : NSObject

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
  if(nz9_isTweakEnabled()) {
    if(nz9_isEditModeEnabled()) {
      return YES;
    }
  }
  return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
  return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	/*
	if([gestureRecognizer isKindOfClass: [UIPanGestureRecognizer class]] || [otherGestureRecognizer isKindOfClass: [UIPanGestureRecognizer class]]) {
		return NO;
	}
	*/
	if(nz9_isFineTuneModeEnabled()) {
		return NO;
	}
	return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
  return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
  return NO;
}

- (void)nz9_pan:(UIPanGestureRecognizer *)sender {
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-method-access"
  [[%c(SBBacklightController) sharedInstance] resetIdleTimer];
  #pragma clang diagnostic pop
  UIView *view = sender.view; // Puts the UIView of the date view into "view"
  CGPoint translation = [sender translationInView:view.superview]; // Puts the translation of the date view into "translation"
  view.center = CGPointMake(view.center.x + translation.x, view.center.y + translation.y); // Implements translation of the view
  [sender setTranslation:CGPointZero inView:view.superview]; // Resets translation of the pan gesture recognizer
  [self savePinnedFrame:view];
  [self setPinnedFrame:view];
}

- (void)nz9_pinch:(UIPinchGestureRecognizer *)sender {
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-method-access"
  [[%c(SBBacklightController) sharedInstance] resetIdleTimer];
  #pragma clang diagnostic pop
  UIView *view = sender.view; // Puts the UIView of the date view into "view"
  CGFloat scale = sender.scale; // Puts the scale of the date view into "scale"  view.center = CGPointMake(view.center.x + translation.x, view.center.y + translation.y); // Implements translation of the view
  [view layer].anchorPoint = CGPointMake(0.5, 0.5);
  view.transform = CGAffineTransformScale(view.transform, scale, scale); // Implements resize of the view
  sender.scale = 1.0; // Resets scale of the pinch gesture recognizer
  [self savePinnedFrame:view];
  [self setPinnedFrame:view];
}

- (void)nz9_rotate:(UIRotationGestureRecognizer *)sender {
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wobjc-method-access"
  [[%c(SBBacklightController) sharedInstance] resetIdleTimer];
  #pragma clang diagnostic pop
  UIView *view = sender.view; // Puts the UIView of the date view into "view"
	CGFloat angle = sender.rotation; // Puts the rotation of the date view into "angle"
  [view layer].anchorPoint = CGPointMake(0.5, 0.5);
  view.transform = CGAffineTransformRotate(view.transform, angle); // Implements rotation of the view
  sender.rotation = 0.0; // Resets rotation of the rotation gesture recognizer
  [self savePinnedFrame:view];
  [self setPinnedFrame:view];
}

- (void)savePinnedFrame:(UIView *)view {
	[settings setObject:NSStringFromCGRect(view.frame) forKey:@"pinnedFrame"];
  [settings setObject:NSStringFromCGAffineTransform(view.transform) forKey:@"pinnedTransform"];
  [settings setObject:NSStringFromCGRect(view.bounds) forKey:@"pinnedBounds"];
  [settings setObject:NSStringFromCGPoint(view.center) forKey:@"pinnedCenter"];
}

- (void)setPinnedFrame:(UIView *)view {
  view.frame = CGRectFromString([settings objectForKey:@"pinnedFrame"]);
  view.transform = CGAffineTransformFromString([settings objectForKey:@"pinnedTransform"]);
  view.center = CGPointFromString([settings objectForKey:@"pinnedCenter"]);
  view.bounds = CGRectFromString([settings objectForKey:@"pinnedBounds"]);
}

@end



@interface SBLockScreenDateViewController

@property (copy) UIView *view;

@end

%hook SBLockScreenDateViewController

- (id)init { // Called when the SBFLockScreenDateView is initialized
  %orig; // Call original init method
    if(nz9_isTweakEnabled()) { // If the tweak is not enabled, only the original loadView method is called
      [self.view setUserInteractionEnabled:YES];
      NZ9_UIGestureRecognizerDelegate *delegate = [[NZ9_UIGestureRecognizerDelegate alloc] init];
      UIPanGestureRecognizer *nz9_panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:delegate action:@selector(nz9_pan:)]; // Initialize pan gesture
      nz9_panRecognizer.delegate = delegate;
      [self.view addGestureRecognizer: nz9_panRecognizer]; // Add pan gesture to the date view
      UIPinchGestureRecognizer *nz9_pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:delegate action:@selector(nz9_pinch:)]; // Initialize pinch gesture
      nz9_pinchRecognizer.delegate = delegate;
      [self.view addGestureRecognizer: nz9_pinchRecognizer]; // Add pinch gesture to the date view
      UIRotationGestureRecognizer *nz9_rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:delegate action:@selector(nz9_rotate:)]; // Initialize rotation gesture
      nz9_rotationRecognizer.delegate = delegate;
      [self.view addGestureRecognizer: nz9_rotationRecognizer]; // Add rotation gesture to the date view
      if(!CGPointEqualToPoint(CGPointFromString([settings objectForKey:@"pinnedCenter"]), CGPointZero)) {
        [delegate setPinnedFrame:self.view];
      }
      [delegate gestureRecognizerShouldBegin: nz9_panRecognizer]; // Enable pan gesture recognizer
      [delegate gestureRecognizerShouldBegin: nz9_pinchRecognizer]; // Enable pinch gesture recognizer
      [delegate gestureRecognizerShouldBegin: nz9_rotationRecognizer]; // Enable rotate gesture recognizer
    }
    return self; // Return initialization
}

%end



@interface SBPagedScrollView

@property (copy) UIView *view;

@end

%hook SBPagedScrollView

- (double)pageRelativeScrollOffset {
  if(nz9_isTweakEnabled()) {
    if(nz9_isLockscreenScrollingDisabled()) {
      self.view.userInteractionEnabled = NO;
    }
    else {
      self.view.userInteractionEnabled = YES;
    }
  }
  return %orig;
}

%end



@interface SBDashBoardView



@end

%hook SBDashBoardView

- (void)_layoutDateView {
  if(nz9_isTweakEnabled()) {
    if(CGPointEqualToPoint(CGPointFromString([settings objectForKey:@"pinnedCenter"]), CGPointZero)) {
      %orig;
    }
  }
  else {
    %orig;
  }
}

- (void)setDateViewIsVibrant:(BOOL)arg1 {
  if(nz9_isTweakEnabled()) {
    if(!nz9_isEditModeEnabled()) {
      if(nz9_isVibrantModeEnabled()) {
        %orig(YES);
      }
      else {
        %orig(NO);
      }
    }
    else {
      %orig(NO);
    }
  }
  else {
    %orig(NO);
  }
}

%end



@interface SBAnimationSettings

@property(nonatomic) long long animationType;

@end

@interface SBFadeAnimationSettings

@property(retain, nonatomic) SBAnimationSettings *dateInSettings;

@end

%hook SBFadeAnimationSettings

- (void)setDefaultValues
{
  %orig;
  if(nz9_isTweakEnabled()) {
    self.dateInSettings = nil;
  }
}

%end
