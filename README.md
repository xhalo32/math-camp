# Aalto Math Camp

This repository provides a simple [Typst](https://typst.app/) document to create adventure maps for math camps. Also an example exercise for the treasure hunt is provided in [equal-sets](./equal-sets/).

## Setting up typst

The typst CLI can be installed from [its GitHub repository](https://github.com/typst/typst?tab=readme-ov-file#installation).

> [!NOTE]
> If you have issues installing typst, please ask me [via email](mailto:niklas.2.halonen@aalto.fi).

## Adventure Map Template

The template is located at [`./map/map.typ`](./map/map.typ). It has some comments explaining the different bits.

### Compiling

To recompile on changes to `map.typ`, run the following inside the `map` directory:

```bash
$ typst watch map.typ
```

## More references on typst

- The [official documentation](https://typst.app/docs)
- The [CeTZ documentation](https://cetz-package.github.io/docs/) and [manual (latest stable)](https://raw.githubusercontent.com/cetz-package/cetz/refs/tags/stable/manual.pdf)