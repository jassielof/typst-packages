#let logo = image("assets/images/ORCID_iD.svg")
#let base-url = "https://orcid.org/"

#let is-valid(id) = {
  return true
}

#let check-format(id) = {
  if type(id) != str {
    panic("ORCID must be of type string: " + type(id))
  }

  if id.contains(regex("^(?:\d{4}-){3}\d{3}[\dX]$")) == false {
    panic(
      "ORCID format is invalid, please check https://support.orcid.org/hc/en-us/articles/360006897674-Structure-of-the-ORCID-Identifier: "
        + id,
    )
  }
}

#let generate-link(
  id,
  format: "logo",
  name: none,
  position: none,
  logo-height: 1em,
  logo-width: 1em,
  logo-separator: [~],
) = {
  check-format(id)

  if format not in ("logo", "full", "compact") {
    panic("Format must be logo, full, or compact: " + format)
  }

  if type(position) == str and position not in ("left", "right") {
    panic("Logo position must be left or right: " + position)
  }

  let identifier-link = base-url + id
  let logo-icon = box(height: logo-height, width: logo-width, logo)

  if format == "logo" {
    if name == none {
      return link(identifier-link, logo-icon)
    }

    if position == "right" {
      return link(identifier-link)[#name#logo-separator#logo-icon]
    } else if position == "left" {
      return link(identifier-link)[#logo-icon#logo-separator#name]
    } else {
      return link(identifier-link)[#logo-icon#logo-separator#name]
    }
  } else if format == "full" {
    if name == none {
      return link(identifier-link, identifier-link)
    }

    if position == "right" {
      return link(identifier-link)
    }
  }
}
