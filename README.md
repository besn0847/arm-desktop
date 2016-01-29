# arm-desktop

To start the container with default config :
```bash
docker run -d -P arm-desktop
```

But you can also use your local datastore :
```bash
docker run -d -P -v <your local datastore>:/data arm-desktop
```

Then just use your favorite Vnc viewer and point it to the exposed port. Connexion is encryted and password is 'passw0rd'.
