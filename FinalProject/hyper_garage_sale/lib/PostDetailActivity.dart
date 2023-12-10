import 'package:flutter/material.dart';
import 'package:hyper_garage_sale/models/post.dart'; // 导入你的 Post 类
import 'FullScreenImagePage.dart'; // 导入全屏图片页面

class PostDetailActivity extends StatelessWidget {
  final Post post;

  PostDetailActivity({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Title: ${post.title}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Description: ${post.description}'),
          ),
          _buildThumbnailGrid(context, post.imageUrls),
        ],
      ),
    );
  }

  Widget _buildThumbnailGrid(BuildContext context, List<String> imageUrls) {
    print('Image URLs: $imageUrls');
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _onThumbnailTapped(context, imageUrls[index]);
          },
          child: Image.network(
            imageUrls[index], // 使用实际的图片链接
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  void _onThumbnailTapped(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImagePage(imageUrl: imageUrl),
      ),
    );
  }
}
