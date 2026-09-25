# Instituto Voice — Landing Page (Voice Academy Online)

Landing page simples, em HTML/CSS/JS puro, para divulgação da **Voice Academy Online** do **Instituto Voice**.

## O que tem nessa página

- Seção hero com vídeo 16:9 (placeholder — veja como trocar abaixo)
- Botão de checkout ligado ao link do Kiwify
- Estatísticas de autoridade (anos de experiência, alunos, estados)
- Grade com os 9 módulos do curso + bônus
- Bloco "sobre o Instituto Voice"
- CTA final com botão de checkout
- Rodapé com Instagram e WhatsApp
- Botão flutuante de WhatsApp (canto inferior direito, com balão de dica)
- Meta tags de SEO básicas (title, description, Open Graph, canonical, schema.org)

## Estrutura

```
instituto-voice-landing/
├── index.html
├── assets/
│   ├── logo-white.png   (logo branco, fundo transparente — usar sobre fundo escuro)
│   ├── logo-navy.png    (logo azul-marinho, fundo transparente — usar sobre fundo claro)
│   └── favicon.png
└── README.md
```

## Como colocar o vídeo final no ar

O vídeo está como placeholder (mostrando a logo + botão de play) porque nenhum arquivo de vídeo foi encontrado na pasta do projeto. Para usar o vídeo definitivo, abra `index.html` e localize o bloco `<div class="video-frame" id="videoFrame">` dentro da seção hero. Duas opções:

**Opção 1 — arquivo de vídeo próprio (mp4)**

Coloque o arquivo em `assets/video.mp4` (e uma imagem de capa em `assets/poster.jpg`, opcional) e substitua o conteúdo interno de `#videoFrame` por:

```html
<video controls poster="assets/poster.jpg" style="position:absolute;inset:0;width:100%;height:100%;object-fit:cover;">
  <source src="assets/video.mp4" type="video/mp4">
</video>
```

**Opção 2 — embed do YouTube ou Vimeo**

Substitua o conteúdo interno de `#videoFrame` por um iframe, por exemplo:

```html
<iframe src="https://www.youtube.com/embed/SEU_ID_AQUI" style="position:absolute;inset:0;width:100%;height:100%;border:0;" allow="autoplay; encrypted-media" allowfullscreen></iframe>
```

## Links já configurados

- **Checkout (Kiwify):** `https://pay.kiwify.com.br/323YtCv`
- **Instagram:** `@instituto_voice`
- **WhatsApp:** `45 99829-9255` (botão flutuante e rodapé já usam o link `wa.me` com mensagem pré-preenchida)

## Como rodar localmente

Não há build nem dependências — é um site 100% estático. Basta abrir `index.html` no navegador, ou usar um servidor local simples:

```bash
npx serve .
```

## Deploy no Cloudflare Pages

1. Suba esta pasta para um repositório no GitHub.
2. No Cloudflare Pages, crie um novo projeto conectado a esse repositório.
3. Build command: (deixe em branco)
4. Output directory: `/`
5. Deploy.

## Próximos passos recomendados

- Substituir o vídeo placeholder pelo vídeo final.
- Registrar um domínio próprio e atualizar a tag `<link rel="canonical">` e as tags Open Graph em `index.html`.
- Adicionar Google Analytics / Meta Pixel, se desejado.
- Gerar `sitemap.xml` e `robots.txt` quando o domínio final estiver definido.
