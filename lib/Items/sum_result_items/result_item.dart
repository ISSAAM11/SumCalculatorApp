import 'package:flutter/material.dart';
import 'package:sum_calculator/colors.dart';

class ResultItem extends StatelessWidget {
  List participantsMap;
  List productsMap;
  ResultItem(
      {super.key, required this.participantsMap, required this.productsMap});
  double sumParticipants = 0;
  double sumProducts = 0;

  @override
  Widget build(BuildContext context) {
    for (var product in productsMap) {
      sumProducts += product['price'];
    }

    for (var participant in participantsMap) {
      sumParticipants += participant['price'];
    }
    return SizedBox(
      height: participantsMap.length * 23 + 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Result',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Flexible(
            child: ListView.builder(
              itemCount: participantsMap.length,
              itemBuilder: (context, index) {
                final participantAmount =
                    (sumParticipants / participantsMap.length -
                        participantsMap[index]['price']);
                return SizedBox(
                  height: 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "${participantsMap[index]['name']} ",
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
                            TextSpan(text: "  =  $sumParticipants \$")
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
