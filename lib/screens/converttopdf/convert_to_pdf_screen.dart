import 'package:flutter/material.dart';
import 'package:pdftoolkit/screens/converttopdf/jpg_to_pdf_screen.dart';
import 'package:pdftoolkit/screens/converttopdf/wordtopdf_screen.dart';
import '../../widgets/pdf_option_card.dart';

class ConvertToPDFScreen extends StatelessWidget {
  const ConvertToPDFScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convert to PDF'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [
          PDFOptionCard(
            title: 'JPG to PDF',
            icon: Icons.image,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConvertJPGToPDFScreen(),
                ),
              );
            },
          ),
          PDFOptionCard(
            title: 'WORD to PDF',
            icon: Icons.description,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConvertWordToPDFScreen(),
                ),
              );
            },
          ),
          PDFOptionCard(
            title: 'POWERPOINT to PDF',
            icon: Icons.present_to_all,
            onTap: () {
              // Implement POWERPOINT to PDF conversion
            },
          ),
          PDFOptionCard(
            title: 'EXCEL to PDF',
            icon: Icons.table_chart,
            onTap: () {
              // Implement EXCEL to PDF conversion
            },
          ),
          PDFOptionCard(
            title: 'HTML to PDF',
            icon: Icons.code,
            onTap: () {
              // Implement HTML to PDF conversion
            },
          ),
        ],
      ),
    );
  }
}
