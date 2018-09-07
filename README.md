# React Native Crypto

Common encryption/decryption for react-native

## Installation
```sh
npm install @trackforce/react-native-crypto
```
or
```sh
yarn add @trackforce/react-native-crypto
```
### Linking Automatically
```sh
react-native link
```
### Linking Manually

#### iOS
* See [Linking Libraries](http://facebook.github.io/react-native/docs/linking-libraries-ios.html)
OR
* Drag RCTAes.xcodeproj to your project on Xcode.
* Click on your main project file (the one that represents the .xcodeproj) select Build Phases and drag libRCTAes.a from the Products folder inside the RCTAes.xcodeproj.

#### (Android)

```gradle
...
include ':@trackforce/react-native-crypto'
project(':@trackforce/react-native-crypto').projectDir = new File(rootProject.projectDir, '../node_modules/@trackforce/react-native-crypto/android')
```

* In `android/app/build.gradle`

```gradle
...
dependencies {
    ...
    compile project(':@trackforce/react-native-crypto')
}
```

* register module (in MainApplication.java)

```java
......
import com.trackforce.aes.RCTAesPackage;

......

@Override
protected List<ReactPackage> getPackages() {
   ......
   new RCTAesPackage(),
   ......
}
```

## Usage

### Example

```js
import Crypto from '@trackforce/react-native-crypto';

function generateKey(password, salt) {
    return Crypto.pbkdf2(password, salt, 5000, 32, 'sha512');
}

async function encrypt(text, key) {
    const iv = 'base 64 random 16 bytes string';
    try {
        const ciphertext = await Crypto.aesEncrypt(text, key, iv);
        return { ciphertext, iv };
    } catch (error) {
        throw error;
    }
}

function decrypt(ciphertext, key, iv) {
    return Crypto.aesDecrypt(ciphertext, key, iv);
}

function hmac(ciphertext, key) {
    return Crypto.hmac256(ciphertext, key);
}

(async () => {
    try {
        const generatedKey = await generateKey('password', 'salt');
        console.log(`generatedKey: ${generatedKey}`);

        const { ciphertext, iv } = await encrypt('Hello, world!', generatedKey);
        console.log(`ciphertext: ${ciphertext}, iv: ${iv}`);

        const decryptedText = await decrypt(ciphertext, generatedKey, iv);
        console.log(`decrypted: ${decryptedText}`);

        const hash = await hmac(ciphertext, generatedKey);
        console.log(`hash: ${hash}`);
    } catch (error) {
        throw error;
    }
})();
```

### methods

```js
declare module '@trackforce/react-native-crypto' {
  function pbkdf2(password: string, salt: string, iterations: number, keyLen: number, hash: 'sha1' | 'sha512'): Promise<string>;
  function aesEncrypt(text: string, key: string, iv: string): Promise<string>;
  function aesDecrypt(ciphertext: string, key: string, iv: string): Promise<string>;
  function hmac256(ciphertext: string, key: string): Promise<string>;
  function sha1(text: string): Promise<string>;
  function sha256(text: string): Promise<string>;
  function sha512(text: string): Promise<string>;
}
```
