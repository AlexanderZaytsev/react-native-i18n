#import <UIKit/UIKit.h>
#import "RNI18n.h"

@implementation RNI18n

RCT_EXPORT_MODULE();

- (NSDictionary *)constantsToExport {
  NSArray *preferredLanguages = [NSLocale preferredLanguages];

  if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
    return @{
      @"language": [preferredLanguages objectAtIndex:0],
      @"languages": preferredLanguages
    };
  }

  NSMutableArray *forcedLanguageTags = [NSMutableArray array];

  for (id l in preferredLanguages) {
    [forcedLanguageTags addObject:[l stringByReplacingOccurrencesOfString:@"_" withString:@"-"]];
  }

  return @{
    @"language": [forcedLanguageTags objectAtIndex:0],
    @"languages": forcedLanguageTags
  };
}

@end
