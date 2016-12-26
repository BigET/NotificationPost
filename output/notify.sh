#!/bin/sh
./gdbus call --session --dest com.ubuntu.Postal --object-path \
/com/ubuntu/Postal/com_2eedi_2enpost \
          --method com.ubuntu.Postal.Post \
                   com.edi.npost_npost \
          "\"{\\\"message\\\": \\\"foobar\\\", \\\"notification\\\":{\\\"card\\\": {\\\"summary\\\": \\\"$1\\\", \\\"body\\\": \\\"$2\\\", \\\"popup\\\": true, \\\"persist\\\": true}}}\"" 
