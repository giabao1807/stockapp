import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/model/login_model.dart';
import 'package:mtsv4/presentation/auth_controller.dart';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/resource/app_padding.dart';
import 'package:mtsv4/resource/gaps.dart';
import 'package:mtsv4/widgets/custom_mbs.dart';

import '../../../resource/asset_path.dart';
import '../fill_button.dart';

class SelectedAccountMbs extends StatelessWidget {
  const SelectedAccountMbs({
    Key? key,
    this.onSelectedRealAccount,
    this.initialIndex = 0,
    this.shouldToShowConfirmDialog = false,
    this.hideVtsTab = false,
  }) : super(key: key);

  final Function(AccountResponse)? onSelectedRealAccount;

  final int initialIndex;

  final bool shouldToShowConfirmDialog;

  final bool hideVtsTab;

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthService>();
    return CustomMbs(
      body: Expanded(
        child: DefaultTabController(
          length: hideVtsTab ? 1 : 2,
          initialIndex: initialIndex,
          child: Column(
            children: [
              TabBar(
                indicatorColor: AppColors.blueBg,
                labelColor: AppColors.blueBg,
                unselectedLabelColor: AppColors.textTitle,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                indicatorWeight: 3,
                padding: AppPad.horiz16,
                tabs: (hideVtsTab
                        ? ['real_trade'.tr]
                        : ['real_trade'.tr, 'virtual_trade'.tr])
                    .map((e) => Tab(
                          text: e,
                        ))
                    .toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Obx(
                      () {
                        final accounts = auth.loginModel.value?.accountList;
                        if (auth.loginModel.value?.authenFlag == AuthenFlag.N) {
                          return Column(
                            children: [
                              Gaps.vGap30,
                              Text(
                                'complete_profile_for_depositing_&_trading'.tr,
                              ),
                              Gaps.vGap30,
                              FillButton(
                                text: 'register_ekyc'.tr,
                              ),
                            ],
                          );
                        }
                        if (accounts == null) return Gaps.empty;
                        return ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final item = accounts[index];
                            return InkWell(
                              onTap: () {
                                Get.back();
                                onSelectedRealAccount?.call(item);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${item.accountNumber}-${item.subNumber}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textContent,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Gaps.vGap2,
                                    Text(
                                      item.accountType.name.toLowerCase().tr,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textTitle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.background,
                          ),
                          itemCount: accounts.length,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
