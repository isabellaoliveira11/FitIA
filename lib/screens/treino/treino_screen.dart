import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TreinoScreen extends StatelessWidget {
  const TreinoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Treinos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Card de treino (futuro - dinâmico)
            Card(
              child: ListTile(
                title: const Text('Treino de Quadríceps'),
                subtitle: const Text('Agachamento, Leg Press, Cadeira Extensora'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // futuramente mostrar detalhes do treino
                },
              ),
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: () => context.go('/treino/novo'),
            icon: const Icon(Icons.add),
            label: const Text("Adicionar novo treino"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          ],
        ),
      ),
    );
  }
}
