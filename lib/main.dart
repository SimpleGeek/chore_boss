import 'dart:ffi';

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

  void _pushAddChore() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => AddChoreForm(),
      ),
    ); // Navigator.of(context).push
  }

  // TODO: Change this method to show task maintenance window
  void _pushDone() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _done.map(
              (String chore) {
                return ListTile(
                  title: Text(
                    chore,
                    style: _biggerFont,
                  )
                );
              }
          ); // Iterable<ListTile>
          final List<Widget> divided = ListTile
            .divideTiles(tiles: tiles, context: context)
            .toList(); // List<Widget>
          return Scaffold(
            appBar: AppBar(
              title: Text('Completed Chores'),
            ),
            body: ListView(children: divided),
          );
        }, // builder
      ),
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
        alreadyDone ? Icons.check_box : Icons.check_box_outline_blank,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pushAddChore(),
        tooltip: 'New Chore',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Chores extends StatefulWidget {
  @override
  ChoresState createState() => ChoresState();
}

class AddChoreForm extends StatefulWidget {
  @override
  AddChoreFormState createState() => AddChoreFormState();
}

class AddChoreFormState extends State<AddChoreForm> {
  final choreTitleController = TextEditingController();

  @override
  void dispose() {
    // Clean up text field controller when done
    choreTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Chore'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: choreTitleController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text that the user has entered by using the
                // TextEditingController
                content: Text(choreTitleController.text),
              );
            }, // builder
          ); // showDialog
        }, // onPressed
      ),
    ); // Scaffold
  }
}
