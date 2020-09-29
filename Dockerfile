FROM openjdk:11-jre

# Update
RUN apt update

# Chromium
RUN apt install -y chromium

# Clojure CLI
RUN curl -O https://download.clojure.org/install/linux-install-1.10.1.697.sh
RUN chmod +x linux-install-1.10.1.697.sh
RUN ./linux-install-1.10.1.697.sh

# Leiningen
RUN wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
RUN mv lein /usr/bin
RUN chmod a+x /usr/bin/lein
RUN lein

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y yarn

# Make
RUN apt install make

WORKDIR /tmp