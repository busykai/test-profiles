#!/bin/sh

tar -zxvf openssl-1.0.1c.tar.gz

mkdir openssl_/

cd openssl-1.0.1c/
./config --prefix=$HOME/openssl_/ no-zlib
make
echo \$? > ~/test-exit-status
make install
cd ..
rm -rf openssl-1.0.1c/
rm -rf openssl_/lib/

echo "#!/bin/sh
./openssl_/bin/openssl speed rsa4096 > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > openssl
chmod +x openssl


