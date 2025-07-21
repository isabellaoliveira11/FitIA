import 'package:flutter/material.dart';

class QuadricepsExercisesScreen extends StatefulWidget {
  const QuadricepsExercisesScreen({super.key});

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
        title: const Text('Exercícios de Quadríceps'),
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
                final selected = _exercises.entries.where((e) => e.value).map((e) => e.key).toList();
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Exercícios Selecionados'),
                    content: Text(selected.join('\n')),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('Fechar'))
                    ],
                  ),
                );
              },
              child: const Text('Salvar Treino'),
            )
          ],
        ),
      ),
    );
  }
}
