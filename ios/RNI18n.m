#import "RNI18n.h"

@implementation RNI18n

RCT_EXPORT_MODULE();

- (NSDictionary *)constantsToExport {
  NSArray *preferredLanguages = [NSLocale preferredLanguages];
  NSMutableArray *languages = [NSMutableArray array];

  for (id language in preferredLanguages) {
    [languages addObject:[language stringByReplacingOccurrencesOfString:@"_" withString:@"-"]];
  }

  return @{
    @"language": [languages objectAtIndex:0],
    @"languages": languages
  };
}

@end
