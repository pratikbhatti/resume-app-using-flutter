import 'package:demo11/about.dart';
import 'package:demo11/pdfdownload.dart';
import 'package:demo11/resume1.dart';
import 'package:demo11/resume2.dart';
import 'package:demo11/spashScreen.dart';
import 'package:demo11/test.dart';
import 'package:flutter/material.dart';

var validateKey = GlobalKey<FormState>();
String? path;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SpashScreen(),
        'resume': (context) => Resume1(),
        'resumedata': (context) => ResumeWithFullData(),
        'about': (context) => About(),
      },
    ),
  );
}
