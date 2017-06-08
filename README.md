## docker-komodo

Run [Komodo](https://github.com/jl777/komodo) daemon in a Docker container.

Note: *This project is still in development, use it at your own risk!*

### Quick start

1. Edit komodo.conf with your configuration if necessary
2. Build `docker build -t naei/komodo .`
3. Run `docker run -it -v ~/.kmd:/root/.komodo naei/komodo`  
   (replace `~/.kmd` by the path in your host in which you want to sync all your data)
