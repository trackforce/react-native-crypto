#import "RCTAes.h"
#import "c.h"

@implementation RCTAes

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(aesEncrypt:(NSString *)data key:(NSString *)key iv:(NSString *)iv
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *base64 = [Aes aesEncrypt:data key:key iv:iv];
    if (base64 == nil) {
        reject(@"encrypt_fail", @"Encrypt error", error);
    } else {
        resolve(base64);
    }
}

RCT_EXPORT_METHOD(aesDecrypt:(NSString *)base64 key:(NSString *)key iv:(NSString *)iv
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = [Aes aesDecrypt:base64 key:key iv:iv];
    if (data == nil) {
        reject(@"decrypt_fail", @"Decrypt failed", error);
    } else {
        resolve(data);
    }
}

RCT_EXPORT_METHOD(pbkdf2:(NSString *)password salt:(NSString *)salt iterations:(int)iterations keyLen:(int)keyLen hash:(NSString *)hash
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = [Aes pbkdf2:password salt:salt iterations:iterations keyLen:keyLen hash:hash];
    if (data == nil) {
        reject(@"keygen_fail", @"Key generation failed", error);
    } else {
        resolve(data);
    }
}

RCT_EXPORT_METHOD(hmac256:(NSString *)base64 key:(NSString *)key
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = [Aes hmac256:base64 key:key];
    if (data == nil) {
        reject(@"hmac_fail", @"HMAC error", error);
    } else {
        resolve(data);
    }
}

RCT_EXPORT_METHOD(sha1:(NSString *)text
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = [Aes sha1:text];
    if (data == nil) {
        reject(@"sha1_fail", @"Hash error", error);
    } else {
        resolve(data);
    }
}

RCT_EXPORT_METHOD(sha256:(NSString *)text
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = [Aes sha256:text];
    if (data == nil) {
        reject(@"sha256_fail", @"Hash error", error);
    } else {
        resolve(data);
    }
}

RCT_EXPORT_METHOD(sha512:(NSString *)text
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = [Aes sha512:text];
    if (data == nil) {
        reject(@"sha512_fail", @"Hash error", error);
    } else {
        resolve(data);
    }
}
@end
