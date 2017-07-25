//  Created by react-native-create-bridge

#import "MakeCallNative.h"

// import RCTBridge
#if __has_include(<React/RCTBridge.h>)
#import <React/RCTBridge.h>
#elif __has_include(“RCTBridge.h”)
#import “RCTBridge.h”
#else
#import “React/RCTBridge.h” // Required when used as a Pod in a Swift project
#endif

// import RCTEventDispatcher
#if __has_include(<React/RCTEventDispatcher.h>)
#import <React/RCTEventDispatcher.h>
#elif __has_include(“RCTEventDispatcher.h”)
#import “RCTEventDispatcher.h”
#else
#import “React/RCTEventDispatcher.h” // Required when used as a Pod in a Swift project
#endif

@implementation MakeCallNative
@synthesize bridge = _bridge;

// Export a native module
// https://facebook.github.io/react-native/docs/native-modules-ios.html
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(callMe:(NSString *)phone) {
  NSString *url = @"tel://";
  NSString *phoneNumDecimalsOnly = [[phone componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
  url = [url stringByAppendingString:phoneNumDecimalsOnly];
  UIApplication *application = [UIApplication sharedApplication];
  [application openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
}

@end
