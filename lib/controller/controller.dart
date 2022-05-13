// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz/model/questions.dart';

class QuestionControler extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  bool isAnswered = false;

  int numcorrectAnswers = 0;

  RxInt questionNumber = 1.obs;

  late int selectedAnswer;

  late int thecorrectanswer;

  List<Question> _questions = questions
      .map((question) => Question(
          id: question['id'],
          answer: question['answer_index'],
          question: question['question'],
          options: question['options']))
      .toList();
  List get questionss => _questions;

  @override
  void onInit() {
    super.onInit();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 30));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });
    _pageController = PageController();
    _animationController.forward().whenComplete(() => nextQuestion());
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

    Future.delayed(Duration(seconds: 2), () => nextQuestion());
  }

  void nextQuestion() {
    if (questionNumber.value != questions.length) {
      isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(() => nextQuestion());
    } else {
      Get.to(null);
    }
  }

  void updateQuestionNum(int index) {
    questionNumber.value = index++;
  }
}
