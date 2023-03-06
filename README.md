# Statically linked DASH

Statically linked [DASH] container image

> 151K

```bash
ghcr.io/awesome-containers/static-tar:latest
ghcr.io/awesome-containers/static-tar:0.5.12

docker.io/awesomecontainers/static-tar:latest
docker.io/awesomecontainers/static-tar:0.5.12
```

Slim statically linked [DASH] container image packaged with [UPX]

> 81K

```bash
ghcr.io/awesome-containers/static-tar:latest-slim
ghcr.io/awesome-containers/static-tar:0.5.12-slim

docker.io/awesomecontainers/static-tar:latest-slim
docker.io/awesomecontainers/static-tar:0.5.12-slim
```

[DASH]: http://gondor.apana.org.au/~herbert/dash/
[UPX]: https://upx.github.io/

<!--
```bash
image="localhost/${PWD##*/}"

podman build -t "$image:latest" .
podman build -t "$image:latest-slim" -f Containerfile-slim \
  --build-arg STATIC_DASH_IMAGE="$image" \
  --build-arg STATIC_DASH_VERSION=latest --no-cache .

echo "$image:latest"
podman inspect "$image:latest" | jq '.[].Size' | numfmt --to=iec
echo "$image:latest-slim"
podman inspect "$image:latest-slim" | jq '.[].Size' | numfmt --to=iec

```
-->
