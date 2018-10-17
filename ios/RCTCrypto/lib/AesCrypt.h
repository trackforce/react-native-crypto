#import <Foundation/Foundation.h>

@interface AesCrypt : NSObject
+ (NSString *) aesEncrypt: (NSString *)clearText  key: (NSString *)key iv: (NSString *)iv;
+ (NSString *) aesDecrypt: (NSString *)cipherText key: (NSString *)key iv: (NSString *)iv;
+ (NSString *) pbkdf2:(NSString *)password saltBase64: (NSString *)saltBase64 iterations: (int)iterations keyLen: (int)keyLen hash: (NSString *)hash;
+ (NSString *) hmac256: (NSString *)input key: (NSString *)key;
+ (NSString *) sha1: (NSString *)input;
+ (NSString *) sha256: (NSString *)input;
+ (NSString *) sha512: (NSString *)input;
+ (NSString *) toHex: (NSData *)nsdata;
@end
