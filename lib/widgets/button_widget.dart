import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_assignment_app/firebase/functions/firebase_functions.dart';
import 'package:ubixstar_assignment_app/providers/image_provider.dart';
import 'package:ubixstar_assignment_app/providers/widgets_provider.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    final widgetsNotifier = context.read<WidgetsProvider>();
    final imageNotifier = context.read<ImagesProvider>();
    return GestureDetector(
      onTap: () async {
        //Only-saved-button-imported
        if (!widgetsNotifier.getImageWidgetSelector() &&
            !widgetsNotifier.getTextWidgetSelector()) {
          widgetsNotifier.setsavedButtonClickedAlone(true);
        } else {
          if (widgetsNotifier.getImageWidgetSelector()) {
            if (imageNotifier.getImageFile() != null) {
              final result = await FirebaseFunctions.instance
                  .uploadImagetoFirebaseStorage(imageNotifier.getImageFile()!);

              if (result is String) {
                //upload-success
                imageNotifier.setSavedImageUrl(result);
              }
            }
          }
        }
      },
      child: Container(
        width: 70,
        height: 45,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 169, 230, 171),
            border: Border.all(width: 1.5, color: Colors.black)),
        child: const Center(
          child: Text(
            'Save',
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
