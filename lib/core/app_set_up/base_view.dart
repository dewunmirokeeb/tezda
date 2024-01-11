import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseView<T> extends HookConsumerWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final ProviderBase<T> provider;
  final void Function(T model)? onModelReady;

  const BaseView({
    Key? key,
    required this.builder,
    required this.provider,
    this.onModelReady,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    T value = ref.watch(provider);

    // Check if onModelReady is provided and the model is not null
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          if (onModelReady != null && value != null) {
            // Invoke the onModelReady callback
            Future.delayed(Duration.zero, () {
              onModelReady!(value);
            });
          }
        });
        return null;
      },
      [],
    );

    return builder(
      context,
      value,
      Container(),
    );
  }
}
