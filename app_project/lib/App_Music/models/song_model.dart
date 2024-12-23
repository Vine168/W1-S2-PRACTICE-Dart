class Song {
  final String title;
  final String artist;
  final String album;
  final Duration duration; // Change from String to Duration
  final String filePath;
  final String? coverArt; // art file path

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    required this.filePath,
    this.coverArt,
  });

  // Factory constructor to create a Song instance from a file
  factory Song.fromFile(String path) {
    // Example logic: Replace with actual metadata extraction logic
    return Song(
      title: path.split('/').last.split('.').first,
      artist: 'Unknown Artist',
      album: 'Unknown Album',
      duration: const Duration(seconds: 0), // Replace with actual duration
      filePath: path,
    );
  }
}
