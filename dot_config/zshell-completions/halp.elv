
use builtin;
use str;

set edit:completion:arg-completer[halp] = {|@words|
    fn spaces {|n|
        builtin:repeat $n ' ' | str:join ''
    }
    fn cand {|text desc|
        edit:complex-candidate $text &display=$text' '(spaces (- 14 (wcswidth $text)))$desc
    }
    var command = 'halp'
    for word $words[1..-1] {
        if (str:has-prefix $word '-') {
            break
        }
        set command = $command';'$word
    }
    var completions = [
        &'halp'= {
            cand --check 'Sets the argument to check'
            cand -c 'Sets the configuration file'
            cand --config 'Sets the configuration file'
            cand --no-version 'Disable checking the version information'
            cand --no-help 'Disable checking the help information'
            cand -v 'Enables verbose logging'
            cand --verbose 'Enables verbose logging'
            cand -h 'Print help'
            cand --help 'Print help'
            cand -V 'Print version'
            cand --version 'Print version'
            cand plz 'Get additional help'
        }
        &'halp;plz'= {
            cand -m 'Sets the manual page command to run'
            cand --man-cmd 'Sets the manual page command to run'
            cand --cheat-sh-url 'Use a custom URL for cheat.sh'
            cand --eg-url 'Use a custom provider URL for `eg` pages'
            cand --cheat-url 'Use a custom URL for cheat sheets'
            cand -p 'Sets the pager to use'
            cand --pager 'Sets the pager to use'
            cand --no-pager 'Disables the pager'
            cand -h 'Print help'
            cand --help 'Print help'
        }
    ]
    $completions[$command]
}
