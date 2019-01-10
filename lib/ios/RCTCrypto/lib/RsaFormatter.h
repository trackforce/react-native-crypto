#import <Foundation/Foundation.h>

@interface RsaFormatter : NSObject
+ (NSString *)PEMFormattedPublicKey:(NSData *)publicKeyData;
+ (NSString *)PEMFormattedPrivateKey:(NSData *)privateKeyData;
+ (NSString *)stripHeaders:(NSString *)pemString;
@end
