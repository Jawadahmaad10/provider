import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/auth_provider.dart';

import 'package:provider_state/provider/count_provider.dart';
import 'package:provider_state/provider/example_one_provider.dart';
import 'package:provider_state/provider/favourite_provider.dart';
import 'package:provider_state/provider/theme_changer_provider.dart';


import 'package:provider_state/screen/dark_theme.dart';
import 'package:provider_state/screen/login.dart';
import 'package:provider_state/screen/value_notify_listner.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //this is main step for provider
    //1.single provider
    //   return ChangeNotifierProvider(
    //    create: (_) => CountProvider(),
    //    child: MaterialApp(
    //   title: "Flutter Demo",
    //   theme: ThemeData(
    //    primarySwatch: Colors.blue,
    // ),
    // home: CountExample(),
    // ),

    // );

    //2.Multi-provider State

    // final themeChanger = Provider.of<ThemeChanger>(context);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ExampleOneProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavouriteItemProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeChanger(),
          ),
            ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeChanger = Provider.of<ThemeChanger>(context);
            return MaterialApp(
              title: 'Flutter Demo',
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.red,

                
                
              ),
              darkTheme: ThemeData(
               brightness: Brightness.dark, 
               primarySwatch: Colors.yellow,
                primaryColor: Colors.purple,
                appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
                iconTheme: IconThemeData(
                 color: Colors.pink, 
                ),
              ),
              home: LoginScreen(),
            );
          },
        ));
  }
}
