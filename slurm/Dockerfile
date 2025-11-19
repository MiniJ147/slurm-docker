FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y build-essential wget munge libmunge-dev \
                   libssl-dev libpam0g-dev libhwloc-dev libjson-c-dev \
                   python3 python3-distutils python3-venv python3-pip \
                   && apt clean

WORKDIR /opt

    # Build Slurm from source without docs
RUN wget https://download.schedmd.com/slurm/slurm-23.11.2.tar.bz2 && \
    tar xf slurm-23.11.2.tar.bz2 && \
    cd slurm-23.11.2 && \
    ./configure --prefix=/usr --sysconfdir=/etc/slurm --without-systemd --without-docs && \
    make -j$(nproc) && make install

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6817 6818

ENTRYPOINT ["/entrypoint.sh"]
