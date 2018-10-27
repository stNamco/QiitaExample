#!/bin/zsh

# sort
./Scripts/sort-Xcode-project-file *.xcodeproj

# swiftformat
Pods/SwiftFormat/CommandLineTool/swiftformat . --exclude Carthage,Pods --trimwhitespace nonblank-lines --stripunusedargs closure-only --patternlet inline  --disable strongOutlets,trailingCommas
