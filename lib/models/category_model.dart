import 'package:flutter/material.dart';
import 'package:shahayak/main.dart';

void main() {
  runApp(Shahayak());
}

class Post {
  final String title;
  final String type;

  Post({required this.title, required this.type});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donation & Exchange',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostFilterScreen(),
    );
  }
}

class PostFilterScreen extends StatefulWidget {
  const PostFilterScreen({super.key});

  @override
  _PostFilterScreenState createState() => _PostFilterScreenState();
}

class _PostFilterScreenState extends State<PostFilterScreen> {
  String selectedCategory = 'Donation'; // Default category

  // Sample posts
  List<Post> posts = [
    Post(title: 'Donate old clothes', type: 'Donation'),
    Post(title: 'Exchange books', type: 'Exchange'),
    Post(title: 'Donate food', type: 'Donation'),
    Post(title: 'Exchange gadgets', type: 'Exchange'),
    Post(title: 'Donate furniture', type: 'Donation'),
  ];

  // Filter posts based on selected category
  List<Post> getFilteredPosts() {
    return posts.where((post) => post.type == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation & Exchange'),
      ),
      body: Column(
        children: [
          // Buttons to switch between Donation and Exchange
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedCategory = 'Donation';
                  });
                },
                child: Text('Donation'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedCategory = 'Exchange';
                  });
                },
                child: Text('Exchange'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: getFilteredPosts().length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(getFilteredPosts()[index].title),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
