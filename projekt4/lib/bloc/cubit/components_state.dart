import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'components_state.freezed.dart';

@freezed
class ComponentsState with _$ComponentsState {
  const factory ComponentsState.initial() = _Initial;
  const factory ComponentsState.loading() = _Loading;
  const factory ComponentsState.loaded({
    required List<String> componentsList,
    required List<TextEditingController> controllers,
    required List<bool> isRed,
  }) = _Loaded;
}
