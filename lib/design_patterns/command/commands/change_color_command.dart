import 'package:flutter/material.dart';
import 'dart:math';

import '../command.dart';
import '../shape.dart';

class ChangeColorCommand implements Command {
  ChangeColorCommand(this.shape) : previousColor = shape.color;

  final Color previousColor;
  Shape shape;

  @override
  String getTitle() => 'Change color';
  Random random = new Random();

  @override
  void execute() => shape.color = const Color.fromRGBO(
        255,
        255,
        255,
        1.0,
      );

  @override
  void undo() => shape.color = previousColor;
}
