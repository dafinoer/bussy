import 'package:bussy/themes/colors_app.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

ColorScheme darkColorScheme(ColorScheme? colorScheme) {
  var scheme = colorScheme;

  if (scheme != null) {
    scheme = scheme.harmonized();

    return scheme;
  }
  scheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: colorDarkPrimary,
    onPrimary: colorDarkOnPrimary,
    secondary: colorDarkSecondary,
    onSecondary: colorDarkOnSecondary,
    error: colorDarkError,
    onError: colorDarkOnError,
    background: colorDarkBackground,
    onBackground: colorDarkOnBackground,
    surface: colorDarkSurface,
    onSurface: colorDarkOnSurface,
    tertiary: colorDarkTertiary,
    onTertiary: colorDarkOnTertiary,
  );

  return scheme;
}
