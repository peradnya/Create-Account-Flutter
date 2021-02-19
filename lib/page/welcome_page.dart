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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: double.infinity,
              color: Colors.blue,
              child: CustomPaint(painter: _CustomCurve()),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'Welcome to\n'),
                    TextSpan(text: 'GIN '),
                    TextSpan(
                      text: 'Finans',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                'Welcome to The Bank of The Future. Manage and track your accounts on the go.',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
            Card(
              elevation: 10,
              margin: EdgeInsets.all(20),
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
                textInputType: TextInputType.emailAddress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.grey.shade100;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.03, size.height * 0.25,
        size.width * 0.13, size.height * 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
