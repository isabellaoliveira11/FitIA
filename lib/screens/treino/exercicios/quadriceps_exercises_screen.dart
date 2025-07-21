import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // IMPORTANTE
import 'package:provider/provider.dart';
import '../../../providers/treino_provider.dart';
import '../../../models/treino_model.dart';

class QuadricepsExercisesScreen extends StatefulWidget {
  final String nomeTreino;

  const QuadricepsExercisesScreen({
    super.key,
    required this.nomeTreino,
  });

  @override
  State<QuadricepsExercisesScreen> createState() => _QuadricepsExercisesScreenState();
}

class _QuadricepsExercisesScreenState extends State<QuadricepsExercisesScreen> {
  final Map<String, bool> _exercises = {
    'Agachamento Livre': false,
    'Cadeira Extensora': false,
    'Leg Press': false,
    'Avanço (Afundo)': false,
    'Agachamento no Smith': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treino: ${widget.nomeTreino}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: _exercises.keys.map((exercise) {
                  return CheckboxListTile(
                    title: Text(exercise),
                    value: _exercises[exercise],
                    onChanged: (bool? value) {
                      setState(() {
                        _exercises[exercise] = value ?? false;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final selected = _exercises.entries
                    .where((e) => e.value)
                    .map((e) => e.key)
                    .toList();

                if (selected.isNotEmpty) {
                  // Salvar no Provider
                  final treino = TreinoModel(
                    nome: widget.nomeTreino,
                    exercicios: selected,
                  );
                  context.read<TreinoProvider>().adicionarTreino(treino);

                  // Voltar para a tela de treinos
                  context.go('/treino');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Selecione ao menos um exercício')),
                  );
                }
              },
              child: const Text('Salvar Treino'),
            )
          ],
        ),
      ),
    );
  }
}
