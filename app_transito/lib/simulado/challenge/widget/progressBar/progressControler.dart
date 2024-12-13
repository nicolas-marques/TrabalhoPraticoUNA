import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProgressController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;
  Animation get animation => this._animation;
  final void Function() nextQuestion;
  ProgressController({this.nextQuestion});
  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(minutes: 50), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(nextQuestion1);
    super.onInit();
  }
  reflesh1() {
    _animationController.reset();
  }
  stop1() {
    _animationController.stop();
  }

  void nextQuestion1() {
    _animationController.reset();
    _animationController.forward().whenComplete(nextQuestion1);
    nextQuestion();
  }
}
