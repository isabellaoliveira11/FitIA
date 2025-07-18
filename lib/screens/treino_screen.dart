import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TreinoScreen extends StatelessWidget {
  const TreinoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela de Treino')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Voltar pra Home'),
        ),
      ),
    );
  }
}
