if [ $# -ne 2 ]; then
  echo "Correct usage: $0 <path to directory> <file extension>"
  exit 1
fi

directory="$1"
extension="$2"

if [ ! -d "$directory" ]; then
  echo "Directory '$directory' not exist."
  exit 1
fi

file_count=$(find "$directory" -type f -name "*.$extension" | wc -l)

echo "Amount of files with extension .$extension in directory $directory: $file_count"

read -p "Press Enter to exit..."