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
% foram adaptados do modelo de teses e dissertações do 
% Instituto de Computação da UNICAMP e estão de acordo com a 
% Instrução Normativa CPG 002/2021.
%
% Autor: André Leon Sampaio Gradvohl, Dr.
% Email:     gradvohl@unicamp.br
% Lattes CV: http://lattes.cnpq.br/9343261628675642
% ORCID:     0000-0002-6520-9740
% 
% Última versão: 10/julho/2025.
%
% Adições/Alterações nesta última versão:
% - Ajustes na folha de aprovação.
%   - Simplificações na folha de aprovação por solicitação da Pró-reitoria de Pós-graduação
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tese-FT}[]
\typeout{tese-FT. Modelo desenvolvido por Prof. André Leon S. Gradvohl, Dr.}

\def\thesislanguage#1{\gdef\@thesislanguage{#1}}
\DeclareOption{Ingles}{
  \thesislanguage{0}
  \typeout{tese-FT: english.}
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

\newif\ifturnitin
\DeclareOption{Turnitin}{
  \turnitintrue
  \typeout{tese-FT: versao para o turnitin.}
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
% Pacote para substituicao de strings
\RequirePackage{xstring}
%
% Pacotes padrão para as línguas usadas no texto.
\RequirePackage[english,spanish,portuguese,brazil]{babel}
% Pacote para os cabeçalhos
\RequirePackage{fancyhdr}
% Pacotes para determinar o tipo de fonte usada para imprimir o texto
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
\RequirePackage[
        pdfdisplaydoctitle = true, 
        pdfstartview={XYZ null null .75} %Abrir em 75% de zoom
    ]{hyperref}
%Mantenha o pacote a seguir para incluir a lista de abreviaturas.
\RequirePackage{nomencl} \makenomenclature
\RequirePackage{pdfpages}
\RequirePackage{xspace}
\RequirePackage{setspace}
\RequirePackage{geometry}
\geometry{a4paper,top=30mm,bottom=20mm,left=30mm,right=20mm}
\RequirePackage{csquotes}
% Pacotes para adicionar a bibliografia
% Coloque a opção uniquename=false, se não quiser que o Biblatex faça a desambiguação de nomes.
\RequirePackage[style=abnt,uniquename=init,giveninits,uniquelist=true,maxbibnames=4,repeatfields=true,justify]{biblatex}
% Comandos para ajustar as citacoes para nova normativa ABNT NBR 10520:2023
\renewcommand*{\UpperOrSC}[1]{#1}
\renewcommand*{\UpperOrSCCite}[1]{#1}
%
% Pacote para tabelas mais interessantes
\RequirePackage{booktabs}
\renewcommand{\arraystretch}{1.2}

\RequirePackage{ifthen}

\ifcase\@thesislanguage\relax
  %English
  \RequirePackage[english,nameinlink]{cleveref}
  \or%Español
  \RequirePackage[spanish,nameinlink]{cleveref}
  \or%Português 
  \RequirePackage[brazilian,nameinlink,noabbrev]{cleveref}
\fi
  \Crefformat{equation}{#2\Cref@equation@name~#1#3}
  \creflabelformat{equation}{#2\textup{#1}#3}
%
% Definição de novos comandos
\newcommand{\@CIDADE}{Limeira}
\newcommand{\@UNIDADEENSINO}{Faculdade de Tecnologia}
\newcommand{\@UNIDADEENSINOABREV}{FT}
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
  \gdef\@textoaviso{\relax\cathpage}
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
  \gdef\@monopt{Monografia}
  \gdef\@monoes{Monografía}
  \gdef\@monoen{Monograph}

  \gdef\@nivelEnsino{Graduação}
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
  \gdef\@monopt{Monografia}
  \gdef\@monoes{Monografía}
  \gdef\@monoen{Monograph}
  
  \gdef\@nivelEnsino{Graduação}
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
  \gdef\@nivelEnsino{Pós-graduação}
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
  \gdef\@nivelEnsino{Pós-graduação}
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
  \gdef\@nivelEnsino{Pós-graduação}
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
  \gdef\@nivelEnsino{Pós-graduação}
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
  
  % Adicao automatica de Propriedades no arquivo PDF.
  \hypersetup{
    pdfcreator   = {Criado com o modelo para teses e dissertações da FT, elaborado pelo prof. André Leon S. Gradvohl, Dr.},
    pdftitle     = {\@titulo},
    pdfauthor    = {\if\@autora\relax\@autor\else\@autora\fi},
    pdfsubject   = {\@monopt\xspace apresentada à Faculdade de Tecnologia da Universidade Estadual de Campinas como parte dos requisitos para a obtenção do título de \@degnamept\xspace.}
  }
  
  \makeatother
  \ifturnitin
    \relax
  \else 
     \openningpage
     \clearpage
     \titlepage
     \@textoaviso
  \fi  

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

  \ifturnitin
    \relax
  \else 
     \clearpage
     \approvalpage
     \clearpage
  \fi
  \setlength{\parindent}{\oldparindent}
  \resetlang
}


\def\logos{
    {\parbox[c]{0cm}{\includegraphics[width=2.2cm]{logo-unicamp.pdf}}}
       {\parbox[c]{\textwidth}
       {
         \noindent
         \centering{
           \large \MakeUppercase{\@UNICAMP}\\
                   \@UNIDADEENSINO}
       }
    }
}

\def\openningpage{
  \logos
  \vskip 70mm%35mm
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
    \@CIDADE\\\@ano
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
    \@monopt\xspace apresentada à Faculdade de Tecnologia da Universidade Estadual de Campinas como parte dos requisitos para a obtenção do título de \@degnamept\xspace \ifx\@areaConcentracao\relax\else, na área de  \@areaConcentracao\fi \ifx\@cotutela\relax\else\xspace, no âmbito do acordo de Cotutela firmado entre a Unicamp e a \@cotutela\fi.
  \end{minipage}
  \ifcase\@thesislanguage
    \vskip 8mm
    \hfill\begin{minipage}[t]{0.54\textwidth}
      \supresshyphen
      \@monoen\xspace presented to the School of Technology of the
      University of Campinas in partial fulfillment of the requirements for
      the degree of \@degnameen\xspace in Computer
      Science\ifx\@areaConcentracao\relax\else, in the area of 
      \IfStrEqCase{\@areaConcentracao}{{Sistemas de Informação e Comunicação}{Computing and Communication Systems}%
                                       {Ambiente}{Environment}%
                                       {Ciência dos Materiais}{Materials Science}%
                                      }%
      \fi\ifx\@cotutela\relax\else\xspace 
      under the double-diploma agreement between Unicamp and \@cotutela\fi.
    \end{minipage}
  \or
    \vskip 8mm
    \hfill\begin{minipage}[t]{0.54\textwidth}
      \supresshyphen
      \@monoes\xspace presentada a Faculdad de Tecnologia de la
      Universidad de Campinas para obtener el título de
      \@degnamees\xspace en Tecnologia\ifx\@areaConcentracao\relax\else, en la area de  %\@areaConcentracao
      \IfStrEqCase{\@areaConcentracao}{{Sistemas de Informação e Comunicação}{Sistemas de Computación y Comunicación}%
                                       {Ambiente}{Ambiente}%
                                       {Ciência dos Materiais}{Ciencias de los Materiales}%
                                      }%
      \fi\ifx\@cotutela\relax\else\xspace 
      en el ámbito del acuerdo de Cotutela firmando entre la Universidad Estatal de Campinas y la \@cotutela\fi.
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
      Este trabalho corresponde à versão final da \@monopt\xspace defendida por
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
    \@CIDADE\\ \@ano
  \end{center}
}

\def\cathpage{
  \ifx\@fichacatalografica\relax
  \newpage
  Na versão final, esta página será substituída pela
  ficha catalográfica no TCC, na dissertação de mestrado ou na
  tese de doutorado.
  
  \phantom{linha em branco}
  
  Caso não tenha ficha catalográfica, deixe essa página em branco conforme as instruções a seguir.
  
  \phantom{linha em branco}
  
  No arquivo principal (\texttt{tese.tex}), adicione o nome do arquivo PDF com a ficha catalográfica como parâmetro para o comando \textbackslash\texttt{fichacatalografica\{\,\}}. Caso a versão da sua dissertação ou tese seja a versão anterior à aprovação pela banca, você pode substituir esta por uma página em branco com o comando a seguir:
  
  \begin{center}
      \textbackslash\texttt{fichacatalografica\{branco.pdf\}}
  \end{center}
      
      Substitua o arquivo \texttt{branco.pdf} por \texttt{white.pdf}, nos textos em inglês, ou por \texttt{blanco.pdf}, para textos em espanhol. Todos esses arquivos PDF já estão disponíveis neste modelo. 
  
  \phantom{linha em branco}
  
  De acordo com o padrão da CCPG: ``Quando se tratar de Teses e Dissertações financiadas por agências de fomento, os beneficiados   deverão fazer referência ao apoio recebido e inserir esta informação na ficha catalográfica, além do nome da agência, o número do processo pelo qual recebeu o auxílio.''\\e\\``caso a tese de doutorado seja feita em Cotutela, será necessário informar na ficha catalográfica o fato, a Universidade convenente, o país e o nome do orientador.''
  \else
    \includepdf[pagecommand={}]{\@fichacatalografica}
  \fi
}

\def\approvalpage{
  \iffinalversion
    %\noindent\centerline{\large\MakeUppercase{\textbf{Folha de Aprovação}}}
    %\vskip 20mm
    \vspace*{5cm}
    
    
    % Abaixo se apresentam os membros da comissão julgadora da % <-- Deixe esse espaço antes do %
    % \IfStrEq{\@nivelEnsino}{Pós-graduação}{sessão pública de defesa de \xspace}{}%
    % \MakeLowercase{\@monopt} para o título de \@degnamept\xspace 
    % \IfStrEq{\@nivelEnsino}{Pós-graduação}{na área de concentração \@areaConcentracao,}
    % a que se submeteu \@artigo\xspace candidat\@artigo\xspace \if\@autora\relax\@autor\else\@autora\fi, em \@dia\xspace de \ifcase \@mes \or janeiro\or fevereiro\or março\or abril\or maio\or junho\or julho\or agosto\or setembro\or outubro\or novembro\or dezembro\fi\xspace de \@ano\xspace na %Faculdade de Tecnologia -- FT/UNICAMP
    % \@UNIDADEENSINO{} -- \@UNIDADEENSINOABREV/UNICAMP, em \@CIDADE/SP.

    %\vfill

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

    \vspace*{\fill}
    %\vfill
    
      \supresshyphen
      \noindent
       Ata da defesa, assinada pelos membros da Comissão Examinadora, encontra-se no SIGA/Sistema de Fluxo de Dissertação/Tese e na Secretaria de \@nivelEnsino\xspace da \@UNIDADEENSINO.
    \vfill
  \else
    Na versão final, esta página será substituída por outra informando a composição da banca e que a ata de defesa está arquivada pela \@UNICAMP.
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

\newenvironment{epigrafeformat}{\newpage\mbox{}\vfill\hfill\begin{minipage}[t]{0.5\textwidth}} % Fim do bloco BEGIN.
                          {\end{minipage}\newpage}


\newcommand{\fimdaspaginasiniciais}{
\newpage
\makeatletter
% Adição importante para o cleveref
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

% Definição do comando para dedicatoria
\newcommand{\dedicatoria}[1]{
    %% O comando \ifturnitin a seguir é obrigatório para o controle 
    %% da opção "turnitin". Não o remova!!
    \ifturnitin 
      \relax
    \else
      \pagestyle{empty}
      \thispagestyle{empty}
      \vspace*{\fill}
      \begin{flushright}
         \begin{minipage}{15em}
            #1
         \end{minipage}
       \end{flushright}
    \fi
} % Fim definição comando \dedicatoria

\newcommand{\epigrafe}[2]{
  \ifturnitin 
      \relax
  \else
     \begin{epigrafeformat}
       #2
       % A linha em branco a seguir é importante

       \hfill (#1)
     \end{epigrafeformat}
   \fi
}

%controle de linhas órfãs e viúvas.
\widowpenalty10000
\clubpenalty10000

%Comandos específicos para referenciar Figuras, Tabelas, Seções etc.
\newcommand{\Capitulo}[1] {\Cref{#1}}
\newcommand{\capitulos}[1]{\cref{#1}}
\newcommand{\Secao}[1]    {\Cref{#1}}
\newcommand{\secoes}[1]   {\cref{#1}}
\newcommand{\Figura}[1]   {\Cref{#1}}
\newcommand{\figuras}[1]  {\cref{#1}}
\newcommand{\Tabela}[1]   {\Cref{#1}}
\newcommand{\tabelas}[1]  {\cref{#1}}
\newcommand{\Equacao}[1]  {\Cref{#1}}
\newcommand{\equacoes}[1] {\cref{#1}}

%Comandos para abreviações especiais
\newcommand{\ie}{i.\,e.\xspace}
\newcommand{\eg}{e.\,g.\xspace}
\newcommand{\pex}{p.\,ex.\xspace}

%Comandos para adição de siglas 
\newcommand{\Sigla}[2]{#1 (#2)\nomenclature{#2}{#1}}
\newcommand{\SiglaHifen}[2]{#1 -- #2\nomenclature{#2}{#1}}