## Turtle-validation with ttl

ttl is a javascript tool for turtle validation developed by Ruben Verborgh, Ghent University.
See [https://github.com/mmlab/TurtleValidator](https://github.com/mmlab/TurtleValidator)


### Installation of the TurtleValidator

Open a terminal window. 
It should be possible to install it on your machine by an `npm` install command:

```bash
    npm install -g turtle-validator
```

(Tested on Mac. Not sure this works on Windows)

After successful installation you should now be able to validate one ttl file at a time.

```bash
    $ ttl example.ttl 
    Validator finished with 0 warnings and 0 errors.
```

### Running ttl over multiple files

The bash script `ttall.sh` runs the TurtleValidator over all files found in a directory and
subdirectories.

#### Install the ttall script

Bash scripts only work on Mac and Unix computers, not on Windows.

To download a single file from Github do the following:

1. Go to the file you want to download, in this case `ttall.sh`.
2. Click it to view the contents within the GitHub UI.
3. In the top right, right click the `Raw` button.
4. Right-click and Save as...

The best place to store the script is in `/usr/local/bin`. In that way the script can be
started from any place on your system. However, in order to do so you need administrator rights.
In this case it is advisable to rename the script `ttall` (leave out the extension `.sh`)
Also you need to make the script _executable_. Open a terminal in the folder where you
downloaded `ttall.sh`

```bash
$ mv ttall.sh /usr/local/bin/ttall
$ chmod u=rwx /usr/local/bin/ttall 
```

You should now be able to open a terminal and issue the `ttall` command from there:

```bash
$ ttall test/
Validating RDF in test/
-- Validating test//data/capability-list.xml
-- Validating test//data/rdfdump-00001
-- Validating test//data/rdfdump-00002
-- Validating test//data/rdfpatch-20160614140249
-- Validating test//data/resource-list.xml
-- Validating test//data/resourcesync
-- Validating test//example.ttl
-- Validating test//start_vql.sh

-------------------------------------------------------------
Report on test/
-------------------------------------------------------------
test//data/capability-list.xml
[Error: Syntax error: unexpected "<?xml" on line 1.]
Validator finished with 0 warnings and 1 errors.

test//data/rdfdump-00001
[Error: Syntax error: unexpected "+" on line 4.]
Validator finished with 0 warnings and 1 errors.

test//data/resource-list.xml
[Error: Syntax error: unexpected "<?xml" on line 1.]
Validator finished with 0 warnings and 1 errors.

test//data/resourcesync
[Error: Syntax error: unexpected "<?xml" on line 1.]
Validator finished with 0 warnings and 1 errors.

test//start_vql.sh
[Error: Syntax error: unexpected "DATA_DIR="$PWD/data"" on line 26.]
Validator finished with 0 warnings and 1 errors.

_______________________________________________________________

Found 5 files with errors on a total of 8 files

```

If you have trouble installing or deploying the `ttall` script, ask your system administrator
for help.



