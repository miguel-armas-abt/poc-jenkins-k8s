> 📌 Utilice una shell compatible con Unix e instale `yq` y `jq` para ejecutar los scripts `.sh`

[← Regresar](../../README.md) <br>

---

## 📋 Pre requisitos
- Tener instalado `Maven`, `JDK 17+`, `Kubectl`, `Minikube`, `Ngrok`.
- Configurar las variables `MAVEN_HOME`, `MAVEN_REPOSITORY`, `JAVA_HOME`, `NGROK_EXE` en el archivo [variables.env](variables.env).
- Construir la imagen del artefacto en el clúster de Minikube.

## ▶️ Menú de opciones
> 1. Iniciar Jenkins
> 2. Configurar Jenkins mediante scraping
> 3. Desinstalar Jenkins
> 4. Generar Jenkinsfiles
> 5. Crear pipeline
>
> ```shell script 
> ./main.sh
> ```

---

### 📌Referencias:
- [chromedriver versions](https://googlechromelabs.github.io/chrome-for-testing/#stable)