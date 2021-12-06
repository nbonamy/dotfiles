#!/bin/bash

echo "export $(grep -v .test .dircolors | dircolors - | head -1)" > .lscolors
