import 'package:flutter/material.dart';
import 'package:flutter_local_database/product_db_provider.dart';
import 'package:flutter_local_database/product_model.dart';

class DisplayDataDesign extends StatefulWidget {
  const DisplayDataDesign({super.key});

  @override
  State<DisplayDataDesign> createState() => _DisplayDataDesignState();
}

class _DisplayDataDesignState extends State<DisplayDataDesign> {
  ProductDBProvider productDatabaseProvider = ProductDBProvider();
  List<Product> productList = [];

  fetchData() async {
    productList = await productDatabaseProvider.fetchProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database Data"),
        centerTitle: true,
      ),
      body: productList.isEmpty
          ? const Center(
              child: Text("Oops !! No Data Found"),
            )
          : ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(productList[index].productId.toString()),
                  ),
                  title: Text(productList[index].productName),
                  // subtitle: Text(productList[index].productImage),
                  subtitle: (Text(productList[index].productPrice.toString())),
                  trailing: CircleAvatar(
                    child: IconButton(
                      onPressed: () async {
                        bool isDeleted =
                            await productDatabaseProvider.deleteProduct(
                                productId: productList[index].productId);
                        if (isDeleted) {
                          setState(() {});
                          fetchData();
                        } else {
                          print("Can't Delete File");
                        }
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            fetchData();
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
