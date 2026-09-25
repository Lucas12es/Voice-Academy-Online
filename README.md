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
├── deploy-github.bat     (dois cliques para subir alterações ao GitHub)
├── assets/
│   ├── logo-white.png   (logo branco, fundo transparente — usar sobre fundo escuro)
│   ├── logo-navy.png    (logo azul-marinho, fundo transparente — usar sobre fundo claro)
│   └── favicon.png
├── .gitignore
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

## Deploy para o GitHub (um clique)

Dê **dois cliques** em `deploy-github.bat` sempre que quiser subir as alterações para o GitHub. O script:

1. Verifica se o Git está instalado.
2. Inicializa o repositório local (na primeira vez) e aponta o remoto para `https://github.com/Lucas12es/Voice-Academy-Online.git`.
3. Adiciona, comita e envia (`push`) todas as mudanças da pasta.
4. Se o repositório remoto já tiver algo (README criado pelo GitHub, por exemplo), sincroniza automaticamente priorizando os arquivos locais.
5. Mantém a janela aberta no final mostrando se deu certo ou não — se der erro, a mensagem explica o motivo.

Pré-requisito: ter o [Git](https://git-scm.com/download/win) instalado e configurado (nome/e-mail) nesse computador — o script avisa caso não esteja.

## Deploy automático no Cloudflare Pages

Essa configuração é feita **uma única vez**. Depois disso, toda vez que você rodar o `deploy-github.bat`, o Cloudflare Pages detecta o push no GitHub sozinho e já publica a nova versão — sem precisar fazer mais nada.

1. Acesse [dash.cloudflare.com](https://dash.cloudflare.com) e vá em **Workers & Pages**.
2. Clique em **Create** → aba **Pages** → **Connect to Git**.
3. Autorize a Cloudflare a acessar sua conta do GitHub (se ainda não tiver feito isso) e selecione o repositório `Lucas12es/Voice-Academy-Online`.
4. Configure o projeto:
   - **Production branch:** `main`
   - **Framework preset:** `None`
   - **Build command:** (deixe em branco)
   - **Build output directory:** `/`
5. Clique em **Save and Deploy**.

Pronto — a partir daqui, cada vez que o `deploy-github.bat` enviar alterações para o GitHub, o Cloudflare Pages builda e publica automaticamente em poucos segundos, sem nenhuma ação manual. Você acompanha cada deploy na aba **Deployments** do projeto no Cloudflare.

## Próximos passos recomendados

- Substituir o vídeo placeholder pelo vídeo final.
- Registrar um domínio próprio e atualizar a tag `<link rel="canonical">` e as tags Open Graph em `index.html`.
- Adicionar Google Analytics / Meta Pixel, se desejado.
- Gerar `sitemap.xml` e `robots.txt` quando o domínio final estiver definido.
