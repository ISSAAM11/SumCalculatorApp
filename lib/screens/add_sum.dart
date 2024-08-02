import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
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
  TextEditingController titleController = TextEditingController();
  List<Map<String, dynamic>> productList = [];
  List<Map<String, dynamic>> participantsList = [];
  String textError = "";
  late SumItem sumItem;
  void createSumItem() {
    if (titleController.text.isEmpty) {
      textError = "You must add a title";
      setState(() {});
      return;
    }
    sumItem = SumItem(
      title: titleController.text,
      productsMap: productList,
      participantsMap: participantsList,
    );
    final sumBox = Boxes.getSumItems();
    sumBox.add(sumItem);
    GoRouter.of(context).go('/SumResult', extra: sumItem);
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
                height: 45.0,
                child: TextFormField(
                  controller: titleController,
                  onChanged: (value) => {
                    setState(() {
                      textError = "";
                    })
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write here',
                  ),
                ),
              ),
              InsertProductsItem(productList: productList),
              InsertParticipantsItem(participantsList: participantsList),
              Align(
                alignment: Alignment.center,
                child: Text(textError,
                    style: const TextStyle(fontSize: 15, color: Colors.red)),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      createSumItem();
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
