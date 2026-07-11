

import 'package:flutter/material.dart';

void navigateFromTop(BuildContext context, Widget navigation) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => navigation,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, -1.0); 
      const end = Offset.zero;        
      const curve = Curves.easeInOut;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(seconds: 1),
  ));
}