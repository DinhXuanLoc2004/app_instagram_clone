import 'package:app_instagram_clone/configs/theme/color/color_config.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required String avatarUrl,
    required bool isStory,
    required bool isWatched,
    double size = _SIZE_DEFAULT,
  }) : _avatarUrl = avatarUrl,
       _isStory = isStory,
       _isWatched = isWatched,
       _size = size;

  static const double _SIZE_DEFAULT = 78;

  final String _avatarUrl;
  final bool _isStory;
  final bool _isWatched;
  final double _size;

  double _paddingOutSide() => !_isStory ? 0 : _size * 0.0385;

  double _paddingInSide() => (_size - (_size * 0.0385)) * 0.04;

  BoxDecoration _buildBoxDecorationOutSide() {
    return _isStory && !_isWatched
        ? const BoxDecoration(
            shape: BoxShape.circle,
            gradient: ColorConfig.COLOR_STORY,
          )
        : _isStory && _isWatched
        ? const BoxDecoration(shape: BoxShape.circle, color: Colors.grey)
        : const BoxDecoration(shape: BoxShape.circle);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return Container(
      padding: EdgeInsets.all(_paddingOutSide()),
      width: _size,
      height: _size,
      decoration: _buildBoxDecorationOutSide(),
      child: Container(
        padding: EdgeInsets.all(_paddingInSide()),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorScheme.surface,
        ),
        child: ClipOval(
          child: Image.network(
            _avatarUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
