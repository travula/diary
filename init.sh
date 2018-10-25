#!/bin/bash

if [ -d exp-publisher ]; then
    echo "experiment publisher already already present"
    (cd exp-publisher; git pull)
else
    git clone https://gitlab.com/vlead-projects/experiments/infra/publish/exp-publisher.git
    (cd exp-publisher)
fi

if [ -L pub-make ]; then
    echo "symlinked makefile already present"
else 
    ln -sf exp-publisher/makefile pub-make
fi
