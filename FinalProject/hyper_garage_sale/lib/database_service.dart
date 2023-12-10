import 'package:hive/hive.dart';
import 'models/post.dart' as myModels;

class DatabaseService {
  late Box<myModels.Post> _postBox = Hive.box<myModels.Post>('posts');

  Future<void> init() async {
    print('Initializing database service...');
    await Hive.openBox<myModels.Post>('posts');
    _postBox = Hive.box<myModels.Post>('posts');

    print('Database initialized.');

    // 添加示例数据
    if (_postBox.isEmpty) {
      print('Adding sample data to the database...');
      await _postBox.addAll([
        myModels.Post(
          title: 'Sample Post 1',
          description: 'This is the first sample post.',
          imageUrls: [
            'https://www.ikea.com/us/en/p/jaettelik-soft-toy-dinosaur-dinosaur-brontosaurus-10471207/',
            'https://www.moosetoys.com/our-toys/bluey/bluey-s9-bluey-friends-plush/',
          ],
        ),
        myModels.Post(
          title: 'Sample Post 2',
          description: 'This is the second sample post.',
          imageUrls: [
            'https://example.com/image3.jpg',
          ],
        ),
        // ... add more posts
      ]);
    }
    print('Database initialization complete.');
  }

  Future<void> addPost(myModels.Post post) async {
    // 确保 _postBox 已经被初始化
    print('Adding post to the database: $post');
    if (!_postBox.isOpen) {
      await init();
    }

    await _postBox.add(post);
  }

  Future<List<myModels.Post>> getPosts() async {
    // Ensure _postBox has been initialized
    print('Retrieving posts from the database...');
    if (!_postBox.isOpen) {
      await init();
    }


    List<myModels.Post> posts = _postBox.values.toList();
    print('Retrieved posts from database: $posts');
    return posts;


    //return _postBox.values.toList();
  }
}
