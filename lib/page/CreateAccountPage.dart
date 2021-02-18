import 'package:create_account/component/step_indicator/StepIndicator.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}

class CreateAccountPageState extends State<CreateAccountPage> {
  int _steps;

  @override
  void initState() {
    _steps = 1;
    super.initState();
  }

  Widget buildWelcomeStep() {
    return Container();
  }

  Widget buildCreatePasswordStep() {
    return Container();
  }

  Widget buildPersonalInfoStep() {
    return Container();
  }

  Widget buildScheduleVideoCallStep() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _steps == 0
          ? null
          : AppBar(
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              title: Text('Create Account'),
            ),
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            StepIndicator(
              currentStep: 3,
              maxStep: 4,
            )
          ],
        ),
      ),
    );
  }
}
