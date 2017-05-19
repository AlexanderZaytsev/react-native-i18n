// @ flow

import React, { Component } from 'react';
// import { languages, getLanguages } from 'react-native-i18n';
import { NativeModules } from 'react-native';
const { getLanguages, languages } = NativeModules.RNI18n;

import {
  Platform,
  StyleSheet,
  Text,
  ScrollView,
  View,
} from 'react-native';

export default class extends Component {
  state = { languages: [] }

  componentWillMount() {
    getLanguages().then(languages => {
      this.setState({ languages })
    })
  }

  render() {
    return (
      <ScrollView style={styles.container}>
        <Text style={styles.title}>Internal constants</Text>

        <View style={styles.line}>
          <Text style={styles.label}>languages: </Text>
          <Text>{JSON.stringify(languages)}</Text>
        </View>

        <Text style={styles.title}>Internal methods</Text>

        <View style={styles.line}>
          <Text style={styles.label}>getLanguages (Promise): </Text>
          <Text>{JSON.stringify(this.state.languages)}</Text>
        </View>
      </ScrollView>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5FCFF',
    padding: 24,
    paddingTop: Platform.OS === 'ios' ? 44 : 24,
  },
  title: {
    fontSize: 20,
    fontWeight: '700',
    marginBottom: 8,
  },
  line: {
    flexDirection: 'row',
    marginBottom: 16,
  },
  label: {
    fontWeight: '700',
    marginRight: 8,
  },
});
