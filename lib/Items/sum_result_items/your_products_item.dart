import 'package:flutter/material.dart';

class YourProductsItem extends StatelessWidget {
  const YourProductsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your product list ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Name", style: TextStyle(color: Colors.black45)),
            Text("Sum", style: TextStyle(color: Colors.black45))
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Meat 0.5 Kg"), Text("22 \$")],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Legume"), Text("18 \$")],
        ),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: Text("=  40 \$"),
        ),
        SizedBox(height: 5),
        Divider()
      ],
    );
  }
}
