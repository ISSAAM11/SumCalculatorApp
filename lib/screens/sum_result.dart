import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sum_calculator/Colors.dart';
import 'package:sum_calculator/Items/sum_result_items/result_item.dart';
import 'package:sum_calculator/Items/sum_result_items/your_participants_item.dart';
import 'package:sum_calculator/Items/sum_result_items/your_products_item.dart';

class SumResult extends StatefulWidget {
  const SumResult({super.key});

  @override
  State<SumResult> createState() => _SumResultState();
}

class _SumResultState extends State<SumResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: yellowColor,
          title: const Text('Result ',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Soup with meat dinner ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              const YourProductsItem(),
              const YourParticipantsItem(),
              const ResultItem(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("Modify")),
                  ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).go('/');
                      },
                      child: const Text("Back"))
                ],
              )
            ],
          ),
        ));
  }
}
