import 'package:flutter/material.dart';
import 'package:water_reminder/widgets/springy_slider/slider_clipper.dart';
import 'package:water_reminder/widgets/springy_slider/slider_controller.dart';

class SliderGoo extends StatelessWidget {
  final SpringySliderController? sliderController;
  final double? paddingTop;
  final double? paddingBottom;
  final Widget? child;

  SliderGoo({
    this.sliderController,
    this.paddingTop,
    this.paddingBottom,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SliderClipper(
        sliderController: sliderController,
        paddingTop: paddingTop,
        paddingBottom: paddingBottom,
      ),
      child: child,
    );
  }
}
