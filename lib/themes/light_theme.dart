import 'package:bussy/themes/colors_app.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

ColorScheme lightColorScheme(ColorScheme? colorScheme) {
  ColorScheme? scheme = colorScheme;
  if (scheme != null) {
    scheme = scheme.harmonized();

    return scheme;
  }
  scheme = const ColorScheme(
    brightness: Brightness.light,
    primary: colorLightPrimary,
    onPrimary: colorLightOnPrimary,
    secondary: colorLightSecondary,
    onSecondary: colorLightOnSecondary,
    error: colorLightError,
    onError: colorLightOnError,
    background: colorLightBackground,
    onBackground: colorLightOnBackground,
    surface: colorLightSurface,
    onSurface: colorLightOnSurface,
    tertiary: colorLightTertiary,
  );

  return scheme;
}
