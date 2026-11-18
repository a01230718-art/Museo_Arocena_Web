# Museo Arocena — Entre Obras Digital Experience

Sitio web oficial y experiencia digital interactiva para el proyecto gastronómico y cultural **Entre Obras** en el **Museo Arocena** (Torreón, Coahuila).

---

## 🏛️ Estructura del Proyecto

```
.
├── index.html                 # Landing page completa, unificada y optimizada para producción
├── vercel.json                # Configuración de despliegue estático para Vercel
├── .gitignore                 # Exclusión de archivos sensibles y temporales
├── screens/
│   ├── html/                  # Pantallas individuales y versión completa modular
│   ├── images/                # Capturas PNG en alta resolución de cada pantalla
│   └── metadata/              # Metadatos del diseño original de Google Stitch
└── supabase/
    └── schema.sql             # Esquema de base de datos y políticas de seguridad RLS (Reservaciones)
```

---

## 🚀 Infraestructura Dedicada

Este proyecto cuenta con su propia infraestructura aislada e independiente:
- **GitHub**: Repositorio dedicado `Museo-Arocena` para control de versiones y respaldo.
- **Vercel**: Proyecto dedicado `museo-arocena` con despliegues automáticos (CI/CD) vinculados a la rama principal de GitHub.
- **Supabase**: Base de datos dedicada con Row Level Security (RLS) para gestionar reservaciones de mesa de manera 100% segura.
