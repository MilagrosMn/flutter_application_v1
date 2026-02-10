# Prototipo Flutter – Laboratorio IV (UTN)

Proyecto desarrollado en Flutter que consume una **API REST de películas**. La aplicación permite listar películas y visualizar el detalle de cada una, utilizando navegación por rutas, arquitectura modular y consumo de servicios HTTP.

---

## Funcionalidades

- Pantalla principal (Home).
- Menú lateral (Drawer).
- Listado de películas obtenido desde API REST.
- Visualización del detalle de una película.
- Navegación mediante rutas nombradas.
- Consumo de API utilizando servicio dedicado.
- Manejo de estado mediante Provider.

---

## Requisitos cumplidos

- Uso de **Flutter** como framework principal.
- Arquitectura modular con separación de responsabilidades.
- Implementación de **modelos de datos**.
- Consumo de **API REST externa** mediante HTTP.
- Listado dinámico utilizando `ListView`.
- Vista de detalle por identificador.
- Navegación por rutas configuradas en `main.dart`.
- Uso de **Provider** para la gestión de estado.
- Variables de entorno mediante `flutter_dotenv`.
- Código organizado, legible y mantenible.

---

## Estructura del proyecto

assets/ 
└── portadas/
```
lib/
├── models/
│
├── providers/
│
├── screens/
│
├── services/
|
│__ theme/
|
├── utils/
│
├── widgets/
│
└── main.dart
```

---

## API de películas

La aplicación consume una API REST desarrollada por la autora, con los siguientes endpoints:

- `GET /peliculas` → listado de películas.
- `GET /peliculas/{id}` → detalle de una película.

El acceso a la API se configura mediante una variable de entorno:

```
API_URL=<url_base_de_la_api>
```

---

## Ejecución del proyecto

Desde la raíz del proyecto:

```
flutter pub get
flutter run
```

> Nota: En entorno web, el consumo de la API puede verse afectado por políticas CORS propias del navegador. El funcionamiento completo se verifica en entorno móvil.

---

## Autora

**Milagros Muñoz Nicosia**

