import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget Function() footerBuilder;

  const CardWidget({
    super.key,
    required this.title,
    required this.body,
    required this.footerBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          body,
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          footerBuilder(),
        ],
      ),
    );
  }
}
