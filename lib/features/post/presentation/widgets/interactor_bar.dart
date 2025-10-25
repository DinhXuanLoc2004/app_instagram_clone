import 'package:app_instagram_clone/cores/widgets/buttons/ink_well_button.dart';
import 'package:app_instagram_clone/cores/widgets/buttons/text_button_icon.dart';
import 'package:app_instagram_clone/cores/widgets/icons/icon_bookmart.dart';
import 'package:app_instagram_clone/cores/widgets/icons/icon_comment_circle.dart';
import 'package:app_instagram_clone/cores/widgets/icons/icon_repeat.dart';
import 'package:app_instagram_clone/cores/widgets/icons/icon_send.dart';
import 'package:flutter/material.dart';

class InteractorBar extends StatelessWidget {
  const InteractorBar({
    super.key,
    required int countFavorite,
    required int countComment,
    required int countRepost,
    required int countShare,
  }) : _countFavorite = countFavorite,
       _countComment = countComment,
       _countRepost = countRepost,
       _countShare = countShare;

  final int _countFavorite;
  final int _countComment;
  final int _countRepost;
  final int _countShare;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              TextButtonIcon(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                lable: _countFavorite.toString(),
              ),
              const SizedBox(width: 12),
              TextButtonIcon(
                onPressed: () {},
                icon: const IconCommentCircle(),
                lable: 
                _countComment.toString(),
              ),
              const SizedBox(width: 12),
              TextButtonIcon(
                onPressed: () {},
                icon: const IconRepeat(),
                lable: _countRepost.toString(),
              ),
              const SizedBox(width: 12),
              TextButtonIcon(
                onPressed: () {},
                icon: const IconSend(),
                lable: _countShare.toString(),
              ),
            ],
          ),
          InkWellButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 2.73),
              child: IconBookmart(),
            ),
          ),
        ],
      ),
    );
  }
}
