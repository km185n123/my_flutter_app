# Sistema de Modo Oscuro

## 🚀 Inicio Rápido

### Ejecutar la App
```bash
flutter run
```

### Probar el Modo Oscuro
1. Navega a la pantalla de configuración de tema:
   - Agrega un botón en tu UI que ejecute: `context.go('/theme-settings')`
   - O navega manualmente a la ruta `/theme-settings`

2. Selecciona el modo de tema:
   - **Modo Claro**: Siempre tema claro
   - **Modo Oscuro**: Siempre tema oscuro
   - **Automático**: Sigue la configuración del sistema

## 📖 Uso en el Código

### Acceder a Colores
```dart
// Colores del tema
final primary = Theme.of(context).colorScheme.primary;
final surface = Theme.of(context).colorScheme.surface;

// Colores personalizados de estados
final acceptedColor = context.appTheme?.statusAccepted;
```

### Cambiar Tema Programáticamente
```dart
// Obtener el cubit
final themeCubit = context.read<ThemeCubit>();

// Cambiar modo
themeCubit.setThemeMode(AppThemeMode.dark);
themeCubit.setThemeMode(AppThemeMode.light);
themeCubit.setThemeMode(AppThemeMode.system);

// Toggle
themeCubit.toggleTheme();
```

## 🎨 Personalización

Los colores están centralizados en:
- `lib/core/theme/app_colors.dart` - Paleta de colores
- `lib/core/theme/app_theme.dart` - Configuración de temas
- `lib/core/theme/theme_extensions.dart` - Colores personalizados

## ✅ Características

- ✅ Detección automática del tema del sistema
- ✅ Cambio manual entre modos
- ✅ Persistencia automática con Hive
- ✅ Colores centralizados
- ✅ Soporte completo Material 3
