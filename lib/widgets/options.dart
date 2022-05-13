// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/controller.dart';

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionControler>(
        init: QuestionControler(),
        builder: (qnController) {
          Color color() {
            if (qnController.isAnswered) {
              if (index == qnController.thecorrectanswer) {
                return Colors.green;
              }
              if (index == qnController.selectedAnswer &&
                  qnController.selectedAnswer !=
                      qnController.thecorrectanswer) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }

          IconData properIcon() {
            return color == Colors.red ? Icons.close : Icons.check;
          }

          return InkWell(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border.all(color: color()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${index + 1}. $text'),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color:
                          color() == Colors.grey ? Colors.transparent : color(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: color()),
                    ),
                    child: color() == Colors.grey
                        ? null
                        : Icon(properIcon(), size: 16),
                  )
                ],
              ),
            ),
          );
        });
  }
}
