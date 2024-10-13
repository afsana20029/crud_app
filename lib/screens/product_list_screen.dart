import 'dart:convert';

import 'package:crud_app/screens/add_new_product_screen.dart';
import 'package:crud_app/widget/product_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _inProgress = false;
  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                getProductList();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: _inProgress
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: productList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 4,
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapButton,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTapButton() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AddNewProductScreen()));
  }

  Future<void> getProductList() async {
    productList.clear();
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse('http://152.42.163.176:2008/api/v1/ReadProduct');
    Response response = await get(uri);
    print(response);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse["data"]) {
        Product product = Product(
          id: item['_id'],
          productName: item['ProductName'],
          productCode: item['ProductCode'],
          productImage: item['Img'],
          unitPrice: item['UnitPrice'],
          quantity: item['Qty'] ?? '',
          totalPrice: item['TotalPrice'],
          createdAt: item['CreatedDate'],
        );
        productList.add(product);
      }
    }
    _inProgress = false;
    setState(() {});
  }
}
