FROM anatolelucet/neovim:nightly

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    python3-pip \
    git \
    nodejs \
    npm \
    ranger \
    ripgrep \
    fzf \
    golang

ENV HOME /home/lunarvim

RUN groupdel users                                              \
  && groupadd -r lunarvim                                       \
  && useradd --create-home --home-dir $HOME                     \
             -r -g lunarvim                                     \
             lunarvim

USER lunarvim

WORKDIR /code

COPY . /opt/LunarVim/

RUN /opt/LunarVim/utils/installer/install.sh

ENTRYPOINT /usr/local/bin/nvim
