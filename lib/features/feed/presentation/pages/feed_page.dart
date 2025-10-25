import 'package:app_instagram_clone/features/feed/presentation/widgets/feed_app_bar.dart';
import 'package:app_instagram_clone/features/post/presentation/widgets/post.dart';
import 'package:app_instagram_clone/features/story/presentation/widgets/stories.dart';
import 'package:app_instagram_clone/features/story/presentation/widgets/story.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const FeedAppBar(),
              const SizedBox(height: 8,),
              Stories(),
              const SizedBox(height: 16,),
              const Post()
            ],
          ),
        ),
      ),
    );
  }
}
