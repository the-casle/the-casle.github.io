@interface SPUISearchHeader : UIView
@end

%hook SPUISearchHeader
-(void) layoutSubviews {
%orig;
UIButton *button = MSHookIvar<UIButton *>(self, "_cancelButton");
[button setTitle: @"KYS"
forState:UIControlStateNormal];
}
%end