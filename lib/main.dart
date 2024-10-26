import 'package:flutter/material.dart';
import 'package:navigation/second_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white, // AppBar color
        ),
      ),
      home: const ImageViewerApp(),
    );
  }
}

class ImageViewerApp extends StatefulWidget {
  const ImageViewerApp({super.key});

  @override
  State<ImageViewerApp> createState() => _ImageViewerAppState();
}

class _ImageViewerAppState extends State<ImageViewerApp> {
  Color _containerColor = Colors.white;
  String _displayedImageUrl = 'https://sorer.somaliren.org.so/api/files/00000000-0000-0000-0000-000000000000/just_sorrer/logo.jpeg';

  // color change
  void _changeContainerColor() {
    setState(() {
      _containerColor = _containerColor == Colors.white ? Colors.grey[200]! : Colors.blue;
    });
  }

  void _updateDisplayedImage(String imageUrl) {
    setState(() {
      _displayedImageUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Viewer Application'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Display
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(8.0),
            color: _containerColor,
            child: Image.network(
              _displayedImageUrl,
              width: double.infinity,
              height: 170,
              fit: BoxFit.contain, // Ensures the image fits within the container
            ),
          ),

          // Image Buttons Section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Image Buttons',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                _buildImageButton('https://sorer.somaliren.org.so/api/files/00000000-0000-0000-0000-000000000000/just_sorrer/logo.jpeg'),
                _buildImageButton('https://e7.pngegg.com/pngimages/289/65/png-clipart-call-app-icon-iphone-computer-icons-symbol-call-angle-electronics-thumbnail.png'),
                _buildImageButton('https://banner2.cleanpng.com/20180517/lxe/avcylvvdt.webp'),
                _buildImageButton('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ5o9HX_7KKA9g-WC8xn4rPHdNjBEkLaUpOA&s'),
                _buildImageButton('https://ptes.org/wp-content/uploads/2014/06/rabbit-e1403800396624.jpg'),
                _buildImageButton('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9Z7rnLjAf4t2gbUs7MxYOucHNMharB1yFPw&s'),
              ],
            ),
          ),

          // Large Buttons at the Bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: _changeContainerColor,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text('Change Container Color'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(imageUrl: _displayedImageUrl),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text('Display on Screen 2'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 29), // space at the bottom
        ],
      ),
    );
  }
// update the main url
  Widget _buildImageButton(String imageUrl) {
    return GestureDetector(
      onTap: () => _updateDisplayedImage(imageUrl), // Update the main image URL on tap
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
