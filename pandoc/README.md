# Exportación del informe a PDF

El informe se convierte de Markdown a PDF con **Pandoc**. Pandoc lee los archivos como GitHub-flavored Markdown (igual que GitHub y WebStorm) y genera el PDF con el motor **WeasyPrint**, de modo que las tablas, imágenes y bloques HTML se ven como en la vista previa.

## Requisitos

**macOS**

```bash
brew install pandoc weasyprint
```

**Windows**

```bash
winget install --id JohnMacFarlane.Pandoc -e
```

WeasyPrint se descarga desde sus [releases oficiales](https://github.com/Kozea/WeasyPrint/releases) (`weasyprint-windows-onefile.zip`). La carpeta que contiene `weasyprint.exe` debe agregarse al `PATH`.

## Exportar

En WebStorm, selecciona la configuración **Export PDF** (junto al botón ▶) y ejecútala. También puedes ejecutar este comando desde la raíz del repositorio:

```bash
pandoc --defaults=pandoc/report.yaml
```

El PDF se genera en `build/upc-pre-202620-1asi0729-7742-IngesCompany-report.pdf`. Antes de entregarlo, renómbralo con el sufijo de la entrega (por ejemplo, `-tb1.pdf`).

## Archivos

| Archivo | Propósito |
|---------|-----------|
| `report.yaml` | Defaults file de Pandoc: orden de los archivos, motor PDF y estilos. |
| `report.css` | Diseño del PDF: tamaño A4, encabezado, pie con número de página, carátula, tablas y tabla de contenido. |
| `report.lua` | Filtro que arma la carátula a partir del README e inserta la tabla de contenido. |
| `../.run/Export PDF.run.xml` | Botón **Export PDF** de WebStorm. |

Al agregar un capítulo nuevo, inclúyelo en `input-files` de `report.yaml`.
