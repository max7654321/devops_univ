while getopts ":p:s:" opt; do
  case $opt in
    p)
      directory="$OPTARG"
      ;;
    s)
      search_text="$OPTARG"
      ;;
    \?)
      echo "Unknown key: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

if [ -z "$directory" ] || [ -z "$search_text" ]; then
  echo "Correct usage: $0 -p <path to directory> -s <text to search>"
  exit 1
fi

if [ ! -d "$directory" ]; then
  echo "Directory '$directory' doesn't exist."
  exit 1
fi

grep -rl "$search_text" "$directory"

read -p "Press Enter to exit..."
