import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/app_router.dart';
import 'providers/treino_provider.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TreinoProvider()),
      ],
      child: const FitIAApp(),
    ),
  );
}

class FitIAApp extends StatelessWidget {
  const FitIAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.light,
      themeMode: ThemeMode.system, // alterna automaticamente
    );
  }
}
