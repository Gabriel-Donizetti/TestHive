import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_hive/components/animated_toggle.dart';
import 'package:test_hive/providers/theme_provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //Acesso aos themas
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: height * 0.1),
        child: Column(
          children: [
            Container(
              width: width * 0.35,
              height: height * 0.35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: themeProvider.themeMode().gradient!,
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight)),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Text(
              'Chose a Style',
              style:
                  TextStyle(fontSize: width * .06, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              width: width * .6,
              child: Text(
                'Day or Nigth customize interface',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            AnimatedToggleWidget(
              values: ['Light', 'Dark'],
              onToggleCallBack: (v) async {
                await themeProvider.toogleThemeData();
                setState(() {});
              },
              onToggleCallback: (v) async {
                await themeProvider.toogleThemeData();
                setState(() {});
              },
            ),
          ],
        ),
      )),
    );
  }
}
