import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RelatorioTreinoScreen extends StatelessWidget {
  final String nomeTreino;

  const RelatorioTreinoScreen({super.key, required this.nomeTreino});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dataAtual = _formatarData(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFFAF7FC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho
              Center(
                child: Column(
                  children: [
                    const Icon(Icons.emoji_events, size: 60, color: Colors.green),
                    const SizedBox(height: 12),
                    Text(
                      "Parabéns!",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Você concluiu o treino \"$nomeTreino\"",
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Card de resumo
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Resumo do Treino", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    _buildLinhaResumo("Data:", dataAtual),
                    _buildLinhaResumo("Exercícios:", "9"),
                    _buildLinhaResumo("Séries Registradas:", "27"),
                    _buildLinhaResumo("Duração:", "42 minutos"),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Botão de voltar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[100],
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Voltar para Início"),
                ),
              ),
            ],
          ),
        ),
      ),

      // BottomNavigationBar com GoRouter
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        iconSize: 20,
        elevation: 6,
        onTap: (index) {
          if (index == 0) context.go('/');
          if (index == 1) context.go('/treino');
          if (index == 2) context.go('/perfil');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Treinos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  Widget _buildLinhaResumo(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titulo, style: const TextStyle(color: Colors.grey)),
          Text(valor),
        ],
      ),
    );
  }

  String _formatarData(DateTime data) {
    final dia = data.day.toString().padLeft(2, '0');
    final mes = data.month.toString().padLeft(2, '0');
    final ano = data.year.toString();
    return "$dia/$mes/$ano";
  }
}
