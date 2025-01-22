import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color bone = const Color(0xffD8CFBC);
    Color smokyBlack = const Color(0xff11120D);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: bone,
        ),
        scaffoldBackgroundColor: bone,
        appBarTheme: AppBarTheme(
          color: bone,
          titleTextStyle: TextStyle(
            color: smokyBlack,
            fontSize: 21,
          ),
          iconTheme: IconThemeData(
            color: smokyBlack,
          ),
        ),
        drawerTheme: DrawerThemeData(backgroundColor: bone),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(bone),
            backgroundColor: WidgetStatePropertyAll(smokyBlack),
          ),
        ),
        cardTheme: CardTheme(
          color: smokyBlack,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: bone,
          ),
        ),
        //
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: smokyBlack,
        ),
        scaffoldBackgroundColor: smokyBlack,
        appBarTheme: AppBarTheme(
          color: smokyBlack,
          titleTextStyle: TextStyle(
            color: bone,
            fontSize: 21,
          ),
          iconTheme: IconThemeData(
            color: bone,
          ),
        ),
        drawerTheme: DrawerThemeData(backgroundColor: smokyBlack),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(smokyBlack),
            backgroundColor: WidgetStatePropertyAll(bone),
          ),
        ),
        cardTheme: CardTheme(
          color: bone,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: smokyBlack,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
