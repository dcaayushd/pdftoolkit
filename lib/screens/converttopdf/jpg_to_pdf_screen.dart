// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:pdf/widgets.dart' as pw;
// import '../../models/pdf_document.dart';
// import '../../services/pdf_service.dart';
// import '../../widgets/pdf_preview.dart';

// class ConvertJPGToPDFScreen extends StatefulWidget {
//   const ConvertJPGToPDFScreen({super.key});

//   @override
//   ConvertJPGToPDFScreenState createState() => ConvertJPGToPDFScreenState();
// }

// class ConvertJPGToPDFScreenState extends State<ConvertJPGToPDFScreen> {
//   List<PlatformFile> _images = [];
//   final PDFService _pdfService = PDFService();

//   Future<void> _pickImages() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//       allowMultiple: true,
//     );

//     if (result != null) {
//       setState(() {
//         _images = result.files;
//       });
//     }
//   }

//   Future<void> _generatePDF() async {
//     if (_images.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select at least one image')),
//       );
//       return;
//     }

//     final pdf = pw.Document();
//     for (final image in _images) {
//       final imageFile = File(image.path!);
//       final imageProvider = pw.MemoryImage(await imageFile.readAsBytes());
//       pdf.addPage(pw.Page(
//         build: (pw.Context context) => pw.Center(
//           child: pw.Image(imageProvider),
//         ),
//       ));
//     }

//     String? outputPath = await FilePicker.platform.saveFile(
//       dialogTitle: 'Save PDF',
//       fileName: 'converted.pdf',
//     );

//     if (outputPath != null) {
//       // await pdf.save(File(outputPath));

//       final outputFile = File(outputPath);
//       await outputFile.writeAsBytes(await pdf.save());
//       final PDFDocument pdfDocument = await _pdfService.loadPDF(outputPath);
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => PDFPreview(document: pdfDocument),
//         ),
//       );
//     }
//   }

//   void _deleteImage(int index) {
//     setState(() {
//       _images.removeAt(index);
//     });
//   }

//   void _moveImage(int oldIndex, int newIndex) {
//     setState(() {
//       if (oldIndex < newIndex) {
//         newIndex -= 1;
//       }
//       final PlatformFile image = _images.removeAt(oldIndex);
//       _images.insert(newIndex, image);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Convert JPG to PDF'),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: ReorderableListView.builder(
//                 itemCount: _images.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     key: ValueKey(_images[index]),
//                     leading: Image.file(
//                       File(_images[index].path!),
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                     ),
//                     title: Text(_images[index].name),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () => _deleteImage(index),
//                     ),
//                   );
//                 },
//                 onReorder: _moveImage,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _pickImages,
//                   child: const Text('Pick Images'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _generatePDF,
//                   child: const Text('Generate PDF'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../models/pdf_document.dart';
import '../../services/pdf_service.dart';
import '../../widgets/pdf_preview.dart';

class ConvertJPGToPDFScreen extends StatefulWidget {
  const ConvertJPGToPDFScreen({super.key});

  @override
  ConvertJPGToPDFScreenState createState() => ConvertJPGToPDFScreenState();
}

class ConvertJPGToPDFScreenState extends State<ConvertJPGToPDFScreen> {
  List<String> _imagePaths = [];
  final PDFService _pdfService = PDFService();

  Future<void> _pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _imagePaths = result.files.map((file) => file.path!).toList();
      });
    }
  }

  // Future<void> _generatePDF() async {
  //   if (_imagePaths.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select at least one image')),
  //     );
  //     return;
  //   }

  //   String? outputPath = await FilePicker.platform.saveFile(
  //     dialogTitle: 'Save PDF',
  //     fileName: 'converted.pdf',
  //   );

  //   if (outputPath != null) {
  //     await _pdfService.createPDFFromImages(_imagePaths, outputPath);
  //     final PDFDocument pdfDocument = await _pdfService.loadPDF(outputPath);
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => PDFPreview(document: pdfDocument),
  //       ),
  //     );
  //   }
  // }
  Future<void> _generatePDF() async {
  if (_imagePaths.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please select at least one image')),
    );
    return;
  }

  String? outputPath = await FilePicker.platform.saveFile(
    dialogTitle: 'Save PDF',
    fileName: 'converted.pdf',
  );
  if (outputPath != null) {
    List<Uint8List> imageBytes = [];
    for (final imagePath in _imagePaths) {
      final imageFile = File(imagePath);
      imageBytes.add(await imageFile.readAsBytes());
    }
    await _pdfService.createPDFFromImages(imageBytes, outputPath);
    final PDFDocument pdfDocument = await _pdfService.loadPDF(outputPath);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFPreview(document: pdfDocument),
      ),
    );
  }
}

  void _deleteImage(int index) {
    setState(() {
      _imagePaths.removeAt(index);
    });
  }

  void _moveImage(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final String image = _imagePaths.removeAt(oldIndex);
      _imagePaths.insert(newIndex, image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convert JPG to PDF'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ReorderableListView.builder(
                itemCount: _imagePaths.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    key: ValueKey(_imagePaths[index]),
                    leading: Image.file(
                      File(_imagePaths[index]),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(_imagePaths[index].split('/').last),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteImage(index),
                    ),
                  );
                },
                onReorder: _moveImage,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _pickImages,
                  child: const Text('Pick Images'),
                ),
                ElevatedButton(
                  onPressed: _generatePDF,
                  child: const Text('Generate PDF'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
