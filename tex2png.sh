file_name=$2
name=${file_name%.*}

case $1 in
  create)
      mkdir $name
      cp template/default.tex $name/$name.tex
      ;;
  build)
      cd $name
      pdflatex $name.tex
      pdftops -eps $name.pdf
      convert -density 300 -transparent white $name.eps $name.png
      ;;
  view)
      cd $name
      xdg-open $name.png
      ;;
  delete)
      rm -rf $name
      ;;
  clean)
      cd $name
      find . -type f -not \( -name '*.png' -or -name '*.tex' -or -name '*.sh' \) -delete
      ;;
  *)
      echo "tex2png.sh create|build|view|delete|clean project_name"
esac
