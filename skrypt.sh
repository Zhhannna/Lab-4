#!/bin/bash

case "$1" in
  --date | -d)
    echo "Today's date: $(date)"
    ;;
  --logs | -l)
    if [ -z "$2" ]; then
      num_files=100
    else
      num_files=$2
    fi
    for ((i=1; i<=num_files; i++))
    do
      filename="log${i}.txt"
      echo "Filename: ${filename}" > $filename
      echo "Script name: script.sh" >> $filename
      echo "Date: $(date)" >> $filename
    done
    ;;
  --help | -h)
    echo "Available options:"
    echo "--date, -d     Displays today's date"
    echo "--logs [n], -l [n] Creates n logx.txt files (100 by default)"
    echo "--init       Clones the repository and adds the path to PATH"
    echo "--error [n], -e [n] Creates n errorx/errorx.txt files (100 by default)"
    echo "--help, -h     Displays help"
    ;;
  --init)
    git clone https://github.com/Zhhannna/Lab-4.git $(pwd)
    export PATH=$PATH:$(pwd)
    ;;
  --error | -e)
    if [ -z "$2" ]; then
      num_files=100
    else
      num_files=$2
    fi
    for ((i=1; i<=num_files; i++))
    do
      mkdir -p "error${i}"
      filename="error${i}/error${i}.txt"
      echo "Filename: ${filename}" > $filename
      echo "Script name: script.sh" >> $filename
      echo "Date: $(date)" >> $filename
    done
    ;;
  *)
    echo "Unknown option. Use --help to display available options."
    ;;
esac
