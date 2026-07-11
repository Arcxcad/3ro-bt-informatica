# Sparse-Checkout
# 1. Nos posicionamos en el Escritorio de la PC
usuario@MiPC MINGW64 ~
$ cd ~/Desktop

# 2. Creamos la carpeta donde bajaremos los archivos
usuario@MiPC MINGW64 ~/Desktop
$ mkdir EduConnect

# 3. Entramos a la carpeta (fíjate cómo cambia la ruta al final)
usuario@MiPC MINGW64 ~/Desktop
$ cd EduConnect

# 4. Inicializamos Git localmente
usuario@MiPC MINGW64 ~/Desktop/EduConnect (master)
$ git init

# 5. Vinculamos el repositorio remoto de GitHub
usuario@MiPC MINGW64 ~/Desktop/EduConnect (master)
$ git remote add origin https://github.com/Arcxcad/3ro-bt-informatica.git

# 6. Activamos la función de clonado parcial
usuario@MiPC MINGW64 ~/Desktop/EduConnect (master)
$ git config core.sparseCheckout true
# Para salir cambiamos a false

# 7. Especificamos qué carpeta del servidor queremos descargar
usuario@MiPC MINGW64 ~/Desktop/EduConnect (master)
$ echo "EduConnect/" >> .git/info/sparse-checkout

# 8. Descargamos el contenido de la rama 'main'
usuario@MiPC MINGW64 ~/Desktop/EduConnect (master)
$ git pull origin main

# Subir archivos
# 1. Comprobamos qué archivos se modificaron o agregaron
usuario@MiPC MINGW64 ~/Desktop/EduConnect (main)
$ git status

# 2. Preparamos todos los cambios para guardarlos (el punto incluye todo)
usuario@MiPC MINGW64 ~/Desktop/EduConnect (main)
$ git add .

# 3. Guardamos la foto del historial agregando un mensaje descriptivo
usuario@MiPC MINGW64 ~/Desktop/EduConnect (main)
$ git commit -m "Actualizando el proyecto EduConnect con mis ultimos cambios"

# 4. Subimos los cambios a la plataforma web de GitHub
usuario@MiPC MINGW64 ~/Desktop/EduConnect (main)
$ git push origin main
