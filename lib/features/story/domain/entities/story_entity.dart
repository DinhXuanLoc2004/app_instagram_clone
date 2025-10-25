final class StoryEntity {
  final String _idStory;
  final String _contentUrl;
  bool _isWatched;
  final DateTime _createdAt;
  final DateTime _expiredAt;

  StoryEntity({
    required String idStory,
    required String contentUrl,
    required bool isWatched,
    required DateTime createdAt,
    required DateTime expiredAt,
  }) : _idStory = idStory,
       _contentUrl = contentUrl,
       _isWatched = isWatched,
       _createdAt = createdAt,
       _expiredAt = expiredAt;

  void actionWatched() {
    _isWatched = true;
  }

  String get idStory => _idStory;

  String get contentUrl => _contentUrl;

  bool get isWatched => _isWatched;

  DateTime get createdAt => _createdAt;

  DateTime get expiredAt => _expiredAt;
}
