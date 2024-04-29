# NuGet in Docker

[![License][license-image]][license-url]
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/don-rumata/docker-image-nuget/docker-image.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/donrumata/nuget-exe)
![Docker Stars](https://img.shields.io/docker/stars/donrumata/nuget-exe)
![Docker Image Size](https://img.shields.io/docker/image-size/donrumata/nuget-exe)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/don-rumata/docker-image-nuget)
![GitHub repo size](https://img.shields.io/github/repo-size/don-rumata/docker-image-nuget)
![GitHub Release](https://img.shields.io/github/v/release/don-rumata/docker-image-nuget)

<!-- Badges for the Badges God! -->

Original [NuGet](https://www.nuget.org/downloads) in Docker.

## How to run

### How to install `AvaloniaUI`

```bash
docker run nuget-exe --volume $(pwd):/var/cache/nuget --rm donrumata/nuget-exe nuget install avalonia
```

```bash
docker run --name nuget-exe --volume $(pwd):/var/cache/nuget --rm donrumata/nuget-exe nuget install avalonia -version 11.0.10
```

## How to build

```bash
git clone https://github.com/don-rumata/docker-image-nuget

cd ./docker-image-nuget

docker build . --tag nuget-exe
```

## License

Apache License, Version 2.0

## Author Information

[don Rumata](https://github.com/don-rumata)

<https://github.com/don-rumata/docker-image-nuget>

[license-image]: https://img.shields.io/github/license/don-rumata/docker-image-nuget.svg
[license-url]: https://opensource.org/licenses/Apache-2.0
