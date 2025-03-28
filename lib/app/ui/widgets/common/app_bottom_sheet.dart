import 'package:flutter/material.dart';

class CommonBottomSheet extends StatelessWidget {
  const CommonBottomSheet({super.key, required this.child, this.decoration, this.padding, this.maxHeight});

  final Widget child;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final double? maxHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.5,
        ),
        decoration: decoration,
        width: double.maxFinite,
        padding: padding ?? const EdgeInsets.only(top: 8.0, left: 12.0, right: 12.0, bottom: 12.0),
        child: child);
  }
}
