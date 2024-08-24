import 'package:flutter/material.dart';
import '../../widgets/pdf_option_card.dart';

class ConvertFromPDFScreen extends StatelessWidget {
  const ConvertFromPDFScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convert from PDF'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [
          PDFOptionCard(
            title: 'PDF to JPG',
            icon: Icons.image,
            onTap: () {
              // Implement PDF to JPG conversion
            },
          ),
          PDFOptionCard(
            title: 'PDF to WORD',
            icon: Icons.description,
            onTap: () {
              // Implement PDF to WORD conversion
            },
          ),
          PDFOptionCard(
            title: 'PDF to POWERPOINT',
            icon: Icons.present_to_all,
            onTap: () {
              // Implement PDF to POWERPOINT conversion
            },
          ),
          PDFOptionCard(
            title: 'PDF to EXCEL',
            icon: Icons.table_chart,
            onTap: () {
              // Implement PDF to EXCEL conversion
            },
          ),
          PDFOptionCard(
            title: 'PDF to PDF/A',
            icon: Icons.picture_as_pdf,
            onTap: () {
              // Implement PDF to PDF/A conversion
            },
          ),
        ],
      ),
    );
  }
}