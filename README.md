# kscript-dockernized
Files to build a Docker's container in order to run Kscript with Java 8.

# Build Image
Run `docker build -t kscript-openjdk8 .` fom the root of the source code. In this case **kscript-openjdk8** is image name, you can change it whatever you want.

# Run scripts with container
- For inline function: `docker run -i --rm kscript-openjdk8 'println("Hello Kotlin")'`.
- For a ***.kts** scripts: `docker run -i --rm kscript-openjdk8 script.kts`.

Notes: 
- `-i` is `docker run`'s option stands for interaction which is used in this case for accept input (println("Hello Kotlin") is an input) into container.
- `--rm` is `docker run`'s option which mean remove container after done run it.
      
Some `docker run`'s options will help in case you want to run it more effectively: 
- `-v [MOUNT]:[PATH_TO_CONTAINER_DIRECTORY]`: bind a mount with [MOUNT] name to the [PATH_TO_CONTAINER_DIRECTORY]. Useful for cache kscript compiled dependencies.
- `-v [PATH_TO_SOURCE_CODE]:[PATH_TO_CONTAINER_DIRECTORY]`: set [PATH_TO_CONTAINER_DIRECTORY] sync with [PATH_TO_CONTAINER_DIRECTORY] so changes from your source code on the host system can sync with docker container.
- `--end-file`: read an environment file. Useful when you want docker container reads some specific environment's variables like database conection... .

The source code includes a shell script **kscript** which run an already built image **tronglehs/kscript-openjdk8** using this source code Dockerfile. The script comes with: 
- `docker run`'s options in order to cache kscript's compiled dependencies (which are sit on /root/.m2, /root/.kscript by default), and sync the files between host system and docker container.
- Read an **.env** file.
You can run (from the source code's root): `./kscript your-script.kts`.

# Credits
- [Kscript](https://github.com/holgerbrandl/kscript)
- [Docker](https://docker.com)
