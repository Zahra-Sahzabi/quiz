// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz/model/questions.dart';

class QuestionControler extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  late PageController _pageController;

  bool isAnswered = false;

  int numcorrectAnswers = 0;

  RxInt questionNumber = 1.obs;

  late int selectedAnswer;

  late int thecorrectanswer;

  List<Question> _questions = questions
      .map((question) => Question(
          id: question['id'],
          answer: question['id'],
          question: question['id'],
          options: question['id']))
      .toList();

  @override
  void onInit() {
    super.onInit();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _animation = Tween(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _pageController = PageController();
    _animationController.forward().whenComplete(() => null);
  }

  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }

  void checkAnswer(Question question, int selectedanswer) {
    isAnswered = true;
    selectedAnswer = selectedanswer;
    thecorrectanswer = question.answer;

    if (selectedAnswer == question.answer) numcorrectAnswers++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 1));
  }

  void nextQuestion() {
    if (questionNumber.value != questions.length) {
      isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(() => null);
    } else {
      Get.to(null);
    }
  }

  void updateQuestionNum(int index) {
    questionNumber.value = index++;
  }
}
