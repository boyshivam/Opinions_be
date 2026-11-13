

class PostModel {
  const PostModel({
    required this.id,
    required this.ownerId,
    required this.title,
    required this.context,
    required this.genre,
    required this.votes,
    required this.postOwner,
    required this.createdAt,
    required this.published,
});

  final int id;
  final int ownerId;
  final String title;
  final String context;
  final String genre;
  final int votes;
  final String postOwner;
  final DateTime createdAt;
  final bool published;
}
