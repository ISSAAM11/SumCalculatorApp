import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sum_calculator/Colors.dart';
import 'package:sum_calculator/screens/add_sum.dart';

class MySumList extends StatefulWidget {
  const MySumList({super.key});

  @override
  State<MySumList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MySumList> {
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
              sumList('Dinner hamburger', '50 \$'),
              sumList("Dinner spaghetti", '70 \$'),
              sumList("Fast food", '120 \$'),
              sumList("Mountain Trip", '240 \$'),
            ],
          ),
        ),
      ),
    );
  }
}

Container sumList(String titleSum, String price) {
  return Container(
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
            Text(titleSum.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(price.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Members: 5"), Text("12/05/2024")],
        ),
      ],
    ),
  );
}
