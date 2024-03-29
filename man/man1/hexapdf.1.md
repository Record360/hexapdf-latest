# hexapdf - A Versatile PDF Manipulation Application
{: data-section="1" data-date="November 2016"}

## SYNOPSIS

`hexapdf` \[`OPTIONS`] `command` \[`COMMAND OPTIONS`]...


## DESCRIPTION

hexapdf is an application for PDF manipulation. It is part of the [hexapdf][hexapdf-ws] library
which also allows PDF creation, among other things.

Using the hexapdf application the following tasks can be performed with PDF files:

{:.compact}
* Extracting embedded files (see the `files` command)
* Extracting images (see the `images` command)
* Showing general information of a PDF file (see the `info` command)
* Inspecting the internal structure of a PDF file (see the `inspect` command)
* Merging multiple PDF files into one (see the `merge` command)
* Modifying an existing PDF file (see the `modify` command)
* Optimizing the file size of a PDF file (see the `optimize` command)
* Splitting a PDF file into individual pages (see the `split` command)
* Batch execution of a command on multiple PDF files (see the `batch` command)

The application contains a built-in `help` command that can be used to provide a quick reminder of a
command's purpose and its options.


## OPTIONS

The following options can only be used when no command is specified:

`-v`, `--version`

: Show the version of the hexapdf application and exit.

These options are available on every command (except if they are overridden):

`--[no-]force`

: Force overwriting existing files. Default: *false*.

`--strict`

: Enable strict parsing and validation. By default, correctable parse error and validation problems
  are treated as warnings which allows processing most PDF files. If this option is used,
  correctable parse errors and uncorrectable validation problems are treated as errors.

  Note that a PDF file may have validation errors and still be usable since most viewing
  applications are very forgiving.

`--verbose`, `-v`

: Enable more verbose output. There are three verbosity levels: 0 (no output), 1 (warning output)
  and 2 (warning and informational output). The default level is 1, specifying this option increases
  it to 2.

`--quiet`

: Suppress any output by setting the verbosity level to 0. Also see the description of `--verbose`
  above.

`-h`, `--help`

: Show the help for the application if no command was specified, or the command help otherwise.


### Optimization Options

Theses options can only be used with the `merge`, `modify` and `optimize` commands and control
optimization aspects when writing an output PDF file. Note that the defaults maybe different
depending on the command.

`--[no-]compact`

: Delete unnecessary PDF objects. This includes merging the base revision and all incremental
  updates into a single revision. Default: *yes*.

`--object-streams` *MODE*

: Defines how object streams should be treated: *generate* will remove all exisiting object streams
  and generate new ones, *delete* will only remove existing object streams and *preserve* will do
  nothing. Default: *preserve*.

`--xref-streams` *MODE*

: Defines how cross-reference streams should be treated: *generate* will add them, *delete* will
  remove them and *preserve* will do nothing. Default: *preserve*.

`--streams` *MODE*

: Defines how streams should be treated: *compress* will compress them when possible, *uncompress*
  will uncompress them when possible and *preserve* will do nothing to them. Default: *preserve*.

`--[no-]compress-pages`

: Recompress page content streams. This is a very expensive operation in terms of processing time
  and won't lead to great file size improvements in many cases. Default: *no*.

`--[no-]optimize-fonts`

: Optimize embedded font files by removing normally unneeded font data. Note that this may have a
  negative effect on PDFs with forms since form entry usually requires fully embedded font files.
  Default: *no*.


### Encryption Options

These options can only be used with the `merge` and `modify` commands and control if and how an
output PDF file should be encrypted. All options except `--decrypt` automatically enable
`--encrypt`.

Note that if a password is needed to open the input file and if encryption parameters are changed,
the provided password is not automatically used for the output file!

`--decrypt`

: Remove any encryption.

  If neither `--decrypt` nor `--encrypt` are specified, the existing encryption configuration is
  preserved.

`--encrypt`

: Encrypt the *OUTPUT*.

  If neither `--decrypt` nor `--encrypt` are specified, the existing encryption configuration is
  preserved.

`--owner-password` *PASSWORD*

: The owner password to be set on the output file. This password is needed when operations not
  allowed by the permissions need to be done. It can also be used when opening the PDF file.

  If an owner password is set but no user password, the output file can be opened without a password
  but the operations are restricted as if a user password were set.

  Use **-** for *PASSWORD* for reading it from standard input.

`--user-password` *PASSWORD*

: The user password to be set on the output file. This password is needed when opening the PDF file.
  The application should restrict the operations to those allowed by the permissions.

  Use **-** for *PASSWORD* for reading it from standard input.

`--algorithm` *ALGORITHM*

: The encryption algorithm to use on the output file. Allowed algorithms are *aes* and *arc4* but
  *arc4* should only be used if it is absolutely necessary for compatibility reasons. Default:
  *aes*.

`--key-length` *BITS*

: The length of the encryption key in bits. The allowed values differ based on the chosen algorithm:
  A number divisible by eight between 40 to 128 for *arc4* and 128 or 256 for *aes*. Default:
  **128**.

  Note: Using 256bit AES encryption can lead to problems viewing the PDF in many applications on
  various platforms!

`--force-V4`

: Force the use of PDF encryption version 4 if key length is *128* and algorithm is *arc4*. This
  option is probably only useful for testing the implementation of PDF libraries' encryption
  handling.

`--permissions` *PERMS*

: A comma separated list of permissions to be set on the output file:

  *print*
  : allow printing

  *modify_content*
  : allow modification of the content of pages

  *copy_content*
  : allow text extraction and similar operations

  *modify_annotation*
  : allow creation and modification of annotations and filling in of forms

  *fill_in_forms*
  : allow filling in of forms even if *modify_annotation* is not set

  *extract_content*
  : allow text and graphics extraction in accessibility cases

  *assemble_document*
  : allow page modifications and bookmark creation

  *high_quality_print*
  : allow high quality printing


## COMMANDS

hexapdf uses a command-style interface. This means that it provides different functionalities
depending on the used command, and each command can have its own options.

There is no need to write the full command name for hexapdf to understand it, the only requirement
is that is must be unambiguous. So using `f` for the `files` command is sufficient. The same is
true for long option names and option values.

Any command that reads and writes a PDF file may do in-place processing of the file. This is
automatically done if an input file name is the same as the output file name. Note that the option
`--force` has to be used in this case.


### batch

Synopsis: `batch` *COMMAND* *FILES...*

This command allows executing a single command for multiple input files, thereby reducing the
overall execution time.

The first argument *COMMAND* is used as a hexapdf command line and must not contain the binary name,
just everything else. The rest of the arguments are the input files. The specified command will be
executed for each input file, with all occurences of {} being replaced by the file name.


### files

Synopsis: `files` \[`OPTIONS`] *PDF*

This command extracts embedded files from the *PDF*. If the `--extract` option is not specified, the
indices and names of the embedded files are just listed.

`-e` \[*A,B,C,...*], `--extract` \[*A,B,C,...*]

: The indices of the embedded files that should be extracted. The value *0* can be used to extract
  all embedded files.

`-s`, `--[no-]search`

: Search the whole PDF file instead of the standard locations, that is files attached to the
  document as a whole or to an individual page. Defaults to *false*.

`-p` *PASSWORD*, `--password` *PASSWORD*

: The password to decrypt the *PDF*. Use **-** for *PASSWORD* for reading it from standard input.


### help

Synopsis: `help` \[*COMMAND*...]

This command prints the application help if no arguments are given. If one or more command names are
given as arguments, these arguments are interpreted as a list of commands with sub-commands and the
help for the innermost command is shown.


### images

Synopsis: `images` \[`OPTIONS`] *PDF*

This command extracts images from the *PDF*. If the `--extract` option is not specified, the images
are listed with their indices and additional information, sorted by page number. Note that if an
image is used multiple times on a page, only the first occurence of it will be included.

The `--extract` option can then be used to extract one or more images, saving them to files called
`PREFIX-N.EXT` where the prefix can be set via `--prefix`, *N* is the image index and *EXT* is
either png, jpg or jpx.

`-e` \[*A,B,C,...*], `--extract` \[*A,B,C,...*]

: The indices of the images that should be extracted. Use *0* or no value to extract all images.

`--prefix` *PREFIX*

: The prefix to use when saving images. May include directories. Defaults to *image*.

`-s`, `--[no-]search`

: Search the whole PDF file instead of the standard locations, that is, images referenced by pages.
  Defaults to *false*.

`-p` *PASSWORD*, `--password` *PASSWORD*

: The password to decrypt the *PDF*. Use **-** for *PASSWORD* for reading it from standard input.


The following information is shown for each image when listing images:

> **index**
> : The image index needed when this image should be extracted.
>
> **page**
> : The page number on which this image appears.
>
> **oid**
> : The PDF internal object identifier consisting of the object and generation numbers.
>
> **width**
> : The width of the image in pixels.
>
> **height**
> : The height of the image in pixels.
>
> **color**
> : The color space used for the image. Either gray, rgb, cmyk or other.
>
> **comp**
> : The number of color components.
>
> **bpc**
> : The number of bits per color component.
>
> **x-ppi**
> : The pixels per inch (PPI) of the x-direction of the image, as found on the page.
>
> **y-ppi**
> : The pixels per inch (PPI) of the y-direction of the image, as found on the page.
>
> **size**
> : The file size of the image as stored in the PDF.
>
> **type**
> : The image type. Either jpg (JPEG), jp2 (JPEG2000), ccitt (CCITT Group 3 or 4 Fax), jbig2 (JBIG2)
>   or png (PNG).
>
> **writable**
> : Either true or false depending on whether hexapdf supports the image format.


### info

Synopsis: `info` \[`OPTIONS`] *FILE*

This command reads the *FILE* and shows general information about it, like author information, PDF
version used, encryption information and so on.

`-p` *PASSWORD*, `--password` *PASSWORD*
: The password to decrypt the PDF *FILE*. Use **-** for *PASSWORD* for reading it from standard
  input.


### inspect

Synopsis: `inspect` \[`OPTIONS`] *FILE*

This command is useful when one needs to inspect the internal object structure or a stream of a PDF
file.

If no option is given, the interactive mode is started (see below). Otherwise the various, mutually
exclusive display options define what is shown. If multiple such options are specified only the last
one is respected. Note that PDF objects are always shown in the native PDF syntax.

The interactive mode allows you to execute inspection commands without re-parsing the PDF file. Use
the 'help' command to list the available commands (generally, everything that is possible with
command line options is also available in interactive mode).

`-o` *OID*\[,*GEN*], `--object` *OID*\[,*GEN*]

: Show the object with the given object and generation numbers. The generation number defaults to 0
  if not given.

`-s` *OID*\[,*GEN*], `--stream` *OID*\[,*GEN*]

: Show the filtered stream data (add `--raw` to get the raw stream data) of the object with the
  given object and generation numbers. The generation number defaults to 0 if not given.

`--raw`

: Modifies `--stream` to show the raw stream data instead of the filtered one.

`-c`, `--page-count`

: Print the number of pages.

`--catalog`

: Show the PDF catalog dictionary.

`--trailer`

: Show the PDF catalog dictionary.

`--pages` \[*PAGES*]

: Show the pages with their object and generation numbers and their associated content streams. If a
  range is specified, only those pages are listed. See the **PAGES SPECIFICATION** below for details
  on the allowed format of *PAGES*.

`--structure`

: Show the structure of the PDF file, i.e. all objects recursively starting from the trailer. Note
  that the keys of dictionary objects are listed alphabetically (instead of the order defined in the
  PDF file) and that object references are substituted with custom references. Both are done to make
  diffing the output more useful, i.e. to find changes done by a PDF application.

`-p` *PASSWORD*, `--password` *PASSWORD*

: The password to decrypt the PDF *FILE*. Use **-** for *PASSWORD* for reading it from standard
  input.


### merge

Synopsis: `merge` \[`OPTIONS`] { *INPUT* \| `--empty` } \[*INPUT*]... *OUTPUT*

This command merges pages from multiple PDFs into one output file which can optionally be
encrypted/decrypted and optimized in various ways.

The first input file is the primary file from which meta data like file information, outlines, etc.
are taken from. Alternatively, it is possible to start with an empty PDF file by using `--empty`.
The order of the input files is important as the pages are added in that order. Note that the
`--password` and `--pages` options always apply to the last preceeding input file.

An input file can be specified multiple times, using a different `--pages` option each time. The
`--password` option, if needed, only needs to be used the first time.

`-p` *PASSWORD*, `--password` *PASSWORD*

: The password to decrypt the last input file. Use **-** for *PASSWORD* for reading it from standard
  input.

`-i` *PAGES*, `--pages` *PAGES*

: The pages (optionally rotated) from the last input file that should be included in the *OUTPUT*.
  See the **PAGES SPECIFICATION** below for details on the allowed format of *PAGES*. Default: *1-e*
  (i.e. all pages with no additional rotation applied).

`-e`, `--empty`

: Use an empty file as primary file. This will lead to an output file that just contains the
  included pages of the input file and no other data from the input files.

`--interleave`

: Interleave the pages from the input files: Takes the first specified page from the first input
  file, then the first specified page from the second input file, and so on. After that the same
  with the second, third, ... specified pages. If fewer pages were specified for an input file, the
  input file is just skipped for the rest of the rounds.

Additionally, the **Optimization Options** and **Encryption Options** can be used.


### modify

Synopsis: `modify` \[`OPTIONS`] *INPUT* *OUTPUT*

This command modifies a PDF file. It can be used to select pages that should appear in the output
file and/or rotate them. The output file can also be encrypted/decrypted and optimized in various
ways.

`-p` *PASSWORD*, `--password` *PASSWORD*

: The password to decrypt the *INPUT*. Use **-** for *PASSWORD* for reading it from standard input.

`-i` *PAGES*, `--pages` *PAGES*

: The pages (optionally rotated) from the *INPUT* that should be included in the *OUTPUT*. See the
  **PAGES SPECIFICATION** below for details on the allowed format of *PAGES*. Default: *1-e* (i.e.
  all pages with no additional rotation applied).

`-e` *FILE*, `--embed` *FILE*

: Embed the given file into the *OUTPUT* using built-in features of PDF. This option can be used
  multiple times to embed more than one file.

Additionally, the **Optimization Options** and **Encryption Options** can be used.


### optimize

Synopsis: `optimize` \[`OPTIONS`] *INPUT* *OUTPUT*

This command uses several optimization strategies to reduce the file size of the PDF file.

By default, all strategies except page compression are used since page compression may take a very
long time without much benefit.

`-p` *PASSWORD*, `--password` *PASSWORD*

: The password to decrypt the *INPUT*. Use **-** for *PASSWORD* for reading it from standard input.

The **Optimization Options** can be used with this command. Note that the defaults are changed to
provide good compression out of the box.


### split

Synopsis: `split` \[`OPTIONS`] *INPUT* \[*OUTPUT_SPEC*]

This command splits the input file into multiple output files, each containing one page.

If no *OUTPUT_SPEC* is given, files of the form *INPUT_0001.pdf*, *INPUT_0002.pdf*, ... and so on
are created (only the name *INPUT* without the file extension is used). Otherwise *OUTPUT_SPEC*
determines the file names of the created files, with a printf-style format string like '%04d' being
replaced by the page number. For example, if the files should be named *page_01.pdf*, *page_02.pdf*
and so on, use *page_%02d.pdf* for the *OUTPUT_SPEC*.

`-p` *PASSWORD*, `--password` *PASSWORD*

: The password to decrypt the *INPUT*. Use **-** for *PASSWORD* for reading it from standard input.

Additionally, the **Optimization Options** and **Encryption Options** can be used.


### version

This command shows the version of the hexapdf application. It is an alternative to using the global
`--version` option.


## PAGES SPECIFICATION

Some commands allow the specification of pages using a *PAGES* argument. This argument is expected
to be a comma separated list of single page numbers or page ranges of the form *START*-*END*. The
character '**e**' represents the last page and can be used instead of a single number or in a range.
The pages are used in the order in which the are specified.

If the start number of a page range is higher than the end number, the pages are used in the reverse
order.

Single page numbers that are not valid are ignored. If a page number in a page range is higher than
the page number of the last page, the page number of the last page is used instead.

Step values can be used with page ranges. If a range is followed by */STEP*, *STEP* - 1 pages are
skipped after each used page.

Additionally, the page numbers and ranges can be suffixed with a rotation modifier:

{:.compact}
**l**
: Rotate the page left, that is 90 degrees counterclockwise

**r**
: Rotate the page right, that is 90 degrees clockwise

**d**
: Rotate the page 180 degrees

**n**
: Remove any set page rotation

Note that this additional functionality may not be used by all commands (it is used, for example, by
the `modify` command).

Examples:

* **1,2,3**: The pages 1, 2 and 3.
* **11,4-9,1,e**: The pages 11, 4 to 9, 1 and the last page, in exactly this order.
* **1-e**: All pages of the document.
* **e-1**: All pages of the document in reverse order.
* **1-5/2**: The pages 1, 3 and 5.
* **10-1/3**: The pages 10, 7, 4 and 1.
* **1l,2r,3-5d,6n**: The pages 1 (rotated left), 2 (rotated right), 3 to 5 (all rotated 180 degrees)
  and 6 (any possibly set rotation removed).


## EXAMPLES

### merge

`hexapdf merge input1.pdf input2.pdf input3.pdf output.pdf`  
`hexapdf merge -e input1.pdf input2.pdf input3.pdf output.pdf`

Merging: In the first case use `input1.pdf` as primary input file and merge the pages from
`input2.pdf` and `input3.pdf` into it. In the second case an empty PDF file is used for merging the
pages from the three given input files into it; the resulting output file will not have an meta data
or other additional data from the first input file.

`hexapdf merge odd.pdf even.pdf --interleave combined.pdf`

Page interleaving: Takes alternately a page from `odd.pdf` and `even.pdf` to create the output file.
This is very useful if you only have a simplex scanner: First you scan the front sides, creating
`odd.pdf`, and then you scan the back sides, creating `even.pdf`. With the command the pages can be
ordered in the correct way.


### modify

`hexapdf modify input.pdf -i 1-5,7-10,12-e output.pdf`

Page removal: Remove the pages 6 and 11 from the `input.pdf`.

`hexapdf modify input.pdf -i 1r,2-ed output.pdf`

Page rotation: Rotate the first page to the right, that is 90 degrees clockwise, and all other pages
180 degrees.

`hexapdf modify input.pdf --user-password my_pwd --permissions print output.pdf`

Encryption: Create the `output.pdf` from the `input.pdf` so that a password is needed to open it,
and only allow printing.

`hexapdf modify input.pdf -p input_password --decrypt output.pdf`

Encryption removal: Create the `output.pdf` as copy of `input.pdf` but with the encryption removed.
If the `--decrypt` was not used, the output file would retain the encryption specification of the
input file.


### optimize

`hexapdf optimize input.pdf output.pdf`

Optimization: Compress the `input.pdf` to get a smaller file size.


### split

`hexapdf split input.pdf out_%02d.pdf`

Split the `input.pdf` into individual pages, naming the output files `out_01.pdf`, `out_02.pdf`, and
so on.


### files

`hexapdf files input.pdf`  
`hexapdf files input.pdf -e 1`

Embedded files: The first command lists the embedded files in the `input.pdf`, the second one then
extracts the embedded file with the index 1.


### images

`hexapdf images input.pdf`  
`hexapdf images input.pdf -e --prefix images/image`

Image info and extraction: The first command lists the images of the `input.pdf`, the second one
then extracts the images into the subdirectory `images` with the prefix `image`.


### info

`hexapdf info input.pdf`

File information: Show general information about the PDF file, like PDF version, number of pages,
creator, creation date and encryption related information.


### inspect

`hexapdf inspect input.pdf -o 3`

Show the object with the object number 3 of the given PDF file.

`hexapdf inspect input.pdf`

Start the interactive inspection mode.


### batch

`hexapdf batch 'info {}' input1.pdf input2.pdf input3.pdf`

Execute the info command for all input files.

`hexapdf batch 'optimize --object-streams delete {} done-{}' input1.pdf input2.pdf input3.pdf`

Optimize the given input files, creating the three output files `done-input1.pdf`, `done-input2.pdf`
and `done-input3.pdf`.


## EXIT STATUS

The exit status is 0 if no error happened. Otherwise it is 1.


## SEE ALSO

The [hexapdf website][hexapdf-ws] for more information.


## AUTHOR

hexapdf was written by Thomas Leitner <t_leitner@gmx.at>.

This manual page was written by Thomas Leitner <t_leitner@gmx.at>.

[hexapdf-ws]: http://hexapdf.gettalong.org
