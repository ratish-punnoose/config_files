#!/bin/sh
/cygdrive/c/cygwin64_installfiles_min/setup-x86_64.exe --download --local-package-dir "c:\cygwin64_installfiles_min" --root "c:\cygwin64_min"  --packages bash-completion,binutils,dos2unix,emacs-w32,file,findutils,git,grep,gzip,less,make,man,man-db,mintty,openssh,tar,terminfo,terminfo-extra,python38-pygments

# For publishing
/cygdrive/c/cygwin64_installfiles_min/setup-x86_64.exe --download --local-package-dir "c:\cygwin64_installfiles_min" --root "c:\cygwin64_min"  --packages texinfo,texinfo-tex,texlive,texlive-collection-basic,texlive-collection-binextra,texlive-collection-fontsextra,texlive-collection-fontsrecommended,texlive-collection-fontutils,texlive-collection-latex,texlive-collection-latexextra,texlive-collection-latexrecommended,texlive-collection-luatex,texlive-collection-mathscience,texlive-collection-metapost,texlive-collection-pictures,texlive-collection-plaingeneric,texlive-collection-pstricks,texlive-collection-publishers

# For rjp dev
/cygdrive/c/cygwin64_installfiles_min/setup-x86_64.exe --download --local-package-dir "c:\cygwin64_installfiles_min" --root "c:\cygwin64_min"  --packages subversion,tar,terminfo,terminfo-extra,texinfo,texinfo-tex


# For rjp
/cygdrive/d/cygwin64_installfiles/setup-x86_64.exe --download --local-package-dir "c:\cygwin64_installfiles_min" --root "c:\cygwin64_min"  --packages screen,ispell,popper,ledger
