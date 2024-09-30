import 'package:flutter/material.dart';

class ClipTopCorners extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    const double radius = 30;

    // Start from the bottom-left corner
    path.moveTo(0, size.height);

    // Draw a straight line to the bottom-right corner
    path.lineTo(size.width, size.height);

    // Draw a straight line to the top-right corner minus the radius
    path.lineTo(size.width, radius);

    // Draw a quadratic bezier curve to clip the top-right corner
    path.quadraticBezierTo(
      size.width, // Control point x
      0, // Control point y
      size.width - radius, // End point x
      0, // End point y
    );

    // Draw a straight line along the top to the left side
    path.lineTo(radius, 0);

    // Draw a quadratic bezier curve to clip the top-left corner
    path.quadraticBezierTo(
      0, // Control point x
      0, // Control point y
      0, // End point x
      radius, // End point y
    );

    // Draw a straight line down to the bottom-left corner
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
