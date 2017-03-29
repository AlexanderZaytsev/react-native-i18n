#import "RNI18n.h"

@implementation RNI18n

RCT_EXPORT_MODULE();

- (NSString*) getCurrentLocale
{
  NSString *preferredLanguage = [[NSLocale preferredLanguages] objectAtIndex:0];

  if ([preferredLanguage rangeOfString:@"-"].location != NSNotFound) {
    return preferredLanguage;
  }

  if ([preferredLanguage rangeOfString:@"_"].location != NSNotFound) {
    return [preferredLanguage stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  }

  NSString *countryCode = [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];

  if (countryCode != nil) {
    return [NSString stringWithFormat:@"%@-%@", preferredLanguage, countryCode];
  }

  return preferredLanguage;
}

- (NSDictionary *)constantsToExport
{
  return @{ @"locale": [self getCurrentLocale] };
}

@end
