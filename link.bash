#!/bin/bash
# creates links in the parent directory to all dotfiles in this directory.
# HAS to be run in this directory

set -e
set -u

COMMAND=""
if [[ $# -gt 0 ]]; then
    COMMAND=$1
fi

# e.g.Turns ".cabal/config" into "../"
function to_breadcrumbs() {
    echo "$1" | sed -r -e 's@[^/]@@g' -e 's@/@../@g'
}

function get_link_path() {
    FILENAME=$1
    pushd $(dirname ${FILENAME}) > /dev/null
    readlink $(basename ${FILENAME})
    popd > /dev/null
}

function get_target_for_file() {
    echo $(to_breadcrumbs $1)dotfiles/$1
}

function create_link() {
    FILENAME=$1
    TARGET=$(get_target_for_file ${FILENAME})
    LINKNAME=../${FILENAME}

    echo LINKING ${FILENAME}
    mkdir -p ../$(dirname ${FILENAME})
    ln -s ${TARGET} ${LINKNAME}
}

function backup_file() {
    FILENAME=$1
    TIMESTAMP=$(date +'%Y.%m.%d')
    BACKUP_NAME=${FILENAME}.${TIMESTAMP}.bak
    echo BACK UP ${FILENAME} to ${BACKUP_NAME}
    mv ${FILENAME} ${BACKUP_NAME}
}

LINKED_FILES=" \
    .bash_local \
    .bashrc \
    .bash_profile \
    .bash_logout \
    .bash_aliases \
    .develop_aliases \
    .quilt_aliases \
    .gitconfig \
    .gitignore_global \
    .tmux.conf \
    .vimrc \
    .gvimrc \
    .ghci \
    .cabal/config \
    .quiltrc \
    .minttyrc \
    bin/* \
    "
COPIED_FILES=""

chmod u+x bin/*

for file in $LINKED_FILES; do

    TARGET=$(to_breadcrumbs $file)dotfiles/$file
    LINKNAME=../$file
    CREATE_LINK=0

    if [[ -e ${LINKNAME} ]]; then
        if [[ -L ${LINKNAME} ]]; then
            CURRENT_TARGET=$(get_link_path ${LINKNAME})
            if [[ "$CURRENT_TARGET" == "$TARGET" ]]; then
                echo LINKED $file exists
                continue
            else
                echo LINK $file already exists but points to ${CURRENT_TARGET}
            fi
        else 
            echo FILE $file already exists
        fi

        if [[ "${COMMAND}" == "force" ]]; then
            backup_file ${LINKNAME}
            CREATE_LINK=1
        fi
    else
        CREATE_LINK=1
    fi

    if [[ ${CREATE_LINK} -eq 1 ]]; then
        create_link $file
    fi
done

for file in $COPIED_FILES; do
    if [[ ! -e ../$file ]]; then
        echo COPYING $file
        cp $file ../$file;
    else
        echo COPY $file already exists
    fi
done

# Bootstrap vim
if [[ ! -e "${HOME}/.vim/bundle/neobundle.vim" ]]; then
    echo "BOOTSTRAPPING vim"
    mkdir -p ~/.vim/bundle
    git clone git://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
fi

# Fix warning from ghci complaining it is writable
chmod g-w .ghci
