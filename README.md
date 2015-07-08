# fmj

A pure awk emoji formatter.

![fmj](https://pbs.twimg.com/media/B8JxDi2CAAAD5Uz.png:large)

## Installation
Put fmj somewhere on your `$PATH`. I keep tools like this in `~/.bin`:

```
$ git clone https://github.com/ecmendenhall/fmj
$ mv fmj/fmj ~/.bin
```

## Usage
fmj is a [Unix filter](https://en.wikipedia.org/wiki/Filter_(software)). Give it
text containing [emoji shortcodes](http://www.emoji-cheat-sheet.com/) on `STDIN`
and it replaces them with the corresponding unicode characters:

```
$ echo :joy_cat: | fmj
```

If there is no input on `STDIN`, fmj reads from a file. Try, e.g.

```
$ fmj they_hatin
```

in this project directory.
