import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class GrupoMuscularScreen extends StatelessWidget {
  const GrupoMuscularScreen({super.key, required this.nomeTreino});
  final String nomeTreino;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gruposMusculares = [
      {'nome': 'Quadríceps', 'rota': '/treino/quadriceps', 'ativo': true},
      {'nome': 'Bíceps e Costas', 'rota': '/treino/biceps-costas', 'ativo': false},
      {'nome': 'Peito', 'rota': '/treino/peito', 'ativo': false},
      {'nome': 'Ombros', 'rota': '/treino/ombros', 'ativo': false},
      {'nome': 'Posterior e Glúteo', 'rota': '/treino/posterior-gluteo', 'ativo': false},
      {'nome': 'Panturrilha', 'rota': '/treino/panturrilha', 'ativo': false},
      {'nome': 'Abdômen', 'rota': '/treino/abdomen', 'ativo': false},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Treino: $nomeTreino',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Escolha um grupo muscular",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.separated(
                itemCount: gruposMusculares.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final grupo = gruposMusculares[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      if (grupo['ativo'] as bool) {
                        context.go(grupo['rota'] as String, extra: nomeTreino);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${grupo['nome']} ainda não implementado')),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          // Imagem com sombra e borda arredondada
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromRGBO(0, 0, 0, 0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/teste.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Texto do grupo
                          Expanded(
                            child: Text(
                              grupo['nome'] as String,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          // Ícone de seta
                          Icon(Icons.chevron_right, color: Colors.grey.shade500),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
