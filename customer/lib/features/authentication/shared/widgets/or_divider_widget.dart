import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  /// Creates a Material Design divider.
  ///
  /// The [height], [thickness], [indent], and [endIndent] must be null or
  /// non-negative.
  const OrDivider({super.key, this.height, this.thickness, this.indent, this.endIndent, this.color, this.text = 'OR'})
    : assert(height == null || height >= 0.0),
      assert(thickness == null || thickness >= 0.0),
      assert(indent == null || indent >= 0.0),
      assert(endIndent == null || endIndent >= 0.0);

  /// The divider's height extent.
  ///
  /// The divider itself is always drawn as a horizontal line that is centered
  /// within the height specified by this value.
  ///
  /// If this is null, then the [DividerThemeData.space] is used. If that is
  /// also null, then this defaults to 16.0.
  final double? height;

  /// The thickness of the line drawn within the divider.
  ///
  /// A divider with a [thickness] of 0.0 is always drawn as a line with a
  /// height of exactly one device pixel.
  ///
  /// If this is null, then the [DividerThemeData.thickness] is used. If
  /// that is also null, then this defaults to 0.0.
  final double? thickness;

  /// The amount of empty space to the leading edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.indent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double? indent;

  /// The amount of empty space to the trailing edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.endIndent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double? endIndent;

  /// The color to use when painting the line.
  ///
  /// If this is null, then the [DividerThemeData.color] is used. If that is
  /// also null, then [ThemeData.dividerColor] is used.
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// const Divider(
  ///   color: Colors.deepOrange,
  /// )
  /// ```
  /// {@end-tool}
  final Color? color;

  final String text;

  @override
  Widget build(BuildContext context) {
    final defaultColor = color ?? Theme.of(context).dividerColor;
    return Row(
      children: [
        Expanded(child: Divider(height: height, thickness: thickness, indent: indent, color: defaultColor)),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Text(text.tr(), style: const TextStyle(fontWeight: FontWeight.bold))),
        Expanded(child: Divider(height: height, thickness: thickness, endIndent: endIndent, color: defaultColor)),
      ],
    );
  }
}
