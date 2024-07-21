import 'package:flutter/material.dart';

///
class AppElevatedButton extends StatelessWidget {
  /// {
  const AppElevatedButton({
    required this.child,
    super.key,
    this.onPressed,
    BorderSide? borderSide,
    Size? maximumSize,
    Size? minimumSize,
    EdgeInsets? padding,
  })  : _borderSide = borderSide,
        _maximumSize = maximumSize ?? _defaultMaximumSize,
        _minimumSize = minimumSize ?? _defaultMinimumSize,
        _padding = padding ?? _defaultPadding;

  /// The maximum size of the button.
  static const _defaultMaximumSize = Size(double.infinity, 56);

  /// The minimum size of the button.
  static const _defaultMinimumSize = Size(double.infinity, 56);

  /// The padding of the the button.
  static const _defaultPadding = EdgeInsets.fromLTRB(
    24,
    9,
    24,
    12,
  );

  /// [VoidCallback] called when button is pressed.
  /// Button is disabled when null.
  final VoidCallback? onPressed;

  /// A border of the button.
  final BorderSide? _borderSide;

  /// The maximum size of the button.
  ///
  /// Defaults to [_defaultMaximumSize].
  final Size _maximumSize;

  /// The minimum size of the button.
  ///
  /// Defaults to [_defaultMinimumSize].
  final Size _minimumSize;

  /// The padding of the button.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsets _padding;

  /// [Widget] displayed on the button.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        /// Butonun alabileceği maksimum boyut
        maximumSize: WidgetStateProperty.all(_maximumSize),

        /// Buton içeriği etrafındaki iç boşluk
        padding: WidgetStateProperty.all(_padding),

        /// Butonun alabileceği minimum boyut
        minimumSize: WidgetStateProperty.all(_minimumSize),

        /// Buton içindeki Text'in Style (font büyüklüğü, vb.)
        textStyle: onPressed == null
            ? WidgetStateProperty.all(
                TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              )
            : WidgetStateProperty.all(
                const TextStyle(color: Colors.white),
              ),

        /// Text'in Rengi
        foregroundColor: onPressed == null
            ? WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary,
              )

            /// Etkin Olduğunda
            : WidgetStateProperty.all(
                Theme.of(context).colorScheme.onPrimary,
              ),

        ///  Butonun Arka Plan rengi
        backgroundColor: onPressed == null
            ? WidgetStateProperty.all(
                Theme.of(context).colorScheme.secondaryContainer,
              )

            /// Etkin Olduğunda
            : WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary,
              ),

        /// Buton kenar çizgisinin Style'ı (kalınlık, renk).
        side: WidgetStateProperty.all(_borderSide),

        /// Butonun köşe yuvarlaklıklarını belirle
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: child,
    );
  }
}
