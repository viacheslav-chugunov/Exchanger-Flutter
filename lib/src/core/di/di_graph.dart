import 'package:get_it/get_it.dart';

abstract class DiGraph {
  final di = GetIt.instance;

  Future<void> init();

  E inject<E extends Object>({String? instanceName}) {
    return di.get<E>();
  }
}