import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sum_calculator/Colors.dart';
import 'package:sum_calculator/boxes/Boxes.dart';
import 'package:sum_calculator/model/sumItem.dart';
import 'package:sum_calculator/screens/add_sum.dart';

class MySumList extends StatefulWidget {
  const MySumList({super.key});

  @override
  State<MySumList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MySumList> {
  final sumBox = Boxes.getSumItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellowColor,
        title: const Text(
          'My Sum application ',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 4.0,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your list',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).go('/AddSum');
                    },
                    child: const Text("Calculate Sum"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 5000,
                child: ValueListenableBuilder<Box<SumItem>>(
                  valueListenable: Boxes.getSumItems().listenable(),
                  builder: (context, box, _) {
                    final sumList = box.values.toList().cast<SumItem>();
                    return ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        return sumListContainer(sumList[index], context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

GestureDetector sumListContainer(SumItem sumItem, BuildContext context) {
  double sumCount = 0;
  for (Map product in sumItem.productsMap) {
    sumCount += product["price"];
  }
  return GestureDetector(
    onTap: () {
      GoRouter.of(context).go('/SumResult', extra: sumItem);
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      width: 1000,
      margin: const EdgeInsets.only(bottom: 15),
      height: 80,
      color: const Color.fromARGB(255, 243, 243, 243),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sumItem.title.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text("${sumCount.toString()} \$",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Members: ${sumItem.participantsMap.length}"),
              const Text("12/05/2024")
            ],
          ),
        ],
      ),
    ),
  );
}
