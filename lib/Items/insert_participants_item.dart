import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InsertParticipantsItem extends StatefulWidget {
  Map participantsList;

  InsertParticipantsItem({super.key, required this.participantsList});

  @override
  State<InsertParticipantsItem> createState() => _InsertParticipantsItemState();
}

class _InsertParticipantsItemState extends State<InsertParticipantsItem> {
  int participantsListLength = 1;
  List<Map<String, TextEditingController>> particiapntsControllerList = [];

  @override
  void initState() {
    addParticipant();
    super.initState();
  }

  addParticipant() {
    TextEditingController newParticipantCtl = TextEditingController();
    TextEditingController newParticipantAmountCtl = TextEditingController();

    Map<String, TextEditingController> participantInformationController;
    participantInformationController = {
      "name": newParticipantCtl,
      "price": newParticipantAmountCtl
    };

    particiapntsControllerList.add(
        participantInformationController.cast<String, TextEditingController>());

    participantsListLength++;

    setState(() {});
  }

  double sum = 0;
/*  calculateSum(String text) {
    sum = 0;
    for (var participant in particiapntsControllerList) {
      if (participant['price']!.text.isNotEmpty) {
        sum += double.parse(participant['price']!.text);
      }
    }
    setState(() {});
  }*/

  updateParticipantsList(String text) {
    sum = 0;
    widget.participantsList.clear();
    for (var participant in particiapntsControllerList) {
      if (participant['price']!.text.isNotEmpty) {
        sum += double.parse(participant['price']!.text);
      }

      if (participant["name"]!.text.isNotEmpty &&
          participant["price"]!.text.isNotEmpty) {
        widget.participantsList[participant["name"]!.text] =
            double.parse(participant["price"]!.text);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Insert participants",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 5),
      const Row(
        children: [
          SizedBox(
            width: 270,
            child: Text(
              "Name",
              style: TextStyle(fontSize: 15, color: Colors.black38),
            ),
          ),
          Text(
            "Prise",
            style: TextStyle(fontSize: 15, color: Colors.black38),
          ),
        ],
      ),
      const SizedBox(height: 5),
      SizedBox(
        height: 45 * participantsListLength.toDouble() - 40,
        child: ListView.builder(
          itemCount: particiapntsControllerList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: TextFormField(
                      onChanged: updateParticipantsList,
                      controller: particiapntsControllerList[index]["name"],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Write here',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: TextFormField(
                      onChanged: updateParticipantsList,
                      controller: particiapntsControllerList[index]["price"],
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '\$',
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Text("=  ${sum.toString()} \$",
            style: const TextStyle(fontSize: 15)),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
            onPressed: () {
              addParticipant();
            },
            child: const Text("+")),
      ),
    ]);
  }
}
