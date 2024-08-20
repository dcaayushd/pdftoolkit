import 'package:flutter/material.dart';
import '../widgets/pdf_option_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF ToolKit'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [
          PDFOptionCard(
            title: 'Merge PDF',
            icon: Icons.merge_type,
            onTap: () {
              // Navigate to merge PDF screen
            },
          ),
          PDFOptionCard(
            title: 'Split PDF',
            icon: Icons.call_split,
            onTap: () {
              // Navigate to split PDF screen
            },
          ),
          // Add more PDFOptionCard widgets for other features
        ],
      ),
    );
  }
}
