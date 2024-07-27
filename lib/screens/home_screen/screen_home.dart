import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_assignment_app/firebase/functions/firebase_functions.dart';
import 'package:ubixstar_assignment_app/providers/firebase_provider.dart';
import 'package:ubixstar_assignment_app/providers/widgets_provider.dart';
import 'package:ubixstar_assignment_app/screens/widget_selection_screen/widget_selection_screen.dart';
import 'package:ubixstar_assignment_app/widgets/button.dart';
import 'package:ubixstar_assignment_app/widgets/button_widget.dart';
import 'package:ubixstar_assignment_app/widgets/image_widget.dart';
import 'package:ubixstar_assignment_app/widgets/text_widget.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final widgetsNotifier = context.read<WidgetsProvider>();
      if (widgetsNotifier.getImageWidgetSelector() ||
          widgetsNotifier.getTextWidgetSelector()) {
        widgetsNotifier.setsavedButtonClickedAlone(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final firebaseNotifer = context.read<FirebaseProvider>();

    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Assignment App',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            //Base-Container
            child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //Widget-display-container
              Container(
                width: width,
                height: height * 0.70,
                padding: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color.fromARGB(255, 241, 246, 241)),
                child: Consumer<WidgetsProvider>(
                  builder: (context, widgetsNotifier, child) {
                    return Column(
                      children: [
                        //Widget-Text
                        (widgetsNotifier.getTextWidgetSelector())
                            ? TextWidget(
                                width: width,
                                height: height,
                                textController: textController,
                              )
                            : const SizedBox(),
                        SizedBox(
                          height: height * 0.08,
                        ),

                        //Widget-Image
                        (widgetsNotifier.getImageWidgetSelector())
                            ? ImageWidget(width: width, height: height)
                            : const SizedBox(),
                        //Saved-button-clicke-alone-notification-text
                        (widgetsNotifier.getsavedButtonClickedAlone())
                            ? const Center(
                                child: Text(
                                'Add at-least a widget to save',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ))
                            : const SizedBox(),
                        SizedBox(
                          height: height * 0.08,
                        ),

                        //Widget-Button
                        (widgetsNotifier.getButtonWidgetSelector())
                            ? ButtonWidget(
                                textController: textController,
                              )
                            : const SizedBox(),
                        (!widgetsNotifier.getButtonWidgetSelector() &&
                                !widgetsNotifier.getImageWidgetSelector() &&
                                !widgetsNotifier.getTextWidgetSelector())
                            ? const Center(
                                child: Text(
                                  'No widget is Added',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : const SizedBox()
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),

              //Add-widget-button
              Button(
                width: width,
                height: height,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const ScreenWidgetSelection()));
                },
                label: 'Add Widget',
              )
            ],
          ),
        )),
      ),
    );
  }
}
