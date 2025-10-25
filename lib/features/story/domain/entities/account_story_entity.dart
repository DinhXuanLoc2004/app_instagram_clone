import 'package:app_instagram_clone/features/story/domain/entities/story_entity.dart';

final class AccountStoryEntity {
  final String _accountId;
  final String _avatarUrl;
  final String _nameAccount;
  final List<StoryEntity> _stories;

  AccountStoryEntity({
    required String accountId,
    required String avatarUrl,
    required String nameAccount,
    required List<StoryEntity> stories,
  }) : _accountId = accountId,
       _avatarUrl = avatarUrl,
       _nameAccount = nameAccount,
       _stories = stories;

  String get accountId => _accountId;

  String get avatarUrl => _avatarUrl;

  String get nameAccount => _nameAccount;

  List<StoryEntity> get stories => _stories;
}
