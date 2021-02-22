import 'package:create_account/component/step_icon/step_icon.dart';
import 'package:flutter/material.dart';

/// [StepIndicator]
/// Component to create step indicator.
/// use [int] currentStep to flag the currentStep, and [int] maxStep to flag the maxStep.
class StepIndicator extends StatelessWidget {
  final int currentStep, maxStep;

  const StepIndicator({Key key, this.currentStep, this.maxStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rows = List<Widget>(maxStep + (maxStep - 1));

    for (var i = 0; i < rows.length; i++) {
      var item = ((i ~/ 2) + 1);
      if (i % 2 == 0) {
        rows[i] = StepIcon(text: '$item', isFinished: (item <= currentStep));
      } else {
        rows[i] = Container(
          width: 50,
          height: 100,
          alignment: Alignment.center,
          child: Divider(
            height: 0,
            thickness: 2,
            color: Colors.black,
          ),
        );
      }
    }

    return Container(
      alignment: Alignment.center,
      height: 100,
      child: FittedBox(
        child: Row(children: rows),
      ),
    );
  }
}
