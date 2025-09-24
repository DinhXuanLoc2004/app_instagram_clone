
import 'package:json_annotation/json_annotation.dart';

part 'option_extra.g.dart';

@JsonSerializable(createFactory: false)
class OptionExtra {
  bool skipAuth = true;

  Map<String, dynamic> toJson() => _$OptionExtraToJson(this);
}