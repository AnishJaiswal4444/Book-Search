// import 'dart:convert';
// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MaterialApp(
//     home: HomeScreen(),
//   ));
// }

// class BookDetailsPage extends StatelessWidget {
//   final String title;
//   final dynamic data;

//   const BookDetailsPage({
//     required this.title,
//     required this.data,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Extract author_name and published date from the data
//     final List<dynamic> authors = data['author_name'] ?? [];
//     final int publishedDate = int.tryParse(data['publish_date'] ?? '') ?? 0;
//     // final String publishedDate = data['publish_date'] ?? '';
//     print(authors);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Author(s): ${authors.join(", ")}',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Published Date: $publishedDate',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// final dataSet = [];

// class _HomeScreenState extends State<HomeScreen> {
//   List<dynamic> booksAuthor = [];
//   List<dynamic> books = [];
//   Future<void> fetchbooks(String query) async {
//     print('fetchbooks called');

//     final url = Uri.parse('https://openlibrary.org/search.json?q=test');
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       if (data['docs'] != null) {
//         setState(() {
//           books = List<String>.from(
//             data['docs'].map((book) => book['title']),
//           );
//         });
//       }
//     } else {
//       print('Error Status code: ${response.statusCode}');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchbooks('test');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Your Book'),
//       ),
//       body: ListView.builder(
//         itemCount: books.length,
//         itemBuilder: (context, index) {
//           final bookDetails = books[index];
//           final bookTitle = bookDetails['title'];
//           final coverId = bookDetails['cover_i'];

//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BookDetailsPage(
//                     title: bookTitle,
//                     data: books[index],
//                   ),
//                 ),
//               );
//             },
//             child: Card(
//               elevation: 5,
//               margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: ListTile(
//                 leading: Image.network(
//                   'https://covers.openlibrary.org/b/id/$coverId-L.jpg',
//                   width: 60,
//                   height: 80,
//                   fit: BoxFit.cover,
//                 ),
//                 title: Text(
//                   books[index],
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// To resolve the error, you need to modify the code where you assign the books list.
// Instead of assigning a List<String>, assign a List<dynamic> to accommodate the
// entire book details as a Map<String, dynamic>
// In the updated code, the books list is modified to hold the entire book details
// as a Map<String, dynamic>. Then, the bookTitle and coverId are extracted from the book details.

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class BookDetailsPage extends StatelessWidget {
  final String title;
  final dynamic data;

  const BookDetailsPage({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> authors = List<String>.from(data['author_name'] ?? []);
    final int publishedDate = int.tryParse(data['publish_date'][0] ?? '') ?? 0;
    final condition = data['cover_i'];
    final String thumbnailUrl =
        'https://covers.openlibrary.org/b/id/${data['cover_i']}-L.jpg';

    final List<String> languages = List<String>.from(data['language'] ?? []);
    final List<String> subjects = List<String>.from(data['subject'] ?? []);
    final backgroundColor = Color.fromARGB(255, 32, 223, 207).withOpacity(0.8);
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
        backgroundColor: backgroundColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.green,
              Colors.orange,
            ], // Specify the colors for the gradient
            begin: Alignment
                .topLeft, // Specify the starting position of the gradient
            end: Alignment
                .bottomRight, // Specify the ending position of the gradient
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Center(
            child: Container(
              width: 700,
              // height: 100,
              child: Card(
                elevation: 5,
                // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.green,
                        Colors.orange,
                      ], // Specify the colors for the gradient
                      begin: Alignment
                          .bottomRight, // Specify the starting position of the gradient
                      end: Alignment
                          .topLeft, // Specify the ending position of the gradient
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 14, 14, 14),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Author(s): ${authors.join(", ")}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Languages: ${languages.join(", ")}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Subjects: ${subjects.join(", ")}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Published Date: $publishedDate',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color.fromARGB(255, 0, 0, 0),
                              width: 2,
                            )),
                            child: FadeInImage.assetNetwork(
                              placeholder: thumbnailUrl,
                              image: thumbnailUrl,
                              width: 380,
                              height: 420,
                              fit: BoxFit.fill,
                              fadeInDuration: Duration(milliseconds: 200),
                              fadeOutDuration: Duration(milliseconds: 100),
                              // Optional error image
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final dataSet = [];

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> books = [];
  List<dynamic> allBooks = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> fetchbooks(String query) async {
    final url = Uri.parse('https://openlibrary.org/search.json?q=test');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['docs'] != null) {
        setState(() {
          allBooks = List<Map<String, dynamic>>.from(
            data['docs'].map((book) => book),
          );
          books = allBooks;
        });
      }
    } else {
      print('Error Status code: ${response.statusCode}');
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
        title: Text('Search Your Book'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {
        //       _searchBooks(_searchController.text);
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Enter book title',
                    ),
                    // onChanged: (value) {
                    //   _searchBooks(value);
                    // },
                    onSubmitted: (value) {
                      _searchBooks(value);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchBooks(_searchController.text);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final bookDetails = books[index];
                final bookTitle = bookDetails['title'];
                final coverId = bookDetails['cover_i'];

                return Dismissible(
                  key: Key(bookTitle),
                  onDismissed: (direction) {
                    // Remove the book from the list and refresh the screen
                    setState(() {
                      books.removeAt(index);
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailsPage(
                            title: bookTitle,
                            data: bookDetails,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue,
                              const Color.fromARGB(255, 195, 126, 207),
                              const Color.fromARGB(255, 219, 90, 133),
                            ], // Specify the colors for the gradient
                            begin: Alignment
                                .bottomRight, // Specify the starting position of the gradient
                            end: Alignment
                                .topLeft, // Specify the ending position of the gradient
                          ),
                        ),
                        child: ListTile(
                          leading: Image.network(
                            'https://covers.openlibrary.org/b/id/$coverId-L.jpg',
                            width: 60,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            bookTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Delete the book from the list and refresh the screen
                              // In the updated code, a Dismissible widget is wrapped around each title card to enable swipe-to-dismiss functionality. The onDismissed callback is triggered when the delete button is swiped and removed from the list. Additionally, an IconButton is added as the trailing property of the ListTile to provide a delete button, which can also be used to delete the book.
                              //When the book is deleted, the books list is updated by removing the corresponding item using books.
                              //removeAt(index), and the screen is refreshed by calling setState() to reflect the changes.
                              setState(() {
                                books.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _resetSearch();
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }

  // void _searchBooks(String query) {
  //   if (query.isNotEmpty) {
  //     fetchbooks(query);
  //   }
  // }
  // void _searchBooks(String query) {
  //   final List<dynamic> matchingBooks = books
  //       .where((book) =>
  //           book['title']
  //               .toString()
  //               .toLowerCase()
  //               .contains(query.toLowerCase()) &&
  //           query.isNotEmpty)
  //       .toList();

  //   setState(() {
  //     books = matchingBooks;
  //   });
  // }

  void _searchBooks(String query) {
    if (query.isNotEmpty) {
      setState(() {
        books = allBooks
            .where((book) =>
                book['title']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) &&
                query.isNotEmpty)
            .toList();
      });
    } else {
      setState(() {
        books = allBooks;
      });
    }
  }

  void _resetSearch() {
    setState(() {
      _searchController.text = '';
      books = allBooks;
    });
  }
}
