FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy
LABEL maintainer="Paradoxxs"
# title
ENV TITLE=Brave


RUN curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
# Install dependencies
RUN apt-get update
RUN apt install -y brave-browser

COPY /root /


# Expose VNC
EXPOSE 3000 