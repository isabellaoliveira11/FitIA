import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/treino/treino_screen.dart';
import '../screens/treino/novo_treino_screen.dart';
import '../screens/treino/grupo_muscular_screen.dart';
import '../screens/treino/exercicios/quadriceps_exercises_screen.dart';
import '../screens/treino/exercicios/treino_ativo_screen.dart';
import '../screens/treino/exercicios/detalhes_exercicio_screen.dart';
import '../screens/treino/detalhes_treino_screen.dart';
import '../screens/treino/relatorio_treino_screen.dart'; // ✅ import necessário

import '../models/treino_model.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/treino',
      builder: (context, state) => const TreinoScreen(),
    ),
    GoRoute(
      path: '/treino/novo',
      builder: (context, state) => const NovoTreinoScreen(),
    ),
    GoRoute(
      path: '/treino/grupo',
      builder: (context, state) {
        final nomeTreino = state.extra as String;
        return GrupoMuscularScreen(nomeTreino: nomeTreino);
      },
    ),
    GoRoute(
      path: '/treino/quadriceps',
      builder: (context, state) {
        final nomeTreino = state.extra as String;
        return QuadricepsExercisesScreen(nomeTreino: nomeTreino);
      },
    ),
    GoRoute(
      path: '/treino/detalhes',
      builder: (context, state) {
        final treino = state.extra as TreinoModel;
        return DetalhesTreinoScreen(treino: treino);
      },
    ),
    GoRoute(
      path: '/treino/ativo',
      builder: (context, state) {
        final treino = state.extra as TreinoModel;
        return TreinoAtivoScreen(treino: treino);
      },
    ),
    GoRoute(
      path: '/detalhesExercicio',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        return DetalhesExercicioScreen(
          nomeExercicio: args['nomeExercicio'],
          indexAtual: args['indexAtual'],
          totalExercicios: args['totalExercicios'],
        );
      },
    ),
    GoRoute(
      path: '/relatorio',
      builder: (context, state) {
        final nomeTreino = state.extra as String? ?? 'Treino';
        return RelatorioTreinoScreen(nomeTreino: nomeTreino);
      },
    ),
  ],
);
