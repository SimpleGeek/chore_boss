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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chore Boss'),
        ),
        body: ListView(
          children: [
            Center(
              child: Text(
                'Today\'s Chores',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
          ], // Children
        ),
        floatingActionButton: FloatingActionButton(
          //onPressed: () => setState(() => _count++), TODO: Fill in this action to add new chore
          tooltip: 'New Chore',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
