import 'package:flutter/material.dart';
import '../../models/treino_model.dart';
import 'exercicios/treino_ativo_screen.dart';

class DetalhesTreinoScreen extends StatelessWidget {
  final TreinoModel treino;

  const DetalhesTreinoScreen({
    super.key,
    required this.treino,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(treino.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Exercícios:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            ...treino.exercicios.map(
              (ex) => Card(
                child: ListTile(
                  leading: const Icon(Icons.fitness_center),
                  title: Text(ex),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TreinoAtivoScreen(treino: treino),
                    ),
                  );
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('Iniciar treino'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
