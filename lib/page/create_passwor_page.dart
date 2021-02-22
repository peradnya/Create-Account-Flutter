import 'package:create_account/component/complexity_indicator/complexity_indicator.dart';
import 'package:create_account/component/custom_text_field/custom_text_field.dart';
import 'package:create_account/component/page_header/page_header.dart';
import 'package:create_account/component/validation_indicator/validation_indicator.dart';
import 'package:flutter/material.dart';

/// [CreatePasswordPage]
/// This class is used to create Create Password Page that will be consumed by [CreateAccountPage].
/// This clasas need [GlobalKey<FormState>] to detect state of current form,
/// and [TextEditingController] to save the password value.
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

/// [CreatePasswordPageState]
/// This class is used to save state of [CreatePasswordPage]
class CreatePasswordPageState extends State<CreatePasswordPage> {
  bool _hidePassword, _lowercase, _uppercase, _number, _length9;
  int _length;
  ComplexityState _complexity;

  static ComplexityState _checkComplexity({
    bool lowercase,
    bool uppercase,
    bool number,
    bool length9,
    int length,
  }) {
    int complexityValue = 0;

    complexityValue = complexityValue + (length > 0 ? 1 : 0);
    complexityValue = complexityValue + (lowercase ? 1 : 0);
    complexityValue = complexityValue + (uppercase ? 1 : 0);
    complexityValue = complexityValue + (number ? 1 : 0);
    complexityValue = complexityValue + (length9 ? 1 : 0);

    switch (complexityValue) {
      case 0:
        return ComplexityState.EMPTY;
      case 1:
        return ComplexityState.VERY_WEAK;
      case 2:
        return ComplexityState.WEAK;
      case 3:
        return ComplexityState.MEDIUM;
      case 4:
        return ComplexityState.STRONG;
      case 5:
        return ComplexityState.VERY_STRONG;
      default:
        return ComplexityState.EMPTY;
    }
  }

  @override
  void initState() {
    _hidePassword = true;
    _length = widget.passwordTextController.text.length;
    _lowercase = widget.passwordTextController.text.contains(RegExp(r'[a-z]'));
    _uppercase = widget.passwordTextController.text.contains(RegExp(r'[A-Z]'));
    _number = widget.passwordTextController.text.contains(RegExp(r'[0-9]'));
    _length9 = widget.passwordTextController.text.length >= 9;

    _complexity = _checkComplexity(
      length: _length,
      lowercase: _lowercase,
      uppercase: _uppercase,
      number: _number,
      length9: _length9,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.createPasswordForm,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: 'Create Password',
              subtitle: 'Password will be used to login to account',
            ),
            CustomTextField(
              password: _hidePassword,
              controller: widget.passwordTextController,
              hint: 'Create Password',
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

                  _complexity = _checkComplexity(
                    length: _length,
                    lowercase: _lowercase,
                    uppercase: _uppercase,
                    number: _number,
                    length9: _length9,
                  );
                });
              },
              tail: IconButton(
                icon: Icon(
                    _hidePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() {
                  _hidePassword = !_hidePassword;
                }),
              ),
            ),
            ComplexityIndicator(complexity: _complexity),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ValidationIndicator(
                  valid: _lowercase,
                  title: 'a',
                  subtitle: 'LowerCase',
                ),
                ValidationIndicator(
                  valid: _uppercase,
                  title: 'A',
                  subtitle: 'UpperCase',
                ),
                ValidationIndicator(
                  valid: _number,
                  title: '123',
                  subtitle: 'Number',
                ),
                ValidationIndicator(
                  valid: _length9,
                  title: '9+',
                  subtitle: 'Characters',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
