import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_assignment_app/providers/firebase_provider.dart';
import 'package:ubixstar_assignment_app/providers/image_provider.dart';
import 'package:ubixstar_assignment_app/providers/widgets_provider.dart';
import 'package:ubixstar_assignment_app/screens/home_screen/screen_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => WidgetsProvider()),
        ChangeNotifierProvider(create: (ctx) => ImagesProvider()),
        ChangeNotifierProvider(create: (ctx) => FirebaseProvider())
      ],
      child: MaterialApp(
        title: 'Ubixstar Assignment App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: ScreenHome(),
      ),
    );
  }
}
