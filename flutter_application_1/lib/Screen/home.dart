import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> books = [];

  Future<void> fetchbooks(String query) async {
    print('fetchbooks called');

    final url = Uri.parse('https://openlibrary.org/search.json?q=test');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // final body = response.body;
      // final json = jsonDecode(body);
      if (data['docs'] != null) {
        setState(() {
          books = List<String>.from(
            data['docs'].map((book) => book['title']).toList(),
          );
        });
      }
    } else {
      print('Error Status code; ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchbooks('test');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book API call'),
      ),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(books[index]),
              ),
            );
          }),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
