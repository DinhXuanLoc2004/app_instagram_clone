import 'package:app_instagram_clone/cores/widgets/avatar.dart';
import 'package:app_instagram_clone/features/story/domain/entities/account_story_entity.dart';
import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  const Story({super.key, required AccountStoryEntity accountStoryEntity})
    : _accountStoryEntity = accountStoryEntity;

  final AccountStoryEntity _accountStoryEntity;

  // 225deg, #7638FA 0%, #D300C5 17%, #FF0069 36%, #FF7A00 62.5%, #FFD600 83.5%

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return UnconstrainedBox(
      child: Column(
        children: [
          Avatar(
            avatarUrl: _accountStoryEntity.avatarUrl,
            isStory: _accountStoryEntity.stories.isNotEmpty,
            isWatched: _accountStoryEntity.stories
                .where((element) => element.isWatched == false)
                .isEmpty,
          ),
          const SizedBox(height: 4),
          Text(
            _accountStoryEntity.nameAccount,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.33,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
