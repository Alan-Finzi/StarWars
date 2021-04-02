import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math' as math show sin;

class WidgetRipplesAnimation extends StatefulWidget {
    final double width;
    final double height;
    final Color color;
    final double borderRadiusSize;
    final Widget child;

    const WidgetRipplesAnimation({Key key, this.width, this.height, this.color, this.borderRadiusSize, this.child,}) : super(key: key);

    @override
    _WidgetRipplesAnimationState createState() => _WidgetRipplesAnimationState();
}

class _WidgetRipplesAnimationState extends State<WidgetRipplesAnimation> with TickerProviderStateMixin {
    AnimationController _controller;

    @override
    void initState() {
        super.initState();
        _controller = AnimationController(
            duration: const Duration(milliseconds: 2000),
            vsync: this,)..repeat();
    }

    @override
    void dispose() {
        _controller.dispose();
        super.dispose();
    }


    @override
    Widget build(BuildContext context) {
        return CustomPaint(
            child: Container(
                height: widget.height,
                width: widget.width,
                child: _childWidget(),
            ),
        );
    }

    Widget _childWidget() {
        return Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadiusSize),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: <Color>[
                                widget.color,
                                Color.lerp(widget.color, widget.color, 0)
                            ],
                        ),
                    ),
                    child: ScaleTransition(
                            scale: Tween(begin: 0.95, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: _controller,
                                    curve:  CurveWave(),
                                ),
                            ),
                            child: widget.child
                    ),
                ),
            ),
        );
    }

}


class CurveWave extends Curve {
    //const PulsateCurve();
    @override
    double transform(double t) {
        if (t == 0 || t == 1) { return 0.01; }
        return math.sin(t *10 );
    }
}