declare module '@trackforce/react-native-crypto' {
  function pbkdf2(password: string, salt: string): Promise<string>;
  function todoPbkdf2(password: string, salt: string, iterations: number, keyLen: number, hash: 'sha1' | 'sha512'): Promise<string>;
  function aesEncrypt(text: string, key: string, iv: string): Promise<string>;
  function aesDecrypt(ciphertext: string, key: string, iv: string): Promise<string>;
  function hmac256(ciphertext: string, key: string): Promise<string>;
  function sha1(text: string): Promise<string>;
  function sha256(text: string): Promise<string>;
  function sha512(text: string): Promise<string>;
}
