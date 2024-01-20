import 'package:flutter/material.dart';

class ThemeProvider extends InheritedModel<String> {
  final bool isDarkModeEnabled;
  final Function(bool) toggleTheme;

  ThemeProvider({
    required this.isDarkModeEnabled,
    required this.toggleTheme,
    required Widget child,
  }) : super(child: child);

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return isDarkModeEnabled != oldWidget.isDarkModeEnabled;
  }

  @override
  bool updateShouldNotifyDependent(
    ThemeProvider oldWidget,
    Set<String> dependencies,
  ) {
    return dependencies.contains('theme') &&
        isDarkModeEnabled != oldWidget.isDarkModeEnabled;
  }
}