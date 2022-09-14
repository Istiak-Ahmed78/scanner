import 'package:flutter/material.dart';

class FutureWidget<T> extends StatelessWidget {
  const FutureWidget({
    Key? key,
    required this.future,
    required this.loadedDataWidgetBuilder,
    this.errorWidgetBuilder,
    this.loadingWidget,
    this.nullDataWidget,
  }) : super(key: key);

  final Future<T> future;
  final DoneWidgetBuilder<T> loadedDataWidgetBuilder;
  final ErrorWidgetBuilder<String>? errorWidgetBuilder;
  final Widget? loadingWidget;
  final Widget? nullDataWidget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (_, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
          case ConnectionState.none:
            {
              return loadingWidget ?? const CircularProgressIndicator();
            }
          case ConnectionState.done:
            {
              if (snapshot.hasError) {
                return (errorWidgetBuilder!(snapshot.error.toString()) ??
                    Text(snapshot.error.toString()));
              } else if (snapshot.data == null) {
                return nullDataWidget ?? const SizedBox();
              }
              return loadedDataWidgetBuilder(snapshot.data!);
            }
        }
      },
    );
  }
}

typedef DoneWidgetBuilder<T> = Widget Function(T);
typedef ErrorWidgetBuilder<T extends String> = Widget? Function(T);
