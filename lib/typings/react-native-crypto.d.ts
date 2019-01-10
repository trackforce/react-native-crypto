declare module '@trackforce/react-native-crypto' {
  interface PublicKey {
    public: string;
  }

  interface KeyPair extends PublicKey {
    private: string;
  }

  namespace Aes {
    export function encrypt(text: string, key: string, iv: string): Promise<string>;
    export function decrypt(ciphertext: string, key: string, iv: string): Promise<string>;
  }

  namespace Sha {
    export function sha1(text: string): Promise<string>;
    export function sha256(text: string): Promise<string>;
    export function sha512(text: string): Promise<string>;
  }

  namespace Hmac {
    export function hmac256(ciphertext: string, key: string): Promise<string>;
  }

  namespace Pbkdf2 {
    export function hash(password: string, saltBase64: string, iterations: number, keyLen: number, hash: 'SHA1' | 'SHA224' | 'SHA256' | 'SHA384' | 'SHA512'): Promise<string>;
  }

  namespace Rsa {
    export function generateKeys(keySize: number): Promise<KeyPair>;
    export function encrypt(data: string, key: string): Promise<string>;
    export function encrypt64(data64: string, key: string): Promise<string>;
    export function decrypt(data: string, key: string): Promise<string>;
    export function decrypt64(data64: string, key: string): Promise<string>;
    export function sign(data: string, key: string, hash: 'Raw' | 'SHA1' | 'SHA224' | 'SHA256' | 'SHA384' | 'SHA512'): Promise<string>;
    export function sign64(data64: string, key: string, hash: 'Raw' | 'SHA1' | 'SHA224' | 'SHA256' | 'SHA384' | 'SHA512'): Promise<string>;
    export function verify(signature: string, data: string, key: string, hash: 'Raw' | 'SHA1' | 'SHA224' | 'SHA256' | 'SHA384' | 'SHA512'): Promise<boolean>;
    export function verify64(signature64: string, data64: string, key: string, hash: 'Raw' | 'SHA1' | 'SHA224' | 'SHA256' | 'SHA384' | 'SHA512'): Promise<boolean>;
  }

  export { Aes, Sha, Hmac, Pbkdf2, Rsa }
}
