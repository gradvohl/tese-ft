# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Changes are recorded from since version 4.1.0

## [4.2.1] - 2025-06-05

### Updated
    - Adjustments to the approval sheet.
        -- Removal of the area of concentration when it is an undergraduate course on the approval sheet.
        -- Adaptation of the text on the approval sheet when it refers to undergraduate, master's or doctoral degrees.


## [4.2.0] - 2025-01-02

### Updated
    - Adjustment to Monograph instead of Dissertation for BSI and TADS.
    - Adjustment to the new ABNT NBR 10520:2023 standard regarding the citation method for authors, which changes from "(AUTHOR, 0000)" to "(Author, 0000). See lines 125 and 126 on tese-FT.cls.

### Added
    - Addition of the cleveref package for better formatting of references, in the three languages (Portuguese, English, and Spanish).
    - Addition of the following variables to facilitate adaptation to other courses or teaching units:
        -- \@UNICAMP to define the abbreviation of the university (in this case, UNICAMP)
        -- \@UNIDADEENSINO to define the teaching unit (in this case, Faculdade de Tecnologia)
        -- \@UNIDADEENSINOABREV to define the abbreviation of the teaching unit (in this case, FT)
        -- \@CIDADE to define the city where the work was carried out.       
    - Addition of areas of concentration in other languages (English and Spanish).


## [4.1.0] - 2023-02-24

### Added

  - Turnitin option for generating the text without pre and post textual elements. This makes the text easy for submitting to the Turnitin software.
  - Automatically add PDF properties in the PDF file.
  - Added the variable \@nivelEnsino to adjust the text for the "Viva" record.
  - Added commands for epigraph and dedication.