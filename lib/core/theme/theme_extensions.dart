import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color statusAccepted;
  final Color statusCancelled;
  final Color statusChanged;
  final Color statusCloseout;
  final Color statusIncoming;

  const AppThemeExtension({
    required this.statusAccepted,
    required this.statusCancelled,
    required this.statusChanged,
    required this.statusCloseout,
    required this.statusIncoming,
  });

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    Color? statusAccepted,
    Color? statusCancelled,
    Color? statusChanged,
    Color? statusCloseout,
    Color? statusIncoming,
  }) {
    return AppThemeExtension(
      statusAccepted: statusAccepted ?? this.statusAccepted,
      statusCancelled: statusCancelled ?? this.statusCancelled,
      statusChanged: statusChanged ?? this.statusChanged,
      statusCloseout: statusCloseout ?? this.statusCloseout,
      statusIncoming: statusIncoming ?? this.statusIncoming,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return AppThemeExtension(
      statusAccepted: Color.lerp(statusAccepted, other.statusAccepted, t)!,
      statusCancelled: Color.lerp(statusCancelled, other.statusCancelled, t)!,
      statusChanged: Color.lerp(statusChanged, other.statusChanged, t)!,
      statusCloseout: Color.lerp(statusCloseout, other.statusCloseout, t)!,
      statusIncoming: Color.lerp(statusIncoming, other.statusIncoming, t)!,
    );
  }
}

extension ThemeExtensionHelper on BuildContext {
  AppThemeExtension? get appTheme =>
      Theme.of(this).extension<AppThemeExtension>();
}
