import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import '../widgets/random_words_widget.dart';

class RandomWordsState extends State<RandomWordsWidget> {
  final _suggestions = <WordPair>[];
  final _biggerfont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Arrange Portal Admin"),
        ),
        body: _buildsuggestions());
  }

  Widget _buildsuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          // The syntax "i ~/ 2" divides i by 2 and returns an integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          final index = i ~/ 2;
          if (index >= _suggestions.length)
            _suggestions.addAll(generateWordPairs().take(10));
          return _buildrow(_suggestions[index]);
        });
  }

  Widget _buildrow(WordPair wordpair) {
    final _alreadysaved = _saved.contains(wordpair);
    return new ListTile(
      title: new Text(wordpair.asPascalCase, style: _biggerfont),
      trailing: new Icon(
        _alreadysaved ? Icons.favorite : Icons.favorite_border,
        color: _alreadysaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (_alreadysaved) _saved.remove(wordpair);
          else _saved.add(wordpair);
        });
      },
    );
  }
}
