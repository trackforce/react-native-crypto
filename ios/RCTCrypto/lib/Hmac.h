#import <Foundation/Foundation.h>

@interface Hmac : NSObject
+ (NSString *) hmac256: (NSString *)input key: (NSString *)key;
@end
