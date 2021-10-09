FROM openjdk:8-jdk

# Somehow the default shell which is /bin/sh doesn't work
# so we need to use /bin/bash instead.
SHELL ["/bin/bash", "-c"]

RUN apt update && \
    apt install zip

RUN curl -s "https://get.sdkman.io" | bash && \
    source "$HOME/.sdkman/bin/sdkman-init.sh" && \
    sdk install kotlin && \
    sdk install kscript

WORKDIR /app

ENTRYPOINT source /root/.sdkman/bin/sdkman-init.sh && /usr/bin/env kscript "$0" "$@"
CMD ['--help']
