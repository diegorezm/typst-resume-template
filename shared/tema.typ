// Configurações visuais globais: margens, fontes, cores e estilos de cabeçalho.
// Edite este arquivo para mudar o visual de todos os currículos de uma vez.

#let cor-destaque = rgb("#2563EB")  // azul
#let cor-secundaria = rgb("#64748B") // cinza

#let configurar-pagina() = {
  set page(
    paper: "a4",
    margin: (x: 1.4cm, y: 1.2cm),
  )
  set text(
    font: "Linux Libertine",
    size: 10pt,
    lang: "pt",
  )
  set par(justify: true, leading: 0.65em)

  // Estilo dos títulos de seção
  show heading.where(level: 1): it => [
    #v(0.6em)
    #text(size: 11pt, weight: "bold", fill: cor-destaque)[#upper(it.body)]
    #line(length: 100%, stroke: 0.5pt + cor-destaque)
    #v(0.3em)
  ]

  // Estilo dos sub-títulos (empresa, cargo)
  show heading.where(level: 2): it => [
    #v(0.2em)
    #text(size: 10pt, weight: "bold")[#it.body]
  ]
}
