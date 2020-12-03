# pdf*P*apers

_Pavel Loskot_ [LinkedIn](https://www.linkedin.com/in/ploskot)

This is the initial release of pdf*P*apers utilities to aid more efficient
consumption of pdf documents. Each utility provides a help option how to
use it. More detailed instructions or even manual will be prepared later.

[1. Introduction](#intro)

[2. Dependencies and installation](#install)

[3. Utilities and their usage](#utils)

[4. Bugs and Todo lists](#todo)

[5. Version history](#history)


# <a name="intro"> 1. Introduction

## Why pdf*P*apers?

The pdf*P*apers is a collection of utilities to make reading of pdf
documents easier and more efficient. The development is primarily motivated
by facilitating work of researchers in science and engineering who are
increasingly relying on knowledge contained in large number of previously
published papers. These papers mostly exist as pdf documents. The pdf files
are typically downloaded to users' personal devices. Whilst there are many
tools available on *nix (Unix/Linux/MacOS) systems for processing text
files, the tools that can provide similar functionality for pdf files are
much more scarce. Hence, the intention of pdf*P*apers is to provide the
utilities for working with the contents of pdf files to complement other
existing pdf utilities which focus on page level manipulation of pdf files.

## Implementation

All pdf*P*apers utilities were implemented as shell scripts. More
specifically, the scripts are written in BASH shell version 5.x. Eearlier
versions of BASH may work as well or with a few modifications by removing
the use of some recent BASH features, but it has not been tested yet. The
expected work flow to explore a smaller or larger collection of pdf
documents is to open and view these files in a batch one by one, perform
initial screen and search through these files using regular expressions,
then convert the pdf files to text files, and finally provide further
processing tools for exploring the converted text files. The focus for now
is on a command-line interface (CLI), so each script has a number of
switches and options to modify their behaviour in addition to specifying
input files to process and possibly output files to generate.

The pdf*P*apers is provided completely free under GPL version 2, but there
is *no other warranty* at all. Once the implementation and overall
implementation structure become more stable, the effective work flows are
clearly defined, and everything is thoroughly tested, the traditional
multi-user development with pull requests will be very desirable.

## Future plans

The development will likely stay with *nix systems, mainly Linux, but it
may be later modified to be compatible with other shell environments on
other *nix systems including Mac OSX and even *nix-like substitutes on
Windows. There is some chance that at least some routines will be
re-implemented in Python or in Perl, if it improves the implementation
efficiency and/or portability. Once the development reaches a certain level
of maturity, it may be desirable to add a GUI which can be done in several
different ways. The ultimate goal should be to define a Grammar of PDF
Contents, a meta langugage to facilitate processing information contents of
pdf documents.

# <a name="install"> 2. Dependencies and installation

In addition to BASH shell environment (version 5.0 and later is recommended
as previous BASH versions have not been tested), the following utilities
(all freeware) should be installed on the same system:

- `pdftotext` probably the most reliable converter of pdf files to text on
  *nix systems
- `pdfinfo` provides basic information about pdf files
- `pdfseparate` enables to extract individual pages from pdf files
- `convert` is a very powerful image manipulation and creation must-have tool
- `composite` allows to overlap images over while setting their transparency
- `gnuplot` is a popular interactive plotting program
- `gawk` is a GNU implementation of awk text processor
- `iconv` is a standard tool for character encoding conversions
- `aspell` is a powerful spell checker

In addition, `pdfviewer` and `pdfsearch` scripts rely on text editor
`Emacs` and pdf viwer `Okular`, but these can be easily changed to whatever
preference the users might have.

## Installation

Simply copy all BASH scripts to any place which is visible by the PATH
environmental variable, and make sure the execute mode bit is set. A
separate utility to check the dependencies may be provided in the future.
At the moment, there are no configuration files e.g. to keep the default
values which would simplify typing the pdf*P*apers commands.

# <a name="#utils"> 3. Utilities and their usage

```
pdfviewer [OPTIONS] files
```

This script allows to view a collection of pdf files in a more organized
way. The files can be specified using BASH shell expansions, e.g., `*.pdf`
expands to all files in the current directory having the pdf extension.
Alternatively, the files to open can be given on separate lines in a text
file. The next file opens once the current file is closed. Furthermore, the
script can be run interactively which enables several keyboard shortcuts
e.g. to copy or move the file to a selected location.

```
pdfsearch [OPTIONS] {pattern} files
```

This script allows to search text extracted from pdf files with complex
regular expressions. Several regular expressions can be combined using
logical operators _AND_ and _OR_, and conditions on the number of
occurences may be also used. The list of files is specified the same way as
for `pdfviewer`. If the input is a pdf file, it is automatically converted
to a text file using `pdftotext` tool unless the corresponding text file
already exists. The produced output can be formatted in different ways
using the corresponding command-line options.

```
pdfastext [OPTIONS] inputfile
```

This is a wrapper for `pdftotext` utility to add a few other features such
as produce additional files with meta information, and most importantly,
maintain a block structure of the text as it appears in the original pdf
document. The text within the blocks can be merged into a single line by
attempting to automatically join words which were split across lines, and
also the non-printable characters can be removed. Finally, there is an
option to produce jpg or eps images of pages showing the blocks locations
over a semi-transparent pdf page as the background.

```
textblocks COMMAND [OPTIONS] inputfile
```

The `textblocks` utility allows to manipulate blocks of text as they were
created by `pdfastext`. The blocks can be moved, copied, renamed, deleted,
sorted, merged, labeled, filtered, cleaned and new empty blocks inserted.
The blocks can be addressed as ranges or sets as explained in instructions
by running `textblocks -help`. Deciding what to do with blocks usually
depends on visually inspecting the jpg or eps views of the pdf pages
generated by `pdfastext`.

```
texttodict COMMAND [OPTIONS] inputfile
```

This utility is intended to work with word dictionaries i.e. collections of
words on separate lines. The dictionaries are created using `aspell`. The
`bow` command is used to create a bag of words from the input text file.

```
texttoinfo COMMAND [OPTIONS] inputfile
```

This utility provides two main commands: `bow` to obtain a bag of words
from the input file, and `getnwords` to extract phrases about the given
pattern which can be selected using a regular expression. Both commands are
pivotal for finding the keywords and the key phrases in pdf documents.

## Examples

The release of pdf*P*apers is accompanied by several examples in the
corresponding sub-directories.

```
Example 1-5
```

Each of these 5 example sub-directories contains 4 BASH scripts
illustrating how to extract information from an input pdf file being a
scientific paper with the help of utilities outlined above. Exploring these
4 BASH script is a good starting point to understand not only how to use
the utilities provided and what features they provide, but also to devise a
proper work flow to efficiently consume a collections of pdf documents.

```
Example 10
```

This sub-directory demonstrates how to convert acronyms or index pages into
a list of keywords which can be used to explore and search the collections
of pdf documents.


# <a name="todo"> 4. Bugs and Todo lists

The bugs are extremely likely considering the extent and the complexity of
the scripts. The bugs will be collected and removed as they are identified.


## Todo list

- check log messages to file and on screen, especially inside functions, so
  they are sufficiently informative

- completely terminate processing if an error is encountered (error trapping)

- consider merging functions into a separate file which can be sourced as a
  library, possibly develop a single script implementing the interface

- implement `+` and other operators to aid more efficient block addressing

- create a configuration file for current as well as home directory

- develop testing procedures and scripts

- identify natural block flows based on their position within a page

- add line-based pdf-to-text conversion in addition to maintaining blocks

- provide more complete documentation

# <a name="history"> 5. Version history

[**0.10**](https://github.com/ploskot/pdfpapers/) [2020-12-02]

- initial release of `pdfviewer`, `pdfsearch`, `pdfastext`, `textblocks`,
  `texttodict` and `texttoinfo` scripts

- `pdfviewer` and `pdfsearch` were developed to produce the paper _Loskot
  et al., Comprehensive Review of Models and Methods for Inferences in
  Bio-Chemical Reaction Networks_, Front. Genet., 14 June 2019. However,
  these two scripts were never publicly released before.
  
