import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Startup Name Generator'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ]),
        body: _buildSuggestions());
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
        return ListTile(
          title: Text(pair.asPascalCase, style: _biggerFont),
        );
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(
            title: Text('Saved Suggestions'),
          ),
          body: ListView(children: divided));
    }));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    // return ListTile(
    //   title: Text(pair.asPascalCase, style: _biggerFont),
    //   trailing: Icon(
    //     alreadySaved ? Icons.favorite : Icons.favorite_border,
    //     color: alreadySaved ? Colors.red : null,
    //   ),
    //   onTap: () {
    //     setState(() {
    //       if (alreadySaved) {
    //         _saved.remove(pair);
    //       } else {
    //         _saved.add(pair);
    //       }
    //     });
    //   },
    // );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: Image.asset('assets/pic2.png'),
              height: 120,
              width: 120,
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(pair.asPascalCase, style: _biggerFont),
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
              // decoration: BoxDecoration(
              //     border: Border.all(
              //         color: Colors.black,
              //         width: 1.0,
              //         style: BorderStyle.solid)),
            ),
            Container(
              width: 200,
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "This is a company name randomly generatedly by WordPair package. The words are concatenated using Pascal case.",
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black,
                      width: 1.0,
                      style: BorderStyle.solid)),
                  margin: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.green[500], size: 16.0),
                      Icon(Icons.star, color: Colors.green[500], size: 16.0),
                      Icon(Icons.star, color: Colors.green[500], size: 16.0),
                      Icon(Icons.star, color: Colors.black, size: 16.0),
                      Icon(Icons.star, color: Colors.black, size: 16.0),
                    ],
                  ),
                ),
                Text("170 Reviews")
              ],
            )
          ],
        ),
        
        GestureDetector(
          onTap: () {
            setState(() {
              if (alreadySaved) {
                _saved.remove(pair);
              } else {
                _saved.add(pair);
              }
            });
          },
          child: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
        )
      ],
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
