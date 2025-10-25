import 'package:app_instagram_clone/configs/logger/log.dart';
import 'package:app_instagram_clone/features/story/domain/entities/account_story_entity.dart';
import 'package:app_instagram_clone/features/story/domain/entities/story_entity.dart';
import 'package:app_instagram_clone/features/story/presentation/widgets/story.dart';
import 'package:app_instagram_clone/features/story/presentation/widgets/story_for_user.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  Stories({super.key});

  final List<AccountStoryEntity> items = [
    AccountStoryEntity(
      accountId: '1',
      avatarUrl:
          'https://static.wikia.nocookie.net/mushokutensei/images/3/30/Fitz-ln-thumb.jpg/revision/latest?cb=20210605181625&path-prefix=vi',
      nameAccount: 'Sylphiette',
      stories: [
        // StoryEntity(
        //   idStory: '1.1',
        //   contentUrl: '',
        //   isWatched: true,
        //   createdAt: DateTime(2025),
        //   expiredAt: DateTime(2025),
        // ),
      ],
    ),
    AccountStoryEntity(
      accountId: '2',
      avatarUrl:
          'https://static.wikia.nocookie.net/mushokutensei/images/3/30/Fitz-ln-thumb.jpg/revision/latest?cb=20210605181625&path-prefix=vi',
      nameAccount: 'Sylphiette',
      stories: [
        StoryEntity(
          idStory: '1.1',
          contentUrl: '',
          isWatched: false,
          createdAt: DateTime(2025),
          expiredAt: DateTime(2025),
        ),
      ],
    ),
    AccountStoryEntity(
      accountId: '3',
      avatarUrl:
          'https://static.wikia.nocookie.net/mushokutensei/images/3/30/Fitz-ln-thumb.jpg/revision/latest?cb=20210605181625&path-prefix=vi',
      nameAccount: 'Sylphiette',
      stories: [
        StoryEntity(
          idStory: '1.1',
          contentUrl: '',
          isWatched: false,
          createdAt: DateTime(2025),
          expiredAt: DateTime(2025),
        ),
      ],
    ),
    AccountStoryEntity(
      accountId: '4',
      avatarUrl:
          'https://static.wikia.nocookie.net/mushokutensei/images/3/30/Fitz-ln-thumb.jpg/revision/latest?cb=20210605181625&path-prefix=vi',
      nameAccount: 'Sylphiette',
      stories: [
        StoryEntity(
          idStory: '1.1',
          contentUrl: '',
          isWatched: false,
          createdAt: DateTime(2025),
          expiredAt: DateTime(2025),
        ),
      ],
    ),
    AccountStoryEntity(
      accountId: '5',
      avatarUrl:
          'https://static.wikia.nocookie.net/mushokutensei/images/3/30/Fitz-ln-thumb.jpg/revision/latest?cb=20210605181625&path-prefix=vi',
      nameAccount: 'Sylphiette',
      stories: [
        StoryEntity(
          idStory: '1.1',
          contentUrl: '',
          isWatched: false,
          createdAt: DateTime(2025),
          expiredAt: DateTime(2025),
        ),
      ],
    ),
    AccountStoryEntity(
      accountId: '6',
      avatarUrl:
          'https://static.wikia.nocookie.net/mushokutensei/images/3/30/Fitz-ln-thumb.jpg/revision/latest?cb=20210605181625&path-prefix=vi',
      nameAccount: 'Sylphiette',
      stories: [
        StoryEntity(
          idStory: '1.1',
          contentUrl: '',
          isWatched: false,
          createdAt: DateTime(2025),
          expiredAt: DateTime(2025),
        ),
      ],
    ),
    AccountStoryEntity(
      accountId: '7',
      avatarUrl:
          'https://static.wikia.nocookie.net/mushokutensei/images/3/30/Fitz-ln-thumb.jpg/revision/latest?cb=20210605181625&path-prefix=vi',
      nameAccount: 'Sylphiette',
      stories: [
        StoryEntity(
          idStory: '1.1',
          contentUrl: '',
          isWatched: false,
          createdAt: DateTime(2025),
          expiredAt: DateTime(2025),
        ),
      ],
    ),
    AccountStoryEntity(
      accountId: '8',
      avatarUrl:
          'https://static.wikia.nocookie.net/mushokutensei/images/3/30/Fitz-ln-thumb.jpg/revision/latest?cb=20210605181625&path-prefix=vi',
      nameAccount: 'Sylphiette',
      stories: [
        StoryEntity(
          idStory: '1.1',
          contentUrl: '',
          isWatched: false,
          createdAt: DateTime(2025),
          expiredAt: DateTime(2025),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return const StoryForUser();

          final item = items[index - 1];
          if (index == items.length) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Story(accountStoryEntity: item),
            );
          }
          return Story(accountStoryEntity: item);
        },
        separatorBuilder: (BuildContext context, int index) {
          Log.debug('index:: $index');
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}
