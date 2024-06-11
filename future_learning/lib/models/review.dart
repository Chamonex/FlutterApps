class Review {
  final double score;
  final String review;

  Review({
    required this.score,
    required this.review,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      score: json['score'],
      review: json['review'],
    );
  }


}
