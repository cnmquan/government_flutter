import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookTheme(name: 'Light Theme', isDefault: true)
ThemeData getLightTheme() => ThemeData.light();
@WidgetbookTheme(name: 'Dark Theme')
ThemeData getDarkTheme() => ThemeData.dark();
