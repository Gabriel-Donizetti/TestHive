//Usamos provider para gerenciar o estado do app

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class ThemeProvider with ChangeNotifier {
  bool isLightTheme;

  ThemeProvider({required this.isLightTheme});

  //Cdg abaixo para gerencair o estado quando trocamos o theme
  getCurrentStatusNavigationBarColor() {
    if (isLightTheme) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xFFFFFFFF),
          systemNavigationBarIconBrightness: Brightness.dark));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xFFFFFFFF),
          systemNavigationBarIconBrightness: Brightness.light));
    }
  }

  //Use para alterar o theme
  toogleThemeData() async {
    final setings = await Hive.openBox('settings');
    setings.put('isLightTheme', !isLightTheme);
    isLightTheme = !isLightTheme;
    getCurrentStatusNavigationBarColor();
    notifyListeners();
  }

  //Dados do theme global, verifica se o lightTheme está ativado
  ThemeData themeData() {
    return ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: isLightTheme ? Colors.grey : Colors.grey,
        primaryColor: isLightTheme ? Colors.white : Color(0xFF1E1F28),
        brightness: isLightTheme ? Brightness.light : Brightness.dark,
        backgroundColor: isLightTheme ? Color(0xFFFFFFFF) : Color(0x26242E),
        scaffoldBackgroundColor:
            isLightTheme ? Color(0xFFFFFFFF) : Color(0xFF26242E));
  }

  //themeMode para exibir propriedades unicas
  ThemeColor themeMode() {
    return ThemeColor(
      gradient: [
        if (isLightTheme) ...[Color(0xDDFF0080), Color(0xDDFF8C00)],
        if (!isLightTheme) ...[Color(0xFF8983F7), Color(0xFFA3DAFB)]
      ],
      toggleBackgroundColor:
          isLightTheme ? Color(0xFFe7e7e8) : Color(0xFF222029),
      toggleButtonColor: isLightTheme ? Color(0xFFFFFFFF) : Color(0xFf34323d),
      textColor: isLightTheme ? Color(0xFF000000) : Color(0xFFFFFFFF),
      shadow: [
        if (isLightTheme)
          BoxShadow(
              color: Color(0xFFd8d7da),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5)),
        if (!isLightTheme)
          BoxShadow(
              color: Color(0x66000000),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5))
      ],
    );
  }
}

//Uma classe para gerenciar a especificação de cores e estilos no aplicativo não suportados por themeData

class ThemeColor {
  List<Color>? gradient;
  Color? backgroundColor;
  Color? toggleButtonColor;
  Color? toggleBackgroundColor;
  Color? textColor;
  List<BoxShadow>? shadow;

  ThemeColor({
    this.gradient,
    this.backgroundColor,
    this.toggleBackgroundColor,
    this.toggleButtonColor,
    this.textColor,
    this.shadow,
  });
}
