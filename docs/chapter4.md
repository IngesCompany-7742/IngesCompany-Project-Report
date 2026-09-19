# Capítulo IV: Product Design

## 4.1. Style Guidelines

### 4.1.1. General Style Guidelines

El diseño visual de **DoofPlus** se rige por una estética limpia, técnica y de alta precisión, reflejando el compromiso de **IngesCompany** con la integridad de datos en la manufactura farmacéutica. El objetivo es proyectar un entorno de confianza y profesionalismo que minimice la carga cognitiva del usuario al gestionar documentación de calidad, trazabilidad de lotes y cumplimiento regulatorio.

**Branding**

El logotipo de DoofPlus combina elementos que representan los pilares de la plataforma: calidad farmacéutica, trazabilidad y tecnología IoT. El nombre "DoofPlus" comunica la idea de ir más allá (+) en la gestión documental y operativa del sector farmacéutico. El branding transmite innovación, rigor y confiabilidad, valores esenciales para los laboratorios que confían en la plataforma el cumplimiento de sus normativas BPM y DIGEMID.

![DoofPlus Logo](../assets/img/chapter4/doofplus-logo.png)

**Typography**

La tipografía empleada es **Inter**, con sus variantes Regular, Medium, SemiBold y Bold. Se eligió Inter por su excelente legibilidad en datos numéricos y tablas extensas, característica crítica para un entorno donde los usuarios revisan expedientes de lotes, resultados analíticos y parámetros de producción. Su disponibilidad en Google Fonts asegura carga eficiente en cualquier dispositivo.

Jerarquía tipográfica:

- **H1 (Títulos principales):** 2.5rem (40px) en escritorio, 2rem (32px) en móvil.
- **H2 (Subtítulos):** 2rem (32px) en escritorio, 1.75rem (28px) en móvil.
- **H3/H4 (Títulos de componentes):** 1.5rem (24px) a 1.25rem (20px).
- **Cuerpo (p):** 1rem (16px) con interlineado de 1.6.
- **Botones y etiquetas:** 0.875rem (14px) a 1.125rem (18px).

![Inter Typography Guide](../assets/img/chapter4/typography-guide.svg)

Se mantiene un ratio de contraste mínimo de 4.5:1 (WCAG 2.1 AA) para garantizar accesibilidad en entornos de laboratorio y oficina.

**Colors**

La paleta fue seleccionada para transmitir pulcritud, control y profesionalismo técnico:

**Paleta principal:**
- **Primario (Teal DoofPlus):** `#0D9488` — Identidad principal, botones de acción y enlaces activos.
- **Secundario (Azul Pizarra Oscuro):** `#0F172A` — Texto principal, headers y barras de navegación.
- **Terciario (Gris Pizarra):** `#64748B` — Texto secundario, etiquetas y descripciones.
- **Fondo Claro:** `#F8FAFC` — Fondos de secciones alternas.
- **Blanco:** `#FFFFFF` — Fondos de tarjetas y contenido principal.

**Colores funcionales:**
- **Éxito:** `#22C55E` — Lotes aprobados, acciones exitosas.
- **Error:** `#EF4444` — Desviaciones críticas, alertas de rechazo.
- **Advertencia:** `#F59E0B` — Calibraciones vencidas, notificaciones.
- **Info:** `#3B82F6` — Mensajes informativos y tooltips.

![DoofPlus Color Palette](../assets/img/chapter4/color-palette.png)

Esta combinación transmite rigor científico, seguridad y trazabilidad, valores clave para laboratorios y entidades regulatorias como DIGEMID.

**Spacing**

El espaciado sigue un sistema modular basado en múltiplos de 8px para mantener consistencia y ritmo visual:

- **Unidad base:** 8px (0.5rem). Todos los espaciados son múltiplos de esta unidad.
- **Padding de secciones:** 64px (4rem) vertical para separación entre bloques principales.
- **Gap entre tarjetas/elementos:** 24px (1.5rem) a 32px (2rem).
- **Padding interno de cards:** 24px (1.5rem).
- **Line-height del texto:** 1.6 para legibilidad óptima en párrafos de documentación.

**Tono de Comunicación**

| Dimensión | Posición | Justificación |
|---|---|---|
| Divertido ↔ Serio | **Serio (80%)** | Industria farmacéutica regulada; los usuarios necesitan precisión y confianza. |
| Formal ↔ Casual | **Formal (75%)** | Comunicación orientada a profesionales de QA/QC y Jefes de Producción. |
| Respetuoso ↔ Irreverente | **Respetuoso (90%)** | Contexto regulatorio donde la credibilidad es fundamental. |
| Entusiasta ↔ Sereno | **Sereno (70%)** | Prioriza claridad y calma; entusiasmo reservado para CTAs y logros. |

El lenguaje es **técnico y directo**, sin evitar terminología del sector (BPM, DIGEMID, trazabilidad, lote), ya que los usuarios la manejan a diario. Se enfoca en los beneficios operativos: reducción de errores, automatización de reportes y trazabilidad inmediata.

### 4.1.2. Web Style Guidelines

Las directrices web de DoofPlus se centran en la eficiencia operativa, la legibilidad de datos y la consistencia visual en todos los dispositivos.

**1) Layout**

- **Grid:** Sistema de 12 columnas con breakpoints en 768px (tablet) y 1024px (desktop). El contenido principal se contiene en un `max-width` de 1200px con centrado automático.
- **Header:** Fijo en la parte superior con navegación principal, logo y accesos (Sign In / Sign Up). Fondo `#0F172A` con texto claro para máximo contraste.
- **Footer:** Contiene enlaces de soporte, contacto, redes sociales y suscripción a actualizaciones.
- **Cards:** Bordes redondeados (8px), sombra sutil (`0 2px 8px rgba(0,0,0,0.08)`) y padding interno de 24px. Se usan para agrupar módulos, planes y métricas.

**2) Responsive Design**

- **Desktop (≥1024px):** Navegación completa visible. Contenido en múltiples columnas. Tablas de datos y dashboards aprovechan el ancho completo.
- **Tablet (768px–1023px):** Navegación colapsada en menú hamburguesa. Grid de 2 columnas. Botones y campos expandidos para interacción táctil.
- **Mobile (<768px):** Layout de 1 columna. Menú desplegable. Elementos interactivos de tamaño mínimo 44×44px para accesibilidad táctil.

**3) Interaction Design**

- **Botones primarios:** Fondo teal (`#0D9488`), texto blanco, hover con oscurecimiento al 10%. Border-radius de 6px.
- **Botones secundarios:** Borde teal, fondo transparente, texto teal. Hover con fondo teal al 10% de opacidad.
- **Formularios:** Campos con borde `#CBD5E1`, focus con borde teal y sombra outline. Validación inline sin recarga de página. Labels siempre visibles encima del campo.

**4) Images and Icons**

- **Imágenes:** Fotografías profesionales de entornos farmacéuticos (laboratorios, líneas de producción). Optimizadas en formato WebP con fallback a PNG/JPG.
- **Íconos:** Estilo lineal y minimalista (ej. Lucide Icons o Heroicons). Tamaño base de 24px. Representan conceptos clave: trazabilidad (ruta), lote (caja), calidad (escudo), IoT (señal), auditoría (documento).

**5) Repositorio Central**

- **Estructura de assets:**
    - `assets/img/` — Imágenes organizadas por capítulo/sección.
    - `assets/fonts/` — Tipografías locales (fallback).
    - `assets/styles/` — Hojas de estilo CSS.
    - `assets/scripts/` — JavaScript interactivo.
- **Versionado:** Git con convención de commits `docs:`, `feat:`, `fix:`. Ramas por feature (`feature/chapter4`, etc.).

## 4.2. Information Architecture

### 4.2.1. Organization Systems
    
### 4.2.2. Labeling Systems

### 4.2.3. SEO Tags and Meta Tags

### 4.2.4. Searching Systems

### 4.2.5. Navigation Systems

## 4.3. Landing Page UI Design

### 4.3.1. Landing Page Wireframe

### 4.3.2. Landing Page Mock-up

## 4.4. Web Applications UX/UI Design

### 4.4.1. Web Applications Wireframes

### 4.4.2. Web Applications Wireflow Diagrams

### 4.4.3. Web Applications Mock-ups

### 4.4.4. Web Applications User Flow Diagrams

## 4.5. Web Applications Prototyping

## 4.6. Domain-Driven Software Architecture

### 4.6.1. Design-Level Event Storming

### 4.6.2. Software Architecture Context Diagram

### 4.6.3. Software Architecture Container Diagrams

### 4.6.4. Software Architecture Components Diagrams

## 4.7. Software Object-Oriented Design

### 4.7.1. Class Diagrams

## 4.8. Database Design

### 4.8.1. Database Diagrams