# What is sgminer-gm?

sgminer-gm is the console miner provided by [genesismining](https://github.com/genesismining/sgminer-gm).

sgminer-gm supports multiple algos.

# How to use this image [AMD version]

Run in background:

```console
$ docker run -d --device /dev/kfd --device /dev/dri --name YOUR_CONTAINER_NAME calvintam236/sgminer-gm:amd -k YOUR_ALGO -o YOUR_POOL_ADDRESS -u YOUR_USERNAME.YOUR_WORKER_NAME -p YOUR_WORKER_PASSWORD --text-only
```

Get `sgminer-gm` options with:

```console
$ docker run --rm calvintam236/sgminer-gm:amd
```

Fetch logs of a container:

```console
$ docker logs YOUR_CONTAINER_NAME
```
