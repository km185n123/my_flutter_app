# 📱 Rick and Morty Favorites App

Aplicación desarrollada en **Flutter** como parte de una **prueba técnica**, cuyo objetivo es consumir datos desde una API externa, permitir la búsqueda de información y gestionar una lista de favoritos de manera persistente.

La app permite al usuario **explorar personajes de Rick and Morty**, **buscar por nombre**, **agregar personajes a favoritos**, **editar información personalizada** y **eliminar favoritos**, ofreciendo una experiencia clara, organizada y escalable.

---

## ✨ Funcionalidades

- **Listado de personajes**: Consumo de datos desde la API pública de Rick and Morty.
- **Búsqueda**: Filtro de personajes por nombre.
- **Gestión de favoritos**:
  - Agregar personajes a favoritos.
  - Editar información personalizada.
  - Eliminar favoritos.
- **Persistencia local** mediante almacenamiento local.
- **Internacionalización (i18n)** para soportar múltiples idiomas.
- **Tema oscuro** configurable.
- **Flavors** configurados para diferentes entornos.
- **Arquitectura limpia (Clean Architecture)**.
- **Buenas prácticas de desarrollo**.
- **Pruebas unitarias** básicas implementadas.

---

## 🏗️ Arquitectura

El proyecto sigue **Clean Architecture** con una estructura basada en **features**, separando responsabilidades en capas:

- **Presentation**
- **Domain**
- **Data**

### Tecnologías principales

- **Manejo de estado**: Bloc / Cubit  
- **Navegación**: GoRouter  
- **Networking**: Dio  
- **Persistencia local**: Hive  

---

## 📂 Estructura de carpetas

```
lib/
├── core/
│   ├── config/
│   ├── data/repositories/
│   ├── di/
│   ├── error/
│   ├── local/
│   ├── network/
│   ├── router/
│   ├── theme/
│   ├── ui/
│   └── utils/
│
├── features/
│   └── api_items/
│       ├── data/
│       │   ├── datasources/
│       │   ├── mappers/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│
└── main.dart
```

---

## 🌍 Internacionalización

La aplicación soporta **internacionalización**, permitiendo agregar fácilmente nuevos idiomas y adaptarse al idioma del sistema.

---

## 🎨 Tema

- Soporte para **modo claro y oscuro**.
- Configuración centralizada del tema.

---

## ⚙️ Flavors

Se configuraron **flavors** para permitir múltiples entornos (por ejemplo: desarrollo y producción).

---

## 🧪 Pruebas

- Pruebas unitarias básicas implementadas.

---

## ⚠️ Limitaciones conocidas

- Quedó pendiente el soporte completo para **múltiples tamaños de pantalla** (responsive / adaptive layout).

---

## 📋 Requisitos

- Flutter SDK >= 3.10.1  
- Dart SDK >= 3.0.0  

---

## ▶️ Instalación y ejecución

1. Clonar el repositorio.
2. Instalar dependencias:
   ```bash
   flutter pub get
   ```
3. Generar adapters de Hive (opcional):
   ```bash
   flutter pub run build_runner build
   ```
4. Ejecutar la aplicación:
   ```bash
   flutter run
   ```

---

## 🧠 Decisiones técnicas

- **Hive**: Persistencia local rápida y sencilla.
- **Dio**: Manejo avanzado de red y errores.
- **GoRouter**: Navegación declarativa y escalable.
- **Cubit**: Simplicidad para flujos controlados.
- **Clean Architecture**: Facilita mantenimiento y escalabilidad.