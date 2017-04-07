// @ flow

import React, { Component } from 'react';
import { language, languages } from 'react-native-i18n';

import {
  Platform,
  StyleSheet,
  Text,
  ScrollView,
  View,
} from 'react-native';

export default class extends Component {
  render() {
    return (
      <ScrollView style={styles.container}>
        <Text style={styles.title}>Constants</Text>

        <View style={styles.line}>
          <Text style={styles.label}>language: </Text>
          <Text>{JSON.stringify(language)}</Text>
        </View>

        <View style={styles.line}>
          <Text style={styles.label}>languages: </Text>
          <Text>{JSON.stringify(languages)}</Text>
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
  },
  label: {
    fontWeight: '700',
    marginRight: 8,
  },
});
