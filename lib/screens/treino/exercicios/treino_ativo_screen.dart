import 'package:flutter/material.dart';
import '../../../models/treino_model.dart';

class TreinoAtivoScreen extends StatefulWidget {
  final TreinoModel treino;
  final int indiceExercicio;

  const TreinoAtivoScreen({
    super.key,
    required this.treino,
    this.indiceExercicio = 0,
  });

  @override
  State<TreinoAtivoScreen> createState() => _TreinoAtivoScreenState();
}

class _TreinoAtivoScreenState extends State<TreinoAtivoScreen> {
  int seriesFeitas = 0;

  @override
  Widget build(BuildContext context) {
    final exercicioAtual = widget.treino.exercicios[widget.indiceExercicio];
    final totalExercicios = widget.treino.exercicios.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.indiceExercicio + 1}/$totalExercicios $exercicioAtual'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do exercício
            Center(
              child: Image.asset(
                'assets/images/${exercicioAtual.toLowerCase().replaceAll(' ', '')}.png',
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Imagem não encontrada',
                    style: TextStyle(color: Colors.red),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            Text(
              exercicioAtual,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCircle('-', 'Repetições\nsugeridas'),
                _buildInfoCircle('⏸️', 'Descanso'),
                _buildInfoCircle('$seriesFeitas', 'Séries feitas'),
              ],
            ),

            const SizedBox(height: 16),
            const Text(
              'Adicionar comentário',
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _BotaoCinza(texto: 'Quilos'),
                _BotaoCinza(texto: 'Repetições'),
                Icon(Icons.add_circle, color: Colors.teal),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              'Histórico',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text('Seg., 14/07/2025'),
            const Text('140 kg x 12 rep. - 19:34'),
            const Text('140 kg x 8 rep. - 19:31'),
            const Text('130 kg x 10 rep. - 19:27'),

            const Spacer(),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: _avancarParaProximoExercicio,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Próximo'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCircle(String valor, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade200,
          child: Text(
            valor,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  void _avancarParaProximoExercicio() {
    if (widget.indiceExercicio + 1 < widget.treino.exercicios.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => TreinoAtivoScreen(
            treino: widget.treino,
            indiceExercicio: widget.indiceExercicio + 1,
          ),
        ),
      );
    } else {
      Navigator.pop(context); // Final do treino
    }
  }
}

class _BotaoCinza extends StatelessWidget {
  final String texto;

  const _BotaoCinza({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(texto),
    );
  }
}
