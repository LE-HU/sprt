# Log Parser

Parser capable of pretty printing data from _path_ - _ip_ log files.

## Usage

Invoke CLI help:

```bash
  ruby parser.rb -h

  Usage: parser.rb [options]
    -f, --file FILE                  Specify log file
    -a, --all                        List all views
    -u, --uniq                       List unique views
    -h, --help                       Prints this help
```

## Example call

```bash
  ruby parser.rb -f webserver.log -au
```
