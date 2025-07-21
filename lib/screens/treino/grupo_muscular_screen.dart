import 'package:flutter/material.dart';

class GrupoMuscularScreen extends StatelessWidget {
  const GrupoMuscularScreen({super.key, required this.nomeTreino});

  final String nomeTreino;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Treino: $nomeTreino')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Escolha um grupo muscular:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            ListTile(
              leading: const Icon(Icons.directions_run),
              title: const Text('Quadríceps'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Aqui você pode passar também o nome do treino e o grupo muscular pra próxima tela
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ainda não implementado')),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Bíceps e Costas'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ainda não implementado')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
