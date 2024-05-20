import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Define your custom font and text styles here
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'YourCustomFont', // Replace 'YourCustomFont' with your font family
            fontSize: 20, // Increased font size for the heading
            fontWeight: FontWeight.bold,
            color: Colors.blue, // Change the color as needed
          ),
          bodyText2: TextStyle(
            fontFamily: 'YourCustomFont', // Replace 'YourCustomFont' with your font family
            fontSize: 16, // Font size for contact names
            color: Colors.black87, // Custom text color for contact names
          ),
        ),
      ),
      home: SlidableExample(),
    );
  }
}

class SlidableExample extends StatelessWidget {
  final List<String> items = [
    'Ali',
    ' Atif',
    'Sara',
    'Hasan',
    'Mehtab',
    'Arbaz',
    ' Aslam',
    'Wali',
    ' Zakir',
    'Bilal',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slidable Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Contact List',
              style: Theme.of(context).textTheme.headline6, // Apply custom text style
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      items[index],
                      style: Theme.of(context).textTheme.bodyText2, // Apply custom text style
                    ),
                    subtitle: Text('Swipe to delete or archive'),
                  ),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {
                        _showSnackBar(context, 'Deleted ${items[index]}');
                        items.removeAt(index);
                      },
                    ),
                    IconSlideAction(
                      caption: 'Archive',
                      color: Colors.blue,
                      icon: Icons.archive,
                      onTap: () => _showSnackBar(context, 'Archived ${items[index]}'),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
