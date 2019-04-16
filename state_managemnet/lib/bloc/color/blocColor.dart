import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:state_managemnet/bloc/bloc.dart';

class BlocColor extends BlocBase {
  StreamController _streamController = StreamController.broadcast();

  Sink get _streamSink => _streamController.sink;
  Stream get stream => _streamController.stream;

  changeColor() {
    _streamSink.add(getRandomColor());
  }

  Color getRandomColor() {
    Random _random = Random();
    return Color.fromARGB(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
