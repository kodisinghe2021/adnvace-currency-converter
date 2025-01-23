import 'package:advance_currency_converter_app/util/constant/font_styles.dart';
import 'package:flutter/material.dart';

class HeightAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double maxHeight;

  const HeightAppBar({
    required this.title,
    required this.maxHeight,
    key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_back_rounded, color: Color(0xFF9AA6B2),),
            const Spacer(),
            Text(
              title,
              style: AppFonts.titleTextStyle,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(maxHeight);
}
