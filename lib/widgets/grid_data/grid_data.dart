import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/widgets/wiget_utils.dart';
import 'grid_data_header.dart';

class GridDataController extends ChangeNotifier {
  bool isScrollToEnd = false;

  final LinkedScrollControllerGroup _horizontalController =
      LinkedScrollControllerGroup();
  final LinkedScrollControllerGroup _verticalController =
      LinkedScrollControllerGroup();
  late final ScrollController _headHorizontalController;
  late final ScrollController horizontalController;
  late final ScrollController _prefixColumnController;
  late final ScrollController _suffixColumnController;
  late final ScrollController verticalController;

  GridDataController() {
    _headHorizontalController = _horizontalController.addAndGet();
    horizontalController = _horizontalController.addAndGet();
    _prefixColumnController = _verticalController.addAndGet();
    _suffixColumnController = _verticalController.addAndGet();
    verticalController = _verticalController.addAndGet();

    verticalController.addListener(() {
      if (verticalController.position.maxScrollExtent ==
          verticalController.position.pixels) {
        isScrollToEnd = true;
        notifyListeners();
        isScrollToEnd = false;
      }
    });
  }

  @override
  void dispose() {
    _headHorizontalController.dispose();
    horizontalController.dispose();
    _prefixColumnController.dispose();
    _suffixColumnController.dispose();
    verticalController.dispose();
    super.dispose();
  }
}

class GridData<T> extends StatelessWidget {
  final GridDataController controller;
  final List<GridDataHeader<T>> configHeader;
  final List<T> items;
  final int prefixHeaderLength;
  final int suffixHeaderLength;
  final double headerHeight;
  final double rowHeight;
  final bool showFixedDivider;
  final List<BoxShadow>? headerShadow;
  final Color? headerBackgoundColor;
  final Widget Function(BuildContext, int) separatorBuilder;
  final Widget? fixedDivider;
  final EdgeInsetsGeometry? padding;
  final Function(T value)? onTapRow;

  const GridData({
    Key? key,
    required this.controller,
    required this.configHeader,
    this.prefixHeaderLength = 0,
    this.suffixHeaderLength = 0,
    this.headerHeight = 40,
    this.rowHeight = 40,
    this.items = const [],
    required this.separatorBuilder,
    this.showFixedDivider = false,
    this.fixedDivider,
    this.headerShadow,
    this.headerBackgoundColor,
    this.onTapRow,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<GridDataHeader<T>> _prefixHeader =
        configHeader.sublist(0, prefixHeaderLength);
    final List<GridDataHeader<T>> _header = configHeader.sublist(
        prefixHeaderLength, configHeader.length - suffixHeaderLength);
    final List<GridDataHeader<T>> _suffixHeader =
        configHeader.sublist(configHeader.length - suffixHeaderLength);

    return items.isEmpty
        ? WidgetUtils.emptyState
        : Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: headerHeight.toDouble()),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: _getWidth(_prefixHeader),
                          child: ListView.separated(
                            controller: controller._prefixColumnController,
                            physics: const ClampingScrollPhysics(),
                            padding: padding,
                            itemCount: items.length,
                            itemBuilder: (ctx, index) => Row(
                              children: _prefixHeader
                                  .map((e) => InkWell(
                                        onTap: () =>
                                            onTapRow?.call(items[index]),
                                        child: Container(
                                          height: rowHeight.toDouble(),
                                          width: e.width.toDouble(),
                                          alignment: e.cellAlignment,
                                          child:
                                              e.cellRender(items[index], index),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            separatorBuilder: separatorBuilder,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: controller.horizontalController,
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            child: SizedBox(
                              width: _getWidth(_header),
                              child: ListView.separated(
                                controller: controller.verticalController,
                                padding: padding,
                                physics: const ClampingScrollPhysics(),
                                itemCount: items.length,
                                itemBuilder: (ctx, index) => Row(
                                  children: _header
                                      .map((e) => InkWell(
                                            onTap: () =>
                                                onTapRow?.call(items[index]),
                                            child: Container(
                                              height: rowHeight.toDouble(),
                                              width: e.width.toDouble(),
                                              alignment: e.cellAlignment,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  left: BorderSide(
                                                      color:
                                                          AppColors.background,
                                                      width: 1),
                                                ),
                                              ),
                                              child: e.cellRender(
                                                  items[index], index),
                                            ),
                                          ))
                                      .toList(),
                                ),
                                separatorBuilder: separatorBuilder,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: _getWidth(_suffixHeader),
                          child: ListView.separated(
                            controller: controller._suffixColumnController,
                            padding: padding,
                            physics: const ClampingScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (ctx, index) => Row(
                              children: _suffixHeader
                                  .map((e) => InkWell(
                                        onTap: () =>
                                            onTapRow?.call(items[index]),
                                        child: Container(
                                          height: rowHeight.toDouble(),
                                          width: e.width.toDouble(),
                                          alignment: e.cellAlignment,
                                          child: Container(
                                            child: e.cellRender(
                                                items[index], index),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            separatorBuilder: separatorBuilder,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: headerHeight.toDouble(),
                decoration: BoxDecoration(
                    color: headerBackgoundColor,
                    boxShadow: headerShadow ?? const []),
                child: Row(
                  children: [
                    SizedBox(
                      width: _getWidth(_prefixHeader),
                      child: Row(
                        children: _prefixHeader
                            .map((e) => _HeaderCell(
                                  title: e.title ?? '',
                                  height: headerHeight,
                                  width: e.width.toDouble(),
                                  titleAlignment: e.titleAlignment,
                                  titleWidget: e.titleRender?.call(),
                                ))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _header.length,
                        controller: controller._headHorizontalController,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (ctx, i) => _HeaderCell(
                          title: _header[i].title ?? '',
                          height: headerHeight,
                          width: _header[i].width.toDouble(),
                          titleAlignment: _header[i].titleAlignment,
                          titleWidget: _header[i].titleRender?.call(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _getWidth(_suffixHeader),
                      child: Row(
                        children: _suffixHeader
                            .map(
                              (e) => _HeaderCell(
                                title: e.title ?? '',
                                height: headerHeight,
                                width: e.width.toDouble(),
                                titleAlignment: e.titleAlignment,
                                titleWidget: e.titleRender?.call(),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  double _getWidth(List<GridDataHeader> data) {
    return data.fold(0, (pre, cur) => pre + cur.width);
  }
}

class _HeaderCell extends StatelessWidget {
  final double? width;
  final double? height;
  final String title;
  final Alignment titleAlignment;

  final Widget? titleWidget;

  const _HeaderCell({
    Key? key,
    this.width,
    this.height,
    required this.title,
    this.titleAlignment = Alignment.center,
    this.titleWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.toDouble(),
      height: height?.toDouble(),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.background,
            width: 1,
          ),
          left: BorderSide(
            color: AppColors.background,
            width: 1,
          ),
          top: BorderSide(
            color: AppColors.background,
            width: 0.75,
          ),
        ),
      ),
      child: titleWidget ??
          Container(
            width: width?.toDouble(),
            height: height?.toDouble(),
            alignment: titleAlignment,
            child: Text(title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
    );
  }
}
