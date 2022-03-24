FROM haskell
WORKDIR /app

RUN apt update && apt install -y git make neovim sudo vim zsh

ARG ROOT_PASSWORD=pass
RUN echo "root:${ROOT_PASSWORD}" | chpasswd

ARG DOCKER_UID=1000
ARG DOCKER_USER=docker_user
ARG DOCKER_PASSWORD=pass
RUN useradd -m --uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} \
    && echo "${DOCKER_USER}:${DOCKER_PASSWORD}" | chpasswd

USER ${DOCKER_USER}

RUN git clone https://github.com/eycjur/dotfiles.git ~/dotfiles
RUN ~/dotfiles/install.sh

CMD ["/bin/zsh"]
