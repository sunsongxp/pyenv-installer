# Install Go
wget http://golang.org/dl/go1.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install useful packages
go get github.com/peco/peco/cmd/peco
go get github.com/dinedal/textql
go get github.com/sosedoff/pgweb
