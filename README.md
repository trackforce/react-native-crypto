[![npm version](https://badge.fury.io/js/%40trackforce%2Freact-native-crypto.svg)](https://badge.fury.io/js/%40trackforce%2Freact-native-crypto)

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
* Drag RCTCrypto.xcodeproj to your project on Xcode.
* Click on your main project file (the one that represents the .xcodeproj) select Build Phases and drag libRCTCrypto.a from the Products folder inside the RCTCrypto.xcodeproj.

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
import com.trackforce.aes.RCTCryptoPackage;

......

@Override
protected List<ReactPackage> getPackages() {
   ......
   new RCTCryptoPackage(),
   ......
}
```

## Local development

1. `yarn install`
2. `yarn link`
3. `cd example`
4. `yarn install`
5. `yarn link @trackforce/react-native-crypto`
6. `yarn run-ios`


## Usage

### Example

See example App.tsx for usage

### methods

See Typescript typings
