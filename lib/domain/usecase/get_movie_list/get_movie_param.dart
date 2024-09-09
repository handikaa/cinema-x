enum MovieCategory { nowPlaying, upcoming }

class GetMovieListParam {
  final int page;
  final MovieCategory movieCategory;

  GetMovieListParam({this.page = 1, required this.movieCategory});
}
