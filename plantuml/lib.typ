#let generate(uml-source: none) = {
  if type(uml-source) == str {
    [generated from string]
  } else if type(uml-source) == bytes {
    [generated from files]
  } else {
    panic("unknown")
  }
}
