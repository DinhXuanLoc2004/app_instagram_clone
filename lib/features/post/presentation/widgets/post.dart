import 'package:app_instagram_clone/cores/widgets/buttons/ink_well_button.dart';
import 'package:app_instagram_clone/cores/widgets/buttons/text_button_icon.dart';
import 'package:app_instagram_clone/cores/widgets/custom_painters/comment_circle_custom_paint.dart';
import 'package:app_instagram_clone/cores/widgets/icons/icon_comment_circle.dart';
import 'package:app_instagram_clone/cores/widgets/icons/icon_repeat.dart';
import 'package:app_instagram_clone/cores/widgets/icons/icon_send.dart';
import 'package:app_instagram_clone/cores/widgets/others/avatar.dart';
import 'package:app_instagram_clone/cores/widgets/buttons/button_base.dart';
import 'package:app_instagram_clone/features/post/presentation/widgets/caption.dart';
import 'package:app_instagram_clone/features/post/presentation/widgets/header_post.dart';
import 'package:app_instagram_clone/features/post/presentation/widgets/interactor_bar.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  static const String lorem =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return Column(
      children: [
        const HeaderPost(
          avatarUrl:
              'https://static.wikia.nocookie.net/mushokutensei/images/3/30/Fitz-ln-thumb.jpg/revision/latest?cb=20210605181625&path-prefix=vi',
          isStory: true,
          isWatched: false,
          name: 'Dinh Xuan Loc',
          isVerified: true,
        ),
        Image.network(
          'https://static.wikia.nocookie.net/mushokutensei/images/3/30/Fitz-ln-thumb.jpg/revision/latest?cb=20210605181625&path-prefix=vi',
          fit: BoxFit.fitWidth,
        ),
        const InteractorBar(
          countFavorite: 1136,
          countComment: 36,
          countRepost: 1152,
          countShare: 7,
        ),
        const Caption(name: 'Dinh Xuan Loc', caption: lorem),
      ],
    );
  }
}
