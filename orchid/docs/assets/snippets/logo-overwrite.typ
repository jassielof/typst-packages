#import "/orchid/lib.typ": * // instead of #import "..." as orchid
#set page(
  height: 7em,
  width: 10em,
)

#let my-id = "0000-0000-0000-0000"

- Default: #generate-link(my-id)
#let logo-icon = box(logo, width: 1.5em, height: 1.5em, baseline: 0.5em)
- Overwritten: #generate-link(my-id, icon: logo-icon)
