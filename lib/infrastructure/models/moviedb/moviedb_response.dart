import 'movie_moviedb.dart';

class MovieDbResponse {
MovieDbResponse({
required this.dates,
required this.page,
required this.results,
required this.totalPages,
required this.totalResults,
});


/// Fechas del rango de estrenos (mínima y máxima) incluidas en la respuesta.
final Dates? dates;

/// Número de página actual dentro de la respuesta paginada.
final int page;

/// Lista de películas devueltas por la API en formato [MovieMovieDB].
final List<MovieMovieDB> results;

/// Total de páginas disponibles en la API.
final int totalPages;

/// Total de resultados (películas) encontrados.
final int totalResults;

/// Convierte el JSON recibido desde la API en una instancia de [MovieDbResponse].
factory MovieDbResponse.fromJson(Map<String, dynamic> json) => MovieDbResponse(
    dates: json["dates"] != null ? Dates.fromJson(json["dates"]) : null,
    page: json["page"],
    results: List<MovieMovieDB>.from(json["results"].map((x) => MovieMovieDB.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
);

/// Convierte la instancia en un mapa JSON, útil para depuración o almacenamiento.
Map<String, dynamic> toJson() => {
    "dates": dates == null ? null : dates!.toJson(),
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
};


}

/// Representa el rango de fechas de las películas en cartelera (máxima y mínima)
/// que devuelve la API de TMDb dentro del objeto `dates`.
class Dates {
Dates({
required this.maximum,
required this.minimum,
});


final DateTime maximum;
final DateTime minimum;

factory Dates.fromJson(Map<String, dynamic> json) => Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
);

Map<String, dynamic> toJson() => {
    "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
    "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
};


}
