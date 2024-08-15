import 'package:flutter/material.dart';
import 'package:taskify/pages/landing_page.dart';
import "package:hive_flutter/hive_flutter.dart";

void main() {
  Hive.initFlutter("hive_boxes");
  runApp(const MaterialApp(home: LandingPage()));
}

