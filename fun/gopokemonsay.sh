#!/usr/bin/env bash
set -euo pipefail

ABSDIR="$(cd "$(dirname "$0")";pwd)";
POKEDEX=("${ABSDIR}/../../pokemonsay/cows"/*)
RANDOM_POKEMON=$(expr $RANDOM % ${#POKEDEX[@]})
POKEMON_NAME=$(echo "${POKEDEX[$RANDOM_POKEMON]}" | sed 's/\.cow//' | sed 's/.*\///')

function print_rainbow() {
	if hash lolcat; then
		echo $1 | lolcat -p 1 -a -d 14 -F 0.5 -s 10
	else
		echo $1
	fi
}

printf "🔑  DON'T FORGET   🔑\n🔑  YOUR \e[35mKEYCHAIN\e[m  🔑" | $ABSDIR/cowsay -n -f "${POKEDEX[$RANDOM_POKEMON]}" ""
print_rainbow $POKEMON_NAME

# Old OpenBSD blowfish cowsayer lolcatter
# if command -v lolcat > /dev/null && command -v cowsay > /dev/null; then
# 	  echo "DON'T FORGET YOUR KEYS! 🔑" | cowsay -f blowfish | lolcat
# 	else
#   echo "DON'T FORGET YOUR KEYS! 🔑"
# fi;
