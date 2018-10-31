'use strict';
import { NativeModules } from 'react-native';

const Aes = NativeModules.Aes;
const Sha = NativeModules.Sha;
const Hmac = NativeModules.Hmac;
const Pbkdf2 = NativeModules.Pbkdf2;

export { Aes, Sha, Hmac, Pbkdf2 };

export default Aes;