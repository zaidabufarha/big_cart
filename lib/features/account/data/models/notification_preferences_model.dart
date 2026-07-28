import 'package:big_cart/features/account/domain/entities/notification_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_preferences_model.g.dart';

@JsonSerializable()
class NotificationPreferencesModel extends NotificationPreferences {
  NotificationPreferencesModel({
    required super.allowEmail,
    required super.allowGeneral,
    required super.allowOrder,
  });
  factory NotificationPreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationPreferencesModelToJson(this);
}
