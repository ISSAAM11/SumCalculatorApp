import 'package:flutter/material.dart';
import 'package:sum_calculator/Colors.dart';

class YourParticipantsItem extends StatelessWidget {
  const YourParticipantsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Your participants list ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Name", style: TextStyle(color: Colors.black45)),
            Text("Sum", style: TextStyle(color: Colors.black45))
          ],
        ),
        const SizedBox(height: 5),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Meat 0.5 Kg"), Text("22 \$")],
        ),
        const SizedBox(height: 5),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Legume"), Text("18 \$")],
        ),
        const SizedBox(height: 5),
        const Align(
          alignment: Alignment.centerRight,
          child: Text("=  40 \$"),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: RichText(
            text: const TextSpan(
                text: "40 / 2 ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: "= 20 \$ each one ",
                    style: TextStyle(
                      color: yellowColor,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ]),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
