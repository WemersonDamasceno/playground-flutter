import 'package:flutter/material.dart';
import 'package:responsividade/config/responsive/break_points.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimensoes) {
      return AnimatedSwitcher(
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        duration: const Duration(seconds: 2),
        child: _getWidget(dimensoes),
      );
    });
  }

  Widget _getWidget(BoxConstraints dimensoes) {
    if (dimensoes.maxWidth < BreakPoints.mobile) {
      return mobile;
    } else if (dimensoes.maxWidth > BreakPoints.mobile &&
        dimensoes.maxWidth <= BreakPoints.tablet) {
      return tablet;
    } else if (dimensoes.maxWidth > BreakPoints.tablet &&
        dimensoes.maxWidth <= BreakPoints.desktop) {
      return desktop;
    }
    return Center(
      child: SizedBox(
        width: BreakPoints.desktop,
        child: desktop,
      ),
    );
  }
}
