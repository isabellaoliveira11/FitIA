import 'package:flutter/material.dart';

class DetalhesExercicioScreen extends StatelessWidget {
  final String nomeExercicio;

  const DetalhesExercicioScreen({
    super.key,
    required this.nomeExercicio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // sem dark mode
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          '1/9 $nomeExercicio',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              '0:03',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/legpress.png', // imagem fixa por enquanto
                height: 220,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  nomeExercicio,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.info_outline, size: 20, color: Colors.blueGrey),
              ],
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIndicador('Repetições\nsugeridas', '-', color: Colors.lightBlue),
                _buildIndicador('Descanso', '⛔', color: Colors.redAccent),
                _buildIndicador('Séries feitas', '0', color: Colors.grey.shade700),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              'Adicionar comentário',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black87,
                    ),
                    child: const Text('Quilos'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black87,
                    ),
                    child: const Text('Repetições'),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
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
            _buildHistorico('Seg., 14/07/2025', [
              '140 kg x 12 rep. - 19:34',
              '140 kg x 8 rep. - 19:31',
              '130 kg x 10 rep. - 19:27',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicador(String label, String valor, {Color? color}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          // ignore: deprecated_member_use
          backgroundColor: color?.withOpacity(0.1) ?? Colors.grey.shade200,
          child: Text(
            valor,
            style: TextStyle(
              color: color ?? Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13),
        )
      ],
    );
  }

  Widget _buildHistorico(String data, List<String> registros) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        ...registros.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(item),
            )),
      ],
    );
  }
}
