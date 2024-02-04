import 'package:flutter/material.dart';
import 'package:second_chance/src/core/theme/colors.dart';
import 'package:second_chance/src/core/theme/styles.dart';

class ItemTile extends StatelessWidget {
  final String line1;
  final String line2;
  final Color? color;
  final TextStyle? textStyleLine1;
  final TextStyle? textStyleLine2;
  final CrossAxisAlignment? crossAxisAlignment;
  const ItemTile(
      {super.key,
      required this.line1,
      required this.line2,
      this.color,
      this.textStyleLine1,
      this.textStyleLine2,
      this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color ?? boxBg1,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: appBarColor,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              line1,
              style: textStyleLine1 ??
                  textStyle16.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              line2,
              style: textStyleLine2 ??
                  textStyleColor.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
