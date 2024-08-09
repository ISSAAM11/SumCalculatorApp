import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sum_calculator/Colors.dart';
import 'package:sum_calculator/Items/sum_result_items/result_item.dart';
import 'package:sum_calculator/Items/sum_result_items/your_participants_item.dart';
import 'package:sum_calculator/Items/sum_result_items/your_products_item.dart';
import 'package:sum_calculator/model/sumItem.dart';

class SumResult extends StatefulWidget {
  final SumItem sumItem;

  const SumResult({super.key, required this.sumItem});

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
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.sumItem.title.toString(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            SizedBox(height: 10.h),
            YourProductsItem(productsMap: widget.sumItem.productsMap),
            YourParticipantsItem(
                participantsMap: widget.sumItem.participantsMap),
            ResultItem(
                participantsMap: widget.sumItem.participantsMap,
                productsMap: widget.sumItem.productsMap),
            // git khalil commit
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //ElevatedButton(onPressed: () {}, child: const Text("Modify")),
                ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).go('/');
                    },
                    child: const Text("Back"))
              ],
            )
          ],
        ),
      )),
    );
  }
}
