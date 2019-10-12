YOUTUBE_DL_CMD=youtube-dl

if ! type $YOUTUBE_DL_CMD > /dev/null; then
  echo "Command 'youtube-dl' not found. Did you run `pip install -r requirements.txt`?"
  exit 1
fi

if [[ $# != 2 ]]; then
  echo "Usage: scripts/download_playlist.sh <playlist> <playlist-end-index>"
  echo "Example: scripts/download_playlist.sh https://www.youtube.com/playlist?list=PLjk8Jdc9PVxuqIzqiST9h1bZQtLcJQFV3 2"
  exit 1
fi

PLAYLIST=$1
END=$2

if [[ "$PWD" != *autonomousBeats ]]; then
  echo "Please call this script from repo root dir!"
  exit 1
fi

# Make data directory and switch to it
mkdir -p data
cd data

CMD="${YOUTUBE_DL_CMD} -x --yes-playlist ${PLAYLIST} --playlist-end ${END}"
$CMD

cd ..
