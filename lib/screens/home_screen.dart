import 'package:flutter/material.dart';

import '../screens/convertfrompdf/convert_from_pdf_screen.dart';
import '../screens/converttopdf/convert_to_pdf_screen.dart';
import '../screens/editpdf/edit_pdf_screen.dart';
import '../screens/optimizepdf/optimize_pdf_screen.dart';
import '../screens/organizetopdf/organize_pdf_screen.dart';
import '../screens/pdfsecurity/pdf_security.dart';
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
            title: 'Convert to PDF',
            icon: Icons.picture_as_pdf,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConvertToPDFScreen()),
              );
            },
          ),
          PDFOptionCard(
            title: 'Convert from PDF',
            icon: Icons.folder_open,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConvertFromPDFScreen()),
              );
            },
          ),
          PDFOptionCard(
            title: 'Edit PDF',
            icon: Icons.edit,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditPDFScreen()),
              );
            },
          ),
          PDFOptionCard(
            title: 'Organize PDF',
            icon: Icons.reorder,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OrganizePDFScreen()),
              );
            },
          ),
          PDFOptionCard(
            title: 'Optimize PDF',
            icon: Icons.speed,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OptimizePDFScreen()),
              );
            },
          ),
          PDFOptionCard(
            title: 'PDF Security',
            icon: Icons.security,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PDFSecurityScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
