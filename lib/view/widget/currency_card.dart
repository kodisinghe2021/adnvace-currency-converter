import 'package:advance_currency_converter_app/model/currency_flag.dart';
import 'package:advance_currency_converter_app/util/constant/app_colors.dart';
import 'package:advance_currency_converter_app/util/constant/constants.dart';
import 'package:advance_currency_converter_app/util/constant/font_styles.dart';
import 'package:advance_currency_converter_app/view/widget/flag_bottom_sheet.dart';
import 'package:advance_currency_converter_app/view/widget/memory_image.dart';
import 'package:advance_currency_converter_app/view/widget/show_snack.dart';
import 'package:advance_currency_converter_app/view_model/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BaseCurrencyCard extends StatelessWidget {
  const BaseCurrencyCard({
    Key? key,
    required HomeController homeController,
  })  : _homeController = homeController,
        super(key: key);

  final HomeController _homeController;

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
          SizedBox(
            width: screenWidth(context) * .4,
            child: TextFormField(
              controller: _homeController.amountController,
              cursorColor: AppColors.kPrimary,
              cursorWidth: 3,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              style: AppFonts.defTextStyle,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () async {
                      if (double.parse(_homeController.amountController.text) !=
                          0.0) {
                        await _homeController.convertAllList();
                      } else {
                        showWarningSnack("Enter correct amount");
                      }
                      _homeController.saveInputAmount();
                    },
                    icon: const Icon(Icons.arrow_circle_right)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        const BorderSide(color: Color(0xFF4C585B), width: 2)),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            // color: Colors.red,
            width: 100,
            child: StreamBuilder<CurrencyFlag>(
              stream: _homeController.getFlagStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.fallingDot(
                      color: Colors.black45,
                      size: 20,
                    ),
                  );
                }
                if (snapshot.hasData &&
                    snapshot.data!.flag.isNotEmpty &&
                    snapshot.data!.code.isNotEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ByteCodeImage(byteCode: snapshot.data!.flag),
                      const SizedBox(width: 8),
                      Text(
                        snapshot.data!.code,
                        style: AppFonts.defTextStyle,
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          IconButton(
            onPressed: () {
              // get the selected base currency and send the request
              
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return FlagBottomSheet(homeController: _homeController);
                },
              );
            },
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              size: 30,
              color: AppColors.kPrimary,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
