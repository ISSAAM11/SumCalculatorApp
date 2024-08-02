import 'package:flutter/material.dart';
import 'package:sum_calculator/colors.dart';

class ResultItem extends StatelessWidget {
  List participantsMap;

  ResultItem({super.key, required this.participantsMap});
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    for (var participant in participantsMap) {
      sum += participant['price'] as int;
    }
    return SizedBox(
      height: participantsMap.length * 20 + 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Your participants list ',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Flexible(
            child: ListView.builder(
              itemCount: participantsMap.length,
              itemBuilder: (context, index) {
                final participantAmount = (sum / participantsMap.length -
                    participantsMap[index]['price']);
                return SizedBox(
                  height: 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "${participantsMap[index]['participant']} ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            const TextSpan(
                                text: "should ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: participantAmount > 0 ? "add " : "get ",
                                style: TextStyle(
                                    color: participantAmount > 0
                                        ? Colors.red
                                        : yellowColor,
                                    fontWeight: FontWeight.w800)),
                            TextSpan(
                              text:
                                  "${participantAmount.abs().toStringAsFixed(1)} \$",
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "${participantsMap[index]['price']}  ",
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                text: participantAmount > 0
                                    ? "+  ${participantAmount.toStringAsFixed(1)}"
                                    : "-  ${participantAmount.abs().toStringAsFixed(1)}",
                                style: TextStyle(
                                    color: participantAmount > 0
                                        ? Colors.red
                                        : yellowColor,
                                    fontWeight: FontWeight.w800)),
                            TextSpan(text: "  =  $sum \$")
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
