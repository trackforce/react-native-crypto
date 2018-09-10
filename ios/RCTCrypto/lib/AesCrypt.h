#import <Foundation/Foundation.h>

@interface AesCrypt : NSObject
+ (NSString *) encrypt: (NSString *)clearText  key: (NSString *)key iv: (NSString *)iv;
+ (NSString *) decrypt: (NSString *)cipherText key: (NSString *)key iv: (NSString *)iv;
+ (NSString *) pbkdf2:(NSString *)password salt: (NSString *)salt iterations: (int)iterations keyLen: (int)keyLen hash: (NSString *)hash;
+ (NSString *) hmac256: (NSString *)input key: (NSString *)key;
+ (NSString *) sha1: (NSString *)input;
+ (NSString *) sha256: (NSString *)input;
+ (NSString *) sha512: (NSString *)input;
+ (NSString *) toHex: (NSData *)nsdata;
@end
