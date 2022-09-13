import 'package:flutter/material.dart';

class Gap extends SizedBox {
  const Gap({
    Key? key,
    double times = 1,
  }) : super(key: key, height: (times * 20));

  /// Use this named constructor if you want to define your own dimensions
  Gap.custom({double? height, double? weight, Widget? child})
      : super(
            height: height ?? 40,
            width: weight ?? double.infinity,
            child: child);

  /// Supply a [BuildContext] for adaptive gap
  Gap.withContext({double times = 1, required BuildContext context})
      : super(height: times * (MediaQuery.of(context).size.height * 0.04));

  /// This provides half gap of default gap.
  Gap.compressHalf({BuildContext? context})
      : super(
          height:
              context == null ? 10 : MediaQuery.of(context).size.height * 0.013,
        );

  Gap.vertical({double h = 20}) : super(height: h);
  Gap.horizontal({double w = 20}) : super(width: w);
}
