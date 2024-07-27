import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_assignment_app/firebase/functions/firebase_functions.dart';
import 'package:ubixstar_assignment_app/providers/image_provider.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImage(BuildContext context) async {
    final imageNotifier = context.read<ImagesProvider>();

    final _pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (_pickedFile != null) {
      imageNotifier.setImageFile(File(_pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageNotifier = context.read<ImagesProvider>();

    return Container(
      width: width * 0.70,
      height: height * 0.25,
      color: const Color.fromARGB(255, 222, 220, 220),
      child: Center(
        child: GestureDetector(
            onTap: () async {
              await pickImage(context);
            },
            onLongPress: () {
              imageNotifier.clearImageFile();
            },
            child: StreamBuilder(
              stream: FirebaseFunctions.instance.fetchImageUrl(),
              builder: (context, snapshot) {
                //Connection-state-waiting
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                  //no-data-fetched
                } else if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Consumer<ImagesProvider>(
                        builder: (context, imageNotifier, child) {
                          return (imageNotifier.getImageFile() == null)
                              ? const Text(
                                  'Upload Image',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500),
                                )
                              : (imageNotifier.getSavedImageUrl().isEmpty)
                                  ? const Text(
                                      'Image Uploaded Successfully',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : SizedBox(
                                      width: width * 0.60,
                                      height: height * 0.13,
                                      child: Image.network(
                                          imageNotifier.getSavedImageUrl()),
                                    );
                        },
                      ),
                    ],
                  );
                } else {
                  //snapshot-has-data
                  final url = snapshot.data!['imageurl'];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: width * 0.60,
                          height: height * 0.13,
                          child: Image.network(
                            url,
                            fit: BoxFit.contain,
                          )),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Text(
                        'Touch again to upload',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      )
                    ],
                  );
                }
              },
            )),
      ),
    );
  }
}
