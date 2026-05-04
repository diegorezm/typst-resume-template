// Global visual settings: margins, fonts, colors, and heading styles.
// Edit this file to change the look of all resumes at once.

#let accent-color = rgb("#2563EB")   // blue
#let muted-color  = rgb("#64748B")   // gray
#let link-color   = rgb("#2563EB")

#let setup-page(body) = {
  set page(
    paper: "a4",
    margin: (x: 1.4cm, y: 1.2cm),
  )
  set text(
    font: "Arial",
    size: 10pt,
    lang: "en",
  )
  set par(justify: true, leading: 0.65em)

  show link: it => text(fill: link-color)[#it]

  // Section heading style
  show heading.where(level: 1): it => [
    #v(0.3em)
    #text(size: 11pt, weight: "bold")[#upper(it.body)]
    #line(length: 100%, stroke: 0.5pt + accent-color)
    #v(0.3em)
  ]

  // Sub-heading style (company, role)
  show heading.where(level: 2): it => [
    #v(0.2em)
    #text(size: 10pt, weight: "bold")[#it.body]
  ]

  body
}
