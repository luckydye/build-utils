get_arch() {
	arch="$(uname -m)"
	if [ "$arch" = x86_64 ]; then
		echo "x64"
	elif [ "$arch" = aarch64 ] || [ "$arch" = arm64 ]; then
		echo "arm64"
	else
		error "unsupported architecture: $arch"
	fi
}

arch="$(get_arch)"
curl https://rtx.pub/rtx-latest-linux-{$arch} > /usr/local/bin/rtx
chmod 700 /usr/local/bin/rtx

echo 'eval "$(rtx activate bash)"' >> ~/.bashrc
