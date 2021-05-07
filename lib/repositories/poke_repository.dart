import 'package:dartz/dartz.dart';
import '../core/errors.dart';
import '../models/pokemon_model.dart';

abstract class PokeRepository {
  Future<Either<Failure, List<PokemonModel>>> fetch(
      {int offset = 0, int limit = 20});
}
