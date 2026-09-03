#!/usr/bin/env bash
dir="$1"
file="$2"
stem="$3"

cd "$dir" || exit 1

echo "[Running] $file"
echo "----------------------------"

case "$file" in
    *.py) python3 "$file" ;;
    *.go) go run "$file" ;;
    *.sh) bash "$file" ;;
    *.rs) cargo run ;;
    *.php) php "$file" ;;
    *.c)
        mkdir -p Output && gcc "$file" -std=c23 -O2 -Wall -o "Output/$stem" && "./Output/$stem"
        ;;
    *.cpp|*.cc|*.cxx)
        mkdir -p Output && g++ "$file" -std=c++23 -O2 -Wall -o "Output/$stem" && "./Output/$stem"
        ;;
    *.java)
        mkdir -p Output && javac -d Output "$file" && java -cp Output "$stem"
        ;;
    *)
        echo "[Code Runner] Unsupported file type: $file"
        exit 1
        ;;
esac

status=$?
echo ""
echo "----------------------------"
echo "[Done] exited with code=$status"
