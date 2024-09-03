import 'dart:math';
import 'package:flutter/material.dart';

import '../../memento/imemento.dart';
import '../../originator.dart';
import '../icommand.dart';

class RandomisePropertiesCommand implements ICommand {
  RandomisePropertiesCommand(this.originator)
      : _backup = originator.createMemento();

  final Originator originator;
  final IMemento _backup;
  Random random = new Random();

  @override
  void execute() {
    final shape = originator.state;

    shape.color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1.0,
    );

    shape.height = (50 + random.nextInt((150 - 50) + 1)).toDouble();
    shape.width = (50 + random.nextInt((150 - 50) + 1)).toDouble();
  }

  @override
  void undo() => originator.restore(_backup);
}
