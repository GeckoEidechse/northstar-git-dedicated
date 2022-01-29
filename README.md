<h1 align="center">northstar-git-dedicated</h1>

**Testing Docker image for the [Northstar](https://northstar.tf) dedicated server using latest git commit of NorthstarMods** 

The goal of this image is to offer a version of pg9182's [`northstar-dedicated` image](https://github.com/pg9182/northstar-dedicated/) that uses the newest git master of [NorthstarMods](https://github.com/R2Northstar/NorthstarMods).

This image is designed mainly for testing new releases, so using it in production is discouraged!

It is however intended to work as a drop-in replacement for `northstar-dedicated`, simply updating the contents of the folder containing the Northstar mods. Therefore instructions on its usage and system requirements can be found in [pg9182's repo](https://github.com/pg9182/northstar-dedicated/).

## Building

Build image via

```bash
docker build --no-cache -t northstar-git-dedicated:latest .
```

make sure to use `--no-cache` to prevent accidentally using an older version of `NorthstarMods` due to previously cached layers.

## Replacing `pg9182/northstar-dedicated`

As this image is based on pg9182's, it can be used as a drop-in replacement. However as `northstar-git-dedicated` does not provide a registry, make sure to remove `--pull always` from your run command.

## Using a specific version of NorthstarMods

To use a specific commit of NorthstarMods, use the build arg `NORTHSTARMODS_SHA1` when building the image. For example:

```
docker build --no-cache --build-arg NORTHSTARMODS_SHA1=db5bc4e76aebe585e6fe9b4aa7c57bb80499fcbb -t northstar-git-dedicated:latest .
```
