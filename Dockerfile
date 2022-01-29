FROM ghcr.io/pg9182/northstar-dedicated:1-tf2.0.11.0

USER root
# Get git
RUN apk add git
# Use this arg to get a specific commit from NorthstarMods
ARG NORTHSTARMODS_SHA1="main"
# Go to location, remove old mods, clone new at specific commit, then cleanup
RUN cd /usr/lib/northstar/R2Northstar/ \
    && rm -rf mods/ \
    && mkdir mods/ \
    && cd mods/ \
    && git init \
    && git remote add origin https://github.com/R2Northstar/NorthstarMods.git \
    && git fetch --depth 1 origin ${NORTHSTARMODS_SHA1} \
    && git checkout FETCH_HEAD \
    && rm -rf LICENSE Northstar.Coop/ README.md .gitattributes .gitignore

USER northstar
EXPOSE 8081/tcp
EXPOSE 37015/udp
# ENTRYPOINT [ "/bin/sh" ]
ENTRYPOINT ["/usr/libexec/nsdedi", "                                                                                                                        "]
