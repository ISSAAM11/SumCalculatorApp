import 'package:flutter/material.dart';
import 'package:sum_calculator/Colors.dart';

class YourParticipantsItem extends StatelessWidget {
  List participantsMap;
  YourParticipantsItem({super.key, required this.participantsMap});

  @override
  Widget build(BuildContext context) {
    double sum = 0;
    for (var participant in participantsMap) {
      sum += participant['price'];
    }
    return SizedBox(
      height: participantsMap.length * 20 + 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your participants list ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
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
          Flexible(
            child: ListView.builder(
              itemCount: participantsMap.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(participantsMap.elementAt(index)["name"]),
                    Text("${participantsMap.elementAt(index)["price"]} \$")
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: Text("=  $sum \$"),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(
                text: "$sum \$ / ${participantsMap.length} participants ",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text:
                        "= ${(sum / participantsMap.length).toStringAsFixed(1)} \$ each one",
                    style: const TextStyle(
                      color: yellowColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
