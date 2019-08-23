import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:developer' as developer;

void main() {
  developer.log('main:+');

  runApp(MyApp());

  developer.log('main:-');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    developer.log('MyApp::build:+');

    var app = MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
    );

    developer.log('MyApp::build:-');
    return app;
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    developer.log('RandomeWordsState::build:+');

    var widget = Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );

    developer.log('RandomeWordsState::build:-');
    return widget;
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        developer.log('RandomWordsState::_buildSuggestions:+');
        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        ListTile row = _buildRow(_suggestions[index]);

        developer.log('RandomWordsState::_buildSuggestions:- index=$i row=${row.title}');
        return row;
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    //developer.log('RandomWordsState::_buildRow:+');

    var row = ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );

    //developer.log('RandomWordsState::_buildRow:- rowx=${row.title}');
    return row;
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
