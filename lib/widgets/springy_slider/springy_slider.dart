import 'package:flutter/material.dart';
import 'package:water_reminder/widgets/springy_slider/slider_controller.dart';
import 'package:water_reminder/widgets/springy_slider/slider_dragger.dart';
import 'package:water_reminder/widgets/springy_slider/slider_goo.dart';
import 'package:water_reminder/widgets/springy_slider/slider_marks.dart';
import 'package:water_reminder/widgets/springy_slider/slider_points.dart';
import 'package:water_reminder/widgets/springy_slider/slider_state.dart';

class SpringySlider extends StatefulWidget {
  final SpringySliderController? sliderController;
  final int? markCount;
  final Color? positiveColor;
  final Color? negativeColor;

  SpringySlider({
    this.sliderController,
    this.markCount,
    this.positiveColor,
    this.negativeColor,
  });

  @override
  _SpringySliderState createState() => _SpringySliderState();
}

class _SpringySliderState extends State<SpringySlider>
    with TickerProviderStateMixin {
  final double paddingTop = 50.0;
  final double paddingBottom = 50.0;
  SpringySliderController? sliderController;
  @override
  Widget build(BuildContext context) {
    double? sliderPercent = widget.sliderController!.sliderValue;
    if (widget.sliderController!.state == SpringySliderState.springing) {
      sliderPercent = widget.sliderController!.springingPercent;
    }

    return SliderDragger(
      sliderController: widget.sliderController,
      paddingTop: paddingTop,
      paddingBottom: paddingBottom,
      child: Stack(
        children: <Widget>[
          SliderMarks(
            markCount: widget.markCount,
            markColor: widget.positiveColor,
            backgroundColor: widget.negativeColor,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
          ),
          SliderGoo(
            sliderController: widget.sliderController,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
            child: SliderMarks(
              markCount: widget.markCount,
              markColor: widget.negativeColor,
              backgroundColor: widget.positiveColor,
              paddingTop: paddingTop,
              paddingBottom: paddingBottom,
            ),
          ),
          SliderPoints(
            sliderController: widget.sliderController,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
          ),
//          new SliderDebug(
//            sliderPercent: sliderController.state == SpringySliderState.dragging
//                ? sliderController.draggingPercent
//                : sliderPercent,
//            paddingTop: paddingTop,
//            paddingBottom: paddingBottom,
//          ),
        ],
      ),
    );
  }
}
