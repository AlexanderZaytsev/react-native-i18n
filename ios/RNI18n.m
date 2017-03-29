#import "RNI18n.h"

@implementation RNI18n

RCT_EXPORT_MODULE();

- (NSString*) getCurrentLocale
{
  NSString *localeString=[[NSLocale preferredLanguages] objectAtIndex:0];
  return localeString;
}

- (NSDictionary *)constantsToExport
{
  return @{ @"locale": [self getCurrentLocale] };
}

@end
