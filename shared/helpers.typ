#import "@preview/fontawesome:0.6.0": *

// Renderiza um item de contato com ícone e link opcional.
#let item-contato(icone, rotulo, url: none, fonte-marca: false) = {
  let i = if fonte-marca {
    fa-icon(icone, font: "Font Awesome 6 Brands")
  } else {
    fa-icon(icone)
  }
  if url != none {
    link(url)[ #i #h(0.3em) #rotulo ]
  } else {
    [ #i #h(0.3em) #rotulo ]
  }
}

// Linha de contato completa gerada a partir do perfil.yaml.
#let linha-contato(perfil) = [
  #item-contato("envelope", perfil.email, url: "mailto:" + perfil.email)
  #h(1em)
  #item-contato("phone", perfil.telefone)
  #h(1em)
  #item-contato("location-dot", perfil.local)
  #h(1em)
  #item-contato("linkedin", perfil.linkedin.rotulo, url: perfil.linkedin.url, fonte-marca: true)
  #h(1em)
  #item-contato("github", perfil.github.rotulo, url: perfil.github.url, fonte-marca: true)
  #h(1em)
  #item-contato("globe", perfil.website.rotulo, url: perfil.website.url)
]
