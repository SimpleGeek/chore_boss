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
        primaryColor: Colors.deepOrange,
        buttonColor: Colors.deepOrange,
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
  // Class constants
  final choreTitleController = TextEditingController();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void dispose() {
    // Clean up text field controller when done
    choreTitleController.dispose();
    super.dispose();
  }

  Widget _buildForm() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Add New Chore',
            style: _biggerFont,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: choreTitleController,
            ),
          ),
          RaisedButton(
            onPressed: () {
              /*...*/
            },
            child: Text(
              "Add Chore",
            ),
          ),
        ],
      ),
    ); // Center
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Chore'),
      ),
      body: _buildForm(),
    ); // Scaffold
  }
}
