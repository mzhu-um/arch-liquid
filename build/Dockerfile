FROM archlinux/archlinux

# Install OCaml and OPAM
RUN printf 'Server = http://mirror.umd.edu/archlinux/$repo/os/$arch\n' > /etc/pacman.d/mirrorlist; \
    pacman -Sy archlinux-keyring; \
    pacman -Syu --noconfirm; \
    pacman -S coreutils diffutils patch gcc git make ocaml opam vim make --noconfirm; \
    rm -rf /var/cache/pacman/pkg; \
    useradd ocaml -m

USER ocaml

# Initialize OPAM and build working switch
RUN opam init -y -a; \
    opam update; \
    opam switch -y create work 4.14.0; \
    opam switch work; \
    eval $(opam env) && opam install -y dune ounit ppx_deriving && opam clean; \
    rm -rf /tmp/*

WORKDIR /home/ocaml
ENTRYPOINT ["/bin/bash", "-l"]