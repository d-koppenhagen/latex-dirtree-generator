# LaTeX dirtree generator
This is a generator for directory trees in LaTeX documents by procesing all files from a given directory.
The Script is written in perl and generates an output wich could be included in LaTeX `.tex`-files.

<img src="./terminal.svg">

## preparation
To see a directory in LaTeX documents you need to include the `dirtree` package first:

```
\usepackage{dirtree}
```

You'll find the official documentation for this package [here](http://tug.ctan.org/macros/generic/dirtree/dirtree.pdf).

## generate dirtree
the perl script `dirtree.pl` creates a LaTeX source code for directory trees.
You can run the script using perl on the command line:

```bash
perl dirtree.pl PATH/TO/DIR DEPTH?
```

the Param `DEPTH` is optional. if you leave it blank all files will be be processed.
You can set this param e.g. to `2` to print only subfolders until hierarchy level 2.
Files in folder of higher hierarchy levels will be indicated with `...`.

### Example
The following command...

```bash
perl dirtree.pl some/directory 2
```

...will generate the output:

```latex
\dirtree{%
  .1 directory.
  .2 file1.
  .2 file2.
  .2 folder1.
  .3 subfolder1.
  .4 \dots.
  .3 subfolder2.
  .4 \dots.       % content is just shown as "..." because of param "2"
  .2 folder2.
  .3 file3.
  .3 file4.
}\hfill
```
