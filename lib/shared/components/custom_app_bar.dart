import 'package:flutter/material.dart';
import 'package:queen/queen.dart';

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
        style: context.headline3?.copyWith(
          color: titleColor,
        ),
      ),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => AppBar(
    bottom: bottom,
  ).preferredSize;
}