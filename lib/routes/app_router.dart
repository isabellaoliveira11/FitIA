import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/treino/treino_screen.dart';
import '../screens/treino/novo_treino_screen.dart';
import '../screens/treino/grupo_muscular_screen.dart';
import '../screens/treino/exercicios/quadriceps_exercises_screen.dart';

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
  ],
);
