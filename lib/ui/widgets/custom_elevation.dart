import 'package:flutter/material.dart';

class CustomElevation extends StatelessWidget {
  final Widget child;

  const CustomElevation({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
