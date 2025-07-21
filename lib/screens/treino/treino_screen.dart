import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:fitia_app/providers/treino_provider.dart';

class TreinoScreen extends StatelessWidget {
  const TreinoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final treinos = context.watch<TreinoProvider>().treinos;

    return Scaffold(
      appBar: AppBar(title: const Text('Meus Treinos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // LISTA DINÂMICA
            Expanded(
              child: treinos.isEmpty
                  ? const Center(child: Text("Nenhum treino adicionado ainda."))
                  : ListView.builder(
                      itemCount: treinos.length,
                      itemBuilder: (context, index) {
                        final treino = treinos[index];
                        return Card(
                          child: ListTile(
                            title: Text(treino.nome),
                            subtitle: Text(treino.exercicios.join(', ')),
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {
                              // futuramente: ir para detalhes do treino
                            },
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 16),
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
