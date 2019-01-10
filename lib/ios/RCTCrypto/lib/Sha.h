#import <Foundation/Foundation.h>

@interface Sha : NSObject
+ (NSString *) sha1: (NSString *)input;
+ (NSString *) sha256: (NSString *)input;
+ (NSString *) sha512: (NSString *)input;
@end
