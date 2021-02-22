import 'package:flutter/material.dart';

/// [StepIcon]
/// Component to create step icon.
/// use [bool] isFinished to flag if the step is already finished,
/// and [String] text to give name of step.
class StepIcon extends StatelessWidget {
  final String text;
  final bool isFinished;

  const StepIcon({
    Key key,
    @required this.text,
    @required this.isFinished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        shape: BoxShape.circle,
        color: isFinished ? Colors.green : Colors.white,
      ),
    );
  }
}
