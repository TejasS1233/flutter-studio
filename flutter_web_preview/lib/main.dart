import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'models/components_data.dart';
import 'screens/preview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(createAllComponents()),
      child: Consumer<AppState>(
        builder: (context, appState, _) {
          return MaterialApp(
            title: 'Flutter Studio',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF0460c6),
              ),
              useMaterial3: true,
              fontFamily: appState.globalTheme.fontFamily,
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontFamily: appState.globalTheme.fontFamily,
                ),
                bodyMedium: TextStyle(
                  fontFamily: appState.globalTheme.fontFamily,
                ),
                bodySmall: TextStyle(
                  fontFamily: appState.globalTheme.fontFamily,
                ),
              ),
            ),
            home: const PreviewScreen(),
          );
        },
      ),
    );
  }
}
