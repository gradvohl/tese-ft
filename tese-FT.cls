%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following comments were written in Portuguese, because this 
% template applies only for School of Technology at University 
% of Campinas, Brazil.
%
% Este é a classe de documentos Latex para teses de doutorado e 
% dissertações de mestrado da Faculdade de Tecnologia (FT) da 
% Universidade Estadual de Campinas (UNICAMP).
%
% Este arquivo de classe de documento e seu respectivo modelo 
% foram adaptado do modelo de teses e dissertações do 
% Instituto de Computação da UNICAMP e estão de acordo com a 
% Norma CPG 001/2019..
%
% Autor: André Leon Sampaio Gradvohl, Dr.
% Email:     gradvohl@ft.unicamp.br
% Lattes CV: http://lattes.cnpq.br/9343261628675642
% ORCID:     0000-0002-6520-9740
% 
% Última versão: 14/junho/2020
%
% Adições/Alterações nesta última versão:
% - Adição de informações sobre a inclusão do arquivo com a 
%   ficha catalográfica ou página em branco.
% - Ajustes no idioma para a lista de abreviações e siglas.
% - Adequações na lista de símbolos.
% - Inclusão do pacote silence para suprimir os "warnings" 
%   referentes à inclusão do arquivo "brazilian-abnt". 
% - Adição da opção "noFig" para acelerar a compilação, sem 
%   a adição de figuras. Use apenas junto com a opção Draft.
% - Adição de comandos para referenciar múltiplos capítulos, 
%   seções, figuras, tabelas, equações.
% - Adição de citação a software na bibliografia.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tese-FT}[]
\typeout{tese-FT}

\def\thesislanguage#1{\gdef\@thesislanguage{#1}}
\DeclareOption{Ingles}{
  \thesislanguage{0}
  \typeout{tese-FT: ingles.}
}
\DeclareOption{Espanhol}{
  \thesislanguage{1}
  \typeout{tese-FT: espanhol.}
}
\DeclareOption{Portugues}{
  \thesislanguage{2}
  \typeout{tese-FT: portugues.}
}
\DeclareOption{Draft}{
  \finalversionfalse
  \typeout{tese-FT: Draft.}
}
\newif\iffinalversion
\DeclareOption{Final}{
  \finalversiontrue
  \typeout{tese-FT: versao final.}
}

\newif\ifnofig
\DeclareOption{noFig}{
  \nofigtrue
  \typeout{tese-FT: Draft without figures.}
}

\ProcessOptions\relax

% Classe base: Relatório
% Se for a versão final, inclui as figuras
\iffinalversion
  \LoadClass[12pt,a4paper]{report}
  % Pacote Silence para ocultar a advertência para o brazilian-abnt.
  % Use a opção "[debrief]" para inspecionar melhor o documento.
  \RequirePackage{silence}
  \WarningsOff[biblatex]
\else %Caso contrário, segue no formato Draft.
  \LoadClass[12pt,a4paper,draft]{report}
  \ifnofig %Se nofig estiver ativado, não inclua as figuras.
  \usepackage[allfiguresdraft]{draftfigure}
  \fi
\fi
%
%Pacotes padrão para as línguas usadas no texto.
\RequirePackage[english,spanish,portuguese,brazil]{babel}
\RequirePackage{fancyhdr}
%Pacotes para determinar o tipo de fonte usada para imprimir o texto
\RequirePackage[ttscale=.875]{libertine}
\RequirePackage{libertinust1math}
\RequirePackage[T1]{fontenc}
%Pacotes para determinar o tipo de fonte usada para escrever o texto
\RequirePackage[utf8]{inputenc}
%Pacotes para facilitar a inclusão das figuras
\RequirePackage{graphicx}
\graphicspath{{./logotipos/}{./figuras/}}
\PassOptionsToPackage{table}{xcolor}
%Pacotes para incluir os hiperlinks no texto
\RequirePackage{hyperref}
%Mantenha o pacote a seguir para incluir a lista de abreviaturas.
\RequirePackage{nomencl} \makenomenclature
\RequirePackage{pdfpages}
\RequirePackage{xspace}
\RequirePackage{setspace}
\RequirePackage{geometry}
\geometry{a4paper,top=30mm,bottom=20mm,left=30mm,right=20mm}
\RequirePackage{csquotes}
%Pacotes para adicionar a bibliografia
% Coloque a opção uniquename=false, se não quiser que o Biblatex faça a desambiguação de nomes.
\RequirePackage[style=abnt,uniquename=init,giveninits,uniquelist=true,maxbibnames=4,repeatfields=true,justify]{biblatex}
%Pacote para tabelas mais interessantes
\RequirePackage{booktabs}
\renewcommand{\arraystretch}{1.2}
%Teste com pacote listofitems
\RequirePackage{listofitems}
\RequirePackage{ifthen}
%
% Definição de novos comandos
\newcommand{\@FT}{Faculdade de Tecnologia}
\newcommand{\@UNICAMP}{Universidade Estadual de Campinas}
%
% Criação de variáveis para o texto.
\let\@autor\relax
\def\autor#1{\gdef\@autor{#1}}
\author{\@autor}
%
\let\@autora\relax
\def\autora#1{\gdef\@autora{#1}}
%
\let\@titulo\relax
\def\titulo#1{\gdef\@titulo{#1}}
\title{\@titulo}
%
\def\grau#1{\gdef\@grau{#1}}
%
\newif\ifmaster
%
%%%%
\gdef\bsi{
%added
  \gdef\@textoaviso{\relax}
  \if\@autora\relax
  \gdef\@degnamept{Bacharel em Sistemas de Informação}
  \gdef\@degnamees{Licenciatura en Sistemas de Información}
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Bacharela em Sistemas de Informação}
  \gdef\@degnamees{Bacharela}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Bachelor in Information Sciences}
  \gdef\@monopt{Dissertação}
  \gdef\@monoes{Dissertacíon}
  \gdef\@monoen{Monograph}
}

\gdef\tads{
%added
  \gdef\@textoaviso{\relax}
  \if\@autora\relax
  \gdef\@degnamept{Tecnólogo em Análise e Desenvolvimento de Sistemas}
  \gdef\@degnamees{Tecnólogo}
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Tecnóloga em Análise e Desenvolvimento de Sistemas}
  \gdef\@degnamees{Tecnóloga}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Technologist in Systems Analysis and Development}
  \gdef\@monopt{Dissertação}
  \gdef\@monoes{Dissertacíon}
  \gdef\@monoen{Monograph}
}
%%%%
\gdef\qualificacaoMestrado{
%added 
  \gdef\@textoaviso{\clearpage}
  \if\@autora\relax
  \gdef\@degnamept{Mestre em Tecnologia}
  \gdef\@degnamees{Maestro en Tecnología}
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Mestra em Tecnologia}
  \gdef\@degnamees{Maestra en Tecnología}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Master of Science in Technology}
  \gdef\@monopt{Monografia de qualificação}
  \gdef\@monoes{Monografía de calificación}
  \gdef\@monoen{Qualification monograph}
}
%%%%
\gdef\qualificacaoDoutorado{
%added 
  \gdef\@textoaviso{\clearpage}
  \if\@autora\relax
  \gdef\@degnamept{Doutor em Tecnologia}
  \gdef\@degnamees{Doctor en Tecnología}
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Doutora em Tecnologia}
  \gdef\@degnamees{Doctora en Tecnología}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Doctor in Technology}
  \gdef\@monopt{Monografia de qualificação}
  \gdef\@monoes{Monografía de calificación}
  \gdef\@monoen{Qualification monograph}
}
\gdef\mestrado{
%added 
  \gdef\@textoaviso{\clearpage \cathpage}
  \if\@autora\relax
  \gdef\@degnamept{Mestre em Tecnologia}
  \gdef\@degnamees{Maestro en Tecnología}
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Mestra em Tecnologia}
  \gdef\@degnamees{Maestra en Tecnología}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Master of Science in Technology}
  \gdef\@monopt{Dissertação}
  \gdef\@monoes{Dissertacíon}
  \gdef\@monoen{Thesis}
}
%%%%
\gdef\doutorado{
%added 
  \gdef\@textoaviso{\clearpage \cathpage}
  \if\@autora\relax
  \gdef\@degnamept{Doutor em Tecnologia}
  \gdef\@degnamees{Doctoren Tecnología}
  \gdef\@artigo{o}
  \else
  \gdef\@degnamept{Doutora em Tecnologia}
  \gdef\@degnamees{Doctora en Tecnología}
  \gdef\@artigo{a}
  \fi
  \gdef\@degnameen{Doctor in Technology}
  \gdef\@monopt{Tese}
  \gdef\@monoes{Tesis}
  \gdef\@monoen{Thesis}
}

\let\@orientador\relax
\def\orientador#1{\gdef\@orientador{#1}}

\let\@orientadora\relax
\def\orientadora#1{\gdef\@orientadora{#1}}

\gdef\@advisors{1}
\let\@coorientador\relax
\def\coorientador#1{\gdef\@coorientador{#1}\gdef\@advisors{2}}

\let\@coorientadora\relax
\def\coorientadora#1{\gdef\@coorientadora{#1}\gdef\@advisors{2}}

\def\datadadefesa#1#2#3{
  \gdef\@dia{#1}
  \gdef\@mes{#2}
  \gdef\@ano{#3}
}

\let\@fichacatalografica\relax
\def\fichacatalografica#1{\gdef\@fichacatalografica{#1}}

\let\@avalA\relax
\let\@avalB\relax
\let\@avalC\relax
\let\@avalD\relax
\let\@avalE\relax
\let\@avalF\relax
\let\@avalG\relax
\let\@avalH\relax
\let\@instavalA\relax
\let\@instavalB\relax
\let\@instavalC\relax
\let\@instavalD\relax
\let\@instavalE\relax
\let\@instavalF\relax
\let\@instavalG\relax
\let\@instavalH\relax

\def\avaliadorA#1#2{\gdef\@avalA{#1}\gdef\@instavalA{#2}}
\def\avaliadorB#1#2{\gdef\@avalB{#1}\gdef\@instavalB{#2}}
\def\avaliadorC#1#2{\gdef\@avalC{#1}\gdef\@instavalC{#2}}
\def\avaliadorD#1#2{\gdef\@avalD{#1}\gdef\@instavalD{#2}}
\def\avaliadorE#1#2{\gdef\@avalE{#1}\gdef\@instavalE{#2}}
\def\avaliadorF#1#2{\gdef\@avalF{#1}\gdef\@instavalF{#2}}
\def\avaliadorG#1#2{\gdef\@avalG{#1}\gdef\@instavalG{#2}}
\def\avaliadorH#1#2{\gdef\@avalH{#1}\gdef\@instavalH{#2}}

\let\@cotutela\relax
\def\cotutela#1{\gdef\@cotutela{#1}}

\let\@areaConcentracao\relax
\def\areaConcentracao#1{\gdef\@areaConcentracao{#1}}

\def\paginasiniciais{
  \newlength{\oldparindent}
  \setlength{\oldparindent}{\parindent}
  \setlength\parindent{0pt}
  \thispagestyle{empty}
  \pagestyle{empty}  
  \makeatletter
  \let\ps@mystyle\ps@plain
  \let\ps@plain\ps@empty
  \makeatother
  \openningpage
  \clearpage
  \titlepage

  \@textoaviso

  %Definição de títulos específicos, dependendo do idioma
  \ifcase\@thesislanguage\relax
  %English
  \renewcommand{\nomname}{List of Acronyms}
  \or%Español
  \renewcommand{\nomname}{Lista de abreviaturas y acrónimos}
  \or%Português 
  \renewcommand{\nomname}{Lista de Abreviaturas e Siglas}
  \fi
%}

  \clearpage
  \approvalpage
  \clearpage
  \setlength{\parindent}{\oldparindent}
  \resetlang
}

\def\logos{
    \noindent
    \raisebox{-.5\height}{\includegraphics[width=2.2cm]{logo-unicamp.pdf}}

    \vspace*{2cm}
    
    \noindent
    \begin{center} \large
        \MakeUppercase{\@UNICAMP}\\
        \@FT
    \end{center}
}

\def\openningpage{
  \logos
  \vskip 35mm
  \begin{center}
    \Large
    {\bf \if\@autora\relax\@autor\else\@autora\fi}
    \vskip 25mm
    \ifcase\@thesislanguage
      {\bf\@title}
      \vskip 25mm
    \or
      {\bf\@title}
      \vskip 25mm
    \fi
    {\bf \@titulo}
    \vfill
    \large
    Limeira\\\@ano
  \end{center}
}


\def\titlepage{
  \large\bf
  \vfill
  \begin{center}
    \if\@autora\relax\@autor\else\@autora\fi
    \vfill
    \ifcase\@thesislanguage
      \@title
      \vskip 8mm
    \or
      \@title
      \vskip 8mm
    \fi
    \@titulo
  \end{center}
  \vfill
  \normalfont
  \normalsize
  \hfill\begin{minipage}[t]{0.54\textwidth}
    \supresshyphen
    \@monopt\xspace apresentada à Faculdade de Tecnologia da Universidade Estadual de Campinas como parte dos requisitos para a obtenção do título de \@degnamept\xspace \ifx\@areaConcentracao\relax\else, na área de  \@areaConcentracao\fi\ifx\@cotutela\relax\else\xspace, no âmbito do acordo de Cotutela firmado entre a Unicamp e a \@cotutela\fi.
  \end{minipage}
  \ifcase\@thesislanguage
    \vskip 8mm
    \hfill\begin{minipage}[t]{0.54\textwidth}
      \supresshyphen
      \@monoen\xspace presented to the School of Technology of the
      University of Campinas in partial fulfillment of the requirements for
      the degree of \@degnameen\xspace in Computer
      Science\ifx\@areaConcentracao\relax\else, in the area of  \@areaConcentracao\fi\ifx\@cotutela\relax\else\xspace under the double-diploma
      agreement between Unicamp and \@cotutela\fi.
    \end{minipage}
  \or
    \vskip 8mm
    \hfill\begin{minipage}[t]{0.54\textwidth}
      \supresshyphen
      \@monoes\xspace presentada a Faculdad de Tecnologia de la
      Universidad de Campinas para obtener el título de
      \@degnamees\xspace en Tecnologia\ifx\@areaConcentracao\relax\else, en la area de  \@areaConcentracao\fi\ifx\@cotutela\relax\else\xspace en el ámbito del
      acuerdo de Cotutela firmando entre la Universidad Estatal de Campinas
      y la \@cotutela\fi.
    \end{minipage}
  \fi
  \vfill
  \ifcase\@thesislanguage
    {\bf Supervisor/}\hspace{-0.9ex}
  \or
    \if\@orientadora\relax {\bf Director/}\else {\bf Directora/}\fi\hspace{-0.9ex}
  \fi
  \if\@orientadora\relax {\bf Orientador: \@orientador}
  \else {\bf Orientadora: \@orientadora}
  \fi
  \ifnum\@advisors=2
    \\
    \ifcase\@thesislanguage
      {\bf Co-supervisor/}\hspace{-0.7ex}
    \or
      \if\@coorientadora\relax {\bf Co-director/}\else {\bf Co-directora/}\fi\hspace{-0.7ex}
    \fi
    \if\@coorientadora\relax {\bf Coorientador: \@coorientador}
    \else {\bf Coorientadora: \@coorientadora}
    \fi
  \fi
  \vfill
  \iffinalversion
    \begin{minipage}[t]{0.5\textwidth}
      \supresshyphen
      Este exemplar corresponde à versão final da \@monopt\xspace defendida por
      \if\@autora\relax\@autor\else\@autora\fi\xspace e orientada
      \if\@orientadora\relax pelo \@orientador\else pela \@orientadora\fi.
    \end{minipage}
  \else
    \begin{minipage}[t]{0.5\textwidth}
      \supresshyphen
      Este exemplar corresponde à versão da \@monopt\xspace entregue
      à banca antes da defesa.
    \end{minipage}
  \fi
  \vfill
  \begin{center}
    \large
    Limeira\\ \@ano
  \end{center}
}


\def\cathpage{
  \ifx\@fichacatalografica\relax
  Na versão final, esta página será substituída pela
  ficha catalográfica na dissertação de mestrado ou na
  tese de doutorado.
  
  \phantom{linha em branco}
  
  No caso de TCC, deixe essa página em branco.
  
  \phantom{linha em branco}
  
  Adicione o arquivo PDF com a ficha catalográfica no comando \textbackslash\texttt{fichacatalografica\{\,\}} no arquivo principal (\texttt{tese.tex}). Caso a versão da sua dissertação ou tese seja a  versão antes da aprovação pela banca, você pode substituir esta por uma página em branco com o comando a seguir:
  
  \begin{center}
      \textbackslash\texttt{fichacatalografica\{branco.pdf\}}
  \end{center}
      
      Substitua o arquivo \texttt{branco.pdf} por \texttt{white.pdf}, nos textos em inglês, ou por \texttt{blanco.pdf}, para textos em espanhol.
  
  \phantom{linha em branco}
  
  
  De acordo com o padrão da CCPG: ``Quando se tratar de Teses e
  Dissertações financiadas por agências de fomento, os beneficiados
  deverão fazer referência ao apoio recebido e inserir esta
  informação na ficha catalográfica, além do nome da agência, o
  número do processo pelo qual recebeu o auxílio.''\\e\\``caso a
  tese de doutorado seja feita em Cotutela, será necessário informar na
  ficha catalográfica o fato, a Universidade convenente, o país e o
  nome do orientador.''
  \else
  \includepdf[pagecommand={}]{\@fichacatalografica}
  \fi
}


\def\approvalpage{
  \iffinalversion
    \noindent\centerline{\large\MakeUppercase{\textbf{Folha de Aprovação}}}
    \vskip 20mm
    
    Abaixo se apresentam os membros da comissão julgadora da sessão pública de defesa de dissertação para o Título de \@degnamept\xspace na área de concentração \@areaConcentracao, a que se submeteu \@artigo\xspace alun\@artigo\xspace \if\@autora\relax\@autor\else\@autora\fi, em \@dia\xspace de \ifcase \@mes \or janeiro\or fevereiro\or março\or abril\or maio\or junho\or julho\or agosto\or setembro\or outubro\or novembro\or dezembro\fi\xspace de \@ano\xspace na Faculdade de Tecnologia -- FT/UNICAMP, em Limeira/SP.

    \vfill

    \ifx\@avalA\relax
    \else
       \noindent \textbf{\@avalA}\newline 
       \noindent Presidente da Comissão Julgadora \vspace*{3em}%\@instavalA 
       
       \ifx\@avalB\relax\else \noindent \textbf{\@avalB}\newline\@instavalB\vspace*{3em}\fi
       
       \ifx\@avalC\relax\else \noindent \textbf{\@avalC}\newline\@instavalC\vspace*{3em}\fi
       
       \ifx\@avalD\relax\else \noindent \textbf{\@avalD}\newline\@instavalD\vspace*{3em}\fi
       
       \ifx\@avalE\relax\else \noindent \textbf{\@avalE}\newline\@instavalE\vspace*{3em}\fi
       
       \ifx\@avalF\relax\else \noindent \textbf{\@avalF}\newline\@instavalF\fi
    \fi
    \vfill
      \supresshyphen
      \noindent
       Ata da defesa, assinada pelos membros da Comissão Examinadora, consta no SIGA/Sistema de Fluxo de Dissertação/Tese e na Secretaria de Pós Graduação da FT.
    \vfill
  \else
    Na versão final, esta página será substituída por outra
    informando a composição da banca e que a ata de defesa está arquivada
    pela Unicamp.
  \fi
}


\def\prefacesection#1{
  \chapter*{#1}
  %\addcontentsline{toc}{chapter}{#1}
  \pagestyle{empty}
  \thispagestyle{empty}
}


\gdef\resetlang{
  \ifcase\@thesislanguage\relax
  \selectlanguage{english}
  \or\selectlanguage{spanish}
  \or\selectlanguage{brazil}
  \fi
}

\gdef\supresshyphen{
  \tolerance=1
  \emergencystretch=\maxdimen
  \hyphenpenalty=10000
  \hbadness=10000
}

% Definição dos Elementos Pré-textuais
\newenvironment{resumo}{\prefacesection{Resumo}\selectlanguage{brazil}}{\resetlang \newpage}
\renewenvironment{abstract}{\prefacesection{Abstract}\selectlanguage{english}}{\resetlang \newpage}
\newenvironment{resumen}{\prefacesection{Resumen}\selectlanguage{spanish}}{\resetlang \newpage}

\newenvironment{epigrafe}{\newpage\mbox{}\vfill\hfill\begin{minipage}[t]{0.5\textwidth}}
{\end{minipage}\newpage}

\newcommand{\fimdaspaginasiniciais}{
\newpage
\makeatletter
\let\ps@plain\ps@mystyle
\makeatother

%Definição das primeiras páginas dos capítulos
\fancypagestyle{plain}{
  \fancyhf{}% Limpa todos os campos
  \fancyhead[R]{\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\headheight}{14.49999pt}%
}

%Definição das demais páginas do texto
\fancypagestyle{headings}{%
  \fancyhf{}% Limpa todos os campos
  \fancyhead[L]{\textsc{\nouppercase{\leftmark}}}
  \fancyhead[R]{\thepage}% Numero da página à direita
  \renewcommand{\headrulewidth}{1pt}%
  \renewcommand{\headheight}{14.49999pt}%
}

\pagestyle{headings}

\setstretch{1.5} %Definido espaçamento entre linhas de 1,5
}

%controle de linhas órfãs e viúvas.
\widowpenalty10000
\clubpenalty10000

%Filtragem dos parâmetros para múltiplas referências.
\newcounter{cnt}
\newcommand{\procitems}[1] {%
  \setcounter{cnt}{1}%
  \setsepchar{,}%
  \readlist*\argumentos{#1}%
  \ifthenelse{\argumentoslen>1}{%
      \whiledo{\argumentoslen>\the\numexpr\value{cnt}+1\relax}{%
         \ref{\argumentos[\value{cnt}]},\xspace
         \stepcounter{cnt}%
     }%
     \ref{\argumentos[-2]} e \ref{\argumentos[-1]}%
    }{% else
       \ref{\argumentos[1]}%
    }%
}%
%
%comandos específicos para referenciar Figuras, Tabelas, Seções etc.
\newcommand{\Capitulo}[1] {Capítulo~\ref{#1}}
\newcommand{\capitulos}[1]{capítulos \procitems{#1}}
\newcommand{\Secao}[1] {Seção~\ref{#1}}
\newcommand{\secoes}[1]{seções \procitems{#1}}
\newcommand{\Figura}[1]{Figura~\ref{#1}}
\newcommand{\figuras}[1]{figuras \procitems{#1}}
\newcommand{\Tabela}[1] {Tabela~\ref{#1}}
\newcommand{\tabelas}[1]{tabelas \procitems{#1}}
\newcommand{\Equacao}[1] {Equação~\ref{#1}}
\newcommand{\equacoes}[1]{equações \procitems{#1}}

%Comandos para abreviações especiais
\newcommand{\ie}{i.\,e.\xspace}
\newcommand{\eg}{e.\,g.\xspace}
\newcommand{\pex}{p.\,ex.\xspace}

%Comandos para adição de siglas 
\newcommand{\Sigla}[2]{#1 (#2)\nomenclature{#2}{#1}}
\newcommand{\SiglaHifen}[2]{#1 -- #2\nomenclature{#2}{#1}}