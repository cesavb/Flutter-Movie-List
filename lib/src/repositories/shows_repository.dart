import 'package:dio/dio.dart';
import '../models/shows_models.dart';
// import '../models/info_models.dart';
import '../models/ep_models.dart';

class RepositoryShows {
  final client = Dio(BaseOptions(baseUrl: 'https://api.tvmaze.com'));

  Future<List<ShowsModels>> fetchshow(pagina) async {
    final response = await client.get('/shows?page=$pagina');
    final list = response.data as List;

    return list.map((json) => ShowsModels.fromJson(json)).toList();
  }

  Future<List<EpModels>> fetchep(id) async {
    final response = await client.get('/shows/$id/episodes');
    final list = response.data as List;

    return list.map((json) => EpModels.fromJson(json)).toList();
  }

  Future<List<ShowsModels>> fetchsearch(searchFieldLabel) async {
    final response = await client.get('/shows?q=$searchFieldLabel');
    final list = response.data as List;

    return list.map((json) => ShowsModels.fromJson(json)).toList();
  }
}
