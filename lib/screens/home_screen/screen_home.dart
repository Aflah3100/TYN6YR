import 'package:flutter/material.dart';
import 'package:ubixstar_assignment_app/screens/widget_selection_screen/widget_selection_screen.dart';
import 'package:ubixstar_assignment_app/widgets/button.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
          //BAse-Container
          child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            //Widge-display-container
            Container(
              width: width,
              height: height * 0.70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color.fromARGB(255, 213, 235, 214)),
            ),
            SizedBox(
              height: height * 0.03,
            ),

            //Add-widget-button
            Button(
              width: width,
              height: height,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const ScreenWidgetSelection()));
              },
              label: 'Add Widget',
            )
          ],
        ),
      )),
    );
  }
}
