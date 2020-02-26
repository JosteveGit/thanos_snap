import 'package:extended_transitions/coupled_transition/coupled_transition.dart';
import 'package:extended_transitions/coupled_transition/coupled_transition_controller.dart';
import 'package:extended_transitions/coupled_transition/transition.dart';
import 'package:flutter/cupertino.dart';

class ThanosSnap extends StatelessWidget {
  final Widget child;
  final Function controllerReturnerForFirst;
  final Function controllerReturnerForSecond;

  ThanosSnap(
      {this.child,
      this.controllerReturnerForFirst(CoupledTransitionController controller),
      this.controllerReturnerForSecond(CoupledTransitionController controller)});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CoupledTransition(
          child: child,
          build: (it) {
            controllerReturnerForFirst(it);
          },
          fadeAnimation: Transition(
              tween: Tween(begin: 1, end: 0),
              duration: Duration(seconds: 1)
          ),
          slideAnimation: Transition(
              tween: Tween(begin: Offset.zero, end: Offset(1, 0)),
              duration: Duration(seconds: 5)
          ),
        ),
        CoupledTransition(
          child: child,
          build: (it) {
            controllerReturnerForSecond(it);
          },
          fadeAnimation: Transition(
              tween: Tween(begin: 1, end: 0),
              duration: Duration(milliseconds: 1100)
          ),
          slideAnimation: Transition(
              tween: Tween(begin: Offset.zero, end: Offset(-1, 0)),
              duration: Duration(seconds: 5)),
        ),
      ],
    );
  }
}
