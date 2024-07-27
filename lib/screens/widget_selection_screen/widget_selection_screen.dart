import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_assignment_app/providers/widgets_provider.dart';
import 'package:ubixstar_assignment_app/widgets/button.dart';

class ScreenWidgetSelection extends StatelessWidget {
  const ScreenWidgetSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    final widgetsNotifier = context.read<WidgetsProvider>();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 237, 226),
      body: SafeArea(
          child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //widget-selector-buttons
            Selector<WidgetsProvider, bool>(
                builder: (ctx, val, _) {
                  return WidgetSelectorButton(
                    selectorColor: (val) ? Colors.green : Colors.grey,
                    label: 'Text Widget',
                    onTap: () {
                      widgetsNotifier.setTextWidgetSelector(
                          !widgetsNotifier.getTextWidgetSelector());
                    },
                  );
                },
                selector: (ctx, widgetsProvider) =>
                    widgetsProvider.getTextWidgetSelector()),
            SizedBox(height: height * 0.05),
            Selector<WidgetsProvider, bool>(
                builder: (ctx, val, _) {
                  return WidgetSelectorButton(
                    selectorColor: (val) ? Colors.green : Colors.grey,
                    label: 'Image Widget',
                    onTap: () {
                      widgetsNotifier.setImageWidgetSelector(
                          !widgetsNotifier.getImageWidgetSelector());
                    },
                  );
                },
                selector: (ctx, widgetsProvider) =>
                    widgetsProvider.getImageWidgetSelector()),
            SizedBox(height: height * 0.05),
            Selector<WidgetsProvider, bool>(
                builder: (ctx, val, _) {
                  return WidgetSelectorButton(
                    selectorColor: (val) ? Colors.green : Colors.grey,
                    label: 'Button Widget',
                    onTap: () {
                      widgetsNotifier.setButtonWidgetSelector(
                          !widgetsNotifier.getButtonWidgetSelector());
                    },
                  );
                },
                selector: (ctx, widgetsProvider) =>
                    widgetsProvider.getButtonWidgetSelector()),
            SizedBox(height: height * 0.25),
            Button(
                width: width,
                height: height,
                onTap: () {},
                label: 'Import Widgets')
          ],
        ),
      )),
    );
  }
}

class WidgetSelectorButton extends StatelessWidget {
  const WidgetSelectorButton({
    super.key,
    required this.label,
    required this.selectorColor,
    required this.onTap,
  });
  final String label;
  final Color selectorColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      color: const Color.fromARGB(255, 208, 208, 208),
      child: Row(
        children: [
          //Widget-selector-widget
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 45,
              color: Colors.white,
              child: Center(
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: selectorColor,
                ),
              ),
            ),
          ),

          const SizedBox(
            width: 30,
          ),

          Text(
            label,
            style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
