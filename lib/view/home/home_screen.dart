import 'package:advance_currency_converter_app/model/currency_flag.dart';
import 'package:advance_currency_converter_app/model/hive_model/hive_currency_model.dart';
import 'package:advance_currency_converter_app/service/local_service/local_storing_service.dart';
import 'package:advance_currency_converter_app/util/constant/app_colors.dart';
import 'package:advance_currency_converter_app/util/constant/constants.dart';
import 'package:advance_currency_converter_app/util/constant/font_styles.dart';
import 'package:advance_currency_converter_app/view/widget/add_converter.dart';
import 'package:advance_currency_converter_app/view/widget/converted_currency_card.dart';
import 'package:advance_currency_converter_app/view/widget/currency_card.dart';
import 'package:advance_currency_converter_app/view/widget/height_App_bar.dart';
import 'package:advance_currency_converter_app/view_model/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: SafeArea(
        child: Scaffold(
          appBar: HeightAppBar(
              title: "Advanced Exchanger",
              maxHeight: screenHeight(context) * .1),
          body: SizedBox(
            width: screenWidth(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "INSERT AMOUNT: ",
                          style: AppFonts.header1TextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    BaseCurrencyCard(homeController: _homeController),
                    const SizedBox(height: 20),
                    Divider(
                      thickness: 1,
                      color: AppColors.kPrimary.withOpacity(.3),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "CONVERT TO: ",
                          style: AppFonts.header1TextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (LocalStoringService().currencyListener() != null) ...{
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: screenHeight(context) * .55),
                        child: ValueListenableBuilder<Box<dynamic>>(
                          valueListenable:
                              LocalStoringService().currencyListener()!,
                          builder: (context, value, child) {
                            
                            List<HiveCurrencyModel> models = value.values
                                .whereType<HiveCurrencyModel>()
                                .cast<HiveCurrencyModel>()
                                .toList();
                
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: ListView.separated(
                                itemCount: models.length,
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                 return const SizedBox(height: 10);
                                },
                                itemBuilder: (context, index) {
                                  return ConvertedCurrencyCard(
                                    currencyFlag: CurrencyFlag(
                                      code: models[index].code,
                                      name: models[index].name,
                                      country: models[index].country,
                                      countryCode: models[index].countryCode,
                                      flag: models[index].flag,
                                    ),
                                    rate: models[index].rateOnBase,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    },
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) {
                            return AddConverter(homeController: _homeController);
                          },
                        );
                      },
                      child: Container(
                        width: 200,
                        // height: 50,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            color: Color(0xFF006A67).withOpacity(.7),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            "+ ADD CONVERTER",
                            style: AppFonts.buttonTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
