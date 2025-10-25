import 'package:app_instagram_clone/cores/widgets/buttons/ink_well_button.dart';
import 'package:app_instagram_clone/cores/widgets/icons/icon_blue_tick.dart';
import 'package:app_instagram_clone/cores/widgets/others/avatar.dart';
import 'package:flutter/material.dart';

class HeaderPost extends StatelessWidget {
  const HeaderPost({
    super.key,
    required String avatarUrl,
    required bool isStory,
    required bool isWatched,
    required String name,
    required bool isVerified,
  }) : _avatarUrl = avatarUrl,
       _isStory = isStory,
       _isWatched = isWatched,
       _name = name,
       _isVerified = isVerified;

  final String _avatarUrl;
  final bool _isStory;
  final bool _isWatched;
  final String _name;
  final bool _isVerified;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Avatar(
                avatarUrl: _avatarUrl,
                isStory: _isStory,
                isWatched: _isWatched,
                size: 34,
              ),
              const SizedBox(width: 8),
              Text(
                _name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.13,
                ),
              ),
              _isVerified ? const Padding(
                padding: EdgeInsets.only(left: 3.5),
                child: IconBlueTick(size: 10,),
              ) : const SizedBox(),
            ],
          ),
          InkWellButton(onPressed: () {}, child: const Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
