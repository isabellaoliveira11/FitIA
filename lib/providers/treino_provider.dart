import 'package:flutter/material.dart';
import '../models/treino_model.dart';

class TreinoProvider with ChangeNotifier {
  final List<TreinoModel> _treinos = [];

  List<TreinoModel> get treinos => _treinos;

  void adicionarTreino(TreinoModel treino) {
    _treinos.add(treino);
    notifyListeners();
  }

  void removerTreino(int index) {
    _treinos.removeAt(index);
    notifyListeners();
  }
}
