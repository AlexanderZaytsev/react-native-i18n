#import <UIKit/UIKit.h>
#import "RNI18n.h"

@implementation RNI18n

RCT_EXPORT_MODULE();

- (NSMutableArray *)toLanguageTags:(NSArray *)languages {
  NSMutableArray *languageTags = [NSMutableArray array];

  for (id l in languages) {
    [languageTags addObject:[l stringByReplacingOccurrencesOfString:@"_" withString:@"-"]];
  }

  return languageTags;
}

RCT_EXPORT_METHOD(getLanguages:(RCTPromiseResolveBlock)resolve
                  rejecter:(__unused RCTPromiseRejectBlock)reject) {
  NSArray *preferredLanguages = [NSLocale preferredLanguages];

  resolve(
    [[[UIDevice currentDevice] systemVersion] floatValue] >= 9
      ? preferredLanguages
      : [self toLanguageTags:preferredLanguages]
  );
}

@end
