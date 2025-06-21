import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewWidget extends StatelessWidget {

  final CameraController cameraController;
  final VoidCallback callback;
  final Future<void> initializeControllerFuture;

  const CameraPreviewWidget({
    super.key,
    required this.cameraController,
    required this.callback,
    required this.initializeControllerFuture,
  });

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CameraPreview( cameraController ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: callback,
                  ),
                ),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}
