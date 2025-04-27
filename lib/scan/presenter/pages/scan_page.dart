import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final ImagePicker picker = ImagePicker();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Scan Image"),
      ),
    );
  }
}
