printf "Downloading fuan analyze...\n"

ROOT_DIR="fuan.analyze"

rm -rf $ROOT_DIR
mkdir -p $ROOT_DIR/bin

url="https://github.com/WesleyCh3n/analyze.api/releases/download/latest/analyze.api-x86_64-unknown-linux-gnu.tar.gz"
curl '-#' -fLO $url
tar xf analyze.api-x86_64-unknown-linux-gnu.tar.gz -C $ROOT_DIR

url="https://github.com/WesleyCh3n/analyze.rs/releases/download/latest/analyze.rs-x86_64-unknown-linux-gnu.tar.gz"
curl '-#' -fLO $url
tar xf analyze.rs-x86_64-unknown-linux-gnu.tar.gz -C $ROOT_DIR
mv $ROOT_DIR/analyze-rs $ROOT_DIR/bin/

url="https://github.com/WesleyCh3n/analyze.web/releases/download/latest/analyze.web-static.tar.gz"
curl '-#' -fLO $url
tar xf analyze.web-static.tar.gz -C $ROOT_DIR/assets/

rm analyze*.tar.gz

printf "Finished!!\n\n"

GREEN='\033[0;32m'
NC='\033[0m' # No Color
printf "${GREEN}Go to fuan.analyze folder and execute analyze-api
Then, go to localhost:3001 in the browser.${NC}\n"
