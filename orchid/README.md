# Orchid

A Typst package for displaying ORCID iDs, inspired by LaTeX's `orcidlink` package.

## Usage

```typst
#import "@preview/orchid:<version>": orcid

#orcid("0000-0002-1825-0097")                // icon + full URL, linked (default)
#orcid("0000-0002-1825-0097", display: "id") // icon + bare iD
#orcid("0000-0002-1825-0097", display: none) // icon only
#orcid("0000-0002-1825-0097", linked: none)  // no link

John Doe #orcid("0000-0002-1825-0097")       // combine with a name by writing them together
```

## Features

- Three independent options (`icon`, `display`, `linked`) instead of fixed formats
- Validates the iD, including its ISO 7064 check digit, so typos fail at compile time
- Accepts a bare iD or a full `https://orcid.org/...` URL
- Custom icon support, and alt text for accessible PDFs (PDF/UA-1)

## Documentation

See the [manual](https://github.jassielof.io/typst-packages/orchid/manual.pdf) for all options and examples.

## License

This package is licensed under the MIT License.
