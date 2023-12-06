FROM haskell:9.6

# Check GHC and Cabal
RUN ghc --version
RUN cabal --version

# Install requirements
RUN cabal update
RUN cabal install alex happy

# Install Agda
RUN cabal install -j3 Agda

# Install EMACS
RUN apt-get update && apt-get upgrade -y
RUN apt-get install emacs-nox -y

# Install Agda plugin into EMACS
RUN agda-mode setup
RUN agda-mode compile
