import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsertProductsItem extends StatefulWidget {
  List<Map<String, dynamic>> productList;
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
        widget.productList.add({
          "name": product["name"]!.text,
          "price": double.parse(product["price"]!.text),
        });
        //[product["name"]!.text] = double.parse(product["price"]!.text)
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 10.h),
      Text(
        "Insert your product list",
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 5.h),
      Row(
        children: [
          SizedBox(
            width: 190.w,
            child: Text(
              "Name",
              style: TextStyle(fontSize: 15.sp, color: Colors.black38),
            ),
          ),
          Text(
            "Prise",
            style: TextStyle(fontSize: 15.sp, color: Colors.black38),
          ),
        ],
      ),
      SizedBox(
        height: 50.h * productsListLength.toDouble() - 50.h,
        child: ListView.builder(
          itemCount: productsControllerList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160.w,
                    height: 45.h,
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
                    width: 160.w,
                    height: 45.h,
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
        child:
            Text("=  ${sum.toString()} \$", style: TextStyle(fontSize: 15.sp)),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
            onPressed: () {
              addProduct();
            },
            child: Text("+ add", style: TextStyle(fontSize: 15.sp))),
      ),
    ]);
  }
}
