# https://github.com/NuGet/Home/issues/11574#issuecomment-1937556913
# https://docs.asciinema.org/manual/agg/installation/#building-with-docker
# TODO. Про exec "$@": https://stackoverflow.com/a/39082923 https://unix.stackexchange.com/a/467003

# ARG DISTRO=public.ecr.aws/lts/ubuntu
ARG DISTRO=ubuntu
ARG DISTRO_VERSION=latest
FROM ${DISTRO}:${DISTRO_VERSION} AS nuget

ARG MAINTAINER="don Rumata <v0541k@yandex.ru>"
ARG DOCKERFILE_VERSION="1.0"
ARG DESCRIPTION="Original nuget.exe in Ubuntu/Docker"
ARG DOCKERFILE_URL="https://github.com/don-rumata/docker-image-nuget"
ARG LICENSE="Apache-2.0"

LABEL maintainer=${MAINTAINER}
LABEL version=${DOCKERFILE_VERSION}
LABEL description=${DESCRIPTION}
LABEL url=${DOCKERFILE_URL}
LABEL license=${LICENSE}

LABEL org.opencontainers.image.authors=${MAINTAINER}
LABEL org.opencontainers.image.url=${DOCKERFILE_URL}
LABEL org.opencontainers.image.documentation=${DOCKERFILE_URL}
LABEL org.opencontainers.image.source=${DOCKERFILE_URL}
LABEL org.opencontainers.image.version=${DOCKERFILE_VERSION}
LABEL org.opencontainers.image.licenses=${LICENSE}
LABEL org.opencontainers.image.description=${DESCRIPTION}

ARG NUGET_EXE_DOWNLOAD_URL="https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"

# # https://www.baeldung.com/ops/dockerfile-path-environment-variable
# ENV PATH="$PATH:/usr/local/bin"

# https://github.com/moby/moby/issues/4032
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libmono-system-componentmodel-composition4.0-cil \
    libmono-microsoft-build-utilities-v4.0-4.0-cil \
    libmono-windowsbase4.0-cil \
    libmono-system-net4.0-cil \
    libmono-system-net-http-formatting4.0-cil \
    libmono-system-net-http-webrequest4.0-cil \
    libmono-system-net-http4.0-cil \
    libmono-system-io-compression4.0-cil \
    libmono-system-data-services-client4.0-cil \
    libmono-system-servicemodel4.0a-cil \
    mono-mcs \
    && rm -rf /var/lib/apt/lists/*

ADD ${NUGET_EXE_DOWNLOAD_URL} /usr/bin/

# COPY <<EOF /usr/bin/nuget
# #!/usr/bin/env bash
# mono /usr/bin/nuget.exe
# EOF

# RUN chmod 755 /usr/bin/nuget

COPY usr-bin-nuget /usr/bin/nuget

# # Little overhead.
# RUN echo 'alias nuget="mono /usr/bin/nuget.exe"' >> /etc/bash.bashrc

WORKDIR /var/cache/nuget

CMD [ "/usr/bin/env", "bash" ]
