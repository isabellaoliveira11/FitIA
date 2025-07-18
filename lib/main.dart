import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'config/theme_config.dart'; // importa aqui

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'FitIA',
      theme: AppTheme.light, // 👈 aplica o nosso tema
    );
  }
}
