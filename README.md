# dips-renamevzs

Rename XML files containing metadata for archival description created by the
[DiPS digital preservation solution][dips].

DiPS writes some information from every ingest to an XML file informally called
dipsExport or vzs file (due to the XML root element or the directory to which
these files are written, respectively, where "vzs" means "Verzeichnungssystem").
The files are named after their ingest's transaction ID (e.g.,
`c845750e-9296-11ee-8821-005056871b7c.xml`) which makes it a little hard for a
human being to find the right file for a given ingest. This script renames the
files based on their human-readable transaction number (not ID) and provenance
name. See below for an example.

## Installation

Just Python without any additional libraries is required. For installation on a
Linux system you may use the provided [Makefile](Makefile). Otherwise just run
the [renamevzs](renamevzs) Python script.

## Usage

Consider an XML file `c845750e-9296-11ee-8821-005056871b7c.xml` conforming to
the dipsExport schema with the transaction number "dips-2023-12" recorded in the
XML element `transactionNumber` and provenance "Ministerium für Zauberei"
recorded in the XML element `provenanceName`. Running this command:

~~~console
$ renamevzs c845750e-9296-11ee-8821-005056871b7c.xml
~~~

... will copy the file to `dips-2023-012_ministerium_für_zauberei.dips.xml`.
Yes, that's all. Nothing fancy, it just renames the file to make it more
human-readable.

Some additional options are available:

~~~console
usage: renamevzs [-h] [-d DEST] [-m] [-w WIDTH] [files ...]

Copy dipsExport files, giving them nice names

positional arguments:
  files                 dipsExport XML files

options:
  -h, --help            show this help message and exit
  -d DEST, --dest DEST  destination directory (default: same as input file)
  -m, --move            move, don't copy
  -w WIDTH, --width WIDTH
                        width of the last part of the transaction number
                        (default: 3)
~~~

[dips]: https://digitalpreservationsolution.de
