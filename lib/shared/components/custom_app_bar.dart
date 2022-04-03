import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import 'package:queen/themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle = true;
  final bool enableLeading;
  final List<Widget>? actions;
  final void Function()? leadingOnTap;
  final VoidCallback? onTapBack;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? leadingIconColor;
  final Color? titleColor;

  const CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.leadingOnTap,
    this.bottom,
    this.backgroundColor,
    this.leadingIconColor,
    this.titleColor,
    this.onTapBack,
    this.enableLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: (backgroundColor == null)
          ? context.theme.backgroundColor
          : backgroundColor,
      centerTitle: centerTitle,
      leading: enableLeading
          ? () {
        if (context.canPop) {
          return IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onTapBack ??
                ((leadingOnTap == null)
                    ? () => Navigator.pop(context)
                    : leadingOnTap),
            color: leadingIconColor ?? context.theme.primaryColor,
          );
        }
      }()
          : null,
      title: Text(
        title ?? '',
        style: context.subtitle1?.copyWith(
          color: titleColor,
        ),
      ),
      actions:  [Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DarlightButton(
          onChange: (ThemeMode theme) {
            AppTheme.next();
          },
        ),
      )],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => AppBar(
    bottom: bottom,
  ).preferredSize;
}