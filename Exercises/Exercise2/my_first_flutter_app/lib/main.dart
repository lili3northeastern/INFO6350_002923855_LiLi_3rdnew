import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Flutter App'),
        ),
        body: Row(
          children: [
            // NavigationRail
            NavigationRail(
              selectedIndex: 0,
              onDestinationSelected: (int index) {
                // Handle navigation item selection
                print('Item $index selected');
              },
              labelType: NavigationRailLabelType.selected,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
            ),
            // Main content area
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Hello, Flutter!'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button click
                      print('Button pressed!');
                    },
                    child: Text('Click Me'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
