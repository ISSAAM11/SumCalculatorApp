import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsertParticipantsItem extends StatefulWidget {
  List<Map<String, dynamic>> participantsList;

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
        widget.participantsList.add({
          "participant": participant["name"]!.text,
          "price": double.parse(participant["price"]!.text)
        });
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Insert participants",
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 5.h),
      Row(
        children: [
          SizedBox(
            width: 190.w,
            child: Text(
              "Name",
              style: TextStyle(fontSize: 15.sp, color: Colors.black38),
            ),
          ),
          Text(
            "Prise",
            style: TextStyle(fontSize: 15.sp, color: Colors.black38),
          ),
        ],
      ),
      SizedBox(
        height: 50.h * participantsListLength.toDouble() - 50.h,
        child: ListView.builder(
          itemCount: particiapntsControllerList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160.w,
                    height: 45.h,
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
                    width: 160.w,
                    height: 45.h,
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
        child:
            Text("=  ${sum.toString()} \$", style: TextStyle(fontSize: 15.sp)),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
            onPressed: () {
              addParticipant();
            },
            child: Text("+ add", style: TextStyle(fontSize: 15.sp))),
      ),
    ]);
  }
}
