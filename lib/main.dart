import 'dart:io';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final randomword= WordPair.random();
    return MaterialApp(
        title: 'Startup Name Generator',
        home: Scaffold(
          appBar: AppBar(title: Text('Madae ko app')),
          body: Center(
            child: RandomWords(),
          ),
        ));
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final suggestions=<WordPair>[];
  final biggerText=TextStyle(fontSize: 18.0);
  Widget buildSuggestion(){
    return ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemBuilder: (context,i){
            if(i.isOdd)
                {
                  return Divider();
                }
            final index=i~/2;
            if(index>=suggestions.length){
              suggestions.addAll(generateWordPairs().take(10));
            }
            return listItemView(suggestions[index]);
          },
         );
  }
  Widget listItemView(WordPair sugesstion){
    return ListTile(title: Text(sugesstion.asUpperCase,style: biggerText,));
  }
  @override
  Widget build(BuildContext context) {
    return buildSuggestion();
  }
}

