import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz/controller/controller.dart';
import 'package:quiz/widgets/options.dart';

import '../model/questions.dart';

class WhiteBox extends StatelessWidget {
  const WhiteBox({
    Key? key,
    required this.question,
  }) : super(key: key);
  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionControler controller = Get.put(QuestionControler());

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Container(
      height: height / 1.58,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        //borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              question.question,
              style: const TextStyle(fontSize: 21, height: 1.5),
            ),
            const SizedBox(height: 25),
            ...List.generate(
              question.options.length,
              ((index) => Options(
                    text: question.options[index],
                    index: index,
                    press: () {
                      controller.checkAnswer(question, index);
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
