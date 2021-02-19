import 'package:create_account/component/validation_indicator/validation_indicator.dart';
import 'package:flutter/material.dart';

class CreatePasswordPage extends StatefulWidget {
  final GlobalKey<FormState> createPasswordForm;
  final TextEditingController passwordTextController;

  const CreatePasswordPage({
    Key key,
    @required this.createPasswordForm,
    @required this.passwordTextController,
  }) : super(key: key);

  @override
  CreatePasswordPageState createState() => CreatePasswordPageState();
}

class CreatePasswordPageState extends State<CreatePasswordPage> {
  bool _hidePassword, _lowercase, _uppercase, _number, _length9;
  int _length;

  @override
  void initState() {
    _hidePassword = true;
    _length = widget.passwordTextController.text.length;
    _lowercase = widget.passwordTextController.text.contains(RegExp(r'[a-z]'));
    _uppercase = widget.passwordTextController.text.contains(RegExp(r'[A-Z]'));
    _number = widget.passwordTextController.text.contains(RegExp(r'[0-9]'));
    _length9 = widget.passwordTextController.text.length >= 9;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String complexity = '';
    Color colorComplexity = Colors.red;

    int complexityValue = 0;
    complexityValue = complexityValue + (_length > 0 ? 1 : 0);
    complexityValue = complexityValue + (_lowercase ? 1 : 0);
    complexityValue = complexityValue + (_uppercase ? 1 : 0);
    complexityValue = complexityValue + (_number ? 1 : 0);
    complexityValue = complexityValue + (_length9 ? 1 : 0);

    switch (complexityValue) {
      case 0:
        complexity = '';
        colorComplexity = Colors.red;
        break;
      case 1:
        complexity = 'Very weak';
        colorComplexity = Colors.red;
        break;
      case 2:
        complexity = 'Weak';
        colorComplexity = Colors.orange;
        break;
      case 3:
        complexity = 'Medium';
        colorComplexity = Colors.yellow;
        break;
      case 4:
        complexity = 'Strong';
        colorComplexity = Colors.lightGreen;
        break;
      case 5:
        complexity = 'Very strong';
        colorComplexity = Colors.lightGreen;
        break;
    }

    return Form(
      key: widget.createPasswordForm,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Password',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
            Text(
              'Password will be used to login to account',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white),
            ),
            Container(height: 20),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Create Password',
                suffixIcon: IconButton(
                  icon: Icon(
                      _hidePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePassword = !_hidePassword;
                    });
                  },
                ),
              ),
              controller: widget.passwordTextController,
              validator: (value) {
                if (value.isEmpty ||
                    !value.contains(RegExp(r'[a-z]')) ||
                    !value.contains(RegExp(r'[A-Z]')) ||
                    !value.contains(RegExp(r'[0-9]')) ||
                    value.length < 9) {
                  return 'Password complexity must be very strong.';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _lowercase = value.contains(RegExp(r'[a-z]'));
                  _uppercase = value.contains(RegExp(r'[A-Z]'));
                  _number = value.contains(RegExp(r'[0-9]'));
                  _length9 = value.length >= 9;
                  _length = value.length;
                });
              },
              obscureText: _hidePassword,
            ),
            Container(height: 20),
            RichText(
              text: TextSpan(
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: 'Complexity: '),
                  TextSpan(
                    text: complexity,
                    style: TextStyle(
                      color: colorComplexity,
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ValidationIndicator(
                    valid: _lowercase, title: 'a', subtitle: 'LowerCase'),
                ValidationIndicator(
                    valid: _uppercase, title: 'A', subtitle: 'UpperCase'),
                ValidationIndicator(
                    valid: _number, title: '123', subtitle: 'Number'),
                ValidationIndicator(
                    valid: _length9, title: '9+', subtitle: 'Characters'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
