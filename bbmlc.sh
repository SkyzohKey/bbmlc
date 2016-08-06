#/bin/sh
APP_NAME=$(basename "$0");
APP_VERSION="0.1.0";

function main () {
  if [ -z "$1" ]; then
    echo -e "No source given. Aborting.";
    exit 0;
  fi;

  if [[ "$1" = "-v" || "$1" = "--version" ]]; then
    echo -e "bbml2html version ${APP_VERSION}";
    exit 0;
  fi;

  TMP_FILE=$(mktemp);

  if [ "$2" = "html" ]; then
    SRC_FILE=$(basename "$1");
    OUT_FILE=$(basename "${SRC_FILE%.*}.html");
    transpile_to "html";
  elif [ "$2" = "bbml" ]; then
    SRC_FILE=$(basename "$1");
    OUT_FILE=$(basename "${SRC_FILE%.*}.bbml");
    transpile_to "bbml";
  else
    echo -e "Usage: ./${APP_NAME} file.(html|bbml) (bbml|html)";
    echo -e "Example: ./${APP_NAME} index.bbml html # index.bbml -> index.html";
    echo -e "         ./${APP_NAME} index.html bbml # index.html -> index.bbml";
    exit 1;
  fi;
}

function transpile_to () {
  FORMAT="$1";

  tput bold; tput setaf 4;
  echo -e " ##";
  echo -e " # The BBcode Markup Language transpiler";
  echo -e " # @version ${APP_VERSION}";
  echo -e " # @author SkyzohKey";
  echo -e " # @source https://github.com/SkyzohKey/bbml";
  echo -e " ##";
  tput sgr0;

  tput bold; tput setaf 2;
  echo -e " - Source file: ${SRC_FILE}";
  echo -e " - Output file: ${OUT_FILE}";
  tput sgr0;

  cat $SRC_FILE > $TMP_FILE;

  if [ "$FORMAT" = "bbml" ]; then
    tput bold; tput setaf 6;
    echo -e " - Transpiling from html to bbml";
    tput sgr0;

    cat $TMP_FILE \
    | sed \
      -e 's/</\[/g' \
      -e 's/>/\]/g' \
    > $OUT_FILE;
  else
    tput bold; tput setaf 6;
    echo -e " - Transpiling from bbml to html";
    tput sgr0;

    cat $TMP_FILE \
    | sed \
      -e 's/\]/>/g' \
      -e 's/\[/</g' \
    > $OUT_FILE;
  fi;

  tput bold; tput setaf 4;
  echo -e " ##";
  tput setaf 2;
  echo -e " - Transpilation finished.";
  tput setaf 5;
  echo -e " - Output: $(pwd)/$OUT_FILE";
  tput setaf 4;
  echo -e " ##";
  tput sgr0;

  exit 0;
}

main $@;
exit 0;
