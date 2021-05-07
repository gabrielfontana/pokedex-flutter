import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../core/errors.dart';
import '../core/app_api.dart';
import '../models/pokemon_model.dart';
import 'poke_repository.dart';

class PokeRepositoryImpl implements PokeRepository {
  @override
  Future<Either<Failure, List<PokemonModel>>> fetch(
      {int offset = 0, int limit = 20}) async {
    try {
      final dio = Dio();
      final response = await dio.get(
        '$kBaseUrl/pokemon?offset=$offset&limit=$limit',
      );
      //print('${response.data}');
      //print('${response.data['results'][0]['name']}');
      final data = response.data['results'] as List;
      final pokemons =
          data.map((pokemon) => PokemonModel.fromMap(pokemon)).toList();
      return Right(pokemons);
    } on DioError catch (error) {
      return Left(ApiError(error.message));
    } catch (error) {
      return Left(UnknownError(error.toString()));
    }
  }
}
