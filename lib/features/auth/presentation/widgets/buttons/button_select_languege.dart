import 'dart:io';

import 'package:app_instagram_clone/cores/configs/translations/enum/langueges.dart';
import 'package:app_instagram_clone/cores/configs/translations/enum/locales.dart';
import 'package:app_instagram_clone/cores/configs/translations/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSelectLanguege extends StatelessWidget {
  const ButtonSelectLanguege({super.key, this.child, required this.context});

  final Widget? child;
  final BuildContext context;

  void _setLocale(Locale locale) {
    Navigator.pop(context);
    context.setLocale(locale);
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _buildCupertinaModalPopup() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text(LocaleKeys.select_languege_title.tr()),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                _setLocale(Locales.en_US.locale);
              },
              child: Text(LocaleKeys.select_languege_english.tr()),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                _setLocale(Locales.vi_VI.locale);
              },
              child: Text(LocaleKeys.select_languege_vietnamese.tr()),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: _cancel,
            child: Text(LocaleKeys.select_languege_cancel.tr()),
          ),
        );
      },
    );
  }

  Icon _buildIcon(bool condition) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return condition == true
        ? Icon(Icons.radio_button_checked, color: colorScheme.primary)
        : Icon(Icons.radio_button_unchecked, color: colorScheme.outline);
  }

  Widget _buildItemSelect(String title, bool condition, Locale locale) {
    return ListTile(
      title: Text(title),
      trailing: _buildIcon(condition),
      onTap: () {
        _setLocale(locale);
      },
    );
  }

  void _buildModalBottomSheet() {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: colorScheme.outlineVariant,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  LocaleKeys.select_languege_title.tr(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            _buildItemSelect(
              LocaleKeys.select_languege_english.tr(),
              Langueges.english.languege == LocaleKeys.language.tr(),
              Locales.en_US.locale,
            ),
            _buildItemSelect(
              LocaleKeys.select_languege_vietnamese.tr(),
              Langueges.vietnamese.languege == LocaleKeys.language.tr(),
              Locales.vi_VI.locale,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
              child: ElevatedButton(
                onPressed: _cancel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                ),
                child: Text(
                  LocaleKeys.select_languege_cancel.tr(),
                  style: TextStyle(color: colorScheme.surfaceContainerLowest),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showLanguegePicker() {
    if (Platform.isIOS) {
      _buildCupertinaModalPopup();
    } else {
      _buildModalBottomSheet();
    }
  }

  Widget _buildChildDefault() {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final Color colorContent = colorScheme.outline;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          LocaleKeys.language.tr(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: colorContent,
          ),
        ),
        const SizedBox(width: 3),
        Icon(Icons.expand_more_outlined, color: colorContent, size: 21),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _showLanguegePicker,
      child: child ?? _buildChildDefault(),
    );
  }
}
