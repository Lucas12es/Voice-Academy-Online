@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title Deploy - Instituto Voice - Voice Academy Online
cd /d "%~dp0"

set REPO_URL=https://github.com/Lucas12es/Voice-Academy-Online.git
set BRANCH=main

echo ================================================
echo   Instituto Voice - Deploy para o GitHub
echo ================================================
echo.

where git >nul 2>&1
if !errorlevel! neq 0 (
    echo [ERRO] O Git nao foi encontrado neste computador.
    echo Baixe e instale em: https://git-scm.com/download/win
    echo Depois execute este arquivo novamente.
    echo.
    pause
    exit /b 1
)

if not exist ".git" (
    echo Inicializando repositorio Git nesta pasta...
    git init -q
    git branch -M %BRANCH%
)

echo Configurando repositorio remoto...
git remote remove origin >nul 2>&1
git remote add origin %REPO_URL%

echo.
echo Adicionando arquivos...
git add -A

git diff --cached --quiet
if !errorlevel! equ 0 (
    echo.
    echo Nenhuma alteracao nova para enviar. Tudo ja esta atualizado.
    echo.
    pause
    exit /b 0
)

echo Criando commit...
git commit -q -m "Deploy: %date% %time:~0,5%"

echo.
echo Enviando para o GitHub...
git push -u origin %BRANCH% 2>nul
if !errorlevel! neq 0 (
    echo O repositorio remoto ja tem conteudo. Sincronizando automaticamente...
    git pull origin %BRANCH% --allow-unrelated-histories --no-rebase -X ours --no-edit
    if !errorlevel! neq 0 (
        echo.
        echo [ERRO] Nao foi possivel sincronizar automaticamente com o repositorio remoto.
        echo Verifique sua conexao com a internet e se voce tem permissao de escrita
        echo no repositorio: %REPO_URL%
        echo.
        pause
        exit /b 1
    )
    git push -u origin %BRANCH%
    if !errorlevel! neq 0 (
        echo.
        echo [ERRO] O envio para o GitHub falhou. Verifique sua conexao,
        echo se voce esta logado no Git/GitHub e se tem permissao no repositorio.
        echo.
        pause
        exit /b 1
    )
)

echo.
echo ================================================
echo   Deploy concluido com sucesso!
echo   Repositorio: %REPO_URL%
echo ================================================
echo.
pause
exit /b 0
