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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/teste.png', // depois você pode mudar para: '${ex.toLowerCase().replaceAll(' ', '')}.png'
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                ex,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
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
