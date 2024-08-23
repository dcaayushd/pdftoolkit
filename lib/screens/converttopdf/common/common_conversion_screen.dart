import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../../widgets/pdf_preview.dart';
import '../../../models/pdf_document.dart';
import '../../../services/pdf_service.dart';


class CommonConversionScreen extends StatefulWidget {
  final String title;
  final Function(String) onConvert;

  const CommonConversionScreen({
    super.key,
    required this.title,
    required this.onConvert,
  });

  @override
  CommonConversionScreenState createState() => CommonConversionScreenState();
}

class CommonConversionScreenState extends State<CommonConversionScreen> {
  PlatformFile? _selectedFile;
  final PDFService _pdfService = PDFService();

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = result.files.single;
      });
    }
  }

  Future<void> _convert() async {
    if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a file')),
      );
      return;
    }

    String? outputPath = await FilePicker.platform.saveFile(
      dialogTitle: 'Save PDF',
      fileName: 'converted.pdf',
    );

    if (outputPath != null) {
      await widget.onConvert(_selectedFile!.path!);
      final PDFDocument pdfDocument = await _pdfService.loadPDF(outputPath);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFPreview(document: pdfDocument),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_selectedFile != null)
            ListTile(
              leading: const Icon(Icons.file_copy),
              title: Text(_selectedFile!.name),
            )
          else
            const Text('No file selected'),
          ElevatedButton(
            onPressed: _pickFile,
            child: const Text('Select File'),
          ),
          ElevatedButton(
            onPressed: _convert,
            child: const Text('Convert to PDF'),
          ),
        ],
      ),
    );
  }
}