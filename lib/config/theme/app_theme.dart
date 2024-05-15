import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149f);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.pink,
  Colors.orange,
  Colors.yellow,
  Colors.green
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Colors must be betwenn 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
