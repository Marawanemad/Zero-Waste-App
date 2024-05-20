class BoardingModel {
  final String image;
  final String title;
  final String? body;
  final bool isLast;
  BoardingModel({
    this.isLast = false,
    required this.image,
    required this.title,
    required this.body,
  });
}
