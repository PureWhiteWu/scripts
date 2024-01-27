#!/usr/bin/env bash

shadowsocks_rust_init='/etc/init.d/shadowsocks-rust'
shadowsocks_rust_config='/etc/shadowsocks-rust/config.json'

if [ ! -d "$(dirname ${shadowsocks_rust_config})" ]; then
    mkdir -p $(dirname ${shadowsocks_rust_config})
fi

cp shadowsocks-rust-config ${shadowsocks_rust_init}

apt install -y gcc g++

git clone https://github.com/shadowsocks/shadowsocks-rust.git

cd shadowsocks-rust

git checkout v1.17.1

rustup default nightly

export RUSTFLAGS="-C target-cpu=native"

cargo build --release --features aead-cipher-2022-extra --bin ssserver

cp target/release/ssserver /usr/local/bin

cat > ${shadowsocks_rust_config}<<-EOF
{
    "server":"::",
    "server_port":,
    "password":"",
    "timeout":300,
    "method":"",
    "keep_alive": 15,
    "mode":"tcp_and_udp"
}
EOF

chmod +x ${shadowsocks_rust_init}
service_name=$(basename ${shadowsocks_rust_init})
update-rc.d -f "${service_name}" defaults

cd ..
rm -rf shadowsocks-rust
rm -rf ~/.rustup/

systemctl enable shadowsocks-rust
