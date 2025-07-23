import 'package:flutter/material.dart';

class DetalhesExercicioScreen extends StatefulWidget {
  final String nomeExercicio;

  const DetalhesExercicioScreen({super.key, required this.nomeExercicio});

  @override
  State<DetalhesExercicioScreen> createState() => _DetalhesExercicioScreenState();
}

class _DetalhesExercicioScreenState extends State<DetalhesExercicioScreen> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final List<String> historico = [];

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          '1/9 ${widget.nomeExercicio}',
          style: const TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              '00:03',
              style: TextStyle(color: Color.fromARGB(136, 206, 183, 204)),
            ),
          ),
        ],
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
                  'assets/images/legpress.png',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  widget.nomeExercicio,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.info_outline, color: Colors.grey),
              ],
            ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIndicador('Repetições\nsugeridas', '-', Icons.repeat, Colors.blue),
                _buildIndicador('Descanso', '⏸️', Icons.timer_off, Colors.orange),
                _buildIndicador('Séries feitas', '${historico.length}', Icons.check, Colors.teal),
              ],
            ),

            const SizedBox(height: 28),
            const Text(
              'Nova Série',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),

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
                    backgroundColor: Colors.black,
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
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            if (historico.isEmpty)
              const Text('Nenhuma série registrada ainda.')
            else
              ...historico.reversed.map((linha) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      linha,
                      style: const TextStyle(fontSize: 15),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                      onPressed: () {
                        setState(() {
                          historico.remove(linha);
                        });
                      },
                    ),
                  )),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicador(String label, String valor, IconData icon, Color cor) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: cor.withOpacity(0.1),
          radius: 28,
          child: Icon(icon, color: cor),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12.5),
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
}
