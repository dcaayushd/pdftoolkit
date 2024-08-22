import 'package:file_picker/file_picker.dart';
import '../models/pdf_document.dart';
import '../services/pdf_service.dart';

class FilePickerHelper {
  static Future<PDFDocument?> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      PDFService pdfService = PDFService();
      return await pdfService.loadPDF(filePath);
    }

    return null;
  }

  static Future<List<PDFDocument>> pickMultiplePDFs() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );

    if (result != null) {
      PDFService pdfService = PDFService();
      List<PDFDocument> documents = [];
      for (PlatformFile file in result.files) {
        PDFDocument doc = await pdfService.loadPDF(file.path!);
        documents.add(doc);
      }
      return documents;
    }

    return [];
  }
}
