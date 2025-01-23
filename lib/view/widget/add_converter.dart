import 'package:advance_currency_converter_app/model/currency_flag.dart';
import 'package:advance_currency_converter_app/util/constant/app_colors.dart';
import 'package:advance_currency_converter_app/util/constant/constants.dart';
import 'package:advance_currency_converter_app/view/widget/memory_image.dart';
import 'package:advance_currency_converter_app/view_model/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddConverter extends StatelessWidget {
  const AddConverter({
    key,
    required HomeController homeController,
  }) : _homeController = homeController;

  final HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * .5,
      width: screenWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      child: FutureBuilder<List<CurrencyFlag>>(
      future: _homeController.getAllCurrencyFlags(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (snapshot.hasData && snapshot.data != null) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: screenWidth(context) * .3),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return (snapshot.data![index].flag.isNotEmpty &&
                        snapshot.data![index].code.isNotEmpty)
                    ? Container(
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.kPrimary.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // color: Colors.amber,
                        child: GetBuilder<HomeController>(
                          builder: (homeController) => ListTile(
                            onTap: () async {
                              // add index
                              homeController.setSelectedIndex(index);
                              homeController.setFlag(snapshot.data![index]);
                              String baseCurrency = await homeController.getBaseCurrency();
                              if(baseCurrency.isEmpty){
                                baseCurrency = "USD";
                              }
                              await homeController.getCurrencyRate(
                                  baseCurrency: baseCurrency,
                                  flag: snapshot.data![index]);
                              //add item to selected list
                              debugPrint(
                                  "log-selected value ${homeController.selectedCurrencyIndex.value} :: ${snapshot.data![index].toJson()}");
                                  Navigator.pop(context);
                            },
                            leading: ByteCodeImage(
                                byteCode: snapshot.data![index].flag),
                            title: Text(snapshot.data![index].code),
                            trailing:
                                homeController.selectedCurrencyIndex.value ==
                                        index
                                    ? IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.check,
                                          color: Color(0xFF006A67),
                                        ))
                                    : null,
                          ),
                        ))
                    : const SizedBox();
              },
            ),
          );
        }
        return const Text("Something went wrong");
      },
        ),
    );
  }
}
