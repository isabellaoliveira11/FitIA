import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../providers/treino_provider.dart';
import '../../../models/treino_model.dart';

class QuadricepsExercisesScreen extends StatefulWidget {
  final String nomeTreino;

  const QuadricepsExercisesScreen({super.key, required this.nomeTreino});

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

  void _limparSelecao() {
    setState(() {
      _exercises.updateAll((key, value) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final selecionados = _exercises.values.where((v) => v).length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nomeTreino),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Selecionado: $selecionados',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _exercises.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final nome = _exercises.keys.elementAt(index);
                final selecionado = _exercises[nome]!;

                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    setState(() {
                      _exercises[nome] = !selecionado;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        const BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.03),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/leg-press.png', // troque conforme o exercício
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            nome,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Icon(
                          selecionado
                              ? Icons.check_circle_rounded
                              : Icons.radio_button_unchecked,
                          color: selecionado ? Colors.teal : Colors.grey.shade300,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Botões de ação fixos
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _limparSelecao,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: const Text(
                      'LIMPAR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final selected = _exercises.entries
                          .where((e) => e.value)
                          .map((e) => e.key)
                          .toList();

                      if (selected.isNotEmpty) {
                        final treino = TreinoModel(
                          nome: widget.nomeTreino,
                          exercicios: selected,
                        );
                        context.read<TreinoProvider>().adicionarTreino(treino);
                        context.go('/treino');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Selecione ao menos um exercício'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'ADICIONAR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
