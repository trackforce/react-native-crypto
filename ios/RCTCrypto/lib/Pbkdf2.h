#import <Foundation/Foundation.h>

@interface Pbkdf2 : NSObject
+ (NSString *) hash:(NSString *)password salt: (NSString *)salt iterations: (int)iterations keyLen: (int)keyLen hash: (NSString *)hash;
@end
