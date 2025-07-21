import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdicionarTreinoScreen extends StatelessWidget {
  const AdicionarTreinoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Treino')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botão Voltar
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text("Voltar"),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Selecione o grupo muscular:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Botão para Quadríceps
            ListTile(
              leading: const Icon(Icons.directions_run),
              title: const Text('Quadríceps'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.go('/treino/novo/quadriceps'),
            ),

            // Outros grupos (por enquanto inativos)
            ListTile(
              leading: const Icon(Icons.accessibility),
              title: const Text('Posterior e Glúteos'),
              trailing: const Icon(Icons.lock),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Em breve')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Bíceps e Costas'),
              trailing: const Icon(Icons.lock),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Em breve')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
