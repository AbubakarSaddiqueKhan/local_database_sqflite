import 'package:flutter/material.dart';
import 'package:flutter_local_database/display_data.dart';
import 'package:flutter_local_database/product_db_provider.dart';
import 'package:flutter_local_database/product_model.dart';

class InsertProductDesign extends StatefulWidget {
  const InsertProductDesign({super.key});

  @override
  State<InsertProductDesign> createState() => _InsertProductDesignState();
}

class _InsertProductDesignState extends State<InsertProductDesign> {
  @override
  Widget build(BuildContext context) {
    ProductDBProvider productDatabaseProvider = ProductDBProvider();
    final formKey = GlobalKey<FormState>();
    String errorMessage = "";
    TextEditingController productIdController = TextEditingController();
    TextEditingController productNameController = TextEditingController();
    TextEditingController productImageController = TextEditingController();
    TextEditingController productPriceController = TextEditingController();

    void addProductToDataBase() {
      formKey.currentState!.validate();
      productDatabaseProvider.insertProduct(
          product: Product(
              productId: int.parse(productIdController.text),
              productName: productNameController.text,
              productImage: productImageController.text,
              productPrice: double.parse(productPriceController.text)));

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Data Inserted Successfully")));
    }

    @override
    void initState() {
      super.initState();
      productIdController = TextEditingController();
      productNameController = TextEditingController();
      productImageController = TextEditingController();
      productPriceController = TextEditingController();
    }

    @override
    void dispose() {
      productIdController.dispose();
      productNameController.dispose();
      productImageController.dispose();
      productPriceController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Product Page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return DisplayDataDesign();
                  },
                ));
              },
              icon: Icon(Icons.dataset_outlined))
        ],
      ),
      body: Center(
          child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //   Product Id text field
            TextFormField(
              controller: productIdController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Product Id"),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required Fields";
                } else {
                  return null;
                }
              },
            ),
            //   Product Name text field
            TextFormField(
              controller: productNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Product Name"),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required Fields";
                } else {
                  return null;
                }
              },
            ),
            //   Product Image path text field
            TextFormField(
              controller: productImageController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Product Image"),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required Fields";
                } else {
                  return null;
                }
              },
            ),
            //   Product Price text field
            TextFormField(
              controller: productPriceController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Product Price"),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required Fields";
                } else {
                  return null;
                }
              },
            ),
            TextButton.icon(
                onPressed: () {
                  addProductToDataBase();
                },
                icon: Icon(Icons.add),
                label: Text("Add Product"))
          ],
        ),
      )),
    );
  }
}
