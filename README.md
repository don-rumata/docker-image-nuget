# NuGet in Docker

[![License][license-image]][license-url]

Original [NuGet](https://www.nuget.org/) in Docker.

## How to run

### How to install `AvaloniaUI`

```bash
docker run --name nuget-exe --volume $(pwd):/var/cache/nuget --rm nuget-exe nuget install avalonia
```
```bash
docker run --name nuget-exe --volume $(pwd):/var/cache/nuget --rm nuget-exe nuget install avalonia -version 11.0.10
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

[license-image]: https://img.shields.io/github/license/don-rumata/docker-image-nuget.svg
[license-url]: https://opensource.org/licenses/Apache-2.0
