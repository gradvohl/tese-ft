# Modelo para Teses e Dissertações na FT-UNICAMP
[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/) ![OverleafReady](https://img.shields.io/badge/Ready_for-Overleaf-success) ![Apache license](https://img.shields.io/badge/license-Apache%202.0-blue) [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity) 

Este é um modelo LaTeX para monografias de Trabalhos de Conclusão de Curso (TCC) na graduação, dissertações de Mestrado e Teses de doutorado da Faculdade de Tecnologia (FT) da Universidade Estadual de Campinas (UNICAMP).

Esse modelo e seu respectivo arquivo de classe de documento foram adaptados do modelo de teses e dissertações do Instituto de Computação da UNICAMP.

A utilização desse modelo é livre e está de acordo com a última versão das **Normas sobre o formato das dissertações de mestrado e teses de doutorado da UNICAMP (Instrução Normativa CPG 002/2021)**.

Você também poderá utilizar esse modelo diretamente no [Overleaf](https://www.overleaf.com), um site que permite a edição de textos no LaTeX de forma bem prática.

O modelo no site Overleaf está disponível em neste [link](https://pt.overleaf.com/latex/templates/template-para-teses-e-dissertacoes-na-ft-slash-unicamp/rhznqbkjvpcr) ou procure por **Template para teses e dissertações na FT/UNICAMP**. Verifique se está na última versão (7/Junho/2025).

## Arquivos que você vai utilizar
:no_entry_sign: Você **não** deve mexer no arquivo ``tese-FT.cls``. Nele estão os comandos para a devida formatação do texto.

Os arquivos que você deve utilizar são os seguintes:
1. *``tese.tex``*: Arquivo com o módulo principal do seu texto. Nele você vai definir o título do texto, nome do autor, nome dos membros da banca, tipo de texto e uma série de outras informações gerais. Está tudo explicado nos comentários no arquivo (linhas que começam com %).
2. *``bibliografia.bib``*: Arquivo com as referências bibliográficas, cuja compilação é feita com o programa `biber` ou `natbib`. O arquivo com as referências bibliográficas deve serguir um formato específico. Veja mais informações no [Guia rápido](https://www.overleaf.com/learn/latex/Articles/Getting_started_with_BibLaTeX) ou detalhes específicos no [Biblatex Cheat Sheet](http://tug.ctan.org/info/biblatex-cheatsheet/biblatex-cheatsheet.pdf).
3. Todos os arquivos .tex podem ser utilizados normalmente. Nesse modelo, cada capítulo ficou em um arquivo diferente. Isso acelera a compilação e permite uma melhor organização dos tópicos.

Observe que existe um diretório **``figuras``**. Nele você pode adicionar todas as figuras do seu texto. Para uma compilação mais rápida, sugere-se que as figuras estejam no formato `.pdf`. Mas, você pode usar `.png`, `.jpg` ou `.eps`.

Se você baixar o modelo tese-FT deste repositório no GitHub, não esqueça de verificar se o LaTeX e todos os pacotes (*packages*) os quais o modelo depende estão instalados na sua máquina.

## Compilação do projeto em ambiente Linux

Ao baixar esse modelo para compilação em ambientes Linux, muitos estudantes se queixaram de erros que surgiram durante o processo de compilação. Esses erros não acontecem quando se utiliza o Overleaf.

As razões para as ocorrências desses erros podem ser as seguintes:
1. Falta de pacotes para compilar alguns comandos especiais.
2. Desconhecimento do processo de compilação completo, incluindo a adição das referências bibliográficas.

Para solucionar o item 1, a sugestão é acessar o *site* do [CTAN -- https://ctan.org](https://ctan.org). Esse *site* contém todos pacotes do LaTeX. Portanto, caso um pacote não esteja instalado localmente, acesse o [CTAN](https://ctan.org) e busque o pacote necessário.

Ainda no item 1, certifique-se que você instalou **toda** a distribuição Tex Live mais atual. O *site* do [TeX User Group](https://www.tug.org/texlive/acquire-netinstall.html) tem a última versão.

Por sua vez, para solucionar o item 2, use o *script* ``compila.sh`` que disponibilizei neste repositório. Para executá-lo, utilize o comando a seguir:

```bash
./compila.sh tese.tex
```

Lembrando que o arquivo ``tese.tex`` é o arquivo principal do projeto.

## Dúvidas e sugestões

Quaisquer dúvidas podem ser sanadas pelo autor no email a seguir.

Autor: **André Leon Sampaio Gradvohl, Dr.**

Email:        gradvohl@unicamp.br 

Lattes CV:    http://lattes.cnpq.br/9343261628675642

ORCID: [0000-0002-6520-9740](https://orcid.org/0000-0002-6520-9740)

Última versão: 7/Junho/2025

Esse software está em um repositório indexado pelo Zenodo e pode ser acessado com o DOI a seguir 

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.842220.svg)](https://doi.org/10.5281/zenodo.842220)

:handshake: Se você acredita que esse modelo o ajudou na escrita da sua tese ou dissertação, considere enviar um email de agradecimento para o autor ou cite-o nas redes sociais [Twitter](https://twitter.com/AGradvohl), [LinkedIn](https://www.linkedin.com/in/andregradvohl) ou [Facebook](https://www.facebook.com/andre.gradvohl). 
