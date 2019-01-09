FROM vault:1.0.1
LABEL maintainer="jmorgan@pivotal.io"
LABEL description="A simple vault server container. Uses amazon S3 as a backend, all arguments must be supplied in the environment."
ADD init.sh init.sh
ENTRYPOINT [ "/bin/sh", "init.sh" ]
