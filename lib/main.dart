import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(const PDFToolApp());
}

class PDFToolApp extends StatelessWidget {
  const PDFToolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PDF ToolKit',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
