## Flutter Movie App — Laboratorio IV (UTN)

Aplicación desarrollada en Flutter que consume una **API REST en Node.js**, la cual obtiene datos desde la API pública de **The Movie Database (TMDB)**.

---

## Funcionalidades principales

- Home Screen.
- Drawer Menu.
- Listado de películas obtenido desde la API REST.
- Visualización del detalle de una película.
- Búsqueda de películas.
- Consumo de datos asincrónicos mediante FutureBuilder.
- Gestión de estado con Provider.
- Navegación mediante rutas.
- Uso de widgets reutilizables.

---

## Estructura principal

```text
lib/
│
├── helpers/
│   └── preferences.dart
│
├── models/
│   ├── models.dart
│   └── movie.dart
│
├── providers/
│   ├── movie_provider.dart
│   └── theme_provider.dart
│
├── screens/
│   ├── detalle_screen.dart
│   ├── form_screen.dart
│   ├── home_screen.dart
│   └── listado_screen.dart
│   └── screens.dart
│
├── services/
│   └── api_service.dart
│
├── theme/
│   └── default_theme.dart
│
├── utils/
│   ├── constants.dart
│   └── routes.dart
│
├── widgets/
│   ├── card_basic.dart
│   ├── drawer_menu.dart
│   └── widgets.dart
│
└── main.dart
```

---

## Buenas prácticas incluidas

- **FutureBuilder** para manejar cargas asíncronas.  
- **Provider** como gestor de estado.  
- **Modelos** tipados generados con **quicktype.io** a partir de JSON.  
- **Variables de entorno** con `flutter_dotenv`.  
- **Peticiones HTTP** con el paquete `http`.

---

## Instalación

```bash
# instalar dependencias Flutter
flutter pub get

# ejecutar app
flutter run
```

---

Nota: En entorno web, el consumo de la API puede verse afectado por políticas CORS propias del navegador. El funcionamiento completo se verifica en entorno móvil.

---

### Autora

Milagros Muñoz Nicosia
