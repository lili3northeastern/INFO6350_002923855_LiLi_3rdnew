
import 'package:flutter/material.dart';
import 'package:hyper_garage_sale/models/post.dart'; // 导入你的 Post 类
import 'NewPostActivity.dart';
import 'PostDetailActivity.dart';
import 'database_service.dart';

class BrowsePostsActivity extends StatefulWidget {
  @override
  _BrowsePostsActivityState createState() => _BrowsePostsActivityState();
}

class _BrowsePostsActivityState extends State<BrowsePostsActivity> {
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse Posts'),
      ),
      body: FutureBuilder<List<Post>>(
        future: _databaseService.getPosts(),
        builder: (context, snapshot) {
        print('Snapshot data: ${snapshot.data}');

  if (snapshot.connectionState == ConnectionState.waiting) {
    print('Connection state: Waiting');
    return CircularProgressIndicator();
  } else if (snapshot.hasError) {
    print('Error: ${snapshot.error}');
    return Text('Error: ${snapshot.error}');
  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
    print('No posts available.');
    return Text('No posts available.');
  } else {
    print('Building list view with data: ${snapshot.data}');
    return _buildListView(snapshot.data!);
  }
},

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPostActivity()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print('Post tapped: ${posts[index]}');
            _onPostSelected(context, posts[index]);
          },
          child: ListTile(
            title: Text(posts[index].title),
            subtitle: Text(posts[index].description),
          ),
        );
      },
    );
  }

  void _onPostSelected(BuildContext context, Post post) {
  print('Navigating to PostDetailActivity with post: $post');
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PostDetailActivity(post: post)),
  );
}

}
