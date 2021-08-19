import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_hive/providers/theme_provider.dart';

class AnimatedToggleWidget extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallBack;
  const AnimatedToggleWidget(
      {Key? key,
      required this.onToggleCallBack,
      required this.values,
      required Future<Null> Function(v) onToggleCallback})
      : super(key: key);

  @override
  _AnimatedToggleWidgetState createState() => _AnimatedToggleWidgetState();
}

mixin v {}

class _AnimatedToggleWidgetState extends State<AnimatedToggleWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: heigth * .7,
      height: width * .1,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              widget.onToggleCallBack(1);
            },
            child: Container(
              width: width * .7,
              height: heigth * .13,
              decoration: ShapeDecoration(
                  color: themeProvider.themeMode().toggleBackgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * .1))),
              child: Row(
                children: List.generate(
                    widget.values.length,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * .1),
                          child: Text(
                            widget.values[index],
                            style: TextStyle(
                                fontSize: width * .05,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF918F95)),
                          ),
                        )),
              ),
            ),
          ),
          AnimatedAlign(
            alignment: themeProvider.isLightTheme
                ? Alignment.centerLeft
                : Alignment.centerRight,
            duration: Duration(microseconds: 350),
            curve: Curves.ease,
            child: Container(
              alignment: Alignment.center,
              width: width * .35,
              height: width * .13,
              decoration: ShapeDecoration(
                  color: themeProvider.themeMode().toggleButtonColor,
                  shadows: themeProvider.themeMode().shadow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * .1))),
              child: Text(
                themeProvider.isLightTheme
                    ? widget.values[0]
                    : widget.values[1],
                style: TextStyle(
                    fontSize: width * .045, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
