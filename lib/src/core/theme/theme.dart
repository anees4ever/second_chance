import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_chance/src/core/theme/colors.dart';

class ThemeClass {
  static ThemeData theme(BuildContext context) => ThemeData(
        primaryColor: appBarColor,
        colorScheme: const ColorScheme.light().copyWith(
          primary: appBarColor,
          secondary: appBarColor,
        ),
        scaffoldBackgroundColor: appBgColor, //page content area
        canvasColor: appBgColor, //reset of the area / drawer
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: appBarColor,
          titleTextStyle: GoogleFonts.bungeeSpice(
            color: textColorPrimary,
            fontSize: 26,
          ),
        ),

        dividerTheme: const DividerThemeData(
          color: appBarColor,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStateProperty.all(textColorPrimary),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return iconColorDisabled;
              }
              return buttonColor;
            }),
            foregroundColor: MaterialStateProperty.all(textColorSecondary),
            overlayColor: MaterialStateProperty.all(
              iconColorPrimary.withAlpha(100),
            ),
            iconColor: MaterialStateProperty.all(textColorSecondary),
          ),
        ),
        textTheme:
            GoogleFonts.martelSansTextTheme(Theme.of(context).textTheme).apply(
          displayColor: textColorPrimary,
          bodyColor: textColorPrimary,
        ),

        iconTheme: const IconThemeData(
          color: iconColorPrimary,
        ),
      );
}
