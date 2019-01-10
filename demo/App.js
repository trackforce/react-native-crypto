import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { Aes, Sha, Hmac, Pbkdf2, Rsa } from '@trackforce/react-native-crypto';

export default class App extends Component {

  async componentDidMount() {
    try {
      const iterations = 4096;
      const keyInBytes = 32;
      const message = 'data to encrypt';
      const key = await Pbkdf2.hash('a0', 'a1b4efst', iterations, keyInBytes, 'SHA1');
      console.log(`pbkdf2 key: ${key}`);

      const iv = null; // or base 64 encoded 16 bytes random string
      const aesEncryptedMessage = await Aes.encrypt(message, key, iv);
      console.log(`aes Encrypt: ${aesEncryptedMessage}`);

      const aesDecryptedMessage = await Aes.decrypt(aesEncryptedMessage, key, iv);
      console.log(`aes Decrypt: ${aesDecryptedMessage}`);

      const hmac256Hash = await Hmac.hmac256(message, key);
      console.log(`hmac256: ${hmac256Hash}`);

      const sha1hash = await Sha.sha1("test");
      console.log(`sha1: ${sha1hash}`);

      // const rsaKeys = await Rsa.generateKeys(4096);
      // console.log('4096 private:', rsaKeys.private);
      // console.log('4096 public:', rsaKeys.public);
      // const rsaEncryptedMessage = await Rsa.encrypt(message, rsaKeys.public);
      // console.log('rsa Encrypt:', rsaEncryptedMessage);
      // const rsaSignature = await Rsa.sign(rsaEncryptedMessage, rsaKeys.private, 'SHA256');
      // console.log('rsa Signature:', rsaSignature);
      // const validSignature = await Rsa.verify(rsaSignature, rsaEncryptedMessage, rsaKeys.public, 'SHA256');
      // console.log('rsa signature verified:', validSignature);
      // const rsaDecryptedMessage = await Rsa.decrypt(rsaEncryptedMessage, rsaKeys.private);
      // console.log('rsa Decrypt:', rsaDecryptedMessage);
    } catch (err) {
      console.log('err', err);
    }
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Open dev console to see output!</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  }
});