import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:sum_calculator/Colors.dart';
import 'package:sum_calculator/Items/insert_participants_item.dart';
import 'package:sum_calculator/Items/insert_products_item%20copy.dart';
import 'package:sum_calculator/boxes/Boxes.dart';
import 'package:sum_calculator/model/sumItem.dart';

class AddSum extends StatefulWidget {
  const AddSum({super.key});

  @override
  State<AddSum> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddSum> {
  List<String> sumList = [];
  TextEditingController titleController = TextEditingController();
  Map<String, dynamic> sumItem = {};
  void createSumItem() {
    // final sumItem = SumItem(
    //   title: titleController.text,
    //   productsMap: {
    //     productNameCtl.text: double.parse(priceAmountCtl.text),
    //   },
    //   participantsMap: {participantCtl.text: 10},
    // );
    // final sumItemsList = Boxes.getSumItems();
    // sumItemsList.add(sumItem);
    /* final myList = sumItemsList.values.toList();
    myList.forEach((item) {
      debugPrint('title: ${item.title}, productsMap: ${item.productsMap}');
    });
*/
    //print("sumItemsList.length: " + sumItemsList.length.toString());
  }

  Map<String, double> productList = {};
  Map<String, double> participantsList = {};
  createSum() {
    Map<String, dynamic> sumItem = {
      "title": titleController.text,
      "productList": productList,
      "participantList": participantsList,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: yellowColor,
          title: const Text('Calculate your sum ',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 4.0,
                      offset: Offset(2, 2),
                    )
                  ]))),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('My Sum application ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Divider(),
              const Text('Title: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 40.0,
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: "Write here",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              InsertProductsItem(productList: productList),
              InsertParticipantsItem(participantsList: participantsList),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      createSumItem();
//                    GoRouter.of(context).go('/SumResult');
//                    saveValue(titleController.text);
                    },
                    child: const Text("Calculate Sum")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
