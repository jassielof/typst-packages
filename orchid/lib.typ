#let logo = image("assets/images/ORCID_iD.svg")
#let base-url = "https://orcid.org/"
#let logo-icon(
  size: 1em,
  baseline: 0.125em,
) = box(
  logo,
  width: size,
  height: size,
  baseline: baseline,
)

#let check-format(id) = {
  if type(id) != str {
    panic("ORCID must be of type string: ", type(id))
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
  position: "left",
  separator: [~],
  icon: logo-icon(),
  logo-position: "before",
) = {
  check-format(id)

  if format not in ("logo", "full", "compact", "compact-logo", "full-logo") {
    panic("Format must be logo, full, compact, compact-logo, or full-logo: " + format)
  }

  if position not in ("left", "right") {
    panic("Name position must be left or right: " + position)
  }

  if logo-position not in ("before", "after") {
    panic("Logo position must be before or after: " + logo-position)
  }

  let identifier-link = base-url + id

  let identifier-content = if format in ("full", "full-logo") {
    identifier-link
  } else {
    id
  }

  let display-content = if format == "logo" {
    icon
  } else if format in ("compact-logo", "full-logo") {
    if logo-position == "after" {
      [#identifier-content#separator#icon]
    } else {
      [#icon#separator#identifier-content]
    }
  } else { id }

  if name == none {
    return link(identifier-link, display-content)
  }

  let content = if position == "right" {
    [#name#separator#display-content]
  } else {
    [#display-content#separator#name]
  }

  return link(identifier-link)[#content]
}
