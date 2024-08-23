import 'package:flutter/material.dart';
import '../../screens/converttopdf/common/common_conversion_screen.dart';

import '../../services/pdf_service.dart';

class ConvertWordToPDFScreen extends StatelessWidget {
  const ConvertWordToPDFScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonConversionScreen(
      title: 'Convert Word to PDF',
      onConvert: (filePath) async {
        final PDFService pdfService = PDFService();
        // await pdfService.convertWordToPDF(filePath, 'converted.pdf');
      },
    );
  }
}
