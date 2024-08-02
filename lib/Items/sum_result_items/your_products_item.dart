import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourProductsItem extends StatelessWidget {
  List productsMap;
  YourProductsItem({super.key, required this.productsMap});

  @override
  Widget build(BuildContext context) {
    int sum = 0;
    for (var product in productsMap) {
      sum += product['price'] as int;
    }

    return SizedBox(
      height: productsMap.length * 20 + 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Your product list ',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Name", style: TextStyle(color: Colors.black45)),
              Text("Sum", style: TextStyle(color: Colors.black45))
            ],
          ),
          SizedBox(height: 5.h),
          Flexible(
            child: ListView.builder(
              itemCount: productsMap.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(productsMap.elementAt(index)["name"]),
                    Text("${productsMap.elementAt(index)["price"]} \$")
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 5.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text("=  $sum \$"),
          ),
          const Divider()
        ],
      ),
    );
  }
}
