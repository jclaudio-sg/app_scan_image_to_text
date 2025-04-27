import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ExpandableFabState>();
  final ImagePicker picker = ImagePicker();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Image To Text"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          title: Text('Item $index'),
        ),
      ),
      // floatingActionButtonLocation: ExpandableFab.location,
      // floatingActionButton: ExpandableFab(
      //   key: _key,
      //   overlayStyle: ExpandableFabOverlayStyle(
      //     //color: Colors.black.withValues(alpha: 0.5),
      //     blur: 5,
      //   ),
      //   onOpen: () {
      //     debugPrint('onOpen');
      //   },
      //   afterOpen: () {
      //     debugPrint('afterOpen');
      //   },
      //   onClose: () {
      //     debugPrint('onClose');
      //   },
      //   afterClose: () {
      //     debugPrint('afterClose');
      //   },
      //   children: [
      //     FloatingActionButton.small(
      //       // shape: const CircleBorder(),
      //       heroTag: null,
      //       child: const Icon(Icons.edit),
      //       onPressed: () {
      //         const SnackBar snackBar = SnackBar(
      //           content: Text("SnackBar"),
      //         );
      //         //scaffoldKey.currentState?.showSnackBar(snackBar);
      //       },
      //     ),
      //     FloatingActionButton.small(
      //       // shape: const CircleBorder(),
      //       heroTag: null,
      //       child: const Icon(Icons.search),
      //       onPressed: () {},
      //     ),
      //     FloatingActionButton.small(
      //       // shape: const CircleBorder(),
      //       heroTag: null,
      //       child: const Icon(Icons.share),
      //       onPressed: () {
      //         final state = _key.currentState;
      //         if (state != null) {
      //           debugPrint('isOpen:${state.isOpen}');
      //           state.toggle();
      //         }
      //       },
      //     ),
      //   ],
      // ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _key,
        type: ExpandableFabType.up,
        childrenAnimation: ExpandableFabAnimation.none,
        distance: 70,
        overlayStyle: ExpandableFabOverlayStyle(
          color: Colors.white.withOpacity(0.9),
        ),
        children: [
          const Row(
            children: [
              Text("Camera"),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: null,
                child: Icon(Icons.camera_alt_outlined),
              )
            ],
          ),
          Row(
            children: [
              const Text("Galeria"),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: () async {
                  debugPrint("Pegando imagem");
                  XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  String data = await getImageToText(image!.path);
                  setState(() {
                    result = data;
                    debugPrint("Texto: $result");
                  });
                },
                child: Icon(Icons.browse_gallery),
              )
            ],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     debugPrint("Pegando imagem");
      //     XFile? image = await picker.pickImage(source: ImageSource.gallery);
      //     String data = await getImageToText(image!.path);
      //     setState(() {
      //       result = data;
      //       debugPrint("Texto: $result");
      //     });
      //   },
      //   child: const Icon(
      //     Icons.add,
      //   ),
      // ),
    );
  }

  Future<String> getImageToText(final imagePath) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(InputImage.fromFilePath(imagePath));
    String text = recognizedText.text.toString();
    return text;
  }
}
