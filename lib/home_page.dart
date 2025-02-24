import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> posts = [];
  Future getProduct() async {
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/ReadProduct');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      final postList = jsonData['data'] as List;
      print(postList.length);
      posts = postList;
      print(postList.length);
    } else {
      print('Failed');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Learn API Integration"),
          elevation: 0.5,
        ),
        body: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final data = posts[index];
              return Card(
                child: ListTile(
                  title: Text(posts[index]['ProductName']), // Product Name
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Product Code: ${data['ProductCode']}"),
                      Text("Quantity: ${posts[index]['Qty']}"),
                      Text("Unit Price: \$${posts[index]['UnitPrice']}"),
                      Text("Total Price: \$${posts[index]['TotalPrice']}"),
                    ],
                  ),
                  // leading: Image.network(
                  //   posts[index]['Img'],
                  //   width: 100,
                  //   height: 100,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              );
            }));
  }
}
