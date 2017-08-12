# fs-to-cdn

fs-to-cdn es un pequeño script (< 1K) que convierte referencias a archivos CSS o JavaScript locales a direcciones CDN.

fs-to-cdn convirte esto:

```
<link rel="stylesheet" href="node_modules/angular-material/angular-material.min.css" />
```

En esto:

```
<link rel="stylesheet" href="https://unpkg.com/angular-material@^1.1.4/angular-material.min.css" />
```

O esto:

```
<link rel="stylesheet" href="https://unpkg.com/angular-material/angular-material.min.css" />
```


Dependiendo si está disponible la version sea en package.json o bower.json, según las especificaciones de [unpkg](https://unpkg.com)

¡Superútil!
