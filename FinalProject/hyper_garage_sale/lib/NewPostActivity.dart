
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class NewPostActivity extends StatefulWidget {
  @override
  _NewPostActivityState createState() => _NewPostActivityState();
}

class _NewPostActivityState extends State<NewPostActivity> {
  // Declare a list to store user-selected images
  List<XFile> selectedImages = [];

  // Method to add images
  Future<void> _addImage() async {
    final picker = ImagePicker();
    
    // Limit the number of images to 4
    if (selectedImages.length < 4) {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        selectedImages.add(pickedFile);
        print('Selected Image Path: ${pickedFile.path}');
        setState(() {});
      }
    } else {
      // Show a message if the user tries to add more than 4 images
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You can only add up to 4 images.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Widget _buildImagePreview() {
    return Column(
      children: [
        for (var image in selectedImages)
          Image.file(
            File(image.path),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _addImage,
            child: Text('Add Image'),
          ),
          _buildImagePreview(),
          // Other input fields and buttons...
        ],
      ),
    );
  }
}