import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  final String title;
  final dynamic data;

  const BookDetailsPage({
    required this.title,
    required this.data,
  });
  // Key? key})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract author_name and published date from the data
    final List<dynamic> authors = data['author_name'] ?? [];
    final String publishedDate = data['publish_date'] ?? '';
    print(authors);
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Author(s): ${authors.join(", ")}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Published Date: $publishedDate',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
