#import <Foundation/Foundation.h>

@interface Shared : NSObject
+ (NSString *) toHex: (NSData *)nsdata;
+ (NSData *) fromHex: (NSString *)string;
@end
