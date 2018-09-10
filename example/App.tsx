import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import Crypto from '@trackforce/react-native-crypto';
declare var console: any;

export default class App extends Component {

  async componentDidMount() {
    try {
      const iterations = 4096;
      const keyInBytes = 32;
      const key = await Crypto.pbkdf2('a0', 'a1b4efst', iterations, keyInBytes, 'SHA1');
      console.log(`pbkdf2 key: ${key}`);

      const iv = null; // or base 64 encoded 16 bytes random string
      const ciphertext = await Crypto.aesEncrypt('data to encrypt', key, iv);
      console.log(`aesEncrypt: ${ciphertext}`);

      const decryptedText = await Crypto.aesDecrypt(ciphertext, key, iv);
      console.log(`aesDecrypt: ${decryptedText}`);

      const hash = await Crypto.hmac256(ciphertext, key);
      console.log(`hmac256: ${hash}`);
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
