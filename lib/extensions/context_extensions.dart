import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void push(Widget nextPage) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => nextPage,
      ),
    );
  }

  void pop() {
    Navigator.pop(this);
  }

  void pushReplacement(Widget nextPage) {
    Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => nextPage));
  }
}
