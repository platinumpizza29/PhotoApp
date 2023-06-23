import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:photoapp/Components/HomeComp.dart';
import 'package:photoapp/Pages/HomePage.dart';
import 'package:photoapp/Pages/LoginPage.dart';
import 'package:photoapp/providers/Image.dart';
import 'package:photoapp/providers/Theme.dart';
import 'package:photoapp/providers/User.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MyTheme()),
      ChangeNotifierProvider(create: (_) => Images()),
      ChangeNotifierProvider(create: (_) => User())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: context.watch<MyTheme>().currentTheme,
        home: context.watch<User>().id == null ? LoginPage() : HomePage());
  }
}
