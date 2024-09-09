String formatRuntime(int runtime) {
  final hours = runtime ~/ 60; // Menghitung jam
  final minutes = runtime % 60; // Sisa menit setelah diambil jamnya
  if (hours > 0) {
    return '$hours h $minutes m';
  } else {
    return '${minutes}m';
  }
}
