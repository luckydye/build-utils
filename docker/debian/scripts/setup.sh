#!/bin/bash

rtx install

# create bash proxy scripts for every binary inside each path of "rtx bin-paths" and ignore errors
for path in $(rtx bin-paths); do \
  for bin in $(ls $path); do \
    echo -e "#!/bin/bash\n$path/$bin \$@" > /usr/local/bin/$bin && \
    chmod +x /usr/local/bin/$bin; \
  done; \
done
