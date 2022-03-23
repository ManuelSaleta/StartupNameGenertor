import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

// The stateful Widget (class). StatefulWidget class is in itself an immutable
// object, it can be garbage collected and replace, But the state override
// Will stay
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  // Function that returns a ListView object
  Widget _buildSuggestionsListGenerator() {
    return ListView.builder(

        // pass context & index var
        itemBuilder: (context, i) {
      // Add a one-pixel-high divider widget before each row in ListView
      if (i.isOdd) {
        return const Divider();
      }

      final index = i ~/ 2; //WTF ???
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10)); // add 10 new items
      }
      return ListTile(
        title: Text(
          _suggestions[index].asPascalCase,
          style: _biggerFont,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestionsListGenerator();
  }
}
