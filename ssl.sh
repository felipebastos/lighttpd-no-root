cd ~/lighttpd/etc
mkdir certs
cd certs
`openssl req -new -x509 -keyout lighttpd.pem -out lighttpd.pem -days 365 -nodes`
chmod 400 lighttpd.pem
cd ~/lighttpd
printf 'server.modules += ("mod_openssl")
$SERVER["socket"] == ":1443" {
  ssl.engine = "enable" 
  ssl.pemfile = "'>>etc/lighttpd.conf
printf $HOME>>etc/lighttpd.conf
echo '/lighttpd/etc/certs/lighttpd.pem" 
}'>>etc/lighttpd.conf

