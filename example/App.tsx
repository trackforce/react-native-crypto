import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import Crypto from '@trackforce/react-native-crypto';

export default class App extends Component {

  async componentDidMount() {
    const generatedKey = await generateKey('password', 'salt');
      console.log(`generatedKey: ${generatedKey}`);

      const { ciphertext, iv } = await encrypt('Hello, world!', generatedKey);
      console.log(`ciphertext: ${ciphertext}, iv: ${iv}`);

      const decryptedText = await decrypt(ciphertext, generatedKey, iv);
      console.log(`decrypted: ${decryptedText}`);

      const hash = await hmac(ciphertext, generatedKey);
      console.log(`hash: ${hash}`);
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Welcome to React Native!</Text>
      </View>
    );
  }
}

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
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
