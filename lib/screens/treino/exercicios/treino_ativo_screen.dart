import 'dart:async';
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
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final List<String> historico = [];
  late Timer _timer;
  int _elapsedSeconds = 0;

  int get seriesFeitas => historico.length;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void _resetTimer() {
    _timer.cancel();
    _elapsedSeconds = 0;
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    pesoController.dispose();
    repsController.dispose();
    super.dispose();
  }

  void _adicionarSerie() {
    final peso = pesoController.text.trim();
    final reps = repsController.text.trim();

    if (peso.isEmpty || reps.isEmpty) return;

    final hora = TimeOfDay.now().format(context);
    setState(() {
      historico.add('$peso kg x $reps rep. - $hora');
      pesoController.clear();
      repsController.clear();
    });

    _resetTimer();
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final exercicioAtual = widget.treino.exercicios[widget.indiceExercicio];
    final totalExercicios = widget.treino.exercicios.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          '${widget.indiceExercicio + 1}/$totalExercicios',
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/teste.png',
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              exercicioAtual,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoBox('$seriesFeitas', 'Séries feitas', color: Colors.grey.shade800),
                _buildInfoBox(_formatTime(_elapsedSeconds), 'Descanso atual', color: const Color(0xFF7CB77A)),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Nova Série',
              style: TextStyle(
                color: Color(0xFF7CB77A),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                    decoration: _buildInputStyle('Quilos'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: repsController,
                    keyboardType: TextInputType.number,
                    decoration: _buildInputStyle('Repetições'),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _adicionarSerie,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7CB77A),
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(14),
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Histórico',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: historico.isEmpty
                  ? const Text('Nenhuma série registrada ainda.')
                  : ListView.builder(
                      itemCount: historico.length,
                      itemBuilder: (context, index) {
                        final item = historico[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.orangeAccent),
                                    onPressed: () {
                                      // implementar edição se quiser depois
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                                    onPressed: () {
                                      setState(() {
                                        historico.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: _avancarParaProximoExercicio,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Próximo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7CB77A),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String valor, String label, {Color? color}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: (color ?? Colors.grey).withAlpha(30),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            valor,
            style: TextStyle(
              color: color ?? Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  InputDecoration _buildInputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
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
      Navigator.pop(context);
    }
  }
}
