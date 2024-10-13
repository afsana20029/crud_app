import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTEController=TextEditingController();
  final TextEditingController _unitpriceTEController=TextEditingController();
  final TextEditingController _totalPriceTEController=TextEditingController();
  final TextEditingController _imageTEController=TextEditingController();
  final TextEditingController _codeTEController=TextEditingController();
  final TextEditingController _quantityTEController=TextEditingController();
  final GlobalKey<FormState>_formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: _buildNewProductName(),
        ),

    );

  }

  Widget _buildNewProductName() {
    return Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
          controller:_productNameTEController ,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: " Name",
                   labelText: "Product Name"

                ),
              ),
              SizedBox(height: 12,),
              TextFormField(
                controller: _unitpriceTEController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: "Unit price",
                  labelText: "unit price"

              ),),
              SizedBox(height: 12,),
              TextFormField(
                controller: _totalPriceTEController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: "Total price",
                  labelText: "Total price"

              ),), SizedBox(height: 12,),
              TextFormField(
                controller: _codeTEController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: "Product code",
                  labelText: "Product code"

              ),), SizedBox(height: 12,), SizedBox(height: 12,),
              TextFormField(
                controller: _imageTEController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: "Product Image",
                  labelText: "Product Image"

              ),), SizedBox(height: 12,), SizedBox(height: 12,),
              TextFormField(
                controller: _quantityTEController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: "Quntity",
                  labelText: "Quntity"

              ),), SizedBox(height: 12,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                 minimumSize: Size(double.infinity,60),

                  ),
                  onPressed: (){}, child:Text("Add product"))
            ],
          ),
        );
  }
  void onTapAddProductButton(){

  }
  @override
  void dispose() {
    _quantityTEController.dispose();
    _imageTEController.dispose();
    _codeTEController.dispose();
    _totalPriceTEController.dispose();
    _unitpriceTEController.dispose();
    _productNameTEController.dispose();
    super.dispose();
  }
}
