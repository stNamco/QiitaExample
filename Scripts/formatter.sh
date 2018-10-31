#!/bin/zsh

# sort
./Scripts/sort-Xcode-project-file *.xcodeproj

# swiftformat
Pods/SwiftFormat/CommandLineTool/swiftformat . --exclude Carthage,Pods --allman false --wraparguments beforefirst --wrapelements beforefirst --self remove --header ignore --binarygrouping none --octalgrouping none --indentcase false --trimwhitespace always --decimalgrouping none --patternlet inline --commas inline --semicolons inline --indent 4 --exponentcase lowercase --operatorfunc spaced --elseposition same-line --empty void --ranges spaced --hexliteralcase uppercase --linebreaks lf --hexgrouping none --comments indent --ifdef indent --stripunusedargs closure-only
