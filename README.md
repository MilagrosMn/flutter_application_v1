# Prototipo Flutter -- Laboratorio IV (UTN)

Prototipo desarrollado en Flutter. La
aplicación simula un catálogo de películas utilizando datos mockeados,
rutas nombradas y estructura modular.

## Funcionalidades principales

-   Home Screen.
-   Drawer Menu.
-   Listado de registros (películas) con ListView.
-   Visualización individual de un registro.
-   Formulario con TextFormField, Switch, validación y uso de setState.
-   Widget reutilizable (CardBasic) con parámetros requeridos y
    opcionales.
-   Navegación mediante rutas configuradas en main.dart.
-   Uso de assets locales (portadas en assets/portadas/).

## Estructura del proyecto
```
assets/
└── portadas/
    ├── pelicula1.png
    ├── pelicula2.png
    ├── ...

lib/
├── mocks/
│   └── peliculas.dart
│
├── models/
│   ├── models.dart
│   └── movie.dart
│
├── providers/
│   └── movie_provider.dart
│
├── screens/
│   ├── detalle_screen.dart
│   ├── form_screen.dart
│   ├── home_screen.dart
│   ├── listado_screen.dart
│   └── screens.dart        
│
├── services/
│   └── api_service.dart
│
├── utils/
│   ├── constants.dart
│   └── routes.dart
│
├── widgets/
│   ├── app_drawer.dart
│   ├── card_basic.dart
│   ├── drawer_menu.dart
│   └── widgets.dart        
│
└── main.dart
```

## Rutas

    /          → HomeScreen
    /listado   → ListadoScreen
    /detalle   → DetalleScreen
    /form      → FormScreen

## Widget reutilizable: CardBasic

-   title, year, director, genre, rating (requeridos).
-   imageUrl, onTap (opcionales).
-   Utilizado en el listado para mostrar cada película.

## Tecnologías utilizadas

-   Flutter / Dart
-   Provider
-   Material Design
-   Widgets: ListView, Form, TextFormField, Switch, Scaffold, SnackBar,
    etc.
-   Assets locales

## Ejecución

    flutter pub get
    flutter run

## Dispositivo de prueba

**Emulador en Android Studio:** Pixel 4  
**API:** 34  
**Pantalla:** 5.7" · 2280×1080 px · 444 ppi

## Autora

Milagros Muñoz Nicosia

