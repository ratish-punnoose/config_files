#!/bin/sh
# Using bash arrays
# https://unix.stackexchange.com/questions/19124/bash-multi-line-command-with-comments-after-the-continuation-character
# https://unix.stackexchange.com/questions/447429/why-doesnt-the-separator-from-ifs-work-for-array-expansion

MINPKGS=(bash-completion binutils dos2unix emacs-w32 file findutils
         git grep gzip less make man man-db mintty openssh tar
         terminfo terminfo-extra python39-pygments python39-numpy bc
         zip unzip
        )
PUBPKGS=(texinfo texinfo-tex texlive texlive-collection-basic
         texlive-collection-binextra texlive-collection-fontsextra
         texlive-collection-fontsrecommended
         texlive-collection-fontutils
         texlive-collection-latex texlive-collection-latexextra
         texlive-collection-latexrecommended
         texlive-collection-luatex texlive-collection-mathscience
         texlive-collection-metapost texlive-collection-pictures
         texlive-collection-plaingeneric
         texlive-collection-pstricks texlive-collection-publishers
         aspell aspell-en
         )

RJPPKGS=(screen ispell terminfo terminfo-extra poppler)
#RJPHOME=(ledger)
XPKGS=(xorg-server)
IFS=','

listonly=0


# -l list
# -b base with python
# -p publication
# -x X
# -r rjp

selected_pkgs=()
install_dir="c:\cygwin64"
package_dir="c:\cygwin64_installfiles"

while getopts 'lbtxrhi:p:' opt; do
    case "$opt" in
        l)
            listonly=1
            ;;
        b)
            selected_pkgs+=( "${MINPKGS[*]}" )
            ;;

        t)
            selected_pkgs+=( "${PUBPKGS[*]}" )
            ;;
        x)
            selected_pkgs+=( "${XPKGS[*]}" )
            ;;

        r)
            selected_pkgs+=( "${RJPPKGS[*]}" )
            ;;

        i)
            install_dir="$OPTARG"
            ;;
        p)
            package_dir="$OPTARG"
            ;;

        :)
            echo "not arg"
            exit 1
            ;;
        :|?|h)
            echo "Usage: $(basename $0) [-i install_dir] [-p pkg_dir] [-b] [-t] [-x] [-r] [-l]"
            echo "     -b : base with python"
            echo "     -t : tex publication"
            echo "     -x : Xserver"
            echo "     -r : rjp"
            echo "     -l : list only"
            echo "     -i : install dir [normally c:\cygwin64]"
            echo "     -p : package dir [normally c:\cygwin64_installfiles]"
            exit 1
            ;;
    esac
done
shift "$(($OPTIND -1))"

echo "Install dir: ${install_dir}"
echo "Package dir: ${package_dir}"
echo "Selected packages: ${selected_pkgs[*]}"
if [ $listonly -eq 0 ]
then
    "${package_dir}"/setup-x86_64.exe \
        --download --local-package-dir "$package_dir" \
        --root "$install_dir" \
        --packages "${selected_pkgs[*]}"
fi
