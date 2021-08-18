import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> names = <String>[];

  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {
      names.insert(0, nameController.text);
    });
  }

  int index = 0;

  void removeItemFromList(int index) {
    setState(() {
      names.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Yakoub task 4'),
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add name to list',
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Add'),
            onPressed: () {
              addItemToList();
            },
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: names.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        child: new Column(
                      children: [
                        new Container(
                          child: Center(
                            child: Text(
                              '${names[index]} ',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        new Container(
                            child: ElevatedButton(
                                child: Icon(Icons.delete),
                                onPressed: () {
                                  removeItemFromList(index);
                                }))
                      ],
                    ));
                  }))
        ]));
  }
}
