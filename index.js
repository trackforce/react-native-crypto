'use strict';
import { NativeModules } from 'react-native';

const Aes = NativeModules.Aes;
const Sha = NativeModules.Sha;
const Hmac = NativeModules.Hmac;
const Pbkdf2 = NativeModules.Pbkdf2;
const Rsa = NativeModules.Rsa;

export { Aes, Sha, Hmac, Pbkdf2, Rsa };

export default Aes;