if [ $# -ne 2 ]; then
  echo "Correct usage: $0 <path to directory> <text to search>"
  exit 1
fi

directory="$1"
search_text="$2"

if [ ! -d "$directory" ]; then
  echo "Directory '$directory' does not exist."
  exit 1
fi

grep -rl "$search_text" "$directory"

read -p "Press Enter to exit..."
