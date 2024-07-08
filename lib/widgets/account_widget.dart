import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/model/login_model.dart';
import 'package:mtsv4/presentation/auth_controller.dart';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/resource/gaps.dart';
import 'package:mtsv4/widgets/account_selection/account_selection_mbs.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    Key? key,
    this.onChangedAccount,
    this.shouldToShowConfirmDialog = false,
    this.hideVtsTab = false,
  }) : super(key: key);

  final Function(AccountResponse)? onChangedAccount;

  final bool shouldToShowConfirmDialog;

  final bool hideVtsTab;

  @override
  Widget build(BuildContext context) {
    final _auth = Get.find<AuthService>();
    return Obx(
      () {
        final account = _auth.selectedAccount.value;
        return account == null
            ? Gaps.empty
            : InkWell(
                onTap: () => Get.bottomSheet(
                  SelectedAccountMbs(
                    shouldToShowConfirmDialog: shouldToShowConfirmDialog,
                    initialIndex: 0,
                    hideVtsTab: hideVtsTab,
                    onSelectedRealAccount: (val) {
                      _auth.selectedAccount(val);
                      onChangedAccount?.call(val);
                    },
                  ),
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  ignoreSafeArea: false,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.credit,
                    ),
                  ),
                  width: Get.width / 3,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 34,
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '${account?.accountNumber}-${account?.subNumber}',
                          style: const TextStyle(
                            color: AppColors.credit,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gaps.hGap3,
                        // SvgPicture.asset(AssetPath.arrow_down),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
