import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NovoTreinoScreen extends StatefulWidget {
  const NovoTreinoScreen({super.key});

  @override
  State<NovoTreinoScreen> createState() => _NovoTreinoScreenState();
}

class _NovoTreinoScreenState extends State<NovoTreinoScreen> {
  final TextEditingController _controller = TextEditingController();

  void _continuar() {
    final nomeTreino = _controller.text.trim();
    if (nomeTreino.isNotEmpty) {
      context.go('/treino/grupo', extra: nomeTreino);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite um nome para o treino')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Novo Treino")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nome do treino:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ex: Treino A - Perna',
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _continuar,
                child: const Text("Avançar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
