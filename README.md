# Instituto Voice — Landing Page (Voice Academy Online)

Landing page simples, em HTML/CSS/JS puro, para divulgação da **Voice Academy Online** do **Instituto Voice**.

## O que tem nessa página

- Seção hero com vídeo 16:9 (`assets/video.mp4`)
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
│   ├── video.mp4        (vídeo de apresentação, versão comprimida p/ web — usado na página)
│   ├── 1007.mp4         (vídeo original em alta resolução — fica só no computador, ignorado pelo Git)
│   ├── logo-white.png   (logo branco, fundo transparente — usar sobre fundo escuro)
│   ├── logo-navy.png    (logo azul-marinho, fundo transparente — usar sobre fundo claro)
│   └── favicon.png
├── .gitignore
└── README.md
```

## Vídeo da seção hero

O vídeo final já está em uso: `assets/video.mp4`, carregado dentro de `<div class="video-frame has-video" id="videoFrame">` na seção hero, com os controles nativos do navegador (play/pausa, volume, tela cheia).

Esse arquivo é uma versão comprimida do vídeo original que você colocou em `assets/1007.mp4` (que tinha 344MB em 2560x1440). O original foi mantido apenas no seu computador (está no `.gitignore`, não sobe para o repositório) e uma versão web — 1280x720, ~20MB — foi gerada para uso na página.

**Importante:** o deploy é feito via Cloudflare Workers (assets estáticos), que tem um limite rígido de **25 MiB por arquivo** — diferente do limite de 100MB do GitHub. Por isso o vídeo precisa ficar abaixo de 25 MiB (hoje está em ~20 MiB, com margem de segurança). Se trocar o vídeo, gere uma versão comprimida (por exemplo com [HandBrake](https://handbrake.fr/), preset "Fast 720p30", mirando algo entre 15-22MB) e substitua `assets/video.mp4`, ou edite o `src` dentro da tag `<source>` em `index.html`. Nunca suba um arquivo de vídeo igual ou maior que 25 MiB nessa pasta — o build do Cloudflare falha com "Asset too large".

Se preferir usar um embed do YouTube ou Vimeo no lugar do arquivo local, substitua o conteúdo interno de `#videoFrame` por um iframe, por exemplo:

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

## Enviar os leads da caixinha por e-mail (EmailJS)

Quando alguém preenche a caixinha (nome, telefone, e-mail) antes do checkout, o site pode enviar esses dados automaticamente por e-mail para o seu cliente — usando a própria conta de e-mail dele (Gmail/Outlook), sem precisar de servidor. Isso é feito com o [EmailJS](https://www.emailjs.com) (gratuito até 200 e-mails/mês).

**Configuração (uma vez só):**

1. Crie uma conta grátis em [emailjs.com](https://www.emailjs.com).
2. No painel, vá em **Email Services** → **Add New Service** → escolha o provedor do cliente (Gmail, Outlook etc.) e autorize o acesso à conta de e-mail dele. Isso gera um **Service ID** (ex: `service_abc1234`).
3. Vá em **Email Templates** → **Create New Template**:
   - No campo **To Email**, coloque o e-mail do cliente que vai receber os leads.
   - No assunto e corpo do e-mail, use as variáveis `{{from_name}}`, `{{phone}}`, `{{email}}` e `{{message}}` (ex: assunto "Novo lead — Voice Academy Online", corpo com "Nome: {{from_name}} / Telefone: {{phone}} / E-mail: {{email}}").
   - Salve. Isso gera um **Template ID** (ex: `template_xyz5678`).
4. Vá em **Account** → **General** e copie a **Public Key**.
5. Abra `index.html`, procure por `EMAILJS_PUBLIC_KEY`, `EMAILJS_SERVICE_ID` e `EMAILJS_TEMPLATE_ID` (perto do fim do arquivo) e substitua pelos valores copiados nos passos acima.

Enquanto esses 3 valores não forem preenchidos, o site funciona normalmente — ele só pula silenciosamente o envio do e-mail e vai direto para o checkout. O envio do e-mail nunca atrasa o checkout em mais de ~1,2 segundo, mesmo se o EmailJS estiver fora do ar.

## Próximos passos recomendados

- Substituir o vídeo placeholder pelo vídeo final.
- Registrar um domínio próprio e atualizar a tag `<link rel="canonical">` e as tags Open Graph em `index.html`.
- Adicionar Google Analytics / Meta Pixel, se desejado.
- Gerar `sitemap.xml` e `robots.txt` quando o domínio final estiver definido.
