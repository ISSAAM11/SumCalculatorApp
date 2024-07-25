import 'package:flutter/material.dart';
import 'package:sum_calculator/Colors.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Your participants list ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: const TextSpan(
                    text: "Issam should ",
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      text: "add ",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w800)),
                  TextSpan(text: "8 \$")
                ])),
            RichText(
                text: const TextSpan(
                    text: "12 ",
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      text: "+ 8 ",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w800)),
                  TextSpan(text: "= 20 \$")
                ])),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: const TextSpan(
                    text: "Salim should ",
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      text: "have ",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w800)),
                  TextSpan(text: "8 \$")
                ])),
            RichText(
                text: const TextSpan(
                    text: "28 ",
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      text: "+ 8 ",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w800)),
                  TextSpan(text: "= 20 \$")
                ])),
          ],
        ),
        const SizedBox(height: 25)
      ],
    );
  }
}
