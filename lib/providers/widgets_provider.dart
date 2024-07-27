import 'package:flutter/material.dart';

class WidgetsProvider with ChangeNotifier {
  bool _textWidgetSelector = false;
  bool _imageWidgetSelector = false;
  bool _buttonWidgetSelector = false;
  bool _savedButtonClickedAlone = false;

  bool getTextWidgetSelector() => _textWidgetSelector;
  bool getImageWidgetSelector() => _imageWidgetSelector;
  bool getButtonWidgetSelector() => _buttonWidgetSelector;
  bool getsavedButtonClickedAlone() => _savedButtonClickedAlone;

  void setTextWidgetSelector(bool value) {
    _textWidgetSelector = (value) ? true : false;
    notifyListeners();
  }

  void setImageWidgetSelector(bool value) {
    _imageWidgetSelector = (value) ? true : false;
    notifyListeners();
  }

  void setButtonWidgetSelector(bool value) {
    _buttonWidgetSelector = (value) ? true : false;
    notifyListeners();
  }

  void setsavedButtonClickedAlone(bool value) {
    _savedButtonClickedAlone = value ? true : false;
    notifyListeners();
  }
}
