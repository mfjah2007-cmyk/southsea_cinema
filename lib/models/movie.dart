class Movie {
  final String id;
  final String title;
  final String synopsis;
  final String ageRating;
  final String screeningTime;
  final double ticketPrice;
  final String imagePath;

  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.screeningTime,
    required this.ticketPrice,
    required this.imagePath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as String,
      title: json['title'] as String,
      synopsis: json['synopsis'] as String,
      ageRating: json['ageRating'] as String,
      screeningTime: json['screeningTime'] as String,
      ticketPrice: (json['ticketPrice'] as num).toDouble(),
      imagePath: json['imagePath'] as String,
    );
  }

 
  String get formattedPrice {
    return '£${ticketPrice.toStringAsFixed(2)}';
  }
}
