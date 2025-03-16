import 'package:flutter/material.dart';
import 'package:kuistpm/model/newsmodel.dart';

class DetailPage extends StatefulWidget {
  final NewsModel news;

  const DetailPage({super.key, required this.news});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late int likes;
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    likes = widget.news.likes;
    isLiked = false;
  }

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        likes--;
      } else {
        likes++;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.news.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.news.image, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(
              widget.news.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(widget.news.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: _toggleLike,
                ),
                Text('$likes Likes', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
