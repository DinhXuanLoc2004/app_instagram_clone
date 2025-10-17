import 'package:app_instagram_clone/cores/widgets/icon_message_circle.dart';
import 'package:app_instagram_clone/features/post/presentation/widgets/post_app_bar.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(left: 16, right: 16, top: 8),
              child: Column(
                children: [
                  // PostAppBar()
                ],
              ),
            ),
            Center(
              child: IconMessageCircle(),
            )
          ],
        ),
      ),
    );
  }
}
