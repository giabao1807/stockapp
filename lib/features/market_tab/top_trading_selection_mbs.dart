import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/resource/asset_path.dart';
import 'package:mtsv4/widgets/custom_mbs.dart';

import 'top_trading_controller.dart';

class TopTradingSelectionMbs extends StatelessWidget {
  const TopTradingSelectionMbs(
      {Key? key, required this.data, required this.items, this.onSelected})
      : super(key: key);

  final TopType data;

  final List<TopType> items;

  final Function(TopType value)? onSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: CustomMbs(
        body: Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              final bool isSelected = item == data;
              return InkWell(
                onTap: () => onSelected?.call(item),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        item.display,
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected
                              ? AppColors.blueBanner
                              : AppColors.textContent,
                          fontWeight: isSelected ? FontWeight.w700 : null,
                        ),
                      ),
                      const Spacer(),
                      if (isSelected)
                        SvgPicture.asset(
                          AssetPath.check,
                          color: AppColors.green,
                          width: 20,
                          height: 20,
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
            itemCount: items.length,
          ),
        ),
      ),
    );
  }
}
