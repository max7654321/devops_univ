if [ $# -ne 2 ]; then
  echo "Correct usage: $0 <path to directory> <files extension>"
  exit 1
fi

directory="$1"
extension="$2"

if [ ! -d "$directory" ]; then
  echo "Directory '$directory' not exist."
  exit 1
fi

find "$directory" -type f -name "*.$extension"

read -p "Press Enter to exit..."