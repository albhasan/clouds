#!/bin/bash
parallel --dry-run zip -r {.}.zip {} ::: $(find . -maxdepth 1 -type d)

