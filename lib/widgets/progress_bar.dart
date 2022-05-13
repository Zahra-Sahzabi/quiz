import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: (BorderRadius.circular(50)),
          border: Border.all(color: const Color(0xFF3F4768), width: 3),
        ),
        child: GetBuilder<QuestionControler>(
          init: QuestionControler(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: ((context, constraints) {
                    return Container(
                      width: constraints.maxWidth * controller.animation.value,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                          borderRadius: BorderRadius.circular(50)),
                    );
                  }),
                ),
                Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                          '${((controller.animation.value) * 30).round()} sec'),
                      const Icon(Icons.timer_outlined)
                  ],
                ),
                    ))
              ],
            );
          },
        ));
  }
}
