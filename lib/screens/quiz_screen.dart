// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/controller.dart';
import 'package:quiz/widgets/White_box.dart';
import 'package:quiz/widgets/progress_bar.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionControler _controller = Get.put(QuestionControler());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          TextButton(
            onPressed: _controller.nextQuestion,
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ProgressBar(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Row(
              children: [
                Obx(
                  (() => Text.rich(
                        TextSpan(
                            text:
                                'Question ${_controller.questionNumber.value}/',
                            style: TextStyle(fontSize: 24),
                            children: [
                              TextSpan(
                                  text: '${_controller.questionss.length}',
                                  style: TextStyle(color: Colors.orange)),
                            ]),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller.pageController,
              onPageChanged: _controller.updateQuestionNum,
              itemCount: _controller.questionss.length,
              itemBuilder: (context, index) => WhiteBox(
                question: _controller.questionss[index],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
