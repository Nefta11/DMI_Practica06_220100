import 'package:cinemapedia_220100/domain/entities/actor.dart';


abstract class ActorsRepository {

  Future<List<Actor>> getActorsByMovie( String movieId );

}