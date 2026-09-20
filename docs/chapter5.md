# Capítulo V: Product Implementation, Validation & Deployment

## 5.1. Software Configuration Management

En esta sección se describen las decisiones, convenciones y herramientas utilizadas por el equipo Inges Company para gestionar el ciclo de vida, implementación, validación y despliegue de **DoofPlus**. Estas decisiones permitieron mantener la trazabilidad sobre los cambios realizados en cada sprint para la Landing Page, Frontend Web Application y Backend Web Services.

### 5.1.1. Software Development Environment Configuration

Se detallan las herramientas utilizadas en el ciclo de vida del producto:

* **Project Management**
  * **Jira / Trello:** Planificación de sprints, gestión del Product Backlog y seguimiento visual de tareas. (Referencia: https://www.atlassian.com/software/jira, https://trello.com)
* **Requirements Management**
  * **Markdown:** Documentación del proyecto. (Referencia: https://www.markdownguide.org)
  * **Gherkin:** Redacción de criterios de aceptación (Given-When-Then). (Referencia: https://cucumber.io/docs/gherkin)
* **Product UX/UI Design**
  * **Figma / UXPressia / Lucidchart:** Elaboración de mockups, User Personas, mapas de experiencia y diagramación técnica. (Referencia: https://www.figma.com, https://uxpressia.com)
* **Software Development**
  * **WebStorm / IntelliJ IDEA:** Entornos de desarrollo para frontend y backend. (Descarga: https://www.jetbrains.com)
  * **Angular & Spring Boot:** Frameworks para las Web Applications (Material Design) y RESTful Web Services (Spring Data JPA). (Referencia: https://angular.dev, https://spring.io)
  * **PostgreSQL:** Sistema gestor de base de datos. (Referencia: https://www.postgresql.org)
* **Software Testing**
  * **Swagger UI / Chrome DevTools / pgAdmin:** Ejecución de pruebas de APIs, inspección de frontend y revisión de bases de datos.
* **Software Documentation**
  * **OpenAPI (Swagger) / PlantUML:** Documentación estructurada de endpoints y diagramación de software.
* **Software Deployment**
  * **GitHub Pages / Firebase / Render / Railway:** Servicios cloud para el despliegue de cada uno de los productos de la solución.

### 5.1.2. Source Code Management

El código fuente de la solución es gestionado mediante **GitHub** como plataforma y sistema de control de versiones distribuido.
* **Landing Page:** https://github.com/IngesCompany-7742/DoofPlus-LandingPage
* **Frontend Web Application:** https://github.com/IngesCompany-7742/DoofPlus-Frontend
* **Backend Web Services:** https://github.com/IngesCompany-7742/doofplus-platform

**GitFlow Workflow**
El proyecto adopta **GitFlow** para la organización de ramas:
* `main`: Rama principal para el código en producción estable.
* `develop`: Rama de integración donde se consolidan las funcionalidades de todo el equipo.
* `feature/<nombre>`: Convención para desarrollar nuevas funcionalidades (ej. `feature/auth-module`).
* `release/v<version>`: Ramas creadas desde develop para preparar y asegurar una nueva versión.
* `hotfix/<nombre>`: Ramas que nacen de `main` para corregir errores críticos en producción.

**Semantic Versioning y Conventional Commits**
Se aplica **Semantic Versioning 2.0.0** (`MAJOR.MINOR.PATCH`) para nombrar las releases. 
Todos los mensajes siguen la convención **Conventional Commits** (`tipo[scope opcional]: descripción`) usando prefijos como `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore` (ej. `feat(landing): add benefits section`).

### 5.1.3. Source Code Style Guide & Coding Conventions

Toda la nomenclatura y lógica programática en el código fuente se desarrolla estrictamente en **inglés**, respetando el Ubiquitous Language del dominio de calidad farmacéutica. Se han adoptado las siguientes convenciones estándar oficiales para la programación:

* **HTML/CSS:** *Google HTML/CSS Style Guide* y *HTML Style Guide and Coding Conventions*.
* **JavaScript / TypeScript:** *Google JavaScript Style Guide*, *Google TypeScript Style Guide* y *Angular coding style guide*.
* **Java / Spring Boot:** *Google Java Style Guide* y buenas prácticas de *Spring Boot Features* para controladores RESTful y abstracción JPA.
* **BDD:** *Gherkin Conventions for Readable Specifications*.

### 5.1.4. Software Deployment Configuration

Pasos y configuración necesarios para el despliegue de la solución en la nube a partir de los repositorios de código:

1. **Landing Page (GitHub Pages):** Se navega a la configuración del repositorio, se habilita GitHub Pages apuntando a la raíz (`/root`) de la rama `main` y el código estático es servido públicamente de manera automática por GitHub.
2. **Frontend Web Application (Firebase Hosting):** 
   - Se ejecuta la construcción optimizada localmente (`ng build --configuration production`).
   - Se utiliza Firebase CLI y el comando `firebase deploy --only hosting` apuntando a la carpeta de distribución para sincronizar la SPA a la nube.
3. **Backend Web Services (Render & Railway):** 
   - Se aprovisiona la base de datos PostgreSQL en **Railway**, obteniendo la URL y credenciales.
   - El backend se despliega como Web Service en **Render** vinculado automáticamente a la rama `main` de su repositorio. Se inyectan las variables de entorno de producción (credenciales de BBDD, JWT keys, tokens de **Niubiz** para flujos de suscripción). En cada commit a `main`, Render compila el proyecto y lo expone públicamente.

## 5.2. Landing Page, Services & Applications Implementation

### 5.2.n. Sprint n

#### 5.2.n.1. Sprint Planning n

#### 5.2.n.2. Aspect Leaders and Collaborators

#### 5.2.n.3. Sprint Backlog n

#### 5.2.n.4. Development Evidence for Sprint Review

#### 5.2.n.5. Execution Evidence for Sprint Review

#### 5.2.n.6. Services Documentation Evidence for Sprint Review

#### 5.2.n.7. Software Deployment Evidence for Sprint Review

#### 5.2.n.8. Team Collaboration Insights during Sprint

## 5.3. Validation Interviews

### 5.3.1. Diseño de Entrevistas

### 5.3.2. Registro de Entrevistas

### 5.3.3. Evaluaciones según heurísticas

## 5.4. Video About-the-Product

# Conclusiones

## Conclusiones y recomendaciones

## Video About-the-Team

# Bibliografía

# Anexos