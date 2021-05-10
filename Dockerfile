FROM debian:stretch-slim

ENV DEBIAN_FRONTEND noninteractive

# I chose not to install systemd-sysv for now to gain in container weight
RUN apt update \
	&& apt full-upgrade -y \
	&& apt install -y --no-install-recommends systemd python3 python3-apt \
	&& apt autoremove \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -Rf /usr/share/doc \
	&& rm -Rf /usr/share/man \
	&& rm -f /lib/systemd/system/multi-user.target.wants/getty.target

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]
