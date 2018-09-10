import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import Crypto from '@trackforce/react-native-crypto';
declare var console: any;

export default class App extends Component {

  async componentDidMount() {
    const key = await Crypto.pbkdf2('pswd', 'a1b4efst', 4096, 32, 'SHA1');
    console.log(`pbkdf2 key: ${key}`);

    const iv = 'base 64 random 16 bytes string';
    const ciphertext = await Crypto.aesEncrypt('data to encrypt', key, iv);
    console.log(`aesEncrypt: ${ciphertext}`);

    const decryptedText = await Crypto.aesDecrypt(ciphertext, key, iv);;
    console.log(`aesDecrypt: ${decryptedText}`);

    const hash = await Crypto.hmac256(ciphertext, key);
    console.log(`hmac256: ${hash}`);
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
