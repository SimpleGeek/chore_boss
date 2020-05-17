import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Chores(),
    );
  }
}

class ChoresState extends State<Chores> {
  final _chores = <String>['Make bed', 'Clean room', 'Make breakfast'];
  final Set<String> _done = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  void _pushDone() {
    Navigator.of(context).push(
      
    );
  }

  Widget _buildRow(String choreDescr) {
    final bool alreadyDone = _done.contains(choreDescr);
    return ListTile(
      title: Text(
        choreDescr,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadyDone ? Icons.check_box_outline_blank : Icons.check_box,
      ),
      onTap: () {
        setState(() {
          if (alreadyDone) {
            _done.remove(choreDescr);
          } else {
            _done.add(choreDescr);
          }
        });
      },
    );
  }

  Widget _buildChores() {
    var _choreWidgets = <Widget>[];

    for (String _choreDescr in _chores) {
      _choreWidgets.add(_buildRow(_choreDescr));
    }

    return ListView(
      children: _choreWidgets,
    ); // ListView
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today\'s Chores'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushDone),
        ],
      ),
      body: _buildChores(),
    ); // Scaffold
  }
}

class Chores extends StatefulWidget {
  @override
  ChoresState createState() => ChoresState();
}
