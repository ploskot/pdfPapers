# pdf*P*apers

_Pavel Loskot_ [LinkedIn](https://www.linkedin.com/in/ploskot)

This is the initial release of pdf*P*apers shell scripts to aid more
efficient consumption of PDF documents. Each script provides '-h' or
'-help' option to show more detailed instruction about the usage. Manual
pages may be prepared later once the development reaches certain level of
stability.

[1. Introduction](#intro)

[2. Dependencies and installation](#install)

[3. Utilities and their usage](#utils)

[4. Bugs and Todo lists](#todo)

[5. Version history](#history)


# <a name="intro"> 1. Introduction

## Why pdf*P*apers?

The pdf*P*apers is a collection of utilities to make reading of PDF
documents easier and more efficient. The development is primarily motivated
by aiding daily work of the researchers in science and engineering who are
increasingly relying on processing knowledge contained in published papers.
The papers are usually available as PDF documents, and they are downloaded
to personal devices. Even though there are many tools for processing text
files available on *nix systems (Unix/Linux/MacOS), such tools with similar
functionality for PDF files are very scarce, and at best available online.
The main objective of pdf*P*apers is to provide utilities for working with
textual contents of PDF files to complement other existing utilities for
manipulating pages of PDF files.

## Implementation

All pdf*P*apers utilities are implemented as shell scripts requiring BASH
version 5.x and later. Eearlier versions of BASH may work or with a few
modifications by removing some recent BASH features, but this has not been
tested. The anticipated workflow to explore smaller or larger collections
of PDF documents is to first view these documents one by one in a batch,
and perform initial searches of their textual contents using regular
expressions. A smaller number of the selected PDF files is then converted
to text files which are amenable to text mining. The focus for now is on a
command-line interface (CLI), so each script comes with a number of
modifying options to achieve the desired processing.

The pdf*P*apers is provided completely free under GPL version 2, but there
is *no other warranty* at all. Once the implementation and overall script
structure become more stable, the efficient workflows and processing are
clearly defined, the traditional multi-user development with pull requests
would be very desirable.

## Future plans

The main development will continue to be done on Linux. However, at some
point in future, the implementation of text mining methods will likely be
changed to use faster languages such as Java. Since Java libraries for text
mining are already available, it makes sense to utilize these libraries
rather than reimplementing the wheel. Around the same time, there could be
considerations about porting the scripts to other *nix systems including
Mac OSX and shell substitutes on Windows. Another future avenue to explore
would be to develop a GUI, for instance, to manipulate text blocks
graphically on the page, and to add a small shell terminal to some of the
open source PDF viewer. The ultimate goal should be to define a Grammar of
PDF Contents, a meta langugage to facilitate processing information
contents of PDF documents.

# <a name="install"> 2. Dependencies and installation

In addition to BASH shell (version 5.0 and later is recommended), the
following utilities (all freeware) should be installed as well:

- `pdftotext` probably the most reliable converter of pdf files to text on
  *nix systems
- `pdfinfo` provides basic information about pdf files
- `pdfseparate` enables to extract individual pages from pdf files
- `convert` is a very powerful image manipulation and creation must-have tool
- `composite` allows to overlap images and set their transparency
- `gnuplot` is a popular interactive plotting program
- `gawk` is a GNU implementation of awk text processor
- `iconv` is a standard tool for conversion of character encodings
- `aspell` is a powerful spell checker

In addition, the `pdfls` and `pdfsearch` scripts rely on text editor
`Emacs` and the pdf viwer `Okular`, but these programs can be changed to
whatever preference the user might have.

## Installation

Simply copy all BASH scripts to any place where they are visible by `PATH'
environmental variable, and make sure the execute mode bit is set. A
separate utility for checking the dependencies may be provided in future.
At the moment, there are no configuration files, for example, to keep the
default values which could simplify typing of full commands when calling
pdf*P*apers utilities.

# <a name="#utils"> 3. Utilities and their usage

```
pdfls [OPTIONS] files
```

This shell script allows to view the whole collection of PDF files
sequentially one by one. The files are given as the argument, and they are
opened in the same order. The files to be opened can be also given on
separate lines in a text file. The next file in the queue opens once the
current file is closed. The script can be called in an interactive mode to
enable several keyboard shortcuts to copy or move the file to a selected
location.

```
pdfsearch [OPTIONS] {pattern} files
```

This shell script allows to search the text automatically extracted from a
collection of PDF documents using complex regular expressions. The list of
PDF files to search is specified the same way as for `pdfls`. Several
standard regular expressions can be combined using logical operators _AND_
and _OR_, and the conditions on the number of occurences of some or all
regular expressions can be also specified. The produced report on the
number of occurrences when the given regular expression is satisfied can be
formatted in different ways using the corresponding commandline options.

```
pdfastext [OPTIONS] inputfile
```

This is a wrapper for `pdftotext` utility to add a few desirable features
such as to produce files with meta information, and to maintain a block
structure of the text as it appears in the original PDF document. The text
within a block can be merged into a single line by attempting to
automatically join words which were split across lines, and by replacing
the end-of-line characters with spaces. The non-printable characters can be
transliterated or removed. Finally, there is a option to produce jpg or eps
images of pages showing the locations of blocks over a semi-transparent PDF
page in the background.

```
textblocks COMMAND [OPTIONS] inputfile
```

The `textblocks` shell script allows to manipulate blocks of text as they
were created by `pdfastext`. The blocks can be moved, copied, renamed,
deleted, sorted, merged, labeled, filtered, cleaned and new empty blocks
inserted. The blocks can be addressed as ranges or sets as explained in
instructions by checking the internal help with instructions. What to do
with text blocks can be decided upon visually inspecting the jpg or eps
views of the PDF pages generated by `pdfastext`.

```
texttodict COMMAND [OPTIONS] inputfile
```

This utility is intended to work with dictionaries i.e. collections of
words on separate lines in an ordinary text file. The dictionaries are
created using `aspell`. This utility can also create a bag of words given
the input text file.

```
texttoinfo COMMAND [OPTIONS] inputfile
```

This utility can be called to generate the bag of words for the input file,
and to extract multi-word phrases of given length about a given pattern
specified using regular expression. These functions are pivotal for finding
the most frequently occurring multi-word phrases and keywords in PDF files.

## Examples

The release of pdf*P*apers is accompanied by several examples in the
corresponding sub-directories.

```
Example 1-5
```

Each of these 5 example sub-directories contains 5 shell scripts
illustrating how to extract information from the input PDF file using the
utilities described above. Exploring how the pdf*P*apers utilities are
called in these shell scripts is a good starting point to understand what
features are provide and to devise workflows to efficiently process
information in collections of PDF documents.

```
Example 10
```

This sub-directory demonstrates how to convert the PDF documents containing
a table of acronyms and an index into a list of expert terms. The lists can
be used to aid the text mining of textual contents of PDF documents.

# <a name="todo"> 4. Bugs and todo lists

The bugs are extremely likely considering the extent and the complexity of
the scripts. The bugs will be collected and removed as they are discovered
or reported.


## Todo list

- check log messages, especially inside functions, so they are sufficiently
  informative

- completely terminate processing if an error is encountered (error trapping)

- consider merging functions into a separate file which can be sourced as a
  library, possibly develop one script implementing the interface to all
  functionality

- implement `+` and other operators to aid more efficient block addressing

- create a global and local configuration file

- develop a set of testing procedures and scripts

- suggest a natural block flow based on the blocks position within a page

- add line-based pdf-to-text conversion in addition to maintaining blocks
  of text

- provide man pages for all scripts

# <a name="history"> 5. Version history

[**0.1.2**](https://github.com/ploskot/pdfpapers/) [2023-7-17]

- minor bug fixes and improvements

- added pythontools folder with examples

[**0.1.1**](https://github.com/ploskot/pdfpapers/) [2020-1-10]

- minor bug fixes and improvements

- added scripts to examples 1-5 to perform multi-word phrases identification

[**0.1.0**](https://github.com/ploskot/pdfpapers/) [2020-12-02]

- initial release of `pdfls`, `pdfsearch`, `pdfastext`, `textblocks`,
  `texttodict` and `texttoinfo` scripts

- `pdfls` and `pdfsearch` were developed to produce the paper _Loskot
  et al., Comprehensive Review of Models and Methods for Inferences in
  [Bio-Chemical Reaction Networks_, Front. Genet., 14 June
  2019](https://www.frontiersin.org/articles/10.3389/fgene.2019.00549/full).
  However, these two scripts were never publicly released before.
  
