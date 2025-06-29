# Add Password - security add-generic-password -a $USER -s amzn_pwd -w
# Add PIN - security add-generic-password -a $USER -s amzn_pin -w

set PWORD [ exec security find-generic-password -w -s amzn_pwd -a "snadnan" ]
set PIN  [ exec security find-generic-password -w -s amzn_pin -a "snadnan" ]
set YKEY [lindex $argv 0]
spawn kinit
expect "snadnan@ANT.AMAZON.COM's password:"
send "$PWORD\r"

spawn mwinit -o
expect "PIN for snadnan:"
send "$PIN\r"
expect "Press the button on your YubiKey (you might have to hold it for about 3-5 seconds before your token produces a one-time password)..."
send "$YKEY\r"

# interact
expect eof