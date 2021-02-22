import 'package:flutter/material.dart';

/// [PageHeader]
/// Component to create page header.
/// use [String] title to bring title to header,
/// and [String] subtitle to bring subtitle to header.
class PageHeader extends StatelessWidget {
  final String title, subtitle;

  const PageHeader({
    Key key,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
