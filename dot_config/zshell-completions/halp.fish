complete -c halp -n "__fish_use_subcommand" -l check -d 'Sets the argument to check' -r
complete -c halp -n "__fish_use_subcommand" -s c -l config -d 'Sets the configuration file' -r -F
complete -c halp -n "__fish_use_subcommand" -l no-version -d 'Disable checking the version information'
complete -c halp -n "__fish_use_subcommand" -l no-help -d 'Disable checking the help information'
complete -c halp -n "__fish_use_subcommand" -s v -l verbose -d 'Enables verbose logging'
complete -c halp -n "__fish_use_subcommand" -s h -l help -d 'Print help'
complete -c halp -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c halp -n "__fish_use_subcommand" -f -a "plz" -d 'Get additional help'
complete -c halp -n "__fish_seen_subcommand_from plz" -s m -l man-cmd -d 'Sets the manual page command to run' -r
complete -c halp -n "__fish_seen_subcommand_from plz" -l cheat-sh-url -d 'Use a custom URL for cheat.sh' -r
complete -c halp -n "__fish_seen_subcommand_from plz" -l eg-url -d 'Use a custom provider URL for `eg` pages' -r
complete -c halp -n "__fish_seen_subcommand_from plz" -l cheat-url -d 'Use a custom URL for cheat sheets' -r
complete -c halp -n "__fish_seen_subcommand_from plz" -s p -l pager -d 'Sets the pager to use' -r
complete -c halp -n "__fish_seen_subcommand_from plz" -l no-pager -d 'Disables the pager'
complete -c halp -n "__fish_seen_subcommand_from plz" -s h -l help -d 'Print help'
