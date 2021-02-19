import 'package:create_account/component/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final GlobalKey<FormState> welcomeForm;
  final TextEditingController emailTextController;

  const WelcomePage({
    Key key,
    @required this.welcomeForm,
    @required this.emailTextController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    return Form(
      key: welcomeForm,
      child: Container(
        width: double.infinity,
        color: Colors.grey.shade100,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                children: [TextSpan(text: 'Welcome to')],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: 'GIN '),
                  TextSpan(
                      text: 'Finans', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            Container(height: 20),
            Text(
              'Welcome to The Bank of The Future. Manage and track your accounts on the go.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Container(height: 20),
            Card(
              elevation: 10,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: CustomTextField(
                color: Colors.grey.shade100,
                controller: emailTextController,
                hint: 'Email',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email must not empty';
                  } else if (!emailRegex.hasMatch(value)) {
                    return 'Email format invalid';
                  }
                  return null;
                },
                head: Icon(Icons.email_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
