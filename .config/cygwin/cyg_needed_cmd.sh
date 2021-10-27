#!/bin/sh
# Using bash arrays
# https://unix.stackexchange.com/questions/19124/bash-multi-line-command-with-comments-after-the-continuation-character
# https://unix.stackexchange.com/questions/447429/why-doesnt-the-separator-from-ifs-work-for-array-expansion

MINPKGS=(bash-completion binutils dos2unix emacs-w32 file findutils
         git grep gzip less make man man-db mintty openssh tar
         terminfo terminfo-extra python38-pygments python38-numpy bc
         tar
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
DEVPKGS=(subversion tar terminfo terminfo-extra texinfo texinfo-tex)
RJPPKGS=(screen ispell popper ledger)
XPKGS=(xorg-server)
IFS=','

echo "${MINPKGS[*]}"
/cygdrive/c/cygwin64_installfiles_min/setup-x86_64.exe \
    --download --local-package-dir "c:\cygwin64_installfiles_min" \
    --root "c:\cygwin64_min" \
    --packages "${MINPKGS[*]}"

