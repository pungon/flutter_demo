import 'package:flutter/material.dart';
//import 'package:codediva_app/screen/home.dart';
import 'package:codediva_app/screen/Splash Screen.dart';
import 'package:provider/provider.dart';
import 'package:codediva_app/provider/LanguageProvider.dart';


void main() {
  runApp(  
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
     
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

  

