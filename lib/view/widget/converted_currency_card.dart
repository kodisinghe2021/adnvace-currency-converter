import 'package:advance_currency_converter_app/model/currency_flag.dart';
import 'package:advance_currency_converter_app/util/constant/app_colors.dart';
import 'package:advance_currency_converter_app/util/constant/constants.dart';
import 'package:advance_currency_converter_app/util/constant/font_styles.dart';
import 'package:advance_currency_converter_app/view/widget/flag_bottom_sheet.dart';
import 'package:advance_currency_converter_app/view/widget/memory_image.dart';
import 'package:advance_currency_converter_app/view_model/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ConvertedCurrencyCard extends StatelessWidget {
  const ConvertedCurrencyCard({
    key,
    required this.currencyFlag,
    required this.rate,
  });

  final CurrencyFlag currencyFlag;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * .1,
      decoration: BoxDecoration(
          color: AppColors.kPrimary.withOpacity(.1),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          Text(
            ((rate*1000).round()/1000).toString(), // toString(),
            style: TextStyle(fontSize: 18),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ByteCodeImage(byteCode: currencyFlag.flag),
              const SizedBox(width: 8),
              Text(
                currencyFlag.code,
                style: AppFonts.defTextStyle,
              ),
              const SizedBox(width: 30),
            ],
          ),
        ],
      ),
    );
  }
}
