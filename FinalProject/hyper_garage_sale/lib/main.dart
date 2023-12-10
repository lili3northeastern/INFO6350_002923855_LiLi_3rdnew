import 'package:flutter/material.dart';
import 'BrowsePostsActivity.dart';
import 'database_service.dart'; // Import your DatabaseService
import 'package:firebase_core/firebase_core.dart';
import 'auth_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/post.dart' as myModels;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive
  await Hive.initFlutter();

  // Register the Post adapter
  // Hive.registerAdapter<Post>(PostAdapter());

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAeHx0GSspF6A8JJXa6OZxjs0DwbbcnArA",
      authDomain: "hypergaragesale-5f342.firebaseapp.com",
      projectId: "hypergaragesale-5f342",
      storageBucket: "hypergaragesale-5f342.appspot.com",
      messagingSenderId: "751763699488",
      appId: "1:751763699488:web:b2783e087fff8d0e858945",
      measurementId: "G-CH34EFDVQN",
    ),

    ); // Initialize Firebase
    await DatabaseService().init(); // Initialize the database

    AuthService authService = AuthService(); // Initialize AuthService

    runApp(MyApp());
  }
  





class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BrowsePostsActivity(),
    );
  }
}


class HyperGarageSaleScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('HyperGarageSale'),
        actions: [
          IconButton(
            icon: Icon(Icons.post_add),
            onPressed: () {
              // Add logic to handle the action of posting a new item
              _showSnackBar(context, 'Posting a new item...');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter title of the item'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Enter price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Enter description of the item'),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to post the classified
                _showSnackBar(context, 'New post added!');
              },
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ),
  );
}

}

