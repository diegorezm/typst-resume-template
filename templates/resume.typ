#import "../shared/helpers.typ": linha-contato
#import "../shared/tema.typ": configurar-pagina, cor-secundaria

// O arquivo de conteúdo é passado via --input arquivo=resumes/nome.yaml
#let perfil = yaml("../shared/perfil.yaml")
#let resume = yaml(sys.inputs.arquivo)

#configurar-pagina()

// ── Cabeçalho ──────────────────────────────────────────────────────────────────
#align(center)[
  #text(size: 22pt, weight: "bold")[#perfil.nome]
  #v(0.1em)
  #text(size: 11pt, fill: cor-secundaria)[#resume.cargo_alvo]
  #v(0.4em)
  #text(size: 8.5pt)[#linha-contato(perfil)]
]

#v(0.6em)

// ── Resumo ─────────────────────────────────────────────────────────────────────
= Resumo
#resume.resumo

// ── Habilidades ────────────────────────────────────────────────────────────────
= Habilidades
#resume.habilidades.join(" • ")

// ── Experiência ────────────────────────────────────────────────────────────────
= Experiência
#for exp in resume.experiencias [
  #grid(
    columns: (1fr, auto),
    align(left)[== #exp.cargo — #exp.empresa],
    align(right)[#text(fill: cor-secundaria)[#exp.periodo]],
  )
  #v(0.15em)
  #for item in exp.itens [
    - #item
  ]
  #v(0.3em)
]

// ── Projetos ───────────────────────────────────────────────────────────────────
#if "projetos" in resume [
  = Projetos
  #for projeto in resume.projetos [
    #grid(
      columns: (1fr, auto),
      align(left)[
        == #if "link" in projeto [
          #link(projeto.link)[#projeto.nome]
        ] else [
          #projeto.nome
        ]
      ],
      align(right)[],
    )
    #v(0.15em)
    #for item in projeto.itens [
      - #item
    ]
    #v(0.3em)
  ]
]

// ── Formação ───────────────────────────────────────────────────────────────────
#if "formacao" in resume [
  = Formação
  #for edu in resume.formacao [
    #grid(
      columns: (1fr, auto),
      align(left)[== #edu.curso — #edu.instituicao],
      align(right)[#text(fill: cor-secundaria)[#edu.periodo]],
    )
    #v(0.3em)
  ]
]
