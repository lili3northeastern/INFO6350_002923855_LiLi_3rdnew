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
          backgroundColor: Colors.blue, // 更改AppBar背景色
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
              backgroundColor: Colors.blueGrey, // 更改NavigationRail背景色
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
              selectedLabelTextStyle: TextStyle(
                color: Colors.yellow, // 更改选中的文本颜色
              ),
              unselectedLabelTextStyle: TextStyle(
                color: Colors.white, // 更改未选中的文本颜色
              ),
            ),
            // Main content area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Hello, Flutter!',
                        style: TextStyle(
                          fontSize: 24, // 更改文本字体大小
                          color: Colors.green, // 更改文本颜色
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle button click
                        print('Button pressed!');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange, // 更改按钮背景色
                      ),
                      child: Text(
                        'Click Me',
                        style: TextStyle(
                          fontSize: 18, // 更改按钮文本字体大小
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
