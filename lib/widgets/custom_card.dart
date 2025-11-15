import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const CustomCard({
    Key? key,
    required this.child,
    this.elevation = 2.0,
    this.borderRadius = 12.0,
    this.padding,
    this.margin,
    this.onTap,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(8),
      child: Material(
        color: backgroundColor ?? Theme.of(context).cardColor,
        elevation: elevation,
        borderRadius: BorderRadius.circular(borderRadius),
        shadowColor: Colors.black26,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: Colors.blue.withOpacity(0.1),
          child: Container(
            padding: padding ?? EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}