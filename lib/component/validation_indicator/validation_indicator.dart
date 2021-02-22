import 'package:flutter/material.dart';

/// [ValidationIndicator]
/// Component to create validation indicator.
/// This component use [bool] valid to flag if validation is valid
/// use [String] title to bring title, and [String] subtitle to bring subtitle.
class ValidationIndicator extends StatelessWidget {
  final String title, subtitle;
  final bool valid;

  const ValidationIndicator({
    Key key,
    @required this.valid,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: Column(children: [
        Expanded(
          child: valid
              ? Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ]),
    );
  }
}
