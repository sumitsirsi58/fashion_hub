import 'package:flutter/material.dart';


//TextFilled Widget
class CustomTextFiled extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscured;

  CustomTextFiled({
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.obscured,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          cursorColor: Colors.black54,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscured,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );

  }
}

//Container Widget
class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;

  CustomContainer({
    required this.width,
    required this.height,
    required this.color,
    required this.child,
    this.padding = const EdgeInsets.all(8.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}

