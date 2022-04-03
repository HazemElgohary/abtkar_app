import 'package:abtkar_app/generated/assets.dart';
import 'package:equatable/equatable.dart';

import '../helpers/end_points.dart';

class PopularPeopleModel extends Equatable {
  final int page;
  final List<Results> results;
  final int totalPages;
  final int totalResults;

  const PopularPeopleModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularPeopleModel.fromJson(Map<String, dynamic> json) {
    return PopularPeopleModel(
      page: json['page'],
      results: (json['results'] as List)
          .map(
            (e) => Results.fromJson(e),
          )
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}

class Results extends Equatable {
  final bool adult;
  final int id;
  final int gender;
  final String department;
  final String name;
  final num popularity;
  final String profileImage;
  final List<KnowFor> knowFor;

  const Results({
    required this.adult,
    required this.id,
    required this.gender,
    required this.department,
    required this.name,
    required this.popularity,
    required this.profileImage,
    required this.knowFor,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      adult: json['adult'],
      id: json['id'],
      gender: json['gender'],
      department: json['known_for_department'],
      name: json['name'],
      popularity: json['popularity'],
      profileImage: json['profile_path'],
      knowFor: (json['known_for'] as List)
          .map(
            (e) => KnowFor.formJson(e),
          )
          .toList(),
    );
  }

  String get getProfileImage => EndPoints.imageUrl + profileImage;

  @override
  List<Object?> get props => [
        adult,
        id,
        gender,
        department,
        name,
        popularity,
        profileImage,
        knowFor,
      ];
}

class KnowFor extends Equatable {
  final String backdropImage;
  final int id;
  final String mediaType;
  final String lang;
  final String? title;
  final String? originalName;
  final String overview;
  final String posterImage;
  final String? releaseDate;
  final num voteAverage;
  final num voteCount;

  const KnowFor({
    required this.originalName,
    required this.backdropImage,
    required this.id,
    required this.mediaType,
    required this.lang,
    required this.title,
    required this.overview,
    required this.posterImage,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory KnowFor.formJson(Map<String, dynamic> json) {
    return KnowFor(
      originalName: json['original_name'],
      backdropImage: json['backdrop_path'] ?? '',
      id: json['id'],
      mediaType: json['media_type'],
      lang: json['original_language'],
      title: json['title'],
      overview: json['overview'],
      posterImage: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  String get getBackdropImage => backdropImage.isNotEmpty
      ? EndPoints.imageUrl + backdropImage
      : Asset.images.image;

  String get getPosterImage => posterImage.isNotEmpty
      ? EndPoints.imageUrl + posterImage
      : Asset.images.image;

  @override
  List<Object?> get props => [
        originalName,
        backdropImage,
        id,
        mediaType,
        lang,
        title,
        overview,
        posterImage,
        releaseDate,
        voteAverage,
        voteCount,
      ];
}
