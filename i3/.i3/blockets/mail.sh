USER=maximilianohorta94
PASS=$(gpg2 -dq ~/.mutt/accounts/gmail_pwds.gpg)

COUNT=`curl -su $USER:$PASS https://mail.google.com/mail/feed/atom || echo "<fullcount>unknown number of</fullcount>"`
COUNT=`echo "$COUNT" | grep -oPm1 "(?<=<fullcount>)[^<]+" `
echo $COUNT
if [ "$COUNT" != "0" ]; then
    if [ "$COUNT" = "1" ];then
        WORD="mail";
    else
        WORD="mails";
    fi
fi
