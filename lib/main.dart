import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/movie_provider.dart';
import 'providers/theme_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../helpers/preferences.dart';
import '../theme/default_theme.dart';
import 'utils/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Preferences.initShared();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Application(),
    );
  }
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prototipo App Flutter',
      initialRoute: Routes.home,
      routes: appRoutes,
      theme: DefaultTheme.lightTheme,
      darkTheme: DefaultTheme.darkTheme,
      themeMode:themeProvider.isDarkmode ? ThemeMode.dark : ThemeMode.light
    );
  }
}
