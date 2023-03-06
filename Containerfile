# https://github.com/awesome-containers/alpine-build-essential
ARG BUILD_ESSENTIAL_VERSION=3.17
ARG BUILD_ESSENTIAL_IMAGE=ghcr.io/awesome-containers/alpine-build-essential

FROM $BUILD_ESSENTIAL_IMAGE:$BUILD_ESSENTIAL_VERSION AS build

# https://git.kernel.org/pub/scm/utils/dash/dash.git
ARG DASH_VERSION=0.5.12

WORKDIR /src/dash

RUN git clone --branch "v$DASH_VERSION" \
        git://git.kernel.org/pub/scm/utils/dash/dash.git .

ARG CFLAGS='-w -g -Os -static'

# hadolint ignore=SC2016
RUN set -eux; \
    ./autogen.sh; \
    ./configure; \
    make -j"$(nproc)"; \
    mkdir -p bin; cp src/dash bin/; \
    strip -s -R .comment --strip-unneeded bin/dash; \
    chmod -cR 755 bin/dash; \
    chown -cR 0:0 bin/dash; \
    ./bin/dash -c 'echo DASH version: $DASH_VERSION'; \
    ln -f ./bin/dash ./bin/ash; \
    ln -f ./bin/dash ./bin/sh

# static dash image
FROM scratch
COPY --from=build /src/dash/bin/ /bin/
ENTRYPOINT ["/bin/dash"]
