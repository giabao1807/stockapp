
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mtsv4/utils/alt_logs.dart';



const TAG = 'SpinLoadingDialog';

const List<Color> _kDefaultRainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class SpinLoadingDialog extends StatefulWidget {
  final bool _isLoading = true;

  const SpinLoadingDialog({super.key});

  @override
  State<SpinLoadingDialog> createState() => SpinLoadingDialogState();

  void showLoading() {
    LogUtils.showLog(TAG, 'showLoading');
  }

  void hideLoading() {
    LogUtils.showLog(TAG, 'hideLoading');
    // LoadingUtils(con).startLoading();
  }
}

class SpinLoadingDialogState extends State<SpinLoadingDialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Scaffold(),
        widget._isLoading
            ? const Opacity(
                opacity: 0.5,
                child: ModalBarrier(dismissible: false, color: Colors.black))
            : const Scaffold(),
        widget._isLoading
            ? const Center(
                child: SizedBox(
                    width: 48.0,
                    height: 48.0,
                    child: SpinLoadingStatelessWidget()),
              )
            : const Scaffold()
      ],
    );
  }
}

class SpinLoadingStatelessWidget extends StatelessWidget {
  const SpinLoadingStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator(
      indicatorType: Indicator.ballSpinFadeLoader,
      colors: _kDefaultRainbowColors,
      strokeWidth: 4.0,
      pathBackgroundColor: Colors.redAccent,
    );
  }
}
