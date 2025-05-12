FROM alpine:latest

RUN apk add ttyd neovim git && \
    wget -q -O /usr/bin/ttyd.nerd "https://github.com/Lanjelin/nerd-ttyd/releases/latest/download/ttyd.$(uname -m)" && \
    chmod +x /usr/bin/ttyd.nerd && \
    mkdir -p /root/.config/nvim

COPY init.lua /root/.config/nvim

COPY ./entrypoint.sh .
COPY ./keep-nvim-open.sh .

ENTRYPOINT ["./entrypoint.sh"]