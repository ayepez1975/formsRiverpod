



import 'package:flutter/material.dart';


const seedColor = Color.fromARGB(255, 150, 88, 217);

class AppTheme {

  final bool isDarkmode;

  AppTheme({ required this.isDarkmode });


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkmode ? Brightness.dark : Brightness.light,
    
      listTileTheme: const ListTileThemeData(
            textColor: seedColor,
            titleTextStyle: TextStyle(fontSize: 20),
            
            selectedTileColor: seedColor,
            iconColor: seedColor
            
        ),
        
    
  );

}