import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InsertProductsItem extends StatefulWidget {
  Map productList;
  InsertProductsItem({super.key, required this.productList});

  @override
  State<InsertProductsItem> createState() => _InsertProductsItemState();
}

class _InsertProductsItemState extends State<InsertProductsItem> {
  int productsListLength = 1;
  double sum = 0;
  List<Map<String, TextEditingController>> productsControllerList = [];

  @override
  void initState() {
    addProduct();
    super.initState();
  }

  addProduct() {
    TextEditingController newProductCtl = TextEditingController();
    TextEditingController newProductAmountCtl = TextEditingController();

    Map<String, TextEditingController> productinformationController;
    productinformationController = {
      "name": newProductCtl,
      "price": newProductAmountCtl
    };

    productsControllerList.add(
        productinformationController.cast<String, TextEditingController>());

    productsListLength++;

    setState(() {});
  }

  updateProductList(String text) {
    sum = 0;
    widget.productList.clear();

    for (var product in productsControllerList) {
      if (product['price']!.text.isNotEmpty) {
        sum += double.parse(product['price']!.text);
      }

      if (product["name"]!.text.isNotEmpty &&
          product["price"]!.text.isNotEmpty) {
        widget.productList[product["name"]!.text] =
            double.parse(product["price"]!.text);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 10),
      const Text(
        "Insert your product list",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 5),
      SizedBox(
        height: 45 * productsListLength.toDouble() - 40,
        child: ListView.builder(
          itemCount: productsControllerList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: TextFormField(
                      onChanged: updateProductList,
                      controller: productsControllerList[index]["name"],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Write here',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: TextFormField(
                      onChanged: updateProductList,
                      controller: productsControllerList[index]["price"],
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '\$',
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Text("=  ${sum.toString()} \$",
            style: const TextStyle(fontSize: 15)),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
            onPressed: () {
              addProduct();
            },
            child: const Text("+")),
      ),
    ]);
  }
}
