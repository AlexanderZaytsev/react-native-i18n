#import <UIKit/UIKit.h>
#import "RNI18n.h"

@implementation RNI18n

RCT_EXPORT_MODULE();

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

- (NSMutableArray *)toLanguageTags:(NSArray *)languages {
  NSMutableArray *languageTags = [NSMutableArray array];

  for (id l in languages) {
    [languageTags addObject:[l stringByReplacingOccurrencesOfString:@"_" withString:@"-"]];
  }

  return languageTags;
}

- (NSArray *)getPreferredLanguages {
  NSArray *preferredLanguages = [NSLocale preferredLanguages];

  return [[[UIDevice currentDevice] systemVersion] floatValue] >= 9
    ? preferredLanguages
    : [self toLanguageTags:preferredLanguages];
}

- (NSDictionary *)constantsToExport {
  return @{ @"languages": [self getPreferredLanguages] };
}

RCT_EXPORT_METHOD(getLanguages:(RCTPromiseResolveBlock)resolve
                  rejecter:(__unused RCTPromiseRejectBlock)reject) {
  resolve([self getPreferredLanguages]);
}

@end
