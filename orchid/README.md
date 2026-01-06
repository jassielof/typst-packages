# Orchid

A Typst package for generating ORCID iD links in various formats. Inspired by LaTeX's `orcidlink` package.

## Usage

```typst
#import "@preview/orchid:..."

#let my-id = "0000-0000-0000-0000"
#let my-name = [John Doe]

// Logo format (default)
#orchid.generate-link(my-id)
#orchid.generate-link(my-id, name: my-name)

// Compact format (shows only the ID)
#orchid.generate-link(my-id, format: "compact")
#orchid.generate-link(my-id, format: "compact", name: my-name)

// Full format (shows the complete URL)
#orchid.generate-link(my-id, format: "full")
#orchid.generate-link(my-id, format: "full", name: my-name)
```

## Features

- **Multiple display formats**: logo icon, compact ID, or full URL
- **Name integration**: Display author names alongside ORCID identifiers
- **Flexible positioning**: Place the logo/ID before or after the name
- **ORCID validation**: Automatically validates ORCID ID format
- **Customizable**: Override the logo icon, separator, and positioning

## Documentation

See the [manual](docs/manual.pdf) for complete documentation and examples.

## License

This package is licensed under the MIT License.

### Previous versions MIT-0 license issue

Previous to version 0.1.1, the manifest stated MIT-0 (no attribution) which wasn't the one intended, as the template README stated MIT, thus, to cause no confusion or problems, all versions below from 0.1.1 are considered to be licensed under either MIT or MIT-0.
