import 'package:codepiraten/presentation/core/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';

class ResponsiveTextList extends StatelessWidget {
  const ResponsiveTextList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ResponsiveAppWidget(
        small: Consumer<ThemeService>(
          builder: (context, ref, child) => AnimatedRotation(
            duration: const Duration(seconds: 1),
            turns:  ref.isDarkMode ? 0.5 : 1,
            child: AnimatedContainer(
              height: ref.isDarkMode ? 100 : 50,
              width: ref.isDarkMode ? 100 : 50,
              color:  ref.isDarkMode ? Colors.red : Colors.blue,
              curve: Curves.easeIn,
              duration: const Duration(seconds: 1),
            ),
          ),
        ),
        medium: const Text('medium'),
        large: const Text('large'),
      ),
    );
  }
}

class ResponsiveAppWidget extends StatelessWidget {
  const ResponsiveAppWidget({
    super.key,
    required this.small,
    required this.medium,
    required this.large,
  });

  final Widget small;
  final Widget medium;
  final Widget large;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    debugPrint('width: $width');

    if (width < 600) {
      return small;
    } else if (width < 800) {
      return medium;
    } else {
      return large;
    }
  }
}

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.small,
    required this.medium,
    required this.large,
  });

  final Widget small;
  final Widget medium;
  final Widget large;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        if (width < 600) {
          return small;
        } else if (width < 800) {
          return medium;
        } else {
          return large;
        }
      },
    );
  }
}
