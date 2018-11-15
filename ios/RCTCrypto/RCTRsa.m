#import "RCTRsa.h"
#import "Rsa.h"

@interface RCTRsa()
+ (SecKeyAlgorithm)getAlgorithmFromHash:(NSString *)hash;
@end

@implementation RCTRsa

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}


+ (SecKeyAlgorithm)getAlgorithmFromHash:(NSString *)hash {
    if ([hash isEqualToString:@"Raw"]) {
        return kSecKeyAlgorithmRSASignatureDigestPKCS1v15Raw;
    } else if ([hash isEqualToString:@"SHA1"]) {
        return kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA1;
    } else if ([hash isEqualToString:@"SHA224"]) {
        return kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA224;
    } else if ([hash isEqualToString:@"SHA256"]) {
        return kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA256;
    } else if ([hash isEqualToString:@"SHA384"]) {
        return kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA384;
    } else {
        return kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA512;
    }
}

RCT_EXPORT_MODULE()

// Key based API, provide the public or private key with each call - pending discussions with @amitaymolko

RCT_EXPORT_METHOD(generate:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    [self generateKeys:2048 resolve:resolve rejecter:reject];
}

RCT_EXPORT_METHOD(generateKeys:(int)keySize resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        Rsa *rsa = [[Rsa alloc] init];
        [rsa generate:keySize];
        NSDictionary *keys = @{
                            @"private" : [rsa encodedPrivateKey],
                            @"public" : [rsa encodedPublicKey]
                            };
        resolve(keys);
    });
}

RCT_EXPORT_METHOD(encrypt:(NSString *)message withKey:(NSString *)key resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        Rsa *rsa = [[Rsa alloc] init];
        rsa.publicKey = key;
        NSString *encodedMessage = [rsa encrypt:message];
        resolve(encodedMessage);
    });
}

RCT_EXPORT_METHOD(decrypt:(NSString *)encodedMessage withKey:(NSString *)key resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        Rsa *rsa = [[Rsa alloc] init];
        rsa.privateKey = key;
        NSString *message = [rsa decrypt:encodedMessage];
        resolve(message);
    });
}

RCT_EXPORT_METHOD(encrypt64:(NSString *)message withKey:(NSString *)key resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        Rsa *rsa = [[Rsa alloc] init];
        rsa.publicKey = key;
        NSString *encodedMessage = [rsa encrypt64:message];
        resolve(encodedMessage);
    });
}

RCT_EXPORT_METHOD(decrypt64:(NSString *)encodedMessage withKey:(NSString *)key resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        Rsa *rsa = [[Rsa alloc] init];
        rsa.privateKey = key;
        NSString *message = [rsa decrypt64:encodedMessage];
        resolve(message);
    });
}


RCT_EXPORT_METHOD(sign:(NSString *)message withKey:(NSString *)key andHash:(NSString *)hash resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error = nil;
        Rsa *rsa = [[Rsa alloc] init];
        rsa.privateKey = key;
        NSString *signature = [rsa sign:message withAlgorithm:[RCTRsa getAlgorithmFromHash:hash] andError:&error];
        if (error != nil) {
            reject(@"error", error.localizedDescription, error);
        } else {
            resolve(signature);
        }
    });
}

RCT_EXPORT_METHOD(sign64:(NSString *)message withKey:(NSString *)key andHash:(NSString *)hash resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error = nil;
        Rsa *rsa = [[Rsa alloc] init];
        rsa.privateKey = key;
        NSString *signature = [rsa sign64:message withAlgorithm:[RCTRsa getAlgorithmFromHash:hash] andError:&error];
        if (error != nil) {
            reject(@"error", error.localizedDescription, error);
        } else {
            resolve(signature);
        }
    });
}

RCT_EXPORT_METHOD(verify:(NSString *)signature withMessage:(NSString *)message andKey:(NSString *)key andHash:(NSString *)hash resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        Rsa *rsa = [[Rsa alloc] init];
        rsa.publicKey = key;
        BOOL valid = [rsa verify:signature withMessage:message andAlgorithm:[RCTRsa getAlgorithmFromHash:hash]];
        resolve(@(valid));
    });
}

RCT_EXPORT_METHOD(verify64:(NSString *)signature withMessage:(NSString *)message andKey:(NSString *)key andHash:(NSString *)hash resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        Rsa *rsa = [[Rsa alloc] init];
        rsa.publicKey = key;
        BOOL valid = [rsa verify64:signature withMessage:message andAlgorithm:[RCTRsa getAlgorithmFromHash:hash]];
        resolve(@(valid));
    });
}

@end