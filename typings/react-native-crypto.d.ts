declare module '@trackforce/react-native-crypto' {
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
    export function hash(password: string, salt: string, iterations: number, keyLen: number, hash: 'SHA1' | 'SHA224' | 'SHA256' | 'SHA384' | 'SHA512'): Promise<string>;
  }

  export { Aes, Sha, Hmac, Pbkdf2 }
}
