# oct/27/2026 02:52:11 by RouterOS 6.49.21
# software id = D6CH-68IV
#
# model = RB1100Dx4
# serial number = HJK0AG9FQK8
/interface bridge
add fast-forward=no name=IN-OUT
/interface ethernet
set [ find default-name=ether2 ] name=E-ISP2
set [ find default-name=ether1 ] name=ISP1
set [ find default-name=ether3 ] name=ISP3
set [ find default-name=ether4 ] name=ISP4
set [ find default-name=ether5 ] name=ISP5
set [ find default-name=ether6 ] name=ISP6
set [ find default-name=ether8 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full,2500M-full
set [ find default-name=ether13 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full,2500M-full \
    comment="\D8\A7\D9\84\D8\A5\D8\B3\D8\AA\D8\B1\D8\A7\D8\AD\D8\A9"
/interface vlan
add interface=ether11 name=VLAN-10 vlan-id=10
add interface=ether10 name=VLAN-20 vlan-id=20
add interface=ether13 name=VLAN-22 vlan-id=22
add interface=ether10 name=VLAN-30 vlan-id=30
add interface=ether9 name=VLAN-60 vlan-id=60
add interface=ether9 name=VLAN-61 vlan-id=61
add interface=ether11 name=VLAN-101 vlan-id=101
add interface=ether11 name=VLAN-101-5.8 vlan-id=1101
add interface=ether13 name=VLAN-102 vlan-id=102
add interface=ether9 name=VLAN-102-5.8 vlan-id=1102
add interface=ether11 name=VLAN-103 vlan-id=103
add interface=ether11 name=VLAN-103-5.8 vlan-id=1103
add interface=ether11 name=VLAN-104 vlan-id=104
add interface=ether11 name=VLAN-104-5.8 vlan-id=1104
add interface=ether11 name=VLAN-105 vlan-id=105
add interface=ether11 name=VLAN-105-5.8 vlan-id=1105
add interface=ether11 name=VLAN-106 vlan-id=106
add interface=ether11 name=VLAN-106-5.8 vlan-id=1106
add interface=ether11 name=VLAN-107 vlan-id=107
add interface=ether11 name=VLAN-107-5.8 vlan-id=1107
add interface=ether11 name=VLAN-111 vlan-id=111
add interface=ether11 name=VLAN-111-5.8 vlan-id=1111
add interface=ether11 name=VLAN-113 vlan-id=113
add interface=ether11 name=VLAN-117 vlan-id=117
add interface=ether10 name=VLAN-131 vlan-id=131
add interface=ether10 name=VLAN-131-5.8 vlan-id=1
add interface=ether10 name=VLAN-132 vlan-id=132
add interface=ether10 name=VLAN-133 vlan-id=133
add interface=ether10 name=VLAN-134 vlan-id=134
add interface=ether9 name=VLAN-150 vlan-id=150
add interface=ether9 name=VLAN-151 vlan-id=151
add interface=ISP3 name=VLAN-2011-L1 vlan-id=2011
add interface=ISP3 name=VLAN-2012-L1 vlan-id=2012
add interface=ISP3 name=VLAN-2013-L1 vlan-id=2013
add interface=ISP3 name=VLAN-2014-L1 vlan-id=2014
add interface=ISP3 name=VLAN-2019-L3 vlan-id=2019
add interface=ISP3 name=VLAN-2020-L3 vlan-id=2020
add interface=ISP3 name=VLAN-2021-L3 vlan-id=2021
add interface=ISP3 name=VLAN-2022-L3 vlan-id=2022
/interface ethernet switch port
set 0 default-vlan-id=0
set 1 default-vlan-id=0
set 2 default-vlan-id=0
set 3 default-vlan-id=0
set 4 default-vlan-id=0
set 5 default-vlan-id=0
set 6 default-vlan-id=0
set 7 default-vlan-id=0
set 8 default-vlan-id=0
set 9 default-vlan-id=0
set 10 default-vlan-id=0
set 11 default-vlan-id=0
set 12 default-vlan-id=0
set 13 default-vlan-id=0
set 14 default-vlan-id=0
set 15 default-vlan-id=0
/interface list
add name=list1
add name=LAN_LIST
add name=OUT-NEWLAN
add name=WAN
add name=Mngmt_List
/interface lte apn
set [ find default=yes ] ip-type=ipv4-ipv6
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=enan-26-7-20 login-by=\
    http-chap,http-pap
add dns-name=e.net hotspot-address=10.33.0.1 html-directory=enan-26-10-21 \
    login-by=cookie,http-chap,http-pap,mac-cookie name=hsprof1 \
    split-user-domain=yes use-radius=yes
/ip hotspot
add addresses-per-mac=1 disabled=no idle-timeout=3m interface=IN-OUT \
    login-timeout=3m name=hotspot1 profile=hsprof1
/ip hotspot user profile
set [ find default=yes ] address-list=Authenticated_Users idle-timeout=2m \
    mac-cookie-timeout=2d on-login="\
    \ndo {\
    \n   # :log info (\"--- STAGE 1: Start processing user \" . \$user . \" --\
    -\");\
    \n    :local currentIp \"\$address\";\
    \n    :local currentUser \"\$user\";\
    \n    :local currentMac \$\"mac-address\";\
    \n    \
    \n#    :log info (\"STAGE 2: Anti-Spoofing & Clearing Old Sessions...\");\
    \n    :foreach i in=[/ip hotspot active find where user=\$currentUser addr\
    ess!=\$currentIp] do={\
    \n        /ip hotspot active remove \$i;\
    \n    }\
    \n    :foreach i in=[/ip hotspot active find where mac-address=\$currentMa\
    c address!=\$currentIp] do={\
    \n    #    /ip hotspot active remove \$i;\
    \n    }\
    \n\
    \n    # :log info (\"STAGE 3: Fetching & Parsing Login Parameters...\");\
    \n    :local test [/ip hotspot active get [find where address=\$currentIp]\
    \_domain];\
    \n    :local s \"|\";\
    \n    :local clean \$test;\
    \n    :if ([:pick \$test 0 1] = \"@\") do={ :set clean [:pick \$test 1 [:l\
    en \$test]]; }\
    \n\
    \n    # \D8\A7\D8\B3\D8\AA\D8\AE\D8\B1\D8\A7\D8\AC \D8\A7\D9\84\D8\B3\D8\
    \B1\D8\B9\D8\A9 \D8\A7\D9\84\D9\88\D9\87\D9\85\D9\8A\D8\A9 \D9\85\D9\86 \
    \D8\B5\D9\81\D8\AD\D8\A9 \D8\A7\D9\84\D8\AF\D8\AE\D9\88\D9\84 \D9\88\D8\A7\
    \D9\84\D8\A8\D8\A7\D8\B1\D8\A7\D9\85\D8\AA\D8\B1\D8\A7\D8\AA\
    \n    :local p1 [:find \$clean \$s];\
    \n    :local loginSpeed [:pick \$clean 0 \$p1];\
    \n    :local rest [:pick \$clean (\$p1 + 1) [:len \$clean]];\
    \n    \
    \n    :local params [:toarray \"\"]; :local lastPos 0;\
    \n    :for i from=0 to=([:len \$rest] - 1) do={\
    \n        :if ([:pick \$rest \$i (\$i + 1)] = \$s) do={\
    \n            :set params (\$params , [:pick \$rest \$lastPos \$i]);\
    \n            :set lastPos (\$i + 1);\
    \n        }\
    \n    }\
    \n    :set params (\$params , [:pick \$rest \$lastPos [:len \$rest]]);\
    \n    :local vpn (\$params->1); :local web (\$params->2); :local update (\
    \$params->3);\
    \n\
    \n   #  :log info (\"STAGE 4: Checking Usermanager Limits...\");\
    \n    :local dynQueue [/queue simple find target=(\$currentIp . \"/32\") d\
    ynamic=yes];\
    \n    \
    \n    :if ([:len \$dynQueue] > 0) do={\
    \n      #   :log info (\"Usermanager Limit Active. Applying visual fixes t\
    o Queue...\");\
    \n        \
    \n        /queue simple set \$dynQueue name=\$currentIp comment=(\"User: \
    \" . \$currentUser . \" (Usermanager)\");\
    \n\t\t# --- \D8\A7\D9\84\D8\AA\D8\B9\D8\AF\D9\8A\D9\84 \D8\A7\D9\84\D8\A3\
    \D9\88\D9\84: \D9\86\D9\82\D9\84 \D8\A7\D9\84\D9\83\D9\8A\D9\88 \D8\A7\D9\
    \84\D8\AF\D9\8A\D9\86\D8\A7\D9\85\D9\8A\D9\83\D9\8A \D9\84\D9\84\D9\85\D9\
    \88\D9\82\D8\B9 1 \D9\84\D9\8A\D8\AA\D8\B1\D9\83 \D8\A7\D9\84\D8\A7\D8\B3\
    \D8\AA\D8\B1\D8\A7\D8\AD\D8\A9 \D9\81\D9\8A 0 ---\
    \n        :local allQueues [/queue simple find];\
    \n       :if ([:len \$allQueues] > 1) do={\
    \n           /queue simple move \$dynQueue destination=[:pick \$allQueues \
    1];\
    \n         }\
    \n        \
    \n    } else={\
    \n     #    :log info (\"No Usermanager limit. Executing Standard Burst Lo\
    gic...\");\
    \n        \
    \n        :local slash [:find \$loginSpeed \"/\"];\
    \n        :local up [:pick \$loginSpeed 0 \$slash];\
    \n        :local down [:pick \$loginSpeed (\$slash + 1) [:len \$loginSpeed\
    ]];\
    \n\
    \n        :local bUp \"0\"; :local bDown \"0\"; :local bThreshUp \"0\"; :l\
    ocal bThreshDown \"0\";\
    \n        :if (\$loginSpeed = \"256K/256K\") do={ :set bUp \"512K\"; :set \
    bDown \"512K\"; :set bThreshUp \"128K\"; :set bThreshDown \"128K\"; }\
    \n        :if (\$loginSpeed = \"256K/512K\") do={ :set bUp \"512K\"; :set \
    bDown \"1M\"; :set bThreshUp \"128K\"; :set bThreshDown \"256K\"; }\
    \n        :if (\$loginSpeed = \"512K/1M\") do={ :set bUp \"1M\"; :set bDow\
    n \"2M\"; :set bThreshUp \"256K\"; :set bThreshDown \"512K\"; }\
    \n        :if (\$loginSpeed = \"1M/4M\") do={ :set bUp \"2M\"; :set bDown \
    \"6M\"; :set bThreshUp \"512K\"; :set bThreshDown \"2M\"; }\
    \n        :if (\$loginSpeed = \"1M/8M\") do={ :set bUp \"2M\"; :set bDown \
    \"10M\"; :set bThreshUp \"512K\"; :set bThreshDown \"4M\"; }\
    \n\
    \n        :local oldQueue [/queue simple find target=(\$currentIp . \"/32\
    \") dynamic=no];\
    \n        :if ([:len \$oldQueue] > 0) do={ /queue simple remove \$oldQueue\
    ; }\
    \n\
    \n        :local firstQ [/queue simple find];\
    \n        :if (\$bDown != \"0\") do={\
    \n            :if ([:len \$firstQ] > 1) do={\
    \n               # /queue simple add name=\$currentIp target=(\$currentIp \
    . \"/32\") max-limit=(\$up . \"/\" . \$down) burst-limit=(\$bUp . \"/\" . \
    \$bDown) burst-threshold=(\$bThreshUp . \"/\" . \$bThreshDown) burst-time=\
    \"2s/2s\" queue=\"default/default\" comment=(\"User: \" . \$currentUser . \
    \" | Speed \" . \$up . \"/\" . \$down) place-before=[:pick \$firstQ 1];\
    \n\t\t\t   /queue simple add name=\$currentIp target=(\$currentIp . \"/32\
    \") max-limit=(\$up . \"/\" . \$down) burst-limit=(\$bUp . \"/\" . \$bDown\
    ) burst-threshold=(\$bThreshUp . \"/\" . \$bThreshDown) burst-time=\"2s/2s\
    \" queue=\"default/default\" comment=(\"User: \" . \$currentUser . \" | Sp\
    eed \" . \$up . \"/\" . \$down);\
    \n            } else={\
    \n                /queue simple add name=\$currentIp target=(\$currentIp .\
    \_\"/32\") max-limit=(\$up . \"/\" . \$down) burst-limit=(\$bUp . \"/\" . \
    \$bDown) burst-threshold=(\$bThreshUp . \"/\" . \$bThreshDown) burst-time=\
    \"2s/2s\" queue=\"default/default\" comment=(\"User: \" . \$currentUser . \
    \" | Speed \" . \$up . \"/\" . \$down);\
    \n            }\
    \n        } else={\
    \n            :if ([:len \$firstQ] > 1) do={\
    \n               # /queue simple add name=\$currentIp target=(\$currentIp \
    . \"/32\") max-limit=(\$up . \"/\" . \$down) queue=\"default/default\" com\
    ment=(\"User: \" . \$currentUser . \" | Speed \" . \$up . \"/\" . \$down) \
    place-before=[:pick \$firstQ 1];\
    \n            /queue simple add name=\$currentIp target=(\$currentIp . \"/\
    32\") max-limit=(\$up . \"/\" . \$down) queue=\"default/default\" comment=\
    (\"User: \" . \$currentUser . \" | Speed \" . \$up . \"/\" . \$down);\
    \n\t\t   } else={\
    \n                /queue simple add name=\$currentIp target=(\$currentIp .\
    \_\"/32\") max-limit=(\$up . \"/\" . \$down) queue=\"default/default\" com\
    ment=(\"User: \" . \$currentUser . \" | Speed \" . \$up . \"/\" . \$down);\
    \n            }\
    \n        }\
    \n    }\
    \n\
    \n    # :log info (\"STAGE 5: Applying Shared Firewall Rules...\");\
    \n #   :local oldFw [/ip firewall address-list find address=\$currentIp];\
    \n  #  :if ([:len \$oldFw] > 0) do={ /ip firewall address-list remove \$ol\
    dFw; }\
    \n  :local oldFw [/ip firewall address-list find address=\$currentIp list!\
    =\"Telegram_Notified\"];\
    \n    :if ([:len \$oldFw] > 0) do={ /ip firewall address-list remove \$old\
    Fw; }\
    \n\
    \n\
    \n    :if (\$vpn ~ \"pm\") do={ /ip firewall address-list add list=\"VPN_U\
    sers\" address=\$currentIp timeout=1d; }\
    \n    :if (\$web != \"all\") do={ /ip firewall address-list add list=\$web\
    \_address=\$currentIp timeout=1d; }\
    \n    :if (\$update = \"*yes**\") do={ /ip firewall address-list add list=\
    \"Users_No_Update\" address=\$currentIp timeout=1d; } else={ /ip firewall \
    address-list add list=\"Allow_Updates\" address=\$currentIp timeout=1d; }\
    \n\
    \n   # :log info (\"--- SUCCESS: Script Processing Complete ---\");\
    \n\t# --- Telegram Notification Block ---\
    \n\t:delay 1s;\
    \n    :do {\
    \n        # \D8\A7\D9\84\D8\AA\D8\AD\D9\82\D9\82 \D9\85\D9\86 \D9\88\D8\AC\
    \D9\88\D8\AF \D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85 \D9\81\D9\8A\
    \_\D9\82\D8\A7\D8\A6\D9\85\D8\A9 \D8\A7\D9\84\D8\A5\D8\B4\D8\B9\D8\A7\D8\
    \B1\D8\A7\D8\AA \D8\B9\D8\A8\D8\B1 \D8\A7\D9\84\D9\80 comment\
    \n        :local notifiedUser [/ip firewall address-list find list=\"Teleg\
    ram_Notified\" comment=\$currentUser];\
    \n        \
    \n        :if ([:len \$notifiedUser] = 0) do={\
    \n            :local token \"8634408712:AAF1080yanmifxTYRkzedQN3gGm8ZXrEB1\
    s\";\
    \n            :local chatid \"7562205396\";\
    \n            :local uCount [/ip hotspot active print count-only];\
    \n            \
    \n            # \D8\A7\D9\84\D8\AA\D8\B9\D8\AF\D9\8A\D9\84 \D8\A7\D9\84\D8\
    \AC\D8\B0\D8\B1\D9\8A \D9\84\D8\AC\D9\84\D8\A8 \D8\A7\D8\B3\D9\85 \D8\A7\
    \D9\84\D8\A7\D9\86\D8\AA\D8\B1\D9\81\D9\8A\D8\B3 (\D8\A7\D9\84\D8\A8\D9\88\
    \D8\B1\D8\AA) \D8\A8\D8\B4\D9\83\D9\84 \D8\B5\D8\AD\D9\8A\D8\AD\
    \n          #  :local actualInterface [/ip hotspot active get [find where \
    address=\$currentIp] interface];\
    \n            \
    \n            :local iconPort \"%F0%9F%94%8C\";\
    \n            :local iconLogin \"%E2%9C%85\";\
    \n            :local iconUser \"%F0%9F%91%A4\";\
    \n            \
    \n            :local msg (\"\$iconLogin *New Login*%0A\$iconUser User: \" \
    . \$currentUser . \"%0A IP: \" . \$currentIp   . \"%0A Total: \" . \$uCoun\
    t);\
    \n            \
    \n            #/tool fetch url=\"https://api.telegram.org/bot\$token/sendM\
    essage\?chat_id=\$chatid&text=\$msg&parse_mode=Markdown\" keep-result=no c\
    heck-certificate=no;\
    \n            \
    \n            # \D8\A5\D8\B6\D8\A7\D9\81\D8\A9 \D8\A7\D9\84\D9\85\D8\B3\D8\
    \AA\D8\AE\D8\AF\D9\85 \D9\84\D9\84\D9\82\D8\A7\D8\A6\D9\85\D8\A9 \D8\A8\D8\
    \A7\D9\84\D8\A3\D9\8A \D8\A8\D9\8A \D8\A7\D9\84\D8\AD\D9\82\D9\8A\D9\82\D9\
    \8A \D9\84\D8\B6\D9\85\D8\A7\D9\86 \D8\B9\D8\AF\D9\85 \D8\A7\D9\84\D8\AA\
    \D8\B9\D8\A7\D8\B1\D8\B6\
    \n            /ip firewall address-list add list=\"Telegram_Notified\" add\
    ress=\$currentIp comment=\$currentUser;\
    \n        }\
    \n    } on-error={ :log warning \"Telegram Notification Failed\" };\
    \n    # ----------------------------------\
    \n\t\
    \n\t\
    \n} on-error={ \
    \n    :log error (\"CRITICAL ERROR: Script crashed. Check logs.\");\
    \n};\
    \n\
    \n\
    \ndo {\
    \n   # :log info (\"--- STAGE 1: Start processing user \" . \$user . \" --\
    -\");\
    \n    :local currentIp \"\$address\";\
    \n    :local currentUser \"\$user\";\
    \n    :local currentMac \$\"mac-address\";\
    \n    \
    \n#    :log info (\"STAGE 2: Anti-Spoofing & Clearing Old Sessions...\");\
    \n    :foreach i in=[/ip hotspot active find where user=\$currentUser addr\
    ess!=\$currentIp] do={\
    \n        /ip hotspot active remove \$i;\
    \n    }\
    \n    :foreach i in=[/ip hotspot active find where mac-address=\$currentMa\
    c address!=\$currentIp] do={\
    \n    #    /ip hotspot active remove \$i;\
    \n    }\
    \n\
    \n    # :log info (\"STAGE 3: Fetching & Parsing Login Parameters...\");\
    \n    :local test [/ip hotspot active get [find where address=\$currentIp]\
    \_domain];\
    \n    :local s \"|\";\
    \n    :local clean \$test;\
    \n    :if ([:pick \$test 0 1] = \"@\") do={ :set clean [:pick \$test 1 [:l\
    en \$test]]; }\
    \n\
    \n    # \D8\A7\D8\B3\D8\AA\D8\AE\D8\B1\D8\A7\D8\AC \D8\A7\D9\84\D8\B3\D8\
    \B1\D8\B9\D8\A9 \D8\A7\D9\84\D9\88\D9\87\D9\85\D9\8A\D8\A9 \D9\85\D9\86 \
    \D8\B5\D9\81\D8\AD\D8\A9 \D8\A7\D9\84\D8\AF\D8\AE\D9\88\D9\84 \D9\88\D8\A7\
    \D9\84\D8\A8\D8\A7\D8\B1\D8\A7\D9\85\D8\AA\D8\B1\D8\A7\D8\AA\
    \n    :local p1 [:find \$clean \$s];\
    \n    :local loginSpeed [:pick \$clean 0 \$p1];\
    \n    :local rest [:pick \$clean (\$p1 + 1) [:len \$clean]];\
    \n    \
    \n    :local params [:toarray \"\"]; :local lastPos 0;\
    \n    :for i from=0 to=([:len \$rest] - 1) do={\
    \n        :if ([:pick \$rest \$i (\$i + 1)] = \$s) do={\
    \n            :set params (\$params , [:pick \$rest \$lastPos \$i]);\
    \n            :set lastPos (\$i + 1);\
    \n        }\
    \n    }\
    \n    :set params (\$params , [:pick \$rest \$lastPos [:len \$rest]]);\
    \n    :local vpn (\$params->1); :local web (\$params->2); :local update (\
    \$params->3);\
    \n\
    \n   #  :log info (\"STAGE 4: Checking Usermanager Limits...\");\
    \n    :local dynQueue [/queue simple find target=(\$currentIp . \"/32\") d\
    ynamic=yes];\
    \n    \
    \n    :if ([:len \$dynQueue] > 0) do={\
    \n      #   :log info (\"Usermanager Limit Active. Applying visual fixes t\
    o Queue...\");\
    \n        \
    \n        /queue simple set \$dynQueue name=\$currentIp comment=(\"User: \
    \" . \$currentUser . \" (Usermanager)\");\
    \n\t\t# --- \D8\A7\D9\84\D8\AA\D8\B9\D8\AF\D9\8A\D9\84 \D8\A7\D9\84\D8\A3\
    \D9\88\D9\84: \D9\86\D9\82\D9\84 \D8\A7\D9\84\D9\83\D9\8A\D9\88 \D8\A7\D9\
    \84\D8\AF\D9\8A\D9\86\D8\A7\D9\85\D9\8A\D9\83\D9\8A \D9\84\D9\84\D9\85\D9\
    \88\D9\82\D8\B9 1 \D9\84\D9\8A\D8\AA\D8\B1\D9\83 \D8\A7\D9\84\D8\A7\D8\B3\
    \D8\AA\D8\B1\D8\A7\D8\AD\D8\A9 \D9\81\D9\8A 0 ---\
    \n        :local allQueues [/queue simple find];\
    \n       :if ([:len \$allQueues] > 1) do={\
    \n           /queue simple move \$dynQueue destination=[:pick \$allQueues \
    1];\
    \n         }\
    \n        \
    \n    } else={\
    \n     #    :log info (\"No Usermanager limit. Executing Standard Burst Lo\
    gic...\");\
    \n        \
    \n        :local slash [:find \$loginSpeed \"/\"];\
    \n        :local up [:pick \$loginSpeed 0 \$slash];\
    \n        :local down [:pick \$loginSpeed (\$slash + 1) [:len \$loginSpeed\
    ]];\
    \n\
    \n        :local bUp \"0\"; :local bDown \"0\"; :local bThreshUp \"0\"; :l\
    ocal bThreshDown \"0\";\
    \n        :if (\$loginSpeed = \"256K/256K\") do={ :set bUp \"512K\"; :set \
    bDown \"512K\"; :set bThreshUp \"128K\"; :set bThreshDown \"128K\"; }\
    \n        :if (\$loginSpeed = \"256K/512K\") do={ :set bUp \"512K\"; :set \
    bDown \"1M\"; :set bThreshUp \"128K\"; :set bThreshDown \"256K\"; }\
    \n        :if (\$loginSpeed = \"512K/768K\") do={ :set bUp \"512K\"; :set \
    bDown \"1M\"; :set bThreshUp \"256K\"; :set bThreshDown \"512K\"; }\
    \n        :if (\$loginSpeed = \"512K/1M\") do={ :set bUp \"1M\"; :set bDow\
    n \"2M\"; :set bThreshUp \"256K\"; :set bThreshDown \"512K\"; }\
    \n        :if (\$loginSpeed = \"1M/4M\") do={ :set bUp \"2M\"; :set bDown \
    \"6M\"; :set bThreshUp \"512K\"; :set bThreshDown \"2M\"; }\
    \n        :if (\$loginSpeed = \"1M/8M\") do={ :set bUp \"2M\"; :set bDown \
    \"10M\"; :set bThreshUp \"512K\"; :set bThreshDown \"4M\"; }\
    \n\
    \n        :local oldQueue [/queue simple find target=(\$currentIp . \"/32\
    \") dynamic=no];\
    \n        :if ([:len \$oldQueue] > 0) do={ /queue simple remove \$oldQueue\
    ; }\
    \n\
    \n        :local firstQ [/queue simple find];\
    \n        :if (\$bDown != \"0\") do={\
    \n            :if ([:len \$firstQ] > 1) do={\
    \n               # /queue simple add name=\$currentIp target=(\$currentIp \
    . \"/32\") max-limit=(\$up . \"/\" . \$down) burst-limit=(\$bUp . \"/\" . \
    \$bDown) burst-threshold=(\$bThreshUp . \"/\" . \$bThreshDown) burst-time=\
    \"2s/2s\" queue=\"default/default\" comment=(\"User: \" . \$currentUser . \
    \" | Speed \" . \$up . \"/\" . \$down) place-before=[:pick \$firstQ 1];\
    \n\t\t\t   /queue simple add name=\$currentIp target=(\$currentIp . \"/32\
    \") max-limit=(\$up . \"/\" . \$down) burst-limit=(\$bUp . \"/\" . \$bDown\
    ) burst-threshold=(\$bThreshUp . \"/\" . \$bThreshDown) burst-time=\"2s/2s\
    \" queue=\"default/default\" comment=(\"User: \" . \$currentUser . \" | Sp\
    eed \" . \$up . \"/\" . \$down);\
    \n            } else={\
    \n                /queue simple add name=\$currentIp target=(\$currentIp .\
    \_\"/32\") max-limit=(\$up . \"/\" . \$down) burst-limit=(\$bUp . \"/\" . \
    \$bDown) burst-threshold=(\$bThreshUp . \"/\" . \$bThreshDown) burst-time=\
    \"2s/2s\" queue=\"default/default\" comment=(\"User: \" . \$currentUser . \
    \" | Speed \" . \$up . \"/\" . \$down);\
    \n            }\
    \n        } else={\
    \n            :if ([:len \$firstQ] > 1) do={\
    \n               # /queue simple add name=\$currentIp target=(\$currentIp \
    . \"/32\") max-limit=(\$up . \"/\" . \$down) queue=\"default/default\" com\
    ment=(\"User: \" . \$currentUser . \" | Speed \" . \$up . \"/\" . \$down) \
    place-before=[:pick \$firstQ 1];\
    \n            /queue simple add name=\$currentIp target=(\$currentIp . \"/\
    32\") max-limit=(\$up . \"/\" . \$down) queue=\"default/default\" comment=\
    (\"User: \" . \$currentUser . \" | Speed \" . \$up . \"/\" . \$down);\
    \n\t\t   } else={\
    \n                /queue simple add name=\$currentIp target=(\$currentIp .\
    \_\"/32\") max-limit=(\$up . \"/\" . \$down) queue=\"default/default\" com\
    ment=(\"User: \" . \$currentUser . \" | Speed \" . \$up . \"/\" . \$down);\
    \n            }\
    \n        }\
    \n    }\
    \n\
    \n    # :log info (\"STAGE 5: Applying Shared Firewall Rules...\");\
    \n    :local oldFw [/ip firewall address-list find address=\$currentIp];\
    \n    :if ([:len \$oldFw] > 0) do={ /ip firewall address-list remove \$old\
    Fw; }\
    \n\
    \n    :if (\$vpn ~ \"pm\") do={ /ip firewall address-list add list=\"VPN_U\
    sers\" address=\$currentIp timeout=1d; }\
    \n    :if (\$web != \"all\") do={ /ip firewall address-list add list=\$web\
    \_address=\$currentIp timeout=1d; }\
    \n    :if (\$update = \"*yes**\") do={ /ip firewall address-list add list=\
    \"Users_No_Update\" address=\$currentIp timeout=1d; } else={ /ip firewall \
    address-list add list=\"Allow_Updates\" address=\$currentIp timeout=1d; }\
    \n\
    \n   # :log info (\"--- SUCCESS: Script Processing Complete ---\");\
    \n\t# --- Telegram Notification Block ---\
    \n\t:delay 1s\
    \n    :do {\
    \n        :local token \"8634408712:AAF1080yanmifxTYRkzedQN3gGm8ZXrEB1s\";\
    \n        :local chatid \"7562205396\";\
    \n        :local uCount [/ip hotspot active print count-only];\
    \n        :local interface \"\$interface\"; # ,D( '3E EFA0 'D(1J/, #H 'DH'\
    ,G)\
    \n\
    \n     \
    \n     \
    \n        :local iconPort \"%F0%9F%94%8C\"; # #JBHF) 'DB'(3 DDEFA0\
    \n        \
    \n\
    \n\t\t   \
    \n        # \D8\B1\D9\85\D9\88\D8\B2 \D9\85\D8\B4\D9\81\D8\B1\D8\A9 \D9\85\
    \D8\AE\D8\AA\D8\B5\D8\B1\D8\A9 (\E2\9C\85 \D9\88 \F0\9F\91\A4)\
    \n        :local iconLogin \"%E2%9C%85\";\
    \n        :local iconUser \"%F0%9F%91%A4\";\
    \n        \
    \n        :local msg (\"\$iconLogin *New Login*%0A\$iconUser User: \" . \$\
    currentUser . \"%0A IP: \" . \$currentIp   . \"%0A\$iconPort Port: \" . \$\
    interface . \"%0A Total: \" . \$uCount);\
    \n        \
    \n        #/tool fetch url=\"https://api.telegram.org/bot\$token/sendMessa\
    ge\?chat_id=\$chatid&text=\$msg&parse_mode=Markdown\" keep-result=no check\
    -certificate=no;\
    \n        \
    \n    } on-error={ :log warning \"Telegram Notification Failed\" };\
    \n    # ----------------------------------\
    \n\t\
    \n\t\
    \n} on-error={ \
    \n    :log error (\"CRITICAL ERROR: Script crashed. Check logs.\");\
    \n};\
    \n\
    \n" on-logout="{\
    \n    :local ip \"\$address\";\
    \n    :local user \"\$user\";\
    \n    :local interface \"\$interface\"; # ,D( '3E EFA0 'D(1J/, #H 'DH',G)\
    \n    \
    \n    /queue simple remove [find where target=\"\$ip/32\"];\
    \n    #/ip firewall address-list remove numbers=[find where address=\"\$ip\
    \"];\
    \n :local oldFw [/ip firewall address-list find address=\$ip list!=\"Teleg\
    ram_Notified\"];\
    \n    :if ([:len \$oldFw] > 0) do={ /ip firewall address-list remove \$old\
    Fw; }\
    \n    \
    \n    :log warning \"User \$user logged out from \$interface - Queue for I\
    P \$ip has been deleted\";\
    \n\t\
    \n    :local token \"8634408712:AAF1080yanmifxTYRkzedQN3gGm8ZXrEB1s\";\
    \n    :local chatid \"7562205396\";\
    \n    :local uCount [/ip hotspot active print count-only];\
    \n        \
    \n    # #JBHF'* 'D%49'1\
    \n    :local iconLogin \"%E2%9A%A0\";\
    \n    :local iconUser \"%F0%9F%91%A4\";\
    \n    :local iconPort \"%F0%9F%94%8C\"; # #JBHF) 'DB'(3 DDEFA0\
    \n        \
    \n    :local msg (\"---------------%0A\$iconLogin%0A*New%20Logout*%0A\$ico\
    nUser%20User:%20\" . \$user . \"%0A%20IP:%20\" . \$ip . \"%0A\$iconPort%20\
    Port:%20\" . \$interface . \"%0ATotal:%20\" . \$uCount);\
    \n        \
    \n    /tool fetch url=\"https://api.telegram.org/bot\$token/sendMessage\?c\
    hat_id=\$chatid&text=\$msg&parse_mode=Markdown\" keep-result=no check-cert\
    ificate=no;\
    \n}\
    \n" shared-users=2
add idle-timeout=2m mac-cookie-timeout=1d name=F30 on-login="do {\
    \n    :log info (\"--- STAGE 1: Start processing user \" . \$user . \" wit\
    h IP: \" . \$address . \" ---\");\
    \n    :local currentIp \"\$address\";\
    \n    :local currentUser \"\$user\";\
    \n    :local currentMac \$\"mac-address\";\
    \n    \
    \n    :log info (\"STAGE 2: Checking for old sessions and MAC conflicts...\
    \");\
    \n    :foreach i in=[/ip hotspot active find where user=\$currentUser] do=\
    {\
    \n        :local activeIp [/ip hotspot active get \$i address];\
    \n        :if (\$activeIp != \$currentIp) do={\
    \n            /ip hotspot active remove \$i;\
    \n            :log info (\"Hotspot: Removed old session for user \" . \$cu\
    rrentUser . \" with IP \" . \$activeIp);\
    \n        }\
    \n    }\
    \n    :foreach i in=[/ip hotspot active find where mac-address=\$currentMa\
    c address!=\$currentIp] do={\
    \n        :local conflictUser [/ip hotspot active get \$i user];\
    \n      #  /ip hotspot active remove \$i;\
    \n        :log warning (\"Hotspot Anti-Spoof: Kicked user \" . \$conflictU\
    ser . \" for using cloned MAC: \" . \$currentMac);\
    \n    }\
    \n\
    \n    :log info (\"STAGE 3: Fetching Domain...\");\
    \n    :local test [/ip hotspot active get [find where address=\$currentIp]\
    \_domain];\
    \n\
    \n    :if (\$test ~ \"|\") do={\
    \n        :log info (\"STAGE 4: Parsing Domain string...\");\
    \n        :local s \"|\";\
    \n        :local clean \$test;\
    \n        if ([:pick \$test 0 1] = \"@\") do={ :set clean [:pick \$test 1 \
    [:len \$test]]; }\
    \n\
    \n        :local p1 [:find \$clean \$s];\
    \n        :local S [:pick \$clean 0 \$p1];\
    \n        :log info (\"Extracted Speed: \" . \$S);\
    \n\
    \n        :local slash [:find \$S \"/\"];\
    \n        :local up [:pick \$S 0 \$slash];\
    \n        :local down [:pick \$S (\$slash + 1) [:len \$S]];\
    \n\
    \n        :log info (\"STAGE 5: Activating Burst Logic (Time: 2s)...\");\
    \n        :local bUp \"0\"; :local bDown \"0\"; :local bThreshUp \"0\"; :l\
    ocal bThreshDown \"0\";\
    \n        \
    \n        :if (\$S = \"256K/256K\") do={ :set bUp \"512K\"; :set bDown \"5\
    12K\"; :set bThreshUp \"128K\"; :set bThreshDown \"128K\"; }\
    \n        :if (\$S = \"256K/512K\") do={ :set bUp \"512K\"; :set bDown \"1\
    M\"; :set bThreshUp \"128K\"; :set bThreshDown \"256K\"; }\
    \n        :if (\$S = \"512K/1M\") do={ :set bUp \"1M\"; :set bDown \"2M\";\
    \_:set bThreshUp \"256K\"; :set bThreshDown \"512K\"; }\
    \n        :if (\$S = \"1M/4M\") do={ :set bUp \"2M\"; :set bDown \"6M\"; :\
    set bThreshUp \"512K\"; :set bThreshDown \"2M\"; }\
    \n        :if (\$S = \"1M/8M\") do={ :set bUp \"2M\"; :set bDown \"10M\"; \
    :set bThreshUp \"512K\"; :set bThreshDown \"4M\"; }\
    \n\
    \n        :log info (\"STAGE 6: Removing old queues safely...\");\
    \n        :local oldQueue [/queue simple find target=(\$currentIp . \"/32\
    \")];\
    \n        :if ([:len \$oldQueue] > 0) do={ /queue simple remove \$oldQueue\
    ; }\
    \n\
    \n        :log info (\"STAGE 7: Adding new queue with 2s Burst...\");\
    \n        :local firstQ [/queue simple find];\
    \n        \
    \n        # \D8\A7\D8\B3\D8\AA\D8\AE\D8\AF\D8\A7\D9\85 burst-time=\"2s/2s\
    \" \D8\A8\D9\86\D8\A7\D8\A1\D9\8B \D8\B9\D9\84\D9\89 \D8\B7\D9\84\D8\A8\D9\
    \83\
    \n        :if (\$bDown != \"0\") do={\
    \n            :if ([:len \$firstQ] > 0) do={\
    \n                /queue simple add name=\$currentIp target=(\$currentIp .\
    \_\"/32\") max-limit=(\$up . \"/\" . \$down) \\\
    \n                burst-limit=(\$bUp . \"/\" . \$bDown) burst-threshold=(\
    \$bThreshUp . \"/\" . \$bThreshDown) burst-time=\"2s/2s\" \\\
    \n                queue=\"default/default\" comment=(\"User: \" . \$curren\
    tUser . \" | Speed: \" . \$up . \"/\" . \$down) place-before=[:pick \$firs\
    tQ 0];\
    \n            } else={\
    \n                /queue simple add name=\$currentIp target=(\$currentIp .\
    \_\"/32\") max-limit=(\$up . \"/\" . \$down) \\\
    \n                burst-limit=(\$bUp . \"/\" . \$bDown) burst-threshold=(\
    \$bThreshUp . \"/\" . \$bThreshDown) burst-time=\"2s/2s\" \\\
    \n                queue=\"default/default\" comment=(\"User: \" . \$curren\
    tUser . \" | Speed: \" . \$up . \"/\" . \$down);\
    \n            }\
    \n        } else={\
    \n            :if ([:len \$firstQ] > 0) do={\
    \n                /queue simple add name=\$currentIp target=(\$currentIp .\
    \_\"/32\") max-limit=(\$up . \"/\" . \$down) \\\
    \n                queue=\"default/default\" comment=(\"User: \" . \$curren\
    tUser . \" | Speed: \" . \$up . \"/\" . \$down) place-before=[:pick \$firs\
    tQ 0];\
    \n            } else={\
    \n                /queue simple add name=\$currentIp target=(\$currentIp .\
    \_\"/32\") max-limit=(\$up . \"/\" . \$down) \\\
    \n                queue=\"default/default\" comment=(\"User: \" . \$curren\
    tUser . \" | Speed: \" . \$up . \"/\" . \$down);\
    \n            }\
    \n        }\
    \n\
    \n        :log info (\"STAGE 8: Extracting remaining parameters...\");\
    \n        :local rest [:pick \$clean (\$p1 + 1) [:len \$clean]];\
    \n        :local params [:toarray \"\"]; :local lastPos 0;\
    \n        :for i from=0 to=([:len \$rest] - 1) do={\
    \n            :if ([:pick \$rest \$i (\$i + 1)] = \$s) do={\
    \n                :set params (\$params , [:pick \$rest \$lastPos \$i]);\
    \n                :set lastPos (\$i + 1);\
    \n            }\
    \n        }\
    \n        :set params (\$params , [:pick \$rest \$lastPos [:len \$rest]]);\
    \n        :local vpn (\$params->1); :local web (\$params->2); :local updat\
    e (\$params->3);\
    \n\
    \n        :log info (\"STAGE 9: Applying Firewall Rules...\");\
    \n        :local oldFw [/ip firewall address-list find address=\$currentIp\
    ];\
    \n        :if ([:len \$oldFw] > 0) do={ /ip firewall address-list remove \
    \$oldFw; }\
    \n\
    \n        :if (\$vpn ~ \"pm\") do={ /ip firewall address-list add list=\"V\
    PN_Users\" address=\$currentIp timeout=1d; }\
    \n        :if (\$web != \"all\") do={ /ip firewall address-list add list=\
    \$web address=\$currentIp timeout=1d; }\
    \n        :if (\$update = \"*yes**\") do={ /ip firewall address-list add l\
    ist=\"Users_No_Update\" address=\$currentIp timeout=1d; } else={ /ip firew\
    all address-list add list=\"Allow_Updates\" address=\$currentIp timeout=1d\
    ; }\
    \n\
    \n        :log info (\"--- SUCCESS: Script with 2s Burst completed for \" \
    . \$currentUser . \" ---\");\
    \n    }\
    \n} on-error={ \
    \n    :log error (\"CRITICAL ERROR: Script crashed. Check last STAGE log.\
    \");\
    \n};" shared-users=2
add idle-timeout=2m mac-cookie-timeout=2d name=antina on-login=":do {\r\
    \n:local a \$address;\r\
    \n:local u \$user;\r\
    \n:local mac \$\"mac-address\";\r\
    \n:local ip \"\$address\";\r\
    \n:local uu \"\$user\";\r\
    \n:local uname \$user;\r\
    \n:local ad \$address;\r\
    \n\r\
    \nip hotspot active remove [find user=\$uname && address!=\$ad];\r\
    \n:local test [/ip hotspot active get [find where address =\"\$ip\"] domai\
    n ];\r\
    \nif (\$test~\"[|]\") do={\r\
    \n:local s \"|\" ;\r\
    \n:local S [:pick \$test (                                                \
    -1    + 1)                                 [:find \$test \$s -1]   ];\r\
    \n:local sh [:pick \$test (                                [:find \$test \
    \$s -1]   + 1)                 [:find \$test \$s [:find \$test \$s -1]]  ]\
    ;\r\
    \n:local vpn [:pick \$test (                [:find \$test \$s [:find \$tes\
    t \$s -1]]  + 1) [:find \$test \$s [:find \$test \$s [:find \$test \$s -1]\
    ]] ];\r\
    \n:local web [:pick \$test ([:find \$test \$s [:find \$test \$s [:find \$t\
    est \$s -1]]]  + 1) [:find \$test \$s [:find \$test \$s [:find \$test \$s \
    [:find \$test \$s -1]]]] ];\r\
    \n:local update [:pick \$test ([:find \$test \$s [:find \$test \$s [:find \
    \$test \$s [:find \$test \$s -1]]]]  + 1) [:find \$test \$s [:find \$test \
    \$s [:find \$test \$s [:find \$test \$s [:find \$test \$s -1]]]]] ];\r\
    \n:local maac [:pick \$test ([:find \$test \$s [:find \$test \$s [:find \$\
    test \$s [:find \$test \$s [:find \$test \$s -1]]]]]  + 1)    [:len  \$tes\
    t ]   ];\r\
    \n/ip firewall address-list remove numbers=[find where address=\"\$ip\"];\
    \r\
    \n\r\
    \n\r\
    \n\r\
    \n\r\
    \n\r\
    \n\r\
    \n\r\
    \n:local originalRate \$S;\r\
    \n:local upload [:pick \$originalRate 0 [:find \$originalRate \"/\"]]\r\
    \n:local speed [:pick \$originalRate ([:find \$originalRate \"/\"] + 1) [:\
    len \$originalRate]]\r\
    \n\r\
    \n\r\
    \n/queue simple remove [find where target=\"\$ip/32\"];\r\
    \n/queue simple add limit-at=\"\$upload/\$speed\" max-limit=\"\$upload/\$s\
    peed\" name=\"\$ip\" target=\"\$ip\" place-before=\"SPEED\" comment=\"hamz\
    a\";\r\
    \n\r\
    \nif (\$web!=\"all\") do={\r\
    \n/ip firewall address-list add list=\"\$web\" address=\"\$ip\";\r\
    \n};\r\
    \nif (\$vpn=\"pu\") do={\r\
    \n/ip firewall address-list add list=\"\$vpn\" address=\"\$ip\";\r\
    \n};\r\
    \nif (\$update=\"*yes**\") do={\r\
    \n/ip firewall address-list add list=\"\$update\" address=\"\$ip\";\r\
    \n};\r\
    \n};\r\
    \n}\r\
    \n\r\
    \n" shared-users=2
/ip ipsec profile
add enc-algorithm=aes-256,3des hash-algorithm=sha256 name=proton-profile
/ip kid-control
add fri=0s-1d mon=0s-1d name=system-dummy sat=0s-1d sun=0s-1d thu=0s-1d tue=\
    0s-1d tur-fri=0s-1d tur-mon=0s-1d tur-sat=0s-1d tur-sun=0s-1d tur-thu=\
    0s-1d tur-tue=0s-1d tur-wed=0s-1d wed=0s-1d
/ip pool
add name=dhcp_pool0 ranges=10.33.0.3-10.33.255.254
add name=pool-android5 ranges=10.5.32.2-10.5.35.254
add name=pool-android6 ranges=10.6.32.2-10.6.35.254
add name=pool-android7 ranges=10.7.32.2-10.7.35.254
add name=pool-android8 ranges=10.8.32.2-10.8.35.254
add name=pool-android9 ranges=10.9.32.2-10.9.35.254
add name=pool-android10 ranges=10.100.32.2-10.100.35.254
add name=pool-android11 ranges=10.11.32.2-10.11.35.254
add name=pool-android12 ranges=10.12.32.2-10.12.35.254
add name=pool-android13 ranges=10.13.32.2-10.13.35.254
add name=pool-android14 ranges=10.14.32.2-10.14.35.254
add name=pool-android15 ranges=10.15.32.2-10.15.35.254
add name=pool-android16 ranges=10.16.32.2-10.16.35.254
add name=pool-HUAWEI-ALL ranges=10.60.32.2-10.60.35.254
add name=vpn ranges=192.168.89.2-192.168.89.255
add name=dhcp_pool1 ranges=10.32.0.3-10.32.255.254
/ip dhcp-server
add add-arp=yes address-pool=dhcp_pool0 bootp-lease-time=lease-time \
    bootp-support=dynamic disabled=no interface=IN-OUT lease-time=4h name=\
    server
/ppp profile
set *0 on-up="{\r\
    \n:local localAddress \$\"local-address\";\r\
    \n:local interfaceName \$interface;\r\
    \n:if ([:pick \"\$localAddress\" 0 3] = \"10.\") do={\r\
    \n/interface pppoe-client enable \$interfaceName;\r\
    \n} else={\r\
    \n#:global Replace;\r\
    \n:set interfaceName [/interface pppoe-client get \$interfaceName name];\r\
    \n#/ip firewall nat set to-address=\$localAddress [f comment=(\"alna7ari-l\
    oadbalance-\".\$interfaceName)];\r\
    \n:local ruleLen [:len [/ip route rule find where comment=\$interfaceName]\
    ];\r\
    \n:if (\$ruleLen > 0) do={/ip route rule set src-address=\$localAddress [f\
    ind comment=\$interfaceName];} else={/ip route rule add action=lookup-only\
    -in-table src-address=\$localAddress comment=\$interfaceName table=[/ip ro\
    ute get ([find gateway=\$interfaceName && routing-mark!=main && distance=1\
    \_&& !disabled]->0) routing-mark ] ;};\r\
    \n:delay 100ms;\r\
    \n/interface l2tp-client set src-address=\$localAddress [f comment=\$inter\
    faceName];\r\
    \n};\r\
    \n}"
add name=ppp1 on-up=":local in \r\
    \n:set in pppoe-out1\r\
    \n:if (([:pick \$\"local-address\" 0 3]  = \"10.\") || ([:pick \$\"local-a\
    ddress\" 0 3] = \"134\") || ([:pick \$\"local-address\" 0 3] = \"5.2\") ||\
    \_([:pick \$\"local-address\" 0 3] = \"109\")) do={\r\
    \n/interface pppoe-client disable \$interface;\r\
    \n:delay 2s;\r\
    \n/interface pppoe-client enable \$interface;\r\
    \n:log warning    \"  local-address and changed to a public address \$\"lo\
    cal-address\"  \";\r\
    \n}"
add name=ppp2 on-up=":local in \r\
    \n:set in pppoe-out2\r\
    \n:if (([:pick \$\"local-address\" 0 3]  = \"10.\") || ([:pick \$\"local-a\
    ddress\" 0 3] = \"134\") || ([:pick \$\"local-address\" 0 3] = \"5.2\") ||\
    \_([:pick \$\"local-address\" 0 3] = \"109\")) do={\r\
    \n/interface pppoe-client disable \$interface;\r\
    \n:delay 2s;\r\
    \n/interface pppoe-client enable \$interface;\r\
    \n:log warning    \"  local-address and changed to a public address \$\"lo\
    cal-address\"  \";\r\
    \n}"
add name=ppp3 on-up=":local in \r\
    \n:set in pppoe-out3\r\
    \n:if (([:pick \$\"local-address\" 0 3]  = \"10.\") || ([:pick \$\"local-a\
    ddress\" 0 3] = \"134\") || ([:pick \$\"local-address\" 0 3] = \"5.2\") ||\
    \_([:pick \$\"local-address\" 0 3] = \"109\")) do={\r\
    \n/interface pppoe-client disable \$interface;\r\
    \n:delay 2s;\r\
    \n/interface pppoe-client enable \$interface;\r\
    \n:log warning    \"  local-address and changed to a public address \$\"lo\
    cal-address\"  \";\r\
    \n}"
add name=ppp4 on-up=":local in \r\
    \n:set in pppoe-out4\r\
    \n:if (([:pick \$\"local-address\" 0 3]  = \"10.\") || ([:pick \$\"local-a\
    ddress\" 0 3] = \"134\") || ([:pick \$\"local-address\" 0 3] = \"5.2\") ||\
    \_([:pick \$\"local-address\" 0 3] = \"109\")) do={\r\
    \n/interface pppoe-client disable \$interface;\r\
    \n:delay 2s;\r\
    \n/interface pppoe-client enable \$interface;\r\
    \n:log warning    \"  local-address and changed to a public address \$\"lo\
    cal-address\"  \";\r\
    \n}"
set *FFFFFFFE local-address=192.168.89.1 on-down="{\
    \n:local interfaceName \$interface;\
    \n:local srcAddress [/interface l2tp-client get \$interfaceName src-addres\
    s];\
    \n:if ([:len \$srcAddress] > 6 && \$\"local-address\" != 0.0.0.0) do={/ip \
    firewall connection remove [find where src-address~\"\$srcAddress\"];};\
    \n}" remote-address=vpn use-compression=no
/interface sstp-client
add authentication=mschap2 connect-to=136.119.127.113 disabled=no max-mtu=\
    1400 name=GCP-Tunnel profile=default-encryption user=salah@VPN \
    verify-server-address-from-certificate=no
/queue type
set 5 pcq-limit=20KiB pcq-rate=1M pcq-total-limit=1000KiB
set 6 pcq-limit=20KiB pcq-rate=1M pcq-total-limit=1000KiB
/queue simple
add burst-limit=2M/10M burst-threshold=512k/4M burst-time=2s/2s comment=\
    "User: 5016246365 | Speed 1M/8M" max-limit=1M/8M name=10.100.35.229 \
    queue=default/default target=10.100.35.229/32
add burst-limit=1M/2M burst-threshold=256k/512k burst-time=2s/2s comment=\
    "User: 3070741726 | Speed 512K/1M" max-limit=512k/1M name=10.14.32.190 \
    queue=default/default target=10.14.32.190/32
add burst-limit=1M/2M burst-threshold=256k/512k burst-time=2s/2s comment=\
    "User: 29718257297995 | Speed 512K/1M" max-limit=512k/1M name=\
    10.100.35.235 queue=default/default target=10.100.35.235/32
add burst-limit=1M/2M burst-threshold=256k/512k burst-time=2s/2s comment=\
    "User: 29437715505547 | Speed 512K/1M" max-limit=512k/1M name=10.13.32.78 \
    queue=default/default target=10.13.32.78/32
add burst-limit=1M/2M burst-threshold=256k/512k burst-time=2s/2s comment=\
    "User: 644523 | Speed 512K/1M" max-limit=512k/1M name=10.11.32.7 queue=\
    default/default target=10.11.32.7/32
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/tool user-manager profile
add name=100-rial name-for-users=100-rial override-shared-users=1 owner=admin \
    price=100 starts-at=logon validity=4d
add name=200-rial name-for-users=200-rial override-shared-users=1 owner=admin \
    price=200 starts-at=logon validity=4d
add name=300-rial name-for-users=300-rial override-shared-users=1 owner=admin \
    price=300 starts-at=logon validity=5d
add name=250-rial name-for-users=250-rial override-shared-users=1 owner=admin \
    price=250 starts-at=logon validity=2d
add name=500-rial name-for-users=500-rial override-shared-users=1 owner=admin \
    price=500 starts-at=logon validity=1w
add name=1000rial name-for-users=1000rial override-shared-users=2 owner=admin \
    price=1000 starts-at=logon validity=2w1d
add name=2000rial name-for-users=2000rial override-shared-users=1 owner=admin \
    price=2000 starts-at=logon validity=4w2d
add name=2500rial name-for-users=2500rial override-shared-users=1 owner=admin \
    price=2500 starts-at=logon validity=4w2d
add name=3000rial name-for-users=3000rial override-shared-users=1 owner=admin \
    price=3000 starts-at=logon validity=4w2d
add name=5000rial name-for-users=5000rial override-shared-users=2 owner=admin \
    price=5000 starts-at=logon validity=4w2d
add name=temp name-for-users=temp override-shared-users=1 owner=admin price=0 \
    starts-at=logon validity=1d
add name=monthly name-for-users=monthly override-shared-users=1 owner=admin \
    price=1500 starts-at=logon validity=4w2d
add name=unlimited name-for-users=unlimited override-shared-users=2 owner=\
    admin price=0 starts-at=logon validity=521w3d
add name=limity-6 name-for-users="" override-shared-users=1 owner=admin \
    price=2000 starts-at=logon validity=0s
add name=limited name-for-users="" override-shared-users=1 owner=admin price=\
    0 starts-at=logon validity=0s
add name=500-512 name-for-users="" override-shared-users=off owner=admin \
    price=0 starts-at=logon validity=0s
/tool user-manager profile limitation
add address-list="" download-limit=0B group-name=default ip-pool="" ip-pool6=\
    "" name=100rial owner=admin transfer-limit=367001600B upload-limit=0B \
    uptime-limit=10h
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=200rial owner=admin transfer-limit=734003200B upload-limit=0B \
    uptime-limit=1d6h
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=250rial owner=admin transfer-limit=786432000B upload-limit=0B \
    uptime-limit=1d16h
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=300rial owner=admin transfer-limit=1205862400B upload-limit=0B \
    uptime-limit=2d2h
add address-list="" download-limit=0B group-name=default ip-pool="" ip-pool6=\
    "" name=500rial owner=admin transfer-limit=1572864000B upload-limit=0B \
    uptime-limit=2d22h
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=1000RIAL owner=admin transfer-limit=3221225472B upload-limit=0B \
    uptime-limit=0s
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=2000RIAL owner=admin transfer-limit=6442450944B upload-limit=0B \
    uptime-limit=0s
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=2500RIAL owner=admin transfer-limit=8589934592B upload-limit=0B \
    uptime-limit=0s
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=3000RIAL owner=admin transfer-limit=10737418240B upload-limit=0B \
    uptime-limit=0s
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=5000RIAL owner=admin transfer-limit=19327352832B upload-limit=0B \
    uptime-limit=0s
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=100_yr owner=admin transfer-limit=367001600B upload-limit=0B \
    uptime-limit=2d
add address-list="" download-limit=0B group-name=default ip-pool="" ip-pool6=\
    "" name=200_yr owner=admin transfer-limit=734003200B upload-limit=0B \
    uptime-limit=4d
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=500_yr owner=admin transfer-limit=1782579200B upload-limit=0B \
    uptime-limit=6d
add address-list="" download-limit=0B group-name=default ip-pool="" ip-pool6=\
    "" name=1000rial owner=admin transfer-limit=3221225472B upload-limit=0B \
    uptime-limit=2w1d
add address-list="" download-limit=0B group-name=default ip-pool="" ip-pool6=\
    "" name=2000rial owner=admin transfer-limit=6442450944B upload-limit=0B \
    uptime-limit=4w2d
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=2500rial owner=admin transfer-limit=8053063680B upload-limit=0B \
    uptime-limit=4w2d
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=3000rial owner=admin transfer-limit=9663676416B upload-limit=0B \
    uptime-limit=4w2d
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=5000rial owner=admin transfer-limit=19327352832B upload-limit=0B \
    uptime-limit=4w2d
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=300_yr owner=admin transfer-limit=1205862400B upload-limit=0B \
    uptime-limit=6d
add address-list="" download-limit=0B group-name=default ip-pool="" ip-pool6=\
    "" name=11 owner=admin transfer-limit=367001600B upload-limit=0B \
    uptime-limit=3h
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=temp owner=admin rate-limit-min-rx=1048576B rate-limit-min-tx=\
    262144B rate-limit-rx=1048576B rate-limit-tx=262144B transfer-limit=\
    157286400B upload-limit=0B uptime-limit=3h
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=250_yr owner=admin transfer-limit=786432000B upload-limit=0B \
    uptime-limit=1d16h
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=monthly owner=admin rate-limit-min-rx=262144B rate-limit-min-tx=\
    262144B rate-limit-rx=262144B rate-limit-tx=262144B transfer-limit=\
    3221225472B upload-limit=0B uptime-limit=4w2d
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=unlimited owner=admin transfer-limit=10737418240B upload-limit=0B \
    uptime-limit=521w3d
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=limity-6 owner=admin rate-limit-min-rx=524288B rate-limit-min-tx=\
    524288B rate-limit-rx=524288B rate-limit-tx=524288B transfer-limit=\
    6442450944B upload-limit=0B uptime-limit=8w4d
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=500-512 owner=admin rate-limit-min-rx=262144B rate-limit-min-tx=\
    262144B rate-limit-rx=524288B rate-limit-tx=262144B transfer-limit=\
    1572864000B upload-limit=0B uptime-limit=0s
/user group
set write policy="local,telnet,ssh,ftp,reboot,read,write,test,winbox,password,\
    web,sniff,sensitive,api,romon,tikapp,!policy,!dude"
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/dude
set data-directory=disk2/dude enabled=yes
/interface bridge filter
add action=drop chain=input comment=hacker disabled=yes packet-mark=\
    host-hacker packet-type=host src-mac-address=\
    00:00:00:00:00:00/FF:FF:FF:FF:FF:FF
add action=drop chain=input disabled=yes packet-mark=host-hacker
add action=drop chain=input disabled=yes dst-port=14789 ip-protocol=tcp \
    mac-protocol=ip
add action=drop chain=input disabled=yes dst-port=14789 ip-protocol=udp \
    mac-protocol=ip
/interface bridge nat
add action=drop chain=dstnat ip-protocol=udp log=yes log-prefix="stop dhcp" \
    mac-protocol=ip src-port=67
/interface bridge port
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=ether10
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=ether9
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=ether12
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=ether11
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-102
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-10
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-20
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-101
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-103
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-30
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-113
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-111
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-132
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-104
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-133
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-131
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-105
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-106
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-102-5.8
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-103-5.8
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-105-5.8
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-131-5.8
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-111-5.8
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-101-5.8
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-107
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-107-5.8
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-106-5.8
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-104-5.8
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=ether8
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=ether13
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-151
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-150
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-117
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-134
add auto-isolate=yes bridge=IN-OUT horizon=1 interface=VLAN-60
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-61
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=ether7
add auto-isolate=yes bridge=IN-OUT edge=yes horizon=1 interface=VLAN-22
/interface bridge settings
set allow-fast-path=no use-ip-firewall=yes
/ip firewall connection tracking
set udp-timeout=30s
/ip neighbor discovery-settings
set discover-interface-list=all
/ip settings
set allow-fast-path=no max-neighbor-entries=16384 send-redirects=no
/interface bridge vlan
add disabled=yes tagged=*4A untagged=ether8 vlan-ids=3021
add disabled=yes tagged=*4A untagged=ether8 vlan-ids=3022
add disabled=yes tagged=*4A untagged=ether8 vlan-ids=3023
add disabled=yes tagged=*4A untagged=ether8 vlan-ids=3024
/interface detect-internet
set detect-interface-list=all wan-interface-list=WAN
/interface l2tp-server server
set enabled=yes use-ipsec=yes
/interface list member
add disabled=yes interface=IN-OUT list=list1
add interface=IN-OUT list=LAN_LIST
add interface=IN-OUT list=OUT-NEWLAN
add interface=ISP1 list=WAN
add interface=E-ISP2 list=WAN
/interface pppoe-server server
add disabled=no interface=IN-OUT service-name=service1
/interface pptp-server server
set enabled=yes
/interface sstp-server server
set default-profile=default-encryption enabled=yes
/ip address
add address=192.168.1.1/24 disabled=yes interface=IN-OUT network=192.168.1.0
add address=10.33.0.1/16 interface=IN-OUT network=10.33.0.0
add address=10.133.0.1/24 comment="add hamza2022-10-29" interface=IN-OUT \
    network=10.133.0.0
add address=10.50.50.2/24 comment="Mini Mikrotik" interface=ISP3 network=\
    10.50.50.0
add address=192.168.8.2/24 comment=104644523 interface=ISP1 network=\
    192.168.8.0
add address=192.168.0.2/24 interface=IN-OUT network=192.168.0.0
add address=10.10.10.1/24 disabled=yes interface=ether13 network=10.10.10.0
add address=192.168.11.3/24 comment=104621875 interface=VLAN-2011-L1 network=\
    192.168.11.0
add address=192.168.100.1/24 interface=IN-OUT network=192.168.100.0
add address=192.168.19.3/24 comment=104622919 interface=VLAN-2019-L3 network=\
    192.168.19.0
add address=192.168.20.3/24 comment=104622920 interface=VLAN-2020-L3 network=\
    192.168.20.0
add address=192.168.21.3/24 comment=104622890 interface=VLAN-2021-L3 network=\
    192.168.21.0
add address=192.168.22.3/24 comment=104622899 interface=VLAN-2022-L3 network=\
    192.168.22.0
add address=10.10.4.1/24 interface=ISP3 network=10.10.4.0
add address=192.168.12.2/24 comment=104643101 interface=VLAN-2012-L1 network=\
    192.168.12.0
add address=192.168.14.2/24 comment=104644521 interface=VLAN-2014-L1 network=\
    192.168.14.0
add address=10.5.32.1/22 interface=IN-OUT network=10.5.32.0
add address=10.6.32.1/22 interface=IN-OUT network=10.6.32.0
add address=10.7.32.1/22 interface=IN-OUT network=10.7.32.0
add address=10.8.32.1/22 interface=IN-OUT network=10.8.32.0
add address=10.9.32.1/22 interface=IN-OUT network=10.9.32.0
add address=10.100.32.1/22 interface=IN-OUT network=10.100.32.0
add address=10.11.32.1/22 interface=IN-OUT network=10.11.32.0
add address=10.12.32.1/22 interface=IN-OUT network=10.12.32.0
add address=10.13.32.1/22 interface=IN-OUT network=10.13.32.0
add address=10.14.32.1/22 interface=IN-OUT network=10.14.32.0
add address=10.15.32.1/22 interface=IN-OUT network=10.15.32.0
add address=10.16.32.1/22 interface=IN-OUT network=10.16.32.0
add address=10.60.32.1/22 interface=IN-OUT network=10.60.32.0
add address=10.10.5.1/24 interface=ISP3 network=10.10.5.0
add address=192.168.13.3/24 comment=104622895 interface=VLAN-2013-L1 network=\
    192.168.13.0
add address=192.168.101.1/24 interface=IN-OUT network=192.168.101.0
add address=10.10.112.1/24 interface=IN-OUT network=10.10.112.0
add address=10.10.4.6 interface=ether8 network=10.10.4.6
add address=192.168.1.254/24 comment="Secondary IP for remote management" \
    interface=IN-OUT network=192.168.1.0
/ip arp
add address=192.168.100.106 interface=IN-OUT mac-address=18:53:E0:4F:76:70
add address=192.168.100.105 interface=IN-OUT mac-address=44:DF:65:55:28:D1
add address=192.168.100.101 interface=IN-OUT mac-address=4C:C6:4C:65:06:52
add address=192.168.100.103 interface=IN-OUT mac-address=D4:35:38:E8:71:05
add address=192.168.100.104 interface=IN-OUT mac-address=A4:A9:30:A1:DB:65
add address=192.168.100.111 interface=IN-OUT mac-address=18:53:E0:4E:59:30
add address=192.168.100.131 interface=IN-OUT mac-address=C8:BF:4C:6B:8B:E1
add address=192.168.100.133 interface=IN-OUT mac-address=B4:A9:4F:6B:96:EA
add address=192.168.100.250 interface=IN-OUT mac-address=9C:14:63:D1:41:74
add address=192.168.100.113 interface=IN-OUT
add address=192.168.100.102 interface=IN-OUT mac-address=CC:D8:43:5A:40:07
add address=10.10.4.40 interface=ISP3 mac-address=40:A5:EF:FF:56:B3
add address=192.168.100.30 interface=IN-OUT mac-address=A4:39:B3:FB:AE:5E
add address=192.168.100.117 interface=IN-OUT mac-address=18:C5:01:89:BF:FB
add address=192.168.100.134 interface=IN-OUT mac-address=18:C5:01:33:F7:F1
add address=192.168.100.107 interface=IN-OUT mac-address=2C:B2:1A:9D:9B:BD
add address=192.168.100.132 interface=IN-OUT mac-address=18:53:E0:44:01:20
add address=10.10.4.10 interface=ISP3 mac-address=A4:39:B3:E4:C2:F6
add address=10.10.4.20 interface=ISP3 mac-address=40:A5:EF:FF:54:EC
add address=192.168.100.20 interface=IN-OUT mac-address=40:A5:EF:FF:54:EB
add address=192.168.100.10 interface=IN-OUT mac-address=40:A5:EF:FF:56:B3
add address=192.168.100.60 interface=IN-OUT mac-address=B8:80:35:F9:C7:2A
/ip cloud
set ddns-enabled=yes ddns-update-interval=1m
/ip dhcp-server network
add address=10.5.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.5.32.1
add address=10.6.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.6.32.1
add address=10.7.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.7.32.1
add address=10.8.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.8.32.1
add address=10.9.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.9.32.1
add address=10.11.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.11.32.1
add address=10.12.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.12.32.1
add address=10.13.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.13.32.1
add address=10.14.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.14.32.1
add address=10.15.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.15.32.1
add address=10.16.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.16.32.1
add address=10.33.0.0/16 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.33.0.1
add address=10.60.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.60.32.1
add address=10.100.32.0/22 dns-server=10.33.0.1,172.17.188.162 gateway=\
    10.100.32.1
/ip dhcp-server vendor-class-id
add address-pool=pool-android5 name=vendor5 server=server vid=android-dhcp-5
add address-pool=pool-android6 name=vendor6 server=server vid=android-dhcp-6
add address-pool=pool-android7 name=vendor7 server=server vid=android-dhcp-7
add address-pool=pool-android8 name=vendor8 server=server vid=android-dhcp-8
add address-pool=pool-android9 name=vendor9 server=server vid=android-dhcp-9
add address-pool=pool-android10 name=vendor10 server=server vid=\
    android-dhcp-10
add address-pool=pool-android11 name=vendor11 server=server vid=\
    android-dhcp-11
add address-pool=pool-android12 name=vendor12 server=server vid=\
    android-dhcp-12
add address-pool=pool-android13 name=vendor13 server=server vid=\
    android-dhcp-13
add address-pool=pool-android14 name=vendor14 server=server vid=\
    android-dhcp-14
add address-pool=pool-android15 name=vendor15 server=server vid=\
    android-dhcp-15
add address-pool=pool-android16 name=vendor16 server=server vid=\
    android-dhcp-16
add address-pool=pool-android8 name=vendor8-1 server=server vid=\
    android-dhcp-8.1.0
add address-pool=pool-HUAWEI-ALL name=vendor-HUAWEI-L22 server=server vid=\
    android:BKK-L22
add address-pool=pool-HUAWEI-ALL name=vendor-HW-Y6_Pro_2017 server=server \
    vid=HUAWEI:android:QC_Reference_Phone
add address-pool=pool-HUAWEI-ALL name=vendor-HW-Y6_Prim_2018 server=server \
    vid=HUAWEI:android:ATU-L31
add address-pool=pool-android7 name=vendor7.0 server=server vid=\
    android-dhcp-7.0
/ip dns
set cache-max-ttl=1h cache-size=5000KiB max-udp-packet-size=12280 servers="8.8\
    .8.8,82.114.163.32,82.114.163.31,8.8.4.4,1.1.1.1,140.82.35.182,108.61.210.\
    25"
/ip dns static
add address=149.154.167.220 name=api.telegram.org
/ip firewall address-list
add address=10.10.10.0/24 list=lan
add address=50.22.0.0/16 comment="03/02/2026 05:09:36" list=whatsap
add address=10.0.0.1 list=dns1
add address=10.33.0.1 list=dns1
add address=10.0.0.1 list=dns2
add address=10.33.0.1 list=dns2
add address=15.15.15.1 list=dns2
add address=172.17.188.162 list=dns2
add list=d-doos
add list=s-doos
add list=not-auth-dst
add list=not-auth-src
add address=192.168.82.0/24 list=Local
add address=10.0.0.0/24 list=lan
add address=10.133.0.0/24 list=lan
add address=10.250.2.1 list=dns1
add address=10.250.3.1 list=dns1
add address=10.250.4.1 list=dns1
add address=10.250.5.1 list=dns1
add address=10.250.6.1 list=dns1
add address=10.250.7.1 list=dns1
add address=10.250.8.1 list=dns1
add address=10.250.9.1 list=dns1
add address=10.250.10.1 list=dns1
add address=10.250.11.1 list=dns1
add address=10.250.12.1 list=dns1
add address=10.250.13.1 list=dns1
add address=10.250.14.1 list=dns1
add address=10.250.15.1 list=dns1
add address=10.250.16.1 list=dns1
add address=10.250.17.1 list=dns1
add address=10.250.18.1 list=dns1
add address=10.250.19.1 list=dns1
add address=10.250.20.1 list=dns1
add address=10.250.21.1 list=dns1
add address=10.250.22.1 list=dns1
add address=10.250.23.1 list=dns1
add address=10.250.24.1 list=dns1
add address=10.250.25.1 list=dns1
add address=10.250.26.1 list=dns1
add address=10.250.27.1 list=dns1
add address=10.250.28.1 list=dns1
add address=10.250.29.1 list=dns1
add address=10.250.30.1 list=dns1
add address=10.250.31.1 list=dns1
add address=10.250.32.1 list=dns1
add address=10.250.33.1 list=dns1
add address=10.250.34.1 list=dns1
add address=10.250.35.1 list=dns1
add address=10.250.36.1 list=dns1
add address=10.250.37.1 list=dns1
add address=10.250.38.1 list=dns1
add address=10.250.39.1 list=dns1
add address=10.250.40.1 list=dns1
add address=10.250.41.1 list=dns1
add address=10.250.42.1 list=dns1
add address=10.250.43.1 list=dns1
add address=10.250.44.1 list=dns1
add address=10.250.45.1 list=dns1
add address=10.250.46.1 list=dns1
add address=10.250.47.1 list=dns1
add address=10.250.48.1 list=dns1
add address=10.250.49.1 list=dns1
add address=10.250.50.1 list=dns1
add address=10.250.51.1 list=dns1
add address=10.250.52.1 list=dns1
add address=10.250.53.1 list=dns1
add address=10.250.54.1 list=dns1
add address=10.250.55.1 list=dns1
add address=10.250.56.1 list=dns1
add address=10.250.57.1 list=dns1
add address=10.250.58.1 list=dns1
add address=10.250.59.1 list=dns1
add address=10.250.60.1 list=dns1
add address=10.250.61.1 list=dns1
add address=10.250.62.1 list=dns1
add address=10.250.63.1 list=dns1
add address=10.250.64.1 list=dns1
add address=10.250.65.1 list=dns1
add address=10.250.66.1 list=dns1
add address=10.250.67.1 list=dns1
add address=10.250.68.1 list=dns1
add address=10.250.69.1 list=dns1
add address=10.250.70.1 list=dns1
add address=10.250.71.1 list=dns1
add address=10.250.72.1 list=dns1
add address=10.250.73.1 list=dns1
add address=10.250.74.1 list=dns1
add address=10.250.75.1 list=dns1
add address=10.250.76.1 list=dns1
add address=10.250.77.1 list=dns1
add address=10.250.78.1 list=dns1
add address=10.250.79.1 list=dns1
add address=10.250.80.1 list=dns1
add address=10.250.81.1 list=dns1
add address=10.250.82.1 list=dns1
add address=10.250.83.1 list=dns1
add address=10.250.84.1 list=dns1
add address=10.250.85.1 list=dns1
add address=10.250.86.1 list=dns1
add address=10.250.87.1 list=dns1
add address=10.250.88.1 list=dns1
add address=10.250.89.1 list=dns1
add address=10.250.90.1 list=dns1
add address=10.250.91.1 list=dns1
add address=10.250.92.1 list=dns1
add address=10.250.93.1 list=dns1
add address=10.250.94.1 list=dns1
add address=10.250.95.1 list=dns1
add address=10.250.96.1 list=dns1
add address=10.250.97.1 list=dns1
add address=10.250.98.1 list=dns1
add address=10.250.99.1 list=dns1
add address=10.250.100.1 list=dns1
add address=15.15.15.1 list=dns1
add address=10.250.2.1 list=dns2
add address=10.250.3.1 list=dns2
add address=10.250.4.1 list=dns2
add address=10.250.5.1 list=dns2
add address=10.250.6.1 list=dns2
add address=10.250.7.1 list=dns2
add address=10.250.8.1 list=dns2
add address=10.250.9.1 list=dns2
add address=10.250.10.1 list=dns2
add address=10.250.11.1 list=dns2
add address=10.250.12.1 list=dns2
add address=10.250.13.1 list=dns2
add address=10.250.14.1 list=dns2
add address=10.250.15.1 list=dns2
add address=10.250.16.1 list=dns2
add address=10.250.17.1 list=dns2
add address=10.250.18.1 list=dns2
add address=10.250.19.1 list=dns2
add address=10.250.20.1 list=dns2
add address=10.250.21.1 list=dns2
add address=10.250.22.1 list=dns2
add address=10.250.23.1 list=dns2
add address=10.250.24.1 list=dns2
add address=10.250.25.1 list=dns2
add address=10.250.26.1 list=dns2
add address=10.250.27.1 list=dns2
add address=10.250.28.1 list=dns2
add address=10.250.29.1 list=dns2
add address=10.250.30.1 list=dns2
add address=10.250.31.1 list=dns2
add address=10.250.32.1 list=dns2
add address=10.250.33.1 list=dns2
add address=10.250.34.1 list=dns2
add address=10.250.35.1 list=dns2
add address=10.250.36.1 list=dns2
add address=10.250.37.1 list=dns2
add address=10.250.38.1 list=dns2
add address=10.250.39.1 list=dns2
add address=10.250.40.1 list=dns2
add address=10.250.41.1 list=dns2
add address=10.250.42.1 list=dns2
add address=10.250.43.1 list=dns2
add address=10.250.44.1 list=dns2
add address=10.250.45.1 list=dns2
add address=10.250.46.1 list=dns2
add address=10.250.47.1 list=dns2
add address=10.250.48.1 list=dns2
add address=10.250.49.1 list=dns2
add address=10.250.50.1 list=dns2
add address=10.250.51.1 list=dns2
add address=10.250.52.1 list=dns2
add address=10.250.53.1 list=dns2
add address=10.250.54.1 list=dns2
add address=10.250.55.1 list=dns2
add address=10.250.56.1 list=dns2
add address=10.250.57.1 list=dns2
add address=10.250.58.1 list=dns2
add address=10.250.59.1 list=dns2
add address=10.250.60.1 list=dns2
add address=10.250.61.1 list=dns2
add address=10.250.62.1 list=dns2
add address=10.250.63.1 list=dns2
add address=10.250.64.1 list=dns2
add address=10.250.65.1 list=dns2
add address=10.250.66.1 list=dns2
add address=10.250.67.1 list=dns2
add address=10.250.68.1 list=dns2
add address=10.250.69.1 list=dns2
add address=10.250.70.1 list=dns2
add address=10.250.71.1 list=dns2
add address=10.250.72.1 list=dns2
add address=10.250.73.1 list=dns2
add address=10.250.74.1 list=dns2
add address=10.250.75.1 list=dns2
add address=10.250.76.1 list=dns2
add address=10.250.77.1 list=dns2
add address=10.250.78.1 list=dns2
add address=10.250.79.1 list=dns2
add address=10.250.80.1 list=dns2
add address=10.250.81.1 list=dns2
add address=10.250.82.1 list=dns2
add address=10.250.83.1 list=dns2
add address=10.250.84.1 list=dns2
add address=10.250.85.1 list=dns2
add address=10.250.86.1 list=dns2
add address=10.250.87.1 list=dns2
add address=10.250.88.1 list=dns2
add address=10.250.89.1 list=dns2
add address=10.250.90.1 list=dns2
add address=10.250.91.1 list=dns2
add address=10.250.92.1 list=dns2
add address=10.250.93.1 list=dns2
add address=10.250.94.1 list=dns2
add address=10.250.95.1 list=dns2
add address=10.250.96.1 list=dns2
add address=10.250.97.1 list=dns2
add address=10.250.98.1 list=dns2
add address=10.250.99.1 list=dns2
add address=10.250.100.1 list=dns2
add address=10.33.0.0/16 list=lan
add address=10.250.0.0/16 list=lan
add address=10.33.0.0/16 list=LAN
add address=g.whatsapp.net comment=Whatsapp list=w
add address=dit.whatsapp.net comment=Whatsapp list=w
add address=31.13.88.61 comment=Whatsapp list=w
add address=static.whatsapp.net comment=Whatsapp list=w
add address=157.240.22.54 comment=Whatsapp list=w
add address=157.240.19.54 comment=Whatsapp list=w
add address=31.13.66.51 comment=Whatsapp list=w
add address=31.13.67.53 comment=Whatsapp list=w
add address=31.13.93.54 comment=Whatsapp list=w
add address=31.13.71.50 comment=Whatsapp list=w
add address=3.33.221.48 comment=Whatsapp list=w
add address=15.197.206.217 comment=Whatsapp list=w
add address=157.240.3.55 comment=Whatsapp list=w
add address=31.13.70.50 comment=Whatsapp list=w
add address=3.33.252.61 comment=Whatsapp list=w
add address=15.197.210.208 comment=Whatsapp list=w
add address=157.240.11.54 comment=Whatsapp list=w
add address=157.240.241.61 comment=Whatsapp list=w
add address=31.13.65.50 comment=Whatsapp list=w
add address=157.240.14.53 comment=Whatsapp list=w
add address=157.240.229.61 comment=Whatsapp list=w
add address=157.240.18.53 comment=Whatsapp list=w
add address=185.11.11.32 comment=Whatsapp list=w
add address=10.33.255.250 comment="Salah Laptop" list=Direct_Access
add address=10.33.255.249 comment="Salah Phone" list=Direct_Access
add address=192.168.19.1 disabled=yes list=Modem_Target
add address=192.168.20.1 disabled=yes list=Modem_Target
add address=10.50.50.1 comment=INCOMING list=lan
add address=10.50.50.1 comment=INCOMING list=LAN
add address=10.33.0.0/16 comment="My Local Network 1" list=Safe_IPs
add address=10.133.0.0/24 comment="My Local Network 2" list=Safe_IPs
add address=192.168.0.0/16 comment="My Local Network 3" list=Safe_IPs
add address=10.50.50.0/24 comment="My Local Network 4" list=Safe_IPs
add address=192.168.30.0/24 comment="VPN Network 1" list=Safe_IPs
add address=1.0.0.1 comment="VPN Network 2" list=Safe_IPs
add address=10.10.10.0/24 comment="Local Admin Range" list=Allowed_Admins
add address=192.168.30.1 comment="Google VPS Tunnel" list=Allowed_Admins
add address=136.113.96.134 comment="Google VPS Public IP" list=Allowed_Admins
add address=d2ttmfnie6kgj.cloudfront.net comment=\
    "sprint samsung frimware update" list=Stop_Updates_Servers
add address=lgdacom.net list=Stop_Updates_Servers
add address=uplus.co.kr list=Stop_Updates_Servers
add address=lghellovision.net list=Stop_Updates_Servers
add address=lg.com list=Stop_Updates_Servers
add address=lge.com list=Stop_Updates_Servers
add address=findmymobile.samsung.com list=Stop_Updates_Servers
add address=samsungvisioncloud.com list=Stop_Updates_Servers
add address=samsungmdec.com list=Stop_Updates_Servers
add address=samsungdm.com list=Stop_Updates_Servers
add address=samsapps.cust.lldns.net list=Stop_Updates_Servers
add address=ospserver.net list=Stop_Updates_Servers
add address=samsungapps.com list=Stop_Updates_Servers
add address=bixby.com list=Stop_Updates_Servers
add address=samsungdive.com list=Stop_Updates_Servers
add address=samsungmax.com list=Stop_Updates_Servers
add address=secmobilesvc.com list=Stop_Updates_Servers
add address=samsungmobile.com list=Stop_Updates_Servers
add address=weather.microsoft.com list=Stop_Updates_Servers
add address=tile-service.weather.microsoft.com list=Stop_Updates_Servers
add address=1plus.io list=Stop_Updates_Servers
add address=windowsphone.com list=Stop_Updates_Servers
add address=dsx.mp.microsoft.com list=Stop_Updates_Servers
add address=microsoft.com list=Stop_Updates_Servers
add address=mobile.pipe.aria.microsoft.com list=Stop_Updates_Servers
add address=quotecenter.microsoft.com list=Stop_Updates_Servers
add address=ris.api.iris.microsoft.com list=Stop_Updates_Servers
add address=s-msft.com list=Stop_Updates_Servers
add address=windowsmedia.com list=Stop_Updates_Servers
add address=update.microsoft.com list=Stop_Updates_Servers
add address=download.microsoft.com list=Stop_Updates_Servers
add address=forefrontdl.microsoft.com list=Stop_Updates_Servers
add address=download.windowsupdate.com list=Stop_Updates_Servers
add address=wustat.windows.com list=Stop_Updates_Servers
add address=ntservicepack.microsoft.com list=Stop_Updates_Servers
add address=statsfe2.ws.microsoft.com list=Stop_Updates_Servers
add address=windowsupdate.nsatc.net list=Stop_Updates_Servers
add address=windowsupdate.com list=Stop_Updates_Servers
add address=windowsupdate.microsoft.com list=Stop_Updates_Servers
add address=update.microsoft.com.nsatc.net list=Stop_Updates_Servers
add address=windowindowsupdate.com list=Stop_Updates_Servers
add address=stats.microsoft.com list=Stop_Updates_Servers
add address=test.stats.update.microsoft.com list=Stop_Updates_Servers
add address=go.microsoft.com list=Stop_Updates_Servers
add address=swscan.apple.com list=Stop_Updates_Servers
add address=swquery.apple.com list=Stop_Updates_Servers
add address=swdownload.apple.com list=Stop_Updates_Servers
add address=swdist.apple.com list=Stop_Updates_Servers
add address=swcdn.apple.com list=Stop_Updates_Servers
add address=dlmgr.gtm.svcmot.com list=Stop_Updates_Servers
add address=play-fe.googleapis.com comment="GOOGLE PLAY STORE" list=\
    Stop_Updates_Servers
add address=play-lh.googleusercontent.com comment="GOOGLE PLAY STORE" list=\
    Stop_Updates_Servers
add address=cdnhwc1.com comment="HUAWEI CDN APPLICATION" list=\
    Stop_Updates_Servers
add address=cdnhwc2.com list=Stop_Updates_Servers
add address=cdnhwc3.com list=Stop_Updates_Servers
add address=cdnhwc4.com list=Stop_Updates_Servers
add address=cdnhwc5.com list=Stop_Updates_Servers
add address=cdnhwc6.com list=Stop_Updates_Servers
add address=cdnhwc7.com list=Stop_Updates_Servers
add address=cdnhwc8.com list=Stop_Updates_Servers
add address=livehwc3.cn comment="HUAWEI CDN APPLICATION" list=\
    Stop_Updates_Servers
add address=huawei.asia comment="HUAWEI APPLICATION" list=\
    Stop_Updates_Servers
add address=hwccpc.com comment="HUAWEI APPLICATION" list=Stop_Updates_Servers
add address=huaweistatic.com comment="HUAWEI APPLICATION" list=\
    Stop_Updates_Servers
add address=huawei.com comment="HUAWEI APPLICATION" list=Stop_Updates_Servers
add address=harmonyos.com comment="HUAWEI APPLICATION" list=\
    Stop_Updates_Servers
add address=dbankedge.net comment="HUAWEI APPLICATION" list=\
    Stop_Updates_Servers
add address=dbankcdn.com comment="HUAWEI APPLICATION" list=\
    Stop_Updates_Servers
add address=dbankcdn.cn comment="HUAWEI APPLICATION" list=\
    Stop_Updates_Servers
add address=dbank.com comment="HUAWEI APPLICATION" list=Stop_Updates_Servers
add address=microsoft.store comment=microsoft.store list=Stop_Updates_Servers
add address=store-images.s-microsoft.com comment=microsoft.store list=\
    Stop_Updates_Servers
add address=storeedgefd.dsx.mp.microsoft.com comment=microsoft.store list=\
    Stop_Updates_Servers
add address=store-images.s-microsoft.com-c.edgekey.net comment=\
    "microsoft store" list=Stop_Updates_Servers
add address=sbixby.com list=Stop_Updates_Servers
add address=aibixby.com list=Stop_Updates_Servers
add address=push.samsungosp.com list=Stop_Updates_Servers
add address=pushmessage.samsung.com comment=microsoft.com list=\
    Stop_Updates_Servers
add address=scs.samsungqbe.com list=Stop_Updates_Servers
add address=ssp.samsung.com list=Stop_Updates_Servers
add address=samsunghealth.com list=Stop_Updates_Servers
add address=remotesamsung.com list=Stop_Updates_Servers
add address=samsung.co.kr list=Stop_Updates_Servers
add address=samsung.com.cn list=Stop_Updates_Servers
add address=samsung.com list=Stop_Updates_Servers
add address=samsungcloud.com list=Stop_Updates_Servers
add address=samsungcloudcdn.com list=Stop_Updates_Servers
add address=samsungknox.com list=Stop_Updates_Servers
add address=www.smartthings.com list=Stop_Updates_Servers
add address=www.samsungrm.net list=Stop_Updates_Servers
add address=secb2b.com list=Stop_Updates_Servers
add address=samsungusa.com list=Stop_Updates_Servers
add address=samsungsetup.com list=Stop_Updates_Servers
add address=samsungsemi.com list=Stop_Updates_Servers
add address=samsungrs.com list=Stop_Updates_Servers
add address=samsungrm.net list=Stop_Updates_Servers
add address=samsungqbe.com list=Stop_Updates_Servers
add address=samsungpositioning.com list=Stop_Updates_Servers
add address=samsungotn.net list=Stop_Updates_Servers
add address=samsungosp.com comment=bixby.com list=Stop_Updates_Servers
add address=samsungiotcloud.com list=Stop_Updates_Servers
add address=doc.samsungmobile.com list=Stop_Updates_Servers
add address=deviceesb.sprint.com list=Stop_Updates_Servers
add address=deviceservices.sprint.com list=Stop_Updates_Servers
add address=zone.sprint.com list=Stop_Updates_Servers
add address=ape-sprint.isappcloud.com list=Stop_Updates_Servers
add address=samfota.s.llnwi.net comment="sprint samsung frimware update" \
    list=Stop_Updates_Servers
add address=samsapps.s.llnwi.net comment="sprint samsung frimware update" \
    list=Stop_Updates_Servers
add address=a1531.dspd.akamai.net comment="sprint samsung frimware update" \
    list=Stop_Updates_Servers
add list=Stop_Updates_Servers
add address=192.168.0.0/16 comment="Local Admin Range" list=Allowed_Admins
add address=10.33.0.0/16 comment="Hotspot Network" list=Local-Networks
add address=192.168.1.0/24 comment="Distribution Routers" list=Local-Networks
add address=10.10.10.10 comment="Rest House Server" list=Local-Networks
add address=10.40.0.0/16 comment="VLAN Interconnect Range" list=\
    Local-Networks
add address=157.240.0.0/16 list=Facebook_Servers
add address=31.13.24.0/21 list=Facebook_Servers
add address=31.13.24.0/21 list=Facebook_All
add address=157.240.0.0/16 list=Facebook_All
add address=185.60.216.0/22 list=Facebook_All
add address=129.134.0.0/17 list=Facebook_All
add address=69.171.0.0/17 list=Facebook_All
add address=66.220.0.0/16 list=Facebook_All
add address=136.119.127.113 comment="GCP Server" list=Critical_Services
add address=api.telegram.org comment="Telegram API" list=Critical_Services
add address=192.168.100.0/24 comment="Distribution Routers" list=\
    Local-Networks
add address=192.168.100.0/24 comment="My Local Network 3" list=Safe_IPs
add address=192.168.100.0/24 comment="Local Admin Range" list=Allowed_Admins
add address=136.119.127.113 comment="Google VPS" list=External_Admins
add address=update.miui.com list=Stop_Updates_Servers
add address=appstore.huawei.com comment=bixby.com list=Stop_Updates_Servers
add address=vas.samsungapps.com list=Stop_Updates_Servers
add address=10.5.32.0/22 list=Local-Networks
add address=10.6.32.0/22 list=Local-Networks
add address=10.7.32.0/22 list=Local-Networks
add address=10.8.32.0/22 list=Local-Networks
add address=10.9.32.0/22 list=Local-Networks
add address=10.11.32.0/22 list=Local-Networks
add address=10.12.32.0/22 list=Local-Networks
add address=10.13.32.0/22 list=Local-Networks
add address=10.14.32.0/22 list=Local-Networks
add address=10.15.32.0/22 list=Local-Networks
add address=10.16.32.0/22 list=Local-Networks
add address=10.50.32.0/22 list=Local-Networks
add address=10.100.32.0/22 list=Local-Networks
add address=10.10.5.0/24 comment="Rest House Server" list=Local-Networks
add address=10.10.5.0/24 comment="Local Admin Range" list=Allowed_Admins
add address=192.168.101.0/24 comment="My Local Network 3" list=Safe_IPs
add address=10.10.5.0/24 comment="My Local Network 3" list=Safe_IPs
add address=192.168.101.0/24 comment="Distribution Routers" list=\
    Local-Networks
add address=10.10.3.0/24 comment="Rest House Server" list=Local-Networks
add address=10.10.3.0/24 comment="My Local Network 3" list=Safe_IPs
add address=fast.com list=FastCom_Servers
add address=api.fast.com list=FastCom_Servers
add address=192.168.89.0/24 comment="VPN Network 1" list=Safe_IPs
add address=192.168.89.1 comment="Google VPS Tunnel" list=Allowed_Admins
add address=10.10.4.0/24 comment="My Local Network 4" list=Safe_IPs
/ip firewall filter
add action=accept chain=forward comment="Allow access to remote router" \
    dst-address=192.168.1.1
add action=accept chain=forward comment=\
    "Allow return traffic from remote router" src-address=192.168.1.1
add action=accept chain=forward comment=\
    "Allow access to 192.168.1.x from main network" dst-address=\
    192.168.1.0/24 src-address=10.33.0.0/16
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here"
add action=accept chain=forward comment="Allow Ping between subnets" \
    dst-address=10.10.10.0/24 protocol=icmp src-address=10.33.0.0/16
add action=accept chain=input comment="Allow UserMan via Tunnel" dst-port=55 \
    protocol=tcp
add action=accept chain=forward comment="Allow Remote Access Ports" dst-port=\
    7010,7020,7030,7101,7112,7111,7103,7150,37777,80,8181,55,5010,7111,7113 \
    protocol=tcp
add action=accept chain=forward comment="Allow Remote Access Ports" dst-port=\
    5020,5019,5021,5022,7190,5011,5012,5013,5014,5010 protocol=tcp
add action=accept chain=forward comment="Allow Remote Access Ports to MT2" \
    dst-port=9292,9729,8182,6020,6010,6002 protocol=tcp
add action=accept chain=forward comment="Allow RDP to Istiraha Server" \
    dst-address=10.10.10.10 dst-port=3389 protocol=tcp src-address=\
    10.33.0.0/16
add action=accept chain=input dst-port=55,80 protocol=tcp
# GCP-Tunnel not ready
add action=accept chain=input comment="GCP: Allow Ping" in-interface=\
    GCP-Tunnel protocol=icmp
# GCP-Tunnel not ready
add action=accept chain=input comment="GCP: Allow Winbox" dst-port=8291 \
    in-interface=GCP-Tunnel protocol=tcp
# GCP-Tunnel not ready
add action=accept chain=input comment="GCP: Allow WebFig" dst-port=55 \
    in-interface=GCP-Tunnel protocol=tcp
add action=accept chain=input comment="allow IPsec NAT" dst-port=4500 \
    protocol=udp
add action=accept chain=input comment="allow IKE" dst-port=500 protocol=udp
add action=accept chain=input comment="allow l2tp" dst-port=1701 protocol=udp
add action=accept chain=input comment="allow pptp" dst-port=1723 protocol=tcp
add action=accept chain=input comment="allow sstp" dst-port=443 protocol=tcp
add action=drop chain=input comment="Drop Brute Force Attackers" \
    src-address-list=Blacklist_24h
add action=drop chain=hs-input comment=2023-12-20 connection-rate=10k-1M \
    dst-port=64874 hotspot=!auth protocol=tcp
add action=jump chain=hs-input comment=2023-12-20 content=g, dst-port=64873 \
    hotspot=!auth jump-target=salman-login protocol=tcp
add action=drop chain=input packet-mark=dns-salman
add action=reject chain=input comment="Block xtianxian_Ahmed abdu" content=\
    xtianxian reject-with=icmp-network-unreachable
add action=reject chain=input comment="Block Freedom _Akram Abdan" content=\
    your-freedom reject-with=icmp-network-unreachable
add action=drop chain=input content=your-freedom
add action=drop chain=forward comment="vide mate" dst-address=161.117.0.0/17
add action=drop chain=forward comment=\
    "Block All Updates for Restricted Users" dst-address-list=\
    Stop_Updates_Servers src-address-list=Users_No_Update
add action=reject chain=forward dst-address=10.0.0.0/24 in-interface=all-ppp \
    reject-with=icmp-network-unreachable
add action=add-dst-to-address-list address-list=w address-list-timeout=\
    none-dynamic chain=forward content=.whatsapp.com dst-address-list=!w \
    hotspot=from-client
add action=add-dst-to-address-list address-list=w address-list-timeout=\
    none-dynamic chain=forward content=.whatsapp. dst-address-list=!w \
    hotspot=from-client
add action=add-dst-to-address-list address-list=w address-list-timeout=\
    none-dynamic chain=forward content=.whatsapp.net dst-address-list=!w \
    hotspot=from-client
add action=accept chain=forward comment=\
    "Allow Access to Sub-Microtik Subnets" src-address=10.10.0.0/16
add action=add-src-to-address-list address-list=Blacklist_24h \
    address-list-timeout=1d chain=input comment=\
    "Step 3: Move to Blacklist for 24h" connection-state=new dst-port=\
    8291,8728,8729,80,55 protocol=tcp src-address-list=Stage_2
add action=add-src-to-address-list address-list=Stage_2 address-list-timeout=\
    1m chain=input comment="Step 2: Move to Stage 2" connection-state=new \
    dst-port=8291,8728,8729,80,55 protocol=tcp src-address-list=Stage_1
add action=add-src-to-address-list address-list=Stage_1 address-list-timeout=\
    1m chain=input comment="Step 1: First Attempt Detection" \
    connection-state=new dst-port=8291,8728,8729,80,55 protocol=tcp \
    src-address-list=!Safe_IPs
add action=drop chain=forward comment=\
    "Block internet for specific web profile" src-address-list=non***
add action=accept chain=input comment="Ping from Sub Mikrotik" in-interface=\
    ISP3 protocol=icmp
add chain=forward
/ip firewall mangle
add action=change-mss chain=forward comment="Clamp MSS to 1320 for MTU 1360" \
    disabled=yes new-mss=1320 passthrough=yes protocol=tcp tcp-flags=syn \
    tcp-mss=1321-65535
add action=mark-connection chain=wan-cc comment="Fast Com TEST" \
    connection-mark=no-mark disabled=yes dst-address-list=FastCom_Servers \
    new-connection-mark=wan11_conn passthrough=yes
add action=accept chain=output comment="Bypass for Sub Mikrotic" dst-address=\
    10.50.50.0/24
add action=accept chain=output comment="Bypass for Sub Mikrotic" dst-address=\
    10.10.4.0/24
add action=accept chain=output comment="Bypass for Sub Mikrotic" dst-address=\
    10.10.5.0/24
add action=accept chain=prerouting comment="GCP Tunnel Bypass" dst-address=\
    136.119.127.113
add action=accept chain=output comment="GCP Tunnel Bypass" dst-address=\
    136.119.127.113
# GCP-Tunnel not ready
add action=accept chain=output comment="GCP Bypass" out-interface=GCP-Tunnel
# GCP-Tunnel not ready
add action=accept chain=prerouting comment="GCP Bypass" in-interface=\
    GCP-Tunnel
add action=accept chain=prerouting dst-address=192.168.0.0/16
add action=accept chain=prerouting dst-address=10.0.0.0/8
add action=accept chain=output comment="Bypass VPS replies" connection-mark=\
    from_vps
add action=accept chain=output comment="Bypass: Output to External Admins" \
    dst-address-list=External_Admins
add action=accept chain=output comment="Bypass: Output to Local Nets" \
    dst-address-list=Local-Networks
add action=accept chain=prerouting comment="Bypass: Local to Local" \
    dst-address-list=Local-Networks src-address-list=Local-Networks
add action=accept chain=prerouting comment="Bypass: Unauth Hotspot" hotspot=\
    from-client,!auth
add action=accept chain=prerouting comment="Bypass: Router Itself" \
    dst-address-type=local
add action=accept chain=prerouting comment="Bypass: Management Ports" \
    dst-port=8291,55,80,9728,5019 protocol=tcp
add action=accept chain=prerouting comment="Bypass: Direct Access (Src)" \
    src-address-list=Direct_Access
add action=accept chain=prerouting comment="Bypass: Direct Access (Dst)" \
    dst-address-list=Direct_Access
add action=accept chain=prerouting comment="Bypass: Sub-Routers" dst-address=\
    192.168.1.0/24
add action=accept chain=prerouting comment="Bypass: Sub-Routers" dst-address=\
    192.168.0.0/16
add action=accept chain=prerouting comment="Bypass: Sub-Routers" dst-address=\
    192.168.10.0/24
add action=accept chain=prerouting comment="Bypass: Sub-Routers" dst-address=\
    10.10.30.0/24
add action=accept chain=prerouting comment="Bypass: Sub-Routers" dst-address=\
    10.10.50.0/24
add action=accept chain=prerouting comment="Bypass: Sub-Routers MT2" \
    dst-address=10.50.50.0/24
add action=accept chain=prerouting comment="Bypass: Sub-Routers MT2" \
    dst-address=10.10.4.0/24
add action=mark-routing chain=prerouting comment="Route VPN Users" disabled=\
    yes new-routing-mark=to_VPN passthrough=yes src-address-list=VPN_Users
add action=add-src-to-address-list address-list=netcutuser \
    address-list-timeout=1d chain=prerouting comment=\
    "Security: Detect NetCut" disabled=yes layer7-protocol=*1
# GCP-Tunnel not ready
add action=mark-connection chain=input comment="Mark connections from VPS" \
    in-interface=GCP-Tunnel new-connection-mark=from_vps passthrough=yes
add action=change-mss chain=forward comment="Optimize: MSS Clamp" new-mss=\
    clamp-to-pmtu passthrough=yes protocol=tcp tcp-flags=syn
add action=accept chain=output dst-address=192.168.19.0/24
add action=accept chain=output dst-address=192.168.10.0/24
add action=accept chain=output dst-address=192.168.11.0/24
add action=accept chain=output dst-address=192.168.12.0/24
add action=accept chain=output dst-address=192.168.13.0/24
add action=accept chain=output dst-address=192.168.14.0/24
add action=accept chain=output dst-address=192.168.20.0/24
add action=accept chain=output dst-address=192.168.21.0/24
add action=accept chain=output dst-address=192.168.22.0/24
add action=accept chain=output dst-address=192.168.23.0/24
add action=accept chain=output comment="Bypass for Sub Mikrotic2" \
    dst-address=10.50.50.0/24 src-address=10.33.0.0/24
add action=accept chain=output comment="Bypass for Sub Mikrotic2" \
    dst-address=10.10.4.0/24 src-address=10.33.0.0/24
add action=mark-routing chain=prerouting comment="Force Istiraha PC to ISP2" \
    disabled=yes dst-address-type=!local new-routing-mark=to_istraha \
    passthrough=no src-address=10.10.10.10
add action=jump chain=prerouting dst-address-type=!local in-interface=IN-OUT \
    jump-target=wan-cc
add action=jump chain=output dst-address-type=!local jump-target=wan-cc
add action=mark-connection chain=wan-cc connection-mark=no-mark \
    new-connection-mark=wan1_conn passthrough=yes per-connection-classifier=\
    both-addresses-and-ports:9/0
add action=mark-connection chain=wan-cc connection-mark=no-mark \
    new-connection-mark=wan2_conn per-connection-classifier=\
    both-addresses-and-ports:9/1
add action=mark-connection chain=wan-cc connection-mark=no-mark \
    new-connection-mark=wan3_conn per-connection-classifier=\
    both-addresses-and-ports:9/2
add action=mark-connection chain=wan-cc connection-mark=no-mark \
    new-connection-mark=wan4_conn per-connection-classifier=\
    both-addresses-and-ports:9/3
add action=mark-connection chain=wan-cc connection-mark=no-mark \
    new-connection-mark=wan5_conn per-connection-classifier=\
    both-addresses-and-ports:9/4
add action=mark-connection chain=wan-cc connection-mark=no-mark \
    new-connection-mark=wan6_conn per-connection-classifier=\
    both-addresses-and-ports:9/5
add action=mark-connection chain=wan-cc connection-mark=no-mark \
    new-connection-mark=wan7_conn per-connection-classifier=\
    both-addresses-and-ports:9/6
add action=mark-connection chain=wan-cc connection-mark=no-mark \
    new-connection-mark=wan8_conn per-connection-classifier=\
    both-addresses-and-ports:9/7
add action=mark-connection chain=wan-cc connection-mark=no-mark \
    new-connection-mark=wan9_conn per-connection-classifier=\
    both-addresses-and-ports:9/8
add action=mark-connection chain=wan-cc connection-mark=no-mark disabled=yes \
    new-connection-mark=wan1_conn per-connection-classifier=\
    both-addresses:9/0
add action=mark-connection chain=wan-cc connection-mark=no-mark disabled=yes \
    new-connection-mark=wan2_conn per-connection-classifier=\
    both-addresses:9/1
add action=mark-connection chain=wan-cc connection-mark=no-mark disabled=yes \
    new-connection-mark=wan3_conn per-connection-classifier=\
    both-addresses:9/2
add action=mark-connection chain=wan-cc connection-mark=no-mark disabled=yes \
    new-connection-mark=wan4_conn per-connection-classifier=\
    both-addresses:9/3
add action=mark-connection chain=wan-cc connection-mark=no-mark disabled=yes \
    new-connection-mark=wan5_conn per-connection-classifier=\
    both-addresses:9/4
add action=mark-connection chain=wan-cc connection-mark=no-mark disabled=yes \
    new-connection-mark=wan6_conn per-connection-classifier=\
    both-addresses:9/5
add action=mark-connection chain=wan-cc connection-mark=no-mark disabled=yes \
    new-connection-mark=wan7_conn per-connection-classifier=\
    both-addresses:9/6
add action=mark-connection chain=wan-cc connection-mark=no-mark disabled=yes \
    new-connection-mark=wan8_conn per-connection-classifier=\
    both-addresses:9/7
add action=mark-connection chain=wan-cc connection-mark=no-mark disabled=yes \
    new-connection-mark=wan9_conn per-connection-classifier=\
    both-addresses:9/8
add action=mark-routing chain=wan-cc connection-mark=wan1_conn \
    new-routing-mark=to_Line10 passthrough=yes
add action=mark-routing chain=wan-cc connection-mark=wan2_conn \
    new-routing-mark=to_Line11 passthrough=yes
add action=mark-routing chain=wan-cc connection-mark=wan3_conn \
    new-routing-mark=to_Line19
add action=mark-routing chain=wan-cc connection-mark=wan4_conn \
    new-routing-mark=to_Line20
add action=mark-routing chain=wan-cc connection-mark=wan5_conn \
    new-routing-mark=to_Line21
add action=mark-routing chain=wan-cc connection-mark=wan6_conn \
    new-routing-mark=to_Line22
add action=mark-routing chain=wan-cc connection-mark=wan7_conn \
    new-routing-mark=to_Line12 passthrough=yes
add action=mark-routing chain=wan-cc connection-mark=wan8_conn \
    new-routing-mark=to_Line13 passthrough=yes
add action=mark-routing chain=wan-cc connection-mark=wan9_conn \
    new-routing-mark=to_Line14 passthrough=yes
add action=change-mss chain=forward comment="Optimize: MSS Clamp" new-mss=\
    clamp-to-pmtu passthrough=yes protocol=tcp tcp-flags=syn
add action=change-ttl chain=postrouting disabled=yes new-ttl=set:1 \
    out-interface=IN-OUT
add action=change-ttl chain=postrouting disabled=yes new-ttl=set:1 \
    out-interface=IN-OUT
/ip firewall nat
add action=masquerade chain=srcnat comment=\
    "Access Einan Net Remote Router 192.168.1.1" dst-address=192.168.1.1
add action=dst-nat chain=dstnat comment="Forward to MT2 - Same Ports" \
    dst-port=9292,9729,6020,6010,6002 protocol=tcp to-addresses=10.50.50.1
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat comment=\
    "Force Reply from 192.168.1.x Routers" dst-address=192.168.1.0/24
add action=masquerade chain=srcnat comment=\
    "Force Reply from 10.10.90.x Routers" dst-address=10.10.112.0/24
add action=masquerade chain=srcnat comment=\
    "Force Reply from 192.168.101.x Routers" dst-address=192.168.101.0/24
add action=masquerade chain=srcnat comment=\
    "Force Reply from 192.168.100.x Routers" dst-address=192.168.100.0/24
add action=masquerade chain=srcnat comment=\
    "Force Reply from 10.10.4..x Routers" dst-address=10.10.4.0/24
add action=masquerade chain=srcnat comment=\
    "Force Reply from 10.10.5..x Routers" dst-address=10.10.5.0/24
add action=dst-nat chain=dstnat comment="1. Winbox for Aggregator" dst-port=\
    9292 protocol=tcp to-addresses=10.50.50.1 to-ports=9292
add action=dst-nat chain=dstnat comment="1. Winbox for Aggregator" dst-port=\
    9292 protocol=tcp to-addresses=10.10.4.2 to-ports=9292
add action=dst-nat chain=dstnat comment="Router 192.168.100.10" dst-port=7010 \
    protocol=tcp to-addresses=192.168.100.10 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.10.1" disabled=yes \
    dst-port=5008 protocol=tcp to-addresses=192.168.8.1 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.11.1" dst-port=5011 \
    protocol=tcp to-addresses=192.168.11.1 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.20" dst-port=7020 \
    protocol=tcp to-addresses=192.168.100.20 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.30" dst-port=7030 \
    protocol=tcp to-addresses=192.168.100.30 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.40" dst-port=7040 \
    protocol=tcp to-addresses=192.168.100.40 to-ports=80
add action=dst-nat chain=dstnat comment="Router 10.10.4.10" dst-port=6020 \
    protocol=tcp to-addresses=10.10.1.10 to-ports=80
add action=dst-nat chain=dstnat comment="Router 10.10.4.40" dst-port=6040 \
    protocol=tcp to-addresses=10.10.1.40 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.101" dst-port=\
    7101 protocol=tcp to-addresses=192.168.100.101 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.102" dst-port=\
    7102 protocol=tcp to-addresses=192.168.100.102 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.103" dst-port=\
    7103 protocol=tcp to-addresses=192.168.100.103 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.104" dst-port=\
    7104 protocol=tcp to-addresses=192.168.100.104 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.105" dst-port=\
    7105 protocol=tcp to-addresses=192.168.100.105 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.106" dst-port=\
    7106 protocol=tcp to-addresses=192.168.100.106 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.107" dst-port=\
    7107 protocol=tcp to-addresses=192.168.100.107 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.117" dst-port=\
    7117 protocol=tcp to-addresses=192.168.100.117 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.111" dst-port=\
    7111 protocol=tcp to-addresses=192.168.100.111 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.113" dst-port=\
    7113 protocol=tcp to-addresses=192.168.100.113 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.131" dst-port=\
    7131 protocol=tcp to-addresses=192.168.100.131 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.132" dst-port=\
    7132 protocol=tcp to-addresses=192.168.100.132 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.133" dst-port=\
    7133 protocol=tcp to-addresses=192.168.100.133 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.134" dst-port=\
    7134 protocol=tcp to-addresses=192.168.100.134 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.150" dst-port=\
    7150 protocol=tcp to-addresses=192.168.100.150 to-ports=80
add action=dst-nat chain=dstnat comment="Router 10.50.50.10" dst-port=6010 \
    protocol=tcp to-addresses=10.10.4.10 to-ports=80
add action=dst-nat chain=dstnat comment="Router 10.50.50.20" dst-port=6040 \
    protocol=tcp to-addresses=10.10.4.40 to-ports=80
add action=dst-nat chain=dstnat comment=Dahua dst-port=7250 protocol=tcp \
    to-addresses=192.168.100.250 to-ports=80
add action=dst-nat chain=dstnat comment=\
    "2. WebFig for Aggregator (From port 56)" dst-port=56 protocol=tcp \
    to-addresses=10.50.50.1 to-ports=8182
add action=dst-nat chain=dstnat comment="5. Modems to Aggregator" dst-port=\
    9729 protocol=tcp to-addresses=10.50.50.1
add action=dst-nat chain=dstnat comment="Modem 19" dst-port=5019 protocol=tcp \
    to-addresses=192.168.19.1 to-ports=80
add action=dst-nat chain=dstnat comment="Modem 20" dst-port=5020 protocol=tcp \
    to-addresses=192.168.20.1 to-ports=80
add action=dst-nat chain=dstnat comment="Modem 21" dst-port=5021 protocol=tcp \
    to-addresses=192.168.21.1 to-ports=80
add action=dst-nat chain=dstnat comment="Modem 22" dst-port=5022 protocol=tcp \
    to-addresses=192.168.22.1 to-ports=80
add action=accept chain=dstnat comment="Fix RDP Loopback" disabled=yes \
    dst-address=10.10.10.10 dst-port=3389 protocol=tcp
add action=masquerade chain=srcnat comment="Remote Access Return Path" \
    disabled=yes dst-address=192.168.1.0/24 out-interface=IN-OUT
add action=masquerade chain=srcnat dst-address=192.168.19.0/24
add action=masquerade chain=srcnat dst-address=192.168.20.0/24
add action=masquerade chain=srcnat dst-address=192.168.21.0/24
add action=masquerade chain=srcnat dst-address=192.168.22.0/24
add action=masquerade chain=srcnat dst-address=192.168.23.0/24
add action=masquerade chain=srcnat dst-address=192.168.13.0/24
add action=masquerade chain=srcnat dst-address=192.168.12.0/24
add action=masquerade chain=srcnat dst-address=192.168.11.0/24
add action=masquerade chain=srcnat dst-address=192.168.14.0/24
add action=masquerade chain=srcnat comment="Hairpin NAT for MT2 Forwarding" \
    dst-address=10.50.50.0/24
add action=masquerade chain=srcnat comment="Hairpin NAT for MT2 Forwarding" \
    dst-address=10.10.4.0/24
add action=masquerade chain=srcnat comment="Hairpin NAT for MT2 Forwarding" \
    dst-address=10.10.5.0/24
add action=masquerade chain=srcnat src-address=10.50.50.0/24
add action=dst-nat chain=dstnat comment="Remote: Router 1.20" dst-port=7020 \
    protocol=tcp to-addresses=192.168.1.20 to-ports=80
add action=masquerade chain=srcnat src-address=10.10.4.0/24
add action=masquerade chain=srcnat src-address=10.10.5.0/24
add action=dst-nat chain=dstnat comment="Remote: Dahua App DMSS" dst-port=\
    37777 protocol=tcp to-addresses=192.168.100.250 to-ports=37777
add action=dst-nat chain=dstnat comment="Forward to MT2 - Port 56" dst-port=\
    8182 protocol=tcp to-addresses=10.50.50.1 to-ports=56
add action=masquerade chain=srcnat src-address=10.10.10.0/24
add action=masquerade chain=srcnat comment="NAT for ISP3" disabled=yes \
    out-interface=ISP3
add action=masquerade chain=srcnat comment="NAT for ISP2" out-interface=\
    E-ISP2
add action=masquerade chain=srcnat comment="NAT for ISP1 Ping" out-interface=\
    ISP1
add action=masquerade chain=srcnat comment="NAT for 12" out-interface=ISP4
add action=masquerade chain=srcnat comment="NAT for 13" out-interface=ISP5
add action=masquerade chain=srcnat comment="NAT for 14" out-interface=ISP6
add action=masquerade chain=srcnat comment="NAT EOIP 2011" disabled=yes \
    out-interface=*41
add action=masquerade chain=srcnat comment="NAT EOIP 2012" disabled=yes \
    out-interface=*42
add action=masquerade chain=srcnat comment="NAT EOIP 2013" disabled=yes \
    out-interface=*43
add action=masquerade chain=srcnat comment="NAT EOIP 2014" disabled=yes \
    out-interface=*44
add action=masquerade chain=srcnat comment="NAT EOIP 2019" disabled=yes \
    out-interface=*51
add action=masquerade chain=srcnat comment="NAT EOIP 2020" disabled=yes \
    out-interface=*52
add action=masquerade chain=srcnat comment="NAT EOIP 2021" disabled=yes \
    out-interface=*53
add action=masquerade chain=srcnat comment="NAT EOIP 2022" disabled=yes \
    out-interface=*54
add action=masquerade chain=srcnat comment="NAT VLAN 2019" out-interface=\
    VLAN-2019-L3
add action=masquerade chain=srcnat comment="NAT VLAN 2020" out-interface=\
    VLAN-2020-L3
add action=masquerade chain=srcnat comment="NAT VLAN 2021" out-interface=\
    VLAN-2021-L3
add action=masquerade chain=srcnat comment="NAT VLAN 2022" out-interface=\
    VLAN-2022-L3
add action=masquerade chain=srcnat comment="NAT VLAN 2011" out-interface=\
    VLAN-2011-L1
add action=masquerade chain=srcnat comment="NAT VLAN 2012" out-interface=\
    VLAN-2012-L1
add action=masquerade chain=srcnat comment="NAT VLAN 2013" out-interface=\
    VLAN-2013-L1
add action=masquerade chain=srcnat comment="NAT VLAN 2014" out-interface=\
    VLAN-2014-L1
add action=dst-nat chain=dstnat comment="Modem 12" dst-port=5012 protocol=tcp \
    to-addresses=192.168.12.1 to-ports=80
add action=dst-nat chain=dstnat comment="Modem 13" dst-port=5013 protocol=tcp \
    to-addresses=192.168.13.1 to-ports=80
add action=dst-nat chain=dstnat comment="Modem 14" dst-port=5014 protocol=tcp \
    to-addresses=192.168.14.1 to-ports=80
add action=masquerade chain=srcnat comment=\
    "Force Reply from 10.10.4..x Routers" dst-address=10.10.5.0/24
add action=masquerade chain=srcnat comment="masq. vpn traffic" src-address=\
    192.168.89.0/24
add action=dst-nat chain=dstnat comment="Router 192.168.100.50" dst-port=7050 \
    protocol=tcp to-addresses=192.168.100.50 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.100.60" dst-port=7060 \
    protocol=tcp to-addresses=192.168.100.60 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.8.1" dst-port=5008 \
    protocol=tcp to-addresses=192.168.8.1 to-ports=80
add action=dst-nat chain=dstnat comment="Router 192.168.11.1" dst-port=5011 \
    protocol=tcp to-addresses=192.168.11.1 to-ports=80
/ip hotspot ip-binding
add address=192.168.1.0/24 type=bypassed
add address=192.168.10.0/24 type=bypassed
add address=10.10.5.0/24 type=bypassed
add address=192.168.101.0/24 type=bypassed
add address=10.10.112.0/24 type=bypassed
add address=192.168.100.0/24 type=bypassed
add address=192.168.0.1 disabled=yes type=bypassed
add address=0.0.0.0/0 comment="LapTop WiFi-1" mac-address=DC:A9:71:5E:CA:54 \
    type=bypassed
add comment=LapTopLan mac-address=D4:35:38:E8:71:05 server=hotspot1 type=\
    bypassed
add mac-address=40:A5:EF:FF:54:EB server=hotspot1 type=bypassed
add address=10.10.10.10 comment="Bypass Istiraha Server from Hotspot" server=\
    hotspot1
add mac-address=40:A5:EF:F9:A1:23 server=hotspot1 type=bypassed
add mac-address=D4:BE:D9:6F:BC:67 server=hotspot1 type=bypassed
add mac-address=B4:A9:4F:6B:96:EA server=hotspot1 type=bypassed
add mac-address=18:53:E0:44:01:20 server=hotspot1 type=bypassed
add mac-address=44:DF:65:55:28:D1 server=hotspot1 type=bypassed
add mac-address=40:A5:EF:FF:56:B3 server=hotspot1 type=bypassed
add mac-address=C8:BF:4C:6B:8B:E1 server=hotspot1 type=bypassed
add address=0.0.0.0/0 comment=\
    "\D8\A7\D9\84\D8\A7\D8\B3\D8\AA\D8\B1\D8\A7\D8\AD\D9\87" mac-address=\
    E8:11:32:DA:91:81 server=hotspot1 type=bypassed
add comment="redme 10" disabled=yes mac-address=BC:61:93:3F:37:6D type=\
    bypassed
add comment="pc salah" mac-address=2A:72:FB:E6:50:0E type=bypassed
add address=192.168.100.101 server=hotspot1 to-address=192.168.100.101 type=\
    bypassed
add address=192.168.100.10 server=hotspot1 to-address=192.168.100.10
add address=192.168.100.30 server=hotspot1 to-address=192.168.100.30
add address=0.0.0.0/0 comment="Istraha WIFI" mac-address=38:59:F9:1A:7A:25 \
    type=bypassed
add mac-address=0A:00:27:00:00:2C type=bypassed
add address=192.168.1.1 comment="Bypass for Einan Net remote router setup" \
    type=bypassed
add mac-address=18:C5:01:33:F7:F1 server=hotspot1 to-address=192.168.100.134
add address=0.0.0.0/0 comment="Istraha WIFI" mac-address=08:00:27:F2:25:69 \
    type=bypassed
add mac-address=98:F6:21:5D:24:D6 server=hotspot1 to-address=10.12.32.81 \
    type=bypassed
add mac-address=42:02:DE:BD:0A:AB server=hotspot1 type=bypassed
/ip hotspot user
add comment=Salah_electrice limit-bytes-total=3000000000 name=73424971212
add email=30@nobind.com limit-bytes-total=5368709120 limit-uptime=4w2d name=\
    engsalah73424
/ip hotspot walled-garden
add comment="place hotspot rules here" disabled=yes
add comment="Allow Free MP3Quran - Enan Net" dst-host=*tvquran.com*
add disabled=yes dst-host=connectivitycheck.gstatic.com
add disabled=yes dst-host=connectivitycheck.android.com
add disabled=yes dst-host=clients3.google.com
add disabled=yes dst-host=captive.apple.com
add disabled=yes dst-host=www.gstatic.com
add disabled=yes dst-host=www.apple.com
/ip hotspot walled-garden ip
add action=accept comment="Allow Rest House Destination" disabled=no \
    dst-address=10.10.10.10
add action=accept comment="Allow Rest House Source" disabled=no src-address=\
    10.10.10.10
/ip route
add comment="Line10 Primary" distance=1 gateway=192.168.8.1 routing-mark=\
    to_Line10
add comment="Line11 Failover-to-21-22" distance=2 gateway=\
    192.168.21.1,192.168.22.1 routing-mark=to_Line10
add comment="Line11 Primary" distance=1 gateway=192.168.11.1 routing-mark=\
    to_Line11
add comment="Line10 Failover-to-19-20" distance=2 gateway=\
    192.168.21.1,192.168.12.1 routing-mark=to_Line11
add comment="Line19 Primary" distance=1 gateway=192.168.19.1 routing-mark=\
    to_Line19
add distance=3 gateway=192.168.13.1,192.168.14.1 routing-mark=to_Line19
add check-gateway=ping comment="Line20 Primary" distance=1 gateway=\
    192.168.20.1 routing-mark=to_Line20
add distance=3 gateway=192.168.8.1,192.168.22.1 routing-mark=to_Line20
add comment="Line21 Primary" distance=1 gateway=192.168.21.1 routing-mark=\
    to_Line21
add distance=3 gateway=192.168.12.1,192.168.14.1 routing-mark=to_Line21
add comment="Line22 Primary" distance=1 gateway=192.168.22.1 routing-mark=\
    to_Line22
add distance=3 gateway=192.168.8.1,192.168.11.1 routing-mark=to_Line22
add comment="fallback Line12" distance=2 gateway=192.168.20.1,192.168.22.1 \
    routing-mark=to_Line12
add comment="Line12 Primary" disabled=yes distance=1 gateway=192.168.12.1 \
    routing-mark=to_Line12
add comment="Line13 Primary" distance=1 gateway=192.168.13.1 routing-mark=\
    to_Line13
add comment="Fallback Line13" distance=2 gateway=192.168.21.1,192.168.19.1 \
    routing-mark=to_Line13
add comment="Line14 Primary" distance=1 gateway=192.168.14.1 routing-mark=\
    to_Line14
add comment="Fallback Line14" distance=2 gateway=192.168.20.1,192.168.19.1 \
    routing-mark=to_Line14
add comment="Return Path to Sub-Router" distance=1 gateway=192.168.20.1
add comment=Fallback-to-ISP2 distance=2 gateway=192.168.14.1
add comment="ISP1 Visible for detection" distance=100 gateway=192.168.9.1
add comment="ISP2 Visible for detection" disabled=yes distance=100 gateway=\
    192.168.11.1
add comment="Return Path to Sub-Router" distance=1 dst-address=10.50.50.1/32 \
    gateway=10.50.50.1
add distance=1 dst-address=192.168.30.1/32 gateway=GCP-Tunnel
add distance=1 dst-address=192.168.89.0/24 gateway=GCP-Tunnel
/ip service
set telnet disabled=yes
set www address=0.0.0.0/0 port=55
set ssh disabled=yes
set api port=9728
set winbox port=9291
set api-ssl disabled=yes port=9729
/ppp aaa
set interim-update=1m
/ppp secret
add name=vpn
/radius
add address=127.0.0.1 require-message-auth=no service=hotspot timeout=3s
/radius incoming
set accept=yes port=1700
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Aden
/system identity
set name=enan_net
/system logging
add topics=dhcp
add action=disk prefix=-> topics=hotspot,info,debug
add prefix=routre topics=event
/system ntp client
set enabled=yes primary-ntp=216.239.35.0 secondary-ntp=162.159.200.1 \
    server-dns-names=time.apple.com,1.asia.pool.ntp.org
/system package update
set channel=long-term
/system routerboard settings
set enter-setup-on=delete-key
/system scheduler
add interval=1d name="user-manger save" on-event="{\
    \n:local dt [/system clock get date];\
    \n:local tm [/system clock get time];\
    \n:local d [ :pick \$dt 4 6 ];\
    \n:local mon [ :pick \$dt 0 3 ];\
    \n:local y [ :pick \$dt 7 11 ];\
    \n:local h [:pick \$tm 0 2];\
    \n:local m [:pick \$tm 3 5];\
    \n:local s [:pick \$tm 6 8];\
    \n:local dFormatted \"\$y_\$mon_\$d_\$h_\$m_\$s\";\
    \n:local dFormattedM \"\$y\$mon\$d\$h\$m\$s\";\
    \n[/tool user-manager database save name=\"disk2/enanUM_Backup__\$dFormatt\
    ed\" ];\
    \n[/system backup save name=\"disk2/enan_net-Config_Backup__\$dFormatted\"\
    \_];\
    \n};\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jul/31/2020 start-time=03:24:40
add interval=6m name=busy on-event=":foreach i in=[/ip dhcp-server lease find \
    where status=\"conflict\"] do={\r\
    \n:local valuess [/ip dhcp-server lease remove \$i];\r\
    \n}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=3m name="ZT+LG Mobile" on-event="{\r\
    \n\r\
    \n:local BlockMac [:toarray (\"00:90:4C:C5:12:38\",\"D8:31:CF:78:B2:BD\",\
    \"1C:99:4C:C3:A4:0E\",\"00:05:49:38:3A:0B\",\"F0:08:F1:69:FF:46\",\"00:03:\
    7F:04:02:12\",\"78:44:76:B1:93:E0\",\"44:6D:57:D0:24:AA\",\"78:e8:b6:2a:b9\
    :11\",\"60:A4:D0:1F:7A:10\",\"FC:42:03:DD:A5:AC\",\"A0:91:69:F5:C2:70\",\"\
    D8:90:E8:10:98:09\",\"90:06:28:E2:44:51\",\"80:5a:04:a4:f9:3c\",\"D0:5B:A8\
    :DA:3D:A8\",\"38:AA:3C:10:C6:79\",\"80:5A:04:A4:F9:3C\",\"00:03:7F:04:02:1\
    2\",\"00:90:4C:C5:12:77\",\"A0:91:69:C2:CF:4B\",\"00:03:7F:04:02:12\",\"A0\
    :91:69:F7:45:18\",\"FC:C7:34:20:F9:A4\",\"E0:19:1D:1F:B3:FF\",\"FC:2D:5E:9\
    B:85:20\",\"50:F5:20:5F:50:8F\",\"2C:FD:AB:0E:14:4E\",\"00:AE:FA:5A:64:BF\
    \",\"98:F1:70:12:AE:B4\",\"4C:66:41:0F:29:D3\",\"B0:C1:9E:AD:4D:67\",\"88:\
    C9:D0:B1:8C:B9\",\"FC:2D:5E:23:7B:21\",\"D0:5B:A8:A8:6D:6E\",\"B0:C1:9E:29\
    :9C:4A\",\"14:F4:2A:C9:E8:BB\",\"10:A5:D0:47:69:ED\",\"FC:2D:5E:9B:85:20\"\
    ,\"BC:3F:4E:1A:D8:1C\",\"B8:D7:AF:69:4C:A5\",\"84:10:0D:B4:35:EE\",\"00:00\
    :11:CF:D5:71\",\"08:D4:6A:F2:33:7E\",\"B8:B4:2E:B0:EB:98\",\"A0:8D:16:DB:4\
    1:2F\",\"98:F1:70:12:AE:B4\",\"B0:C1:9E:2F:0A:99\",\"98:00:C6:7C:39:31\",\
    \"88:C9:D0:B1:8C:B9\",\"B0:C1:9E:B8:4C:A5\",\"F8:4E:73:35:AE:AF\",\"C8:FE:\
    30:FF:C3:E5\",\"C8:FE:30:FF:C3:E5\",\"B4:79:A7:15:84:E0\",\"B8:D7:AF:69:4C\
    :A5\")];\r\
    \n\r\
    \n:for i from=0 to=([:len \$BlockMac]-1) do={\r\
    \n\r\
    \n:do {/ip hotspot cookie remove numbers=[find where mac-address =[:pick \
    \$BlockMac \$i]]} on-error={}\r\
    \n\r\
    \n}}" policy=ftp,reboot,read,write,test,sniff,sensitive,romon start-date=\
    jan/03/2021 start-time=16:53:59
add comment="add by hamza" interval=8m name=conflict on-event=":foreach i in=[\
    /ip dhcp-server lease find where status=\"conflict\"] do={\r\
    \n:local valuess [/ip dhcp-server lease remove \$i];\r\
    \n}" policy=ftp,reboot,read,write,test,sniff,sensitive,romon start-date=\
    sep/30/2021 start-time=20:42:11
add name="Cloud update" on-event="/ ip cloud force-update" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=mar/06/2022 start-time=22:36:19
add disabled=yes interval=1h name=expire_users_sched on-event=\
    "/system script run expire_user" policy=\
    ftp,reboot,read,write,policy,test,password,sniff start-date=nov/16/2022 \
    start-time=00:05:00
add name=remove-hs-dynamic on-event=":delay 10s;/queue simple remove [find nam\
    e~\"<samawi-limit>-\"];:delay 2s;/queue simple remove [find name~\"<samawi\
    -limit>-\"];:delay 2s;/queue simple remove [find dynamic=yes];:delay 2s;/q\
    ueue simple remove [find dynamic=yes];" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=1m name=lgmac on-event=lgmac policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add name=usermangre-comaand on-event="/ip hotspot disable [find ];\r\
    \n\r\
    \n/tool user-manager user remove [find where !actual-profile and uptime-us\
    ed>0s];\r\
    \n\r\
    \n/tool user-manager session close-session [find ] ;\r\
    \n\r\
    \n/tool user-manager session remove [find ] ;\r\
    \n\r\
    \n/tool user-manager database rebuild;\r\
    \n\r\
    \n/delay 30;\r\
    \n\r\
    \n/ip hotspot enable [find ];\r\
    \n\r\
    \n/system reboot;\r\
    \n\r\
    \n/y;\r\
    \n\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/04/2025 start-time=01:04:02
add name=hamza on-event=\
    "/queue simple remove numbers=[find where comment =hamza];" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=nov/17/2025 start-time=23:56:31
add interval=1d name=userman_reboot on-event=userman policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=dec/08/2025 start-time=05:45:00
add interval=1m name=Check_Shared_MAC on-event=":foreach i in=[/ip hotspot act\
    ive find] do={:local mac [/ip hotspot active get \$i mac-address];:local c\
    ount 0;:foreach j in=[/ip hotspot active find mac-address=\$mac] do={:set \
    count (\$count + 1)};:if (\$count > 1) do={/ip firewall filter add chain=f\
    orward src-mac-address=\$mac action=drop comment=\"MAC Banned 24h for shar\
    ing\" timeout=1d;/ip hotspot active remove [find mac-address=\$mac];}}" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=mar/13/2026 start-time=20:16:03
add comment=HourlyStatusReport interval=1h name=HourlyStatusReport on-event=\
    HourlyStatusReport policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=5m name=VoltageWatch on-event=":if ([/system health get voltage] \
    < 11) do={ /tool fetch url=\"https://api.telegram.org/bot/sendMessagechat_\
    id=&text=%E2%9A%A0%EF%B8%8F WARNING: Low Voltage (234V) on ENAN_MAIN!\" ke\
    ep-result=no check-certificate=no }" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=10s name=AntiSpoof on-event=AntiSpoof policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=mar/18/2026 start-time=02:59:37
add interval=1w name=Sendingtoemail on-event=Sendingtoemail policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=1m name=User_Manager_Opserver on-event=User_Manager_Opserver \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=1d name="daily cleanner" on-event=\
    "/HourlyStatusReport\
    \n/delay 2;\
    \n/Bulk Clean" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=apr/14/2026 start-time=06:43:03
add disabled=yes interval=10s name=Smart-Failover on-event="# Smart Rx/Tx Fail\
    over v11.0 (Hardware + Logical Check - Ultimate)\
    \n    :global st1; :global tm1;\
    \n    :global st2; :global tm2;\
    \n\
    \n    :if ([:typeof \$st1] = \"nothing\") do={ :set st1 \"UP\"; :set tm1 0\
    ; }\
    \n    :if ([:typeof \$st2] = \"nothing\") do={ :set st2 \"UP\"; :set tm2 0\
    ; }\
    \n\
    \n    # ================================\
    \n    # === Check ISP1 ===\
    \n    # ================================\
    \n    :local run1 [/interface get \"ISP1\" running];\
    \n    \
    \n    :if (\$run1) do={\
    \n        # ---        ---\
    \n        /interface monitor-traffic \"ISP1\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st1 = \"UP\") do={\
    \n                #   (   )\
    \n                :if (\$rx > 30000 || \$tx > 80000 || (\$rx > \$tx && \$r\
    x > 1000)) do={\
    \n                    :set tm1 0;\
    \n                } else={\
    \n                    #  \
    \n                    :if (\$tx > 20000 && \$rx < 5000) do={\
    \n                        :set tm1 (\$tm1 + 1);\
    \n                        :log warning (\"[] ISP1 Suspect: TX=\" . \$tx . \
    \" RX=\" . \$rx . \" (Strike: \" . \$tm1 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm1 >= 4) do={\
    \n                            :set st1 \"DOWN\"; :set tm1 0;\
    \n                          /ip route disable [find comment=\"Line10 Prima\
    ry\"];\
    \n                            :log error \"[!!!] ISP1 CONFIRMED DEAD (Logi\
    cal) - PCC Disabled\";\
    \n\t\t\t\t\t\t :do {/tool fetch url=\"https://api.telegram.org/bot87864665\
    93:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&tex\
    t=\\F0\\9F\\94\\B4%20Line%2010%20DOWN\" keep-result=no check-certificate=n\
    o;} on-error={ :log error \"Failed to send TG ISP1 alert\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st1 = \"DOWN\") do={\
    \n                :set tm1 (\$tm1 + 1);\
    \n                :if (\$tm1 >= 12) do={\
    \n                    :set st1 \"PROBATION\"; :set tm1 0;\
    \n                     /ip route enable [find comment=\"Line10 Primary\"];\
    \n                    :log warning \"[*] ISP1 PROBATION - Checking for Rea\
    l Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st1 = \"PROBATION\") do={\
    \n                :set tm1 (\$tm1 + 1);\
    \n                :if (\$rx > 40000 || \$tx > 80000) do={\
    \n                    :set st1 \"UP\"; :set tm1 0;\
    \n                    :log info \"[+++] ISP1 STABLE - Internet Restored\";\
    \n\t\t\t\t\t\t :do {/tool fetch url=\"https://api.telegram.org/bot87864665\
    93:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&tex\
    t=\\F0\\9F\\9F\\A2%20Line%2010%20BACK\" keep-result=no check-certificate=n\
    o;} on-error={ :log error \"Failed to send TG ISP1 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm1 >= 8) do={\
    \n                        :set st1 \"DOWN\"; :set tm1 0;\
    \n                      /ip route disable [find comment=\"Line10 Primary\"\
    ];\
    \n                        :log error \"[-] ISP1 Test Failed - Still Dead\"\
    ;\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        # ---    (Link Down) ---\
    \n        :if (\$st1 = \"UP\" || \$st1 = \"PROBATION\") do={\
    \n            :set st1 \"DOWN\"; :set tm1 0;\
    \n          /ip route disable [find comment=\"Line10 Primary\"];\
    \n            :log error \"[!!!] ISP1 PHYSICAL LINK DOWN - Cable Unplugged\
    ! (Instant Cutoff)\";\
    \n          :do {/tool fetch url=\"https://api.telegram.org/bot8786466593:\
    AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&text=\
    \\E2\\9D\\8C%20Router%2010%20Cable%20Unplugged\" keep-result=no check-cert\
    ificate=no;} on-error={ :log error \"Failed to send TG ISP1 alert\"; }\
    \n               \
    \n        }\
    \n        :if (\$st1 = \"DOWN\") do={\
    \n            #           \
    \n            :set tm1 0;\
    \n        }\
    \n    }\
    \n\
    \n    # ================================\
    \n    # === Check ISP2 ===\
    \n    # ================================\
    \n    :local run2 [/interface get \"ISP2\" running];\
    \n    \
    \n    :if (\$run2) do={\
    \n        # ---        ---\
    \n        /interface monitor-traffic \"ISP2\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st2 = \"UP\") do={\
    \n                :if (\$rx > 30000 || \$tx > 80000 || (\$rx > \$tx && \$r\
    x > 1000)) do={\
    \n                    :set tm2 0;\
    \n                } else={\
    \n                    :if (\$tx > 20000 && \$rx < 5000) do={\
    \n                        :set tm2 (\$tm2 + 1);\
    \n                        :log warning (\"[] ISP2 Suspect: TX=\" . \$tx . \
    \" RX=\" . \$rx . \" (Strike: \" . \$tm2 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm2 >= 4) do={\
    \n                            :set st2 \"DOWN\"; :set tm2 0;\
    \n                         /ip route disable [find comment=\"Line11 Primar\
    y\"];\
    \n                            :log error \"[!!!] ISP2 CONFIRMED DEAD (Logi\
    cal) - PCC Disabled\";\
    \n\t\t\t\t\t\t\t\
    \n\t\t\t\t\t\t :do {/tool fetch url=\"https://api.telegram.org/bot87864665\
    93:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&tex\
    t=\\F0\\9F\\94\\B4%20Line%2011%20DOWN\" keep-result=no check-certificate=n\
    o;} on-error={ :log error \"Failed to send TG ISP2 alert\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st2 = \"DOWN\") do={\
    \n                :set tm2 (\$tm2 + 1);\
    \n                :if (\$tm2 >= 12) do={\
    \n                    :set st2 \"PROBATION\"; :set tm2 0;\
    \n                     /ip route enable [find comment=\"Line11 Primary\"];\
    \n                    :log warning \"[*] ISP2 PROBATION - Checking for Rea\
    l Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st2 = \"PROBATION\") do={\
    \n                :set tm2 (\$tm2 + 1);\
    \n                :if (\$rx > 40000 || \$tx > 80000) do={\
    \n                    :set st2 \"UP\"; :set tm2 0;\
    \n                    :log info \"[+++] ISP2 STABLE - Internet Restored\";\
    \n\t\t\t\t\t :do {/tool fetch url=\"https://api.telegram.org/bot8786466593\
    :AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&text=\
    \\F0\\9F\\9F\\A2%20Line%2011%20BACK\" keep-result=no check-certificate=no;\
    } on-error={ :log error \"Failed to send TG ISP2 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm2 >= 8) do={\
    \n                        :set st2 \"DOWN\"; :set tm2 0;\
    \n                     /ip route disable [find comment=\"Line11 Primary\"]\
    ;\
    \n                        :log error \"[-] ISP2 Test Failed - Still Dead\"\
    ;\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        # ---    (Link Down) ---\
    \n        :if (\$st2 = \"UP\" || \$st2 = \"PROBATION\") do={\
    \n            :set st2 \"DOWN\"; :set tm2 0;\
    \n         /ip route disable [find comment=\"Line11 Primary\"];\
    \n            :log error \"[!!!] ISP2 PHYSICAL LINK DOWN - Cable Unplugged\
    ! (Instant Cutoff)\";\
    \n          :do {/tool fetch url=\"https://api.telegram.org/bot8786466593:\
    AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&text=\
    \\E2\\9D\\8C%20Router%2011%20Cable%20Unplugged\" keep-result=no check-cert\
    ificate=no;} on-error={ :log error \"Failed to send TG ISP2 alert\"; }\
    \n        }\
    \n        :if (\$st2 = \"DOWN\") do={\
    \n            :set tm2 0;\
    \n        }\
    \n    }\
    \n   \
    \n    :global st4; :global tm4;\
    \n    :global st5; :global tm5;\
    \n\
    \n    :if ([:typeof \$st4] = \"nothing\") do={ :set st4 \"UP\"; :set tm4 0\
    ; }\
    \n    :if ([:typeof \$st5] = \"nothing\") do={ :set st5 \"UP\"; :set tm5 0\
    ; }\
    \n\
    \n    # ================================\
    \n    # === Check ISP4 ===\
    \n    # ================================\
    \n    :local run4 [/interface get \"ISP4\" running];\
    \n    \
    \n    :if (\$run4) do={\
    \n        # ---        ---\
    \n        /interface monitor-traffic \"ISP4\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st4 = \"UP\") do={\
    \n                #   (   )\
    \n                :if (\$rx > 30000 || \$tx > 80000 || (\$rx > \$tx && \$r\
    x > 1000)) do={\
    \n                    :set tm4 0;\
    \n                } else={\
    \n                    #  \
    \n                    :if (\$tx > 20000 && \$rx < 5000) do={\
    \n                        :set tm4 (\$tm4 + 1);\
    \n                        :log warning (\"[] ISP4 Suspect: TX=\" . \$tx . \
    \" RX=\" . \$rx . \" (Strike: \" . \$tm4 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm4 >= 4) do={\
    \n                            :set st4 \"DOWN\"; :set tm4 0;\
    \n                          /ip route disable [find comment=\"Line12 Prima\
    ry\"];\
    \n                            :log error \"[!!!] ISP4 CONFIRMED DEAD (Logi\
    cal) - PCC Disabled\";\
    \n\t\t\t\t\t\t :do {/tool fetch url=\"https://api.telegram.org/bot87864665\
    93:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&tex\
    t=\\F0\\9F\\94\\B4%20Line%2012%20DOWN\" keep-result=no check-certificate=n\
    o;} on-error={ :log error \"Failed to send TG ISP4 alert\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st4 = \"DOWN\") do={\
    \n                :set tm4 (\$tm4 + 1);\
    \n                :if (\$tm4 >= 12) do={\
    \n                    :set st4 \"PROBATION\"; :set tm4 0;\
    \n                     /ip route enable [find comment=\"Line12 Primary\"];\
    \n                    :log warning \"[*] ISP4 PROBATION - Checking for Rea\
    l Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st4 = \"PROBATION\") do={\
    \n                :set tm4 (\$tm4 + 1);\
    \n                :if (\$rx > 40000 || \$tx > 80000) do={\
    \n                    :set st4 \"UP\"; :set tm4 0;\
    \n                    :log info \"[+++] ISP4 STABLE - Internet Restored\";\
    \n\t\t\t\t\t\t :do {/tool fetch url=\"https://api.telegram.org/bot87864665\
    93:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&tex\
    t=\\F0\\9F\\9F\\A2%20Line%2012%20BACK\" keep-result=no check-certificate=n\
    o;} on-error={ :log error \"Failed to send TG ISP4 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm4 >= 8) do={\
    \n                        :set st4 \"DOWN\"; :set tm4 0;\
    \n                      /ip route disable [find comment=\"Line12 Primary\"\
    ];\
    \n                        :log error \"[-] ISP4 Test Failed - Still Dead\"\
    ;\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        # ---    (Link Down) ---\
    \n        :if (\$st4 = \"UP\" || \$st4 = \"PROBATION\") do={\
    \n            :set st4 \"DOWN\"; :set tm4 0;\
    \n          /ip route disable [find comment=\"Line12 Primary\"];\
    \n            :log error \"[!!!] ISP4 PHYSICAL LINK DOWN - Cable Unplugged\
    ! (Instant Cutoff)\";\
    \n          :do {/tool fetch url=\"https://api.telegram.org/bot8786466593:\
    AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&text=\
    \\E2\\9D\\8C%20Router%2012%20Cable%20Unplugged\" keep-result=no check-cert\
    ificate=no;} on-error={ :log error \"Failed to send TG ISP4 alert\"; }\
    \n               \
    \n        }\
    \n        :if (\$st4 = \"DOWN\") do={\
    \n            #           \
    \n            :set tm4 0;\
    \n        }\
    \n    }\
    \n\
    \n    # ================================\
    \n    # === Check eoip-13 ===\
    \n    # ================================\
    \n    :local run5 [/interface get \"eoip-13\" running];\
    \n    \
    \n    :if (\$run5) do={\
    \n        # ---        ---\
    \n        /interface monitor-traffic \"eoip-13\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st5 = \"UP\") do={\
    \n                :if (\$rx > 30000 || \$tx > 80000 || (\$rx > \$tx && \$r\
    x > 1000)) do={\
    \n                    :set tm5 0;\
    \n                } else={\
    \n                    :if (\$tx > 20000 && \$rx < 5000) do={\
    \n                        :set tm5 (\$tm5 + 1);\
    \n                        :log warning (\"[] eoip-13 Suspect: TX=\" . \$tx\
    \_. \" RX=\" . \$rx . \" (Strike: \" . \$tm5 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm5 >= 4) do={\
    \n                            :set st5 \"DOWN\"; :set tm5 0;\
    \n                         /ip route disable [find comment=\"Line13 Primar\
    y\"];\
    \n                            :log error \"[!!!] eoip-13 CONFIRMED DEAD (L\
    ogical) - PCC Disabled\";\
    \n\t\t\t\t\t\t\t\
    \n\t\t\t\t\t\t :do {/tool fetch url=\"https://api.telegram.org/bot87864665\
    93:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&tex\
    t=\\F0\\9F\\94\\B4%20Line%2013%20DOWN\" keep-result=no check-certificate=n\
    o;} on-error={ :log error \"Failed to send TG eoip-13 alert\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st5 = \"DOWN\") do={\
    \n                :set tm5 (\$tm5 + 1);\
    \n                :if (\$tm5 >= 12) do={\
    \n                    :set st5 \"PROBATION\"; :set tm5 0;\
    \n                     /ip route enable [find comment=\"Line13 Primary\"];\
    \n                    :log warning \"[*] eoip-13 PROBATION - Checking for \
    Real Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st5 = \"PROBATION\") do={\
    \n                :set tm5 (\$tm5 + 1);\
    \n                :if (\$rx > 40000 || \$tx > 80000) do={\
    \n                    :set st5 \"UP\"; :set tm5 0;\
    \n                    :log info \"[+++] eoip-13 STABLE - Internet Restored\
    \";\
    \n\t\t\t\t\t :do {/tool fetch url=\"https://api.telegram.org/bot8786466593\
    :AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&text=\
    \\F0\\9F\\9F\\A2%20Line%2013%20BACK\" keep-result=no check-certificate=no;\
    } on-error={ :log error \"Failed to send TG eoip-13 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm5 >= 8) do={\
    \n                        :set st5 \"DOWN\"; :set tm5 0;\
    \n                     /ip route disable [find comment=\"Line13 Primary\"]\
    ;\
    \n                        :log error \"[-] eoip-13 Test Failed - Still Dea\
    d\";\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        # ---    (Link Down) ---\
    \n        :if (\$st5 = \"UP\" || \$st5 = \"PROBATION\") do={\
    \n            :set st5 \"DOWN\"; :set tm5 0;\
    \n         /ip route disable [find comment=\"Line13 Primary\"];\
    \n            :log error \"[!!!] eoip-13 PHYSICAL LINK DOWN - Cable Unplug\
    ged! (Instant Cutoff)\";\
    \n          :do {/tool fetch url=\"https://api.telegram.org/bot8786466593:\
    AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&text=\
    \\E2\\9D\\8C%20Router%2013%20Cable%20Unplugged\" keep-result=no check-cert\
    ificate=no;} on-error={ :log error \"Failed to send TG eoip-13 alert\"; }\
    \n        }\
    \n        :if (\$st5 = \"DOWN\") do={\
    \n            :set tm5 0;\
    \n        }\
    \n    }\
    \n   \
    \n    :global st6; :global tm6;\
    \n    \
    \n    :if ([:typeof \$st6] = \"nothing\") do={ :set st6 \"UP\"; :set tm6 0\
    ; }\
    \n   \
    \n    # ================================\
    \n    # === Check ISP6 ===\
    \n    # ================================\
    \n    :local run6 [/interface get \"ISP6\" running];\
    \n    \
    \n    :if (\$run6) do={\
    \n        # ---        ---\
    \n        /interface monitor-traffic \"ISP6\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st6 = \"UP\") do={\
    \n                #   (   )\
    \n                :if (\$rx > 30000 || \$tx > 80000 || (\$rx > \$tx && \$r\
    x > 1000)) do={\
    \n                    :set tm6 0;\
    \n                } else={\
    \n                    #  \
    \n                    :if (\$tx > 20000 && \$rx < 5000) do={\
    \n                        :set tm6 (\$tm6 + 1);\
    \n                        :log warning (\"[] ISP6 Suspect: TX=\" . \$tx . \
    \" RX=\" . \$rx . \" (Strike: \" . \$tm6 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm6 >= 4) do={\
    \n                            :set st6 \"DOWN\"; :set tm6 0;\
    \n                          /ip route disable [find comment=\"Line14 Prima\
    ry\"];\
    \n                            :log error \"[!!!] ISP6 CONFIRMED DEAD (Logi\
    cal) - PCC Disabled\";\
    \n\t\t\t\t\t\t :do {/tool fetch url=\"https://api.telegram.org/bot87864665\
    93:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&tex\
    t=\\F0\\9F\\94\\B4%20Line%2014%20DOWN\" keep-result=no check-certificate=n\
    o;} on-error={ :log error \"Failed to send TG ISP6 alert\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st6 = \"DOWN\") do={\
    \n                :set tm6 (\$tm6 + 1);\
    \n                :if (\$tm6 >= 12) do={\
    \n                    :set st6 \"PROBATION\"; :set tm6 0;\
    \n                     /ip route enable [find comment=\"Line14 Primary\"];\
    \n                    :log warning \"[*] ISP6 PROBATION - Checking for Rea\
    l Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st6 = \"PROBATION\") do={\
    \n                :set tm6 (\$tm6 + 1);\
    \n                :if (\$rx > 40000 || \$tx > 80000) do={\
    \n                    :set st6 \"UP\"; :set tm6 0;\
    \n                    :log info \"[+++] ISP6 STABLE - Internet Restored\";\
    \n\t\t\t\t\t\t :do {/tool fetch url=\"https://api.telegram.org/bot87864665\
    93:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&tex\
    t=\\F0\\9F\\9F\\A2%20Line%2014%20BACK\" keep-result=no check-certificate=n\
    o;} on-error={ :log error \"Failed to send TG ISP6 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm6 >= 8) do={\
    \n                        :set st6 \"DOWN\"; :set tm6 0;\
    \n                      /ip route disable [find comment=\"Line14 Primary\"\
    ];\
    \n                        :log error \"[-] ISP6 Test Failed - Still Dead\"\
    ;\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        # ---    (Link Down) ---\
    \n        :if (\$st6 = \"UP\" || \$st6 = \"PROBATION\") do={\
    \n            :set st6 \"DOWN\"; :set tm6 0;\
    \n          /ip route disable [find comment=\"Line14 Primary\"];\
    \n            :log error \"[!!!] ISP6 PHYSICAL LINK DOWN - Cable Unplugged\
    ! (Instant Cutoff)\";\
    \n          :do {/tool fetch url=\"https://api.telegram.org/bot8786466593:\
    AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessage\?chat_id=7562205396&text=\
    \\E2\\9D\\8C%20Router%2014%20Cable%20Unplugged\" keep-result=no check-cert\
    ificate=no;} on-error={ :log error \"Failed to send TG ISP6 alert\"; }\
    \n               \
    \n        }\
    \n        :if (\$st6 = \"DOWN\") do={\
    \n            #           \
    \n            :set tm6 0;\
    \n        }\
    \n    }\
    \n" policy=read,write,policy,test start-time=startup
add disabled=yes interval=5s name=ISP3-Trunk-Monitor on-event="\
    \n    # ISP3 Trunk Monitor - TEST MODE (Log Only - No Actual Disconnect)\
    \n    #        \
    \n    :global st3; :global tm3;\
    \n\
    \n    :if ([:typeof \$st3] = \"nothing\") do={ :set st3 \"UP\"; :set tm3 0\
    ; }\
    \n\
    \n    # ==================================================\
    \n    # === Check ISP3 (   ) ===\
    \n    # ==================================================\
    \n    :local run3 [/interface get \"ISP3\" running];\
    \n    \
    \n    :if (\$run3) do={\
    \n        # ---       ---\
    \n        /interface monitor-traffic \"ISP3\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st3 = \"UP\") do={\
    \n                #      (   )\
    \n                :if (\$rx > 150000 || \$tx > 200000 || (\$rx > \$tx && \
    \$rx > 30000)) do={\
    \n                    :set tm3 0;\
    \n                } else={\
    \n                    # :        \
    \n                    :if (\$tx > 20000 && \$rx < 60000) do={\
    \n                        :set tm3 (\$tm3 + 1);\
    \n                        :log warning (\"[] ISP3 (Trunk) Suspect: TX=\" .\
    \_\$tx . \" RX=\" . \$rx . \" (Strike: \" . \$tm3 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm3 >= 4) do={\
    \n                            :set st3 \"DOWN\"; :set tm3 0;\
    \n                            #    \
    \n                            # /ip firewall mangle disable [find comment=\
    \"PCC-ISP3\"]\
    \n                            :log error \"[TEST MODE] ISP3 WOULD BE KILLE\
    D HERE (Logical Dead) - But kept active for testing\";\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st3 = \"DOWN\") do={\
    \n                :set tm3 (\$tm3 + 1);\
    \n                :if (\$tm3 >= 12) do={\
    \n                    :set st3 \"PROBATION\"; :set tm3 0;\
    \n                    #    \
    \n                    # /ip firewall mangle enable [find comment=\"PCC-ISP\
    3\"]\
    \n                    :log warning \"[*] ISP3 PROBATION - Checking for Rea\
    l Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st3 = \"PROBATION\") do={\
    \n                :set tm3 (\$tm3 + 1);\
    \n                #    \
    \n                :if (\$rx > 150000 || \$tx > 200000 || (\$rx > \$tx && \
    \$rx > 30000)) do={\
    \n                    :set st3 \"UP\"; :set tm3 0;\
    \n                    :log info \"[+++] ISP3 STABLE - Internet Restored ov\
    er Trunk\";\
    \n                } else={\
    \n                    :if (\$tm3 >= 4) do={\
    \n                        :set st3 \"DOWN\"; :set tm3 0;\
    \n                        #    \
    \n                        # /ip firewall mangle disable [find comment=\"PC\
    C-ISP3\"]\
    \n                        :log error \"[TEST MODE] ISP3 Probation Failed -\
    \_WOULD BE KILLED AGAIN\";\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        # ---      ---\
    \n        :if (\$st3 = \"UP\" || \$st3 = \"PROBATION\") do={\
    \n            :set st3 \"DOWN\"; :set tm3 0;\
    \n            #    \
    \n            # /ip firewall mangle disable [find comment=\"PCC-ISP3\"]\
    \n            :log error \"[TEST MODE] ISP3 PHYSICAL LINK DOWN - Antenna U\
    nplugged! WOULD BE KILLED INSTANTLY\";\
    \n        }\
    \n        :if (\$st3 = \"DOWN\") do={\
    \n            :set tm3 0;\
    \n        }\
    \n    }\
    \n" policy=read,write,policy,test start-time=startup
add interval=20s name=TelegramRemote on-event=TelegramRemote policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=apr/29/2026 start-time=04:08:05
add interval=1d name=expire_user_remove_notifi on-event=\
    expire_user_remove_notifi policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=may/04/2026 start-time=05:50:00
add disabled=yes interval=10s name=check_failed_sched on-event=\
    "/system script run check_failed_lines" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=8s name="L3-VLAN Flavour" on-event="\
    \n    # Smart Rx/Tx Failover v11.3 (VLAN Trunk Edition - Noise Filtered)\
    \n    :global st19; :global tm19;\
    \n    :global st20; :global tm20;\
    \n    :global st21; :global tm21;\
    \n    :global st22; :global tm22;\
    \n\
    \n    :if ([:typeof \$st19] = \"nothing\") do={ :set st19 \"UP\"; :set tm1\
    9 0; }\
    \n    :if ([:typeof \$st20] = \"nothing\") do={ :set st20 \"UP\"; :set tm2\
    0 0; }\
    \n    :if ([:typeof \$st21] = \"nothing\") do={ :set st21 \"UP\"; :set tm2\
    1 0; }\
    \n    :if ([:typeof \$st22] = \"nothing\") do={ :set st22 \"UP\"; :set tm2\
    2 0; }\
    \n\
    \n    # ==========================================\
    \n    # === Check VLAN- 19 (VLAN-2019-L3) ===\
    \n    # ==========================================\
    \n    :local run1 [/interface get \"VLAN-2019-L3\" running];\
    \n    \
    \n    :if (\$run1) do={\
    \n        /interface monitor-traffic \"VLAN-2019-L3\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st19 = \"UP\") do={\
    \n                #   (     > 40k)\
    \n                :if (\$rx > 150000 || \$tx > 200000 || (\$rx > \$tx && \
    \$rx > 30000)) do={\
    \n                    :set tm19 0;\
    \n                } else={\
    \n                    # :   > 25k       < 15k\
    \n                    :if (\$tx > 20000 && \$rx < 60000) do={\
    \n                        :set tm19 (\$tm19 + 1);\
    \n                        :log warning (\"[] VLAN-2019 Suspect: TX=\" . \$\
    tx . \" RX=\" . \$rx . \" (Strike: \" . \$tm19 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm19 >= 4) do={\
    \n                            :set st19 \"DOWN\"; :set tm19 0;\
    \n                            /ip route disable [find comment=\"Line19 Pri\
    mary\"];\
    \n                            :log error \"[!!!] VLAN-2019 CONFIRMED DEAD \
    (Logical) - Route Disabled\";\
    \n                            :do {/tool fetch url=\"https://api.telegram.\
    org/bot8786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7\
    562205396&text=\\F0\\9F\\94\\B4%20VLAN-%2019%20DOWN\" keep-result=no check\
    -certificate=no;} on-error={ :log error \"Failed to send TG VLAN-2019 aler\
    t\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st19 = \"DOWN\") do={\
    \n                :set tm19 (\$tm19 + 1);\
    \n                :if (\$tm19 >= 12) do={\
    \n                    :set st19 \"PROBATION\"; :set tm19 0;\
    \n                    /ip route enable [find comment=\"Line19 Primary\"];\
    \n                    :log warning \"[*] VLAN-2019 PROBATION - Checking fo\
    r Real Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st19 = \"PROBATION\") do={\
    \n                :set tm19 (\$tm19 + 1);\
    \n                :if (\$rx > 150000 || \$tx > 200000) do={\
    \n                    :set st19 \"UP\"; :set tm19 0;\
    \n                    :log info \"[+++] VLAN-2019 STABLE - Internet Restor\
    ed\";\
    \n                    :do {/tool fetch url=\"https://api.telegram.org/bot8\
    786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=756220539\
    6&text=\\F0\\9F\\9F\\A2%20VLAN-%2019%20BACK\" keep-result=no check-certifi\
    cate=no;} on-error={ :log error \"Failed to send TG VLAN-2019 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm19 >= 8) do={\
    \n                        :set st19 \"DOWN\"; :set tm19 0;\
    \n                        /ip route disable [find comment=\"Line19 Primary\
    \"];\
    \n                        :log error \"[-] VLAN-2019 Test Failed - Still D\
    ead\";\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        :if (\$st19 = \"UP\" || \$st19 = \"PROBATION\") do={\
    \n            :set st19 \"DOWN\"; :set tm19 0;\
    \n            /ip route disable [find comment=\"Line19 Primary\"];\
    \n            :log error \"[!!!] VLAN-2019 PHYSICAL LINK DOWN (Instant Cut\
    off)\";\
    \n            :do {/tool fetch url=\"https://api.telegram.org/bot878646659\
    3:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7562205396&text=\
    \\E2\\9D\\8C%20VLAN-%2019%20Cable%20Unplugged\" keep-result=no check-certi\
    ficate=no;} on-error={ :log error \"Failed to send TG VLAN-2019 alert\"; }\
    \n        }\
    \n        :if (\$st19 = \"DOWN\") do={\
    \n            :set tm19 0;\
    \n        }\
    \n    }\
    \n\
    \n    # ==========================================\
    \n    # === Check VLAN- 20 (VLAN-2020-L3) ===\
    \n    # ==========================================\
    \n    :local run2 [/interface get \"VLAN-2020-L3\" running];\
    \n    \
    \n    :if (\$run2) do={\
    \n        /interface monitor-traffic \"VLAN-2020-L3\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st20 = \"UP\") do={\
    \n                :if (\$rx > 40000 || \$tx > 80000 || (\$rx > \$tx && \$r\
    x > 15000)) do={\
    \n                    :set tm20 0;\
    \n                } else={\
    \n                    :if (\$tx > 25000 && \$rx < 15000) do={\
    \n                        :set tm20 (\$tm20 + 1);\
    \n                        :log warning (\"[] VLAN-2020 Suspect: TX=\" . \$\
    tx . \" RX=\" . \$rx . \" (Strike: \" . \$tm20 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm20 >= 4) do={\
    \n                            :set st20 \"DOWN\"; :set tm20 0;\
    \n                            /ip route disable [find comment=\"Line20 Pri\
    mary\"];\
    \n                            :log error \"[!!!] VLAN-2020 CONFIRMED DEAD \
    (Logical) - Route Disabled\";\
    \n                            :do {/tool fetch url=\"https://api.telegram.\
    org/bot8786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7\
    562205396&text=\\F0\\9F\\94\\B4%20VLAN-%2020%20DOWN\" keep-result=no check\
    -certificate=no;} on-error={ :log error \"Failed to send TG VLAN-2020 aler\
    t\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st20 = \"DOWN\") do={\
    \n                :set tm20 (\$tm20 + 1);\
    \n                :if (\$tm20 >= 12) do={\
    \n                    :set st20 \"PROBATION\"; :set tm20 0;\
    \n                    /ip route enable [find comment=\"Line20 Primary\"];\
    \n                    :log warning \"[*] VLAN-2020 PROBATION - Checking fo\
    r Real Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st20 = \"PROBATION\") do={\
    \n                :set tm20 (\$tm20 + 1);\
    \n                :if (\$rx > 40000 || \$tx > 80000) do={\
    \n                    :set st20 \"UP\"; :set tm20 0;\
    \n                    :log info \"[+++] VLAN-2020 STABLE - Internet Restor\
    ed\";\
    \n                    :do {/tool fetch url=\"https://api.telegram.org/bot8\
    786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=756220539\
    6&text=\\F0\\9F\\9F\\A2%20VLAN-%2020%20BACK\" keep-result=no check-certifi\
    cate=no;} on-error={ :log error \"Failed to send TG VLAN-2020 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm20 >= 8) do={\
    \n                        :set st20 \"DOWN\"; :set tm20 0;\
    \n                        /ip route disable [find comment=\"Line20 Primary\
    \"];\
    \n                        :log error \"[-] VLAN-2020 Test Failed - Still D\
    ead\";\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        :if (\$st20 = \"UP\" || \$st20 = \"PROBATION\") do={\
    \n            :set st20 \"DOWN\"; :set tm20 0;\
    \n            /ip route disable [find comment=\"Line20 Primary\"];\
    \n            :log error \"[!!!] VLAN-2020 PHYSICAL LINK DOWN (Instant Cut\
    off)\";\
    \n            :do {/tool fetch url=\"https://api.telegram.org/bot878646659\
    3:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7562205396&text=\
    \\E2\\9D\\8C%20VLAN-%2020%20Cable%20Unplugged\" keep-result=no check-certi\
    ficate=no;} on-error={ :log error \"Failed to send TG VLAN-2020 alert\"; }\
    \n        }\
    \n        :if (\$st20 = \"DOWN\") do={\
    \n            :set tm20 0;\
    \n        }\
    \n    }\
    \n\
    \n    # ==========================================\
    \n    # === Check VLAN- 21 (VLAN-2021-L3) ===\
    \n    # ==========================================\
    \n    :local run3 [/interface get \"VLAN-2021-L3\" running];\
    \n    \
    \n    :if (\$run3) do={\
    \n        /interface monitor-traffic \"VLAN-2021-L3\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st21 = \"UP\") do={\
    \n                :if (\$rx > 40000 || \$tx > 80000 || (\$rx > \$tx && \$r\
    x > 15000)) do={\
    \n                    :set tm21 0;\
    \n                } else={\
    \n                    :if (\$tx > 25000 && \$rx < 15000) do={\
    \n                        :set tm21 (\$tm21 + 1);\
    \n                        :log warning (\"[] VLAN-2021 Suspect: TX=\" . \$\
    tx . \" RX=\" . \$rx . \" (Strike: \" . \$tm21 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm21 >= 4) do={\
    \n                            :set st21 \"DOWN\"; :set tm21 0;\
    \n                            /ip route disable [find comment=\"VLAN-21 Pr\
    imary\"];\
    \n                            :log error \"[!!!] VLAN-2021 CONFIRMED DEAD \
    (Logical) - Route Disabled\";\
    \n                            :do {/tool fetch url=\"https://api.telegram.\
    org/bot8786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7\
    562205396&text=\\F0\\9F\\94\\B4%20VLAN-%2021%20DOWN\" keep-result=no check\
    -certificate=no;} on-error={ :log error \"Failed to send TG VLAN-2021 aler\
    t\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st21 = \"DOWN\") do={\
    \n                :set tm21 (\$tm21 + 1);\
    \n                :if (\$tm21 >= 12) do={\
    \n                    :set st21 \"PROBATION\"; :set tm21 0;\
    \n                    /ip route enable [find comment=\"VLAN-21 Primary\"];\
    \n                    :log warning \"[*] VLAN-2021 PROBATION - Checking fo\
    r Real Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st21 = \"PROBATION\") do={\
    \n                :set tm21 (\$tm21 + 1);\
    \n                :if (\$rx > 40000 || \$tx > 80000) do={\
    \n                    :set st21 \"UP\"; :set tm21 0;\
    \n                    :log info \"[+++] VLAN-2021 STABLE - Internet Restor\
    ed\";\
    \n                    :do {/tool fetch url=\"https://api.telegram.org/bot8\
    786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=756220539\
    6&text=\\F0\\9F\\9F\\A2%20VLAN-%2021%20BACK\" keep-result=no check-certifi\
    cate=no;} on-error={ :log error \"Failed to send TG VLAN-2021 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm21 >= 8) do={\
    \n                        :set st21 \"DOWN\"; :set tm21 0;\
    \n                        /ip route disable [find comment=\"VLAN-21 Primar\
    y\"];\
    \n                        :log error \"[-] VLAN-2021 Test Failed - Still D\
    ead\";\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        :if (\$st21 = \"UP\" || \$st21 = \"PROBATION\") do={\
    \n            :set st21 \"DOWN\"; :set tm21 0;\
    \n            /ip route disable [find comment=\"VLAN-21 Primary\"];\
    \n            :log error \"[!!!] VLAN-2021 PHYSICAL LINK DOWN (Instant Cut\
    off)\";\
    \n            :do {/tool fetch url=\"https://api.telegram.org/bot878646659\
    3:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7562205396&text=\
    \\E2\\9D\\8C%20VLAN-%2021%20Cable%20Unplugged\" keep-result=no check-certi\
    ficate=no;} on-error={ :log error \"Failed to send TG VLAN-2021 alert\"; }\
    \n        }\
    \n        :if (\$st21 = \"DOWN\") do={\
    \n            :set tm21 0;\
    \n        }\
    \n    }\
    \n\
    \n    # ==========================================\
    \n    # === Check VLAN- 22 (VLAN-2022-L3) ===\
    \n    # ==========================================\
    \n    :local run4 [/interface get \"VLAN-2022-L3\" running];\
    \n    \
    \n    :if (\$run4) do={\
    \n        /interface monitor-traffic \"VLAN-2022-L3\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st22 = \"UP\") do={\
    \n                :if (\$rx > 40000 || \$tx > 80000 || (\$rx > \$tx && \$r\
    x > 15000)) do={\
    \n                    :set tm22 0;\
    \n                } else={\
    \n                    :if (\$tx > 20000 && \$rx < 60000) do={\
    \n                        :set tm22 (\$tm22 + 1);\
    \n                        :log warning (\"[] VLAN-2022 Suspect: TX=\" . \$\
    tx . \" RX=\" . \$rx . \" (Strike: \" . \$tm22 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm22 >= 4) do={\
    \n                            :set st22 \"DOWN\"; :set tm22 0;\
    \n                            /ip route disable [find comment=\"Line22 Pri\
    mary\"];\
    \n                            :log error \"[!!!] VLAN-2022 CONFIRMED DEAD \
    (Logical) - Route Disabled\";\
    \n                            :do {/tool fetch url=\"https://api.telegram.\
    org/bot8786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7\
    562205396&text=\\F0\\9F\\94\\B4%20VLAN-%2022%20DOWN\" keep-result=no check\
    -certificate=no;} on-error={ :log error \"Failed to send TG VLAN-2022 aler\
    t\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st22 = \"DOWN\") do={\
    \n                :set tm22 (\$tm22 + 1);\
    \n                :if (\$tm22 >= 12) do={\
    \n                    :set st22 \"PROBATION\"; :set tm22 0;\
    \n                    /ip route enable [find comment=\"Line22 Primary\"];\
    \n                    :log warning \"[*] VLAN-2022 PROBATION - Checking fo\
    r Real Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st22 = \"PROBATION\") do={\
    \n                :set tm22 (\$tm22 + 1);\
    \n                :if (\$rx > 40000 || \$tx > 80000) do={\
    \n                    :set st22 \"UP\"; :set tm22 0;\
    \n                    :log info \"[+++] VLAN-2022 STABLE - Internet Restor\
    ed\";\
    \n                    :do {/tool fetch url=\"https://api.telegram.org/bot8\
    786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=756220539\
    6&text=\\F0\\9F\\9F\\A2%20VLAN-%2022%20BACK\" keep-result=no check-certifi\
    cate=no;} on-error={ :log error \"Failed to send TG VLAN-2022 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm22 >= 8) do={\
    \n                        :set st22 \"DOWN\"; :set tm22 0;\
    \n                        /ip route disable [find comment=\"Line22 Primary\
    \"];\
    \n                        :log error \"[-] VLAN-2022 Test Failed - Still D\
    ead\";\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        :if (\$st22 = \"UP\" || \$st22 = \"PROBATION\") do={\
    \n            :set st22 \"DOWN\"; :set tm22 0;\
    \n            /ip route disable [find comment=\"Line22 Primary\"];\
    \n            :log error \"[!!!] VLAN-2022 PHYSICAL LINK DOWN (Instant Cut\
    off)\";\
    \n            :do {/tool fetch url=\"https://api.telegram.org/bot878646659\
    3:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7562205396&text=\
    \\E2\\9D\\8C%20VLAN-%2022%20Cable%20Unplugged\" keep-result=no check-certi\
    ficate=no;} on-error={ :log error \"Failed to send TG VLAN-2022 alert\"; }\
    \n        }\
    \n        :if (\$st22 = \"DOWN\") do={\
    \n            :set tm22 0;\
    \n        }\
    \n    }\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=1d name="Daily report" on-event=Telegram-Daily-Report policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jun/21/2026 start-time=05:40:00
add interval=1d name=user-usage-mb on-event="A user-usage-mb" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/1970 start-time=05:30:00
add interval=1d name=schedule2 on-event="A user-usage-mb" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jun/27/2026 start-time=20:20:00
add disabled=yes interval=5s name=A_test on-event=A policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add disabled=yes interval=5s name=A_test21 on-event="   :global st212; :global\
    \_tm212;\
    \n\
    \n    :if ([:typeof \$st2122] = \"nothing\") do={ :set st212 \"UP\"; :set \
    tm212 0; }\
    \n    # ==========================================\
    \n    # === Check Line 21 (VLAN-2021-L1) ===\
    \n    # ==========================================\
    \n    :local run3 [/interface get \"VLAN-2021-L1\" running];\
    \n    \
    \n    :if (\$run3) do={\
    \n        /interface monitor-traffic \"VLAN-2021-L1\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st212 = \"UP\") do={\
    \n                :if (\$rx > 80000 || \$tx > 150000 || (\$rx > \$tx && \$\
    rx > 15000)) do={\
    \n                    :set tm212 0;\
    \n                } else={\
    \n                    :if (\$tx > 20000 && \$rx < 60000) do={\
    \n                        :set tm212 (\$tm212 + 1);\
    \n                        :log warning (\"Line21 Suspect: TX=\" . \$tx . \
    \" RX=\" . \$rx . \" (Strike: \" . \$tm212 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm212 >= 4) do={\
    \n                            :set st212 \"DOWN\"; :set tm212 0;\
    \n                            /ip route disable [find comment=\"Line21 Pri\
    mary\"];\
    \n                            :log error \"[!!!] Line21 CONFIRMED DEAD (Lo\
    gical) - Route Disabled\";\
    \n                            :do {/tool fetch url=\"https://api.telegram.\
    org/bot8786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7\
    562205396&text=\\F0\\9F\\94\\B4%20Line%2021%20DOWN\" keep-result=no check-\
    certificate=no;} on-error={ :log error \"Failed to send TG VLAN-2021 alert\
    \"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st212 = \"DOWN\") do={\
    \n                :set tm212 (\$tm212 + 1);\
    \n                :if (\$tm212 >= 12) do={\
    \n                    :set st212 \"PROBATION\"; :set tm212 0;\
    \n                    /ip route enable [find comment=\"Line21 Primary\"];\
    \n                    :log warning \"[*] Line21 PROBATION - Checking for R\
    eal Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st212 = \"PROBATION\") do={\
    \n                :set tm212 (\$tm212 + 1);\
    \n                :if (\$rx > 80000 || \$tx > 150000) do={\
    \n                    :set st212 \"UP\"; :set tm212 0;\
    \n                    :log info \"[+++] Line21 STABLE - Internet Restored\
    \";\
    \n                    :do {/tool fetch url=\"https://api.telegram.org/bot8\
    786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=756220539\
    6&text=\\F0\\9F\\9F\\A2%20Line%2021%20BACK\" keep-result=no check-certific\
    ate=no;} on-error={ :log error \"Failed to send TG VLAN-2021 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm212 >= 8) do={\
    \n                        :set st212 \"DOWN\"; :set tm212 0;\
    \n                        /ip route disable [find comment=\"Line21 Primary\
    \"];\
    \n                        :log error \"[-] Line21 Test Failed - Still Dead\
    \";\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        :if (\$st212 = \"UP\" || \$st212 = \"PROBATION\") do={\
    \n            :set st212 \"DOWN\"; :set tm212 0;\
    \n            /ip route disable [find comment=\"Line21 Primary\"];\
    \n            :log error \"[!!!] Line21 PHYSICAL LINK DOWN (Instant Cutoff\
    )\";\
    \n            :do {/tool fetch url=\"https://api.telegram.org/bot878646659\
    3:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7562205396&text=\
    \\E2\\9D\\8C%20Router%2021%20Cable%20Unplugged\" keep-result=no check-cert\
    ificate=no;} on-error={ :log error \"Failed to send TG VLAN-2021 alert\"; \
    }\
    \n        }\
    \n        :if (\$st212 = \"DOWN\") do={\
    \n            :set tm212 0;\
    \n        }\
    \n    }\
    \n" policy=read,write,policy,test start-time=startup
add interval=1d name=speed_open on-event="queue simple rem [f]" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jul/02/2026 start-time=00:00:00
add interval=1d name=reset_selected_um_users on-event="\
    \n    :local users {\"772838\"};\
    \n    :local d [/system clock get date];\
    \n    :local m [:pick \$d 0 3];\
    \n    :local day [:pick \$d 4 6];\
    \n    :local y [:pick \$d 7 11];\
    \n\
    \n    :if (\$day=\"4\") do={\
    \n        :local marker (\"um_reset_\" . \$m . \"_\" . \$y);\
    \n        :if ([:len [/file find name=\$marker]] = 0) do={\
    \n            :foreach uname in=\$users do={\
    \n                :local uid [/tool user-manager user find where username=\
    \$uname];\
    \n                :if ([:len \$uid] > 0) do={\
    \n                    :foreach i in=\$uid do={\
    \n                        /tool user-manager user reset-counters \$i;\
    \n                    };\
    \n                };\
    \n            };\
    \n            /file print file=\$marker;\
    \n            :log info \"Selected User Manager users counters reset for t\
    his month\";\
    \n        };\
    \n    };\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jul/04/2026 start-time=00:05:00
add interval=8s name="L1-VLAN FLAVOR" on-event="\
    \n    # Smart Rx/Tx Failover v11.3 (VLAN Trunk Edition - Noise Filtered)\
    \n    :global st11; :global tm11;\
    \n    :global st12; :global tm12;\
    \n    :global st13; :global tm13;\
    \n    :global st14; :global tm14;\
    \n\
    \n    :if ([:typeof \$st11] = \"nothing\") do={ :set st11 \"UP\"; :set tm1\
    1 0; }\
    \n    :if ([:typeof \$st12] = \"nothing\") do={ :set st12 \"UP\"; :set tm1\
    2 0; }\
    \n    :if ([:typeof \$st13] = \"nothing\") do={ :set st13 \"UP\"; :set tm1\
    3 0; }\
    \n    :if ([:typeof \$st14] = \"nothing\") do={ :set st14 \"UP\"; :set tm1\
    4 0; }\
    \n\
    \n    # ==========================================\
    \n    # === Check VLAN- 11 (VLAN-2011-L1) ===\
    \n    # ==========================================\
    \n    :local run1 [/interface get \"VLAN-2011-L1\" running];\
    \n    \
    \n    :if (\$run1) do={\
    \n        /interface monitor-traffic \"VLAN-2011-L1\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st11 = \"UP\") do={\
    \n                #   (     > 40k)\
    \n                :if (\$rx > 150000 || \$tx > 200000 || (\$rx > \$tx && \
    \$rx > 30000)) do={\
    \n                    :set tm11 0;\
    \n                } else={\
    \n                    # :   > 25k       < 15k\
    \n                    :if (\$tx > 20000 && \$rx < 60000) do={\
    \n                        :set tm11 (\$tm11 + 1);\
    \n                        :log warning (\"[] VLAN-2011 Suspect: TX=\" . \$\
    tx . \" RX=\" . \$rx . \" (Strike: \" . \$tm11 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm11 >= 4) do={\
    \n                            :set st11 \"DOWN\"; :set tm11 0;\
    \n                            /ip route disable [find comment=\"Line11 Pri\
    mary\"];\
    \n                            :log error \"[!!!] VLAN-2011 CONFIRMED DEAD \
    (Logical) - Route Disabled\";\
    \n                            :do {/tool fetch url=\"https://api.telegram.\
    org/bot8786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7\
    562205396&text=\\F0\\9F\\94\\B4%20VLAN-%2011%20DOWN\" keep-result=no check\
    -certificate=no;} on-error={ :log error \"Failed to send TG VLAN-2011 aler\
    t\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st11 = \"DOWN\") do={\
    \n                :set tm11 (\$tm11 + 1);\
    \n                :if (\$tm11 >= 12) do={\
    \n                    :set st11 \"PROBATION\"; :set tm11 0;\
    \n                    /ip route enable [find comment=\"Line11 Primary\"];\
    \n                    :log warning \"[*] VLAN-2011 PROBATION - Checking fo\
    r Real Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st11 = \"PROBATION\") do={\
    \n                :set tm11 (\$tm11 + 1);\
    \n                :if (\$rx > 150000 || \$tx > 200000) do={\
    \n                    :set st11 \"UP\"; :set tm11 0;\
    \n                    :log info \"[+++] VLAN-2011 STABLE - Internet Restor\
    ed\";\
    \n                    :do {/tool fetch url=\"https://api.telegram.org/bot8\
    786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=756220539\
    6&text=\\F0\\9F\\9F\\A2%20VLAN-%2011%20BACK\" keep-result=no check-certifi\
    cate=no;} on-error={ :log error \"Failed to send TG VLAN-2011 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm11 >= 8) do={\
    \n                        :set st11 \"DOWN\"; :set tm11 0;\
    \n                        /ip route disable [find comment=\"Line11 Primary\
    \"];\
    \n                        :log error \"[-] VLAN-2011 Test Failed - Still D\
    ead\";\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        :if (\$st11 = \"UP\" || \$st11 = \"PROBATION\") do={\
    \n            :set st11 \"DOWN\"; :set tm11 0;\
    \n            /ip route disable [find comment=\"Line11 Primary\"];\
    \n            :log error \"[!!!] VLAN-2011 PHYSICAL LINK DOWN (Instant Cut\
    off)\";\
    \n            :do {/tool fetch url=\"https://api.telegram.org/bot878646659\
    3:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7562205396&text=\
    \\E2\\9D\\8C%20VLAN-%2011%20Cable%20Unplugged\" keep-result=no check-certi\
    ficate=no;} on-error={ :log error \"Failed to send TG VLAN-2011 alert\"; }\
    \n        }\
    \n        :if (\$st11 = \"DOWN\") do={\
    \n            :set tm11 0;\
    \n        }\
    \n    }\
    \n\
    \n    # ==========================================\
    \n    # === Check VLAN- 12 (VLAN-2012-L1) ===\
    \n    # ==========================================\
    \n    :local run2 [/interface get \"VLAN-2012-L1\" running];\
    \n    \
    \n    :if (\$run2) do={\
    \n        /interface monitor-traffic \"VLAN-2012-L1\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st12 = \"UP\") do={\
    \n                :if (\$rx > 40000 || \$tx > 80000 || (\$rx > \$tx && \$r\
    x > 15000)) do={\
    \n                    :set tm12 0;\
    \n                } else={\
    \n                    :if (\$tx > 25000 && \$rx < 15000) do={\
    \n                        :set tm12 (\$tm12 + 1);\
    \n                        :log warning (\"[] VLAN-2012 Suspect: TX=\" . \$\
    tx . \" RX=\" . \$rx . \" (Strike: \" . \$tm12 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm12 >= 4) do={\
    \n                            :set st12 \"DOWN\"; :set tm12 0;\
    \n                            /ip route disable [find comment=\"Line12 Pri\
    mary\"];\
    \n                            :log error \"[!!!] VLAN-2012 CONFIRMED DEAD \
    (Logical) - Route Disabled\";\
    \n                            :do {/tool fetch url=\"https://api.telegram.\
    org/bot8786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7\
    562205396&text=\\F0\\9F\\94\\B4%20VLAN-%2012%20DOWN\" keep-result=no check\
    -certificate=no;} on-error={ :log error \"Failed to send TG VLAN-2012 aler\
    t\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st12 = \"DOWN\") do={\
    \n                :set tm12 (\$tm12 + 1);\
    \n                :if (\$tm12 >= 12) do={\
    \n                    :set st12 \"PROBATION\"; :set tm12 0;\
    \n                    /ip route enable [find comment=\"Line12 Primary\"];\
    \n                    :log warning \"[*] VLAN-2012 PROBATION - Checking fo\
    r Real Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st12 = \"PROBATION\") do={\
    \n                :set tm12 (\$tm12 + 1);\
    \n                :if (\$rx > 40000 || \$tx > 80000) do={\
    \n                    :set st12 \"UP\"; :set tm12 0;\
    \n                    :log info \"[+++] VLAN-2012 STABLE - Internet Restor\
    ed\";\
    \n                    :do {/tool fetch url=\"https://api.telegram.org/bot8\
    786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=756220539\
    6&text=\\F0\\9F\\9F\\A2%20VLAN-%2012%20BACK\" keep-result=no check-certifi\
    cate=no;} on-error={ :log error \"Failed to send TG VLAN-2012 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm12 >= 8) do={\
    \n                        :set st12 \"DOWN\"; :set tm12 0;\
    \n                        /ip route disable [find comment=\"Line12 Primary\
    \"];\
    \n                        :log error \"[-] VLAN-2012 Test Failed - Still D\
    ead\";\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        :if (\$st12 = \"UP\" || \$st12 = \"PROBATION\") do={\
    \n            :set st12 \"DOWN\"; :set tm12 0;\
    \n            /ip route disable [find comment=\"Line12 Primary\"];\
    \n            :log error \"[!!!] VLAN-2012 PHYSICAL LINK DOWN (Instant Cut\
    off)\";\
    \n            :do {/tool fetch url=\"https://api.telegram.org/bot878646659\
    3:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7562205396&text=\
    \\E2\\9D\\8C%20VLAN-%2012%20Cable%20Unplugged\" keep-result=no check-certi\
    ficate=no;} on-error={ :log error \"Failed to send TG VLAN-2012 alert\"; }\
    \n        }\
    \n        :if (\$st12 = \"DOWN\") do={\
    \n            :set tm12 0;\
    \n        }\
    \n    }\
    \n\
    \n    # ==========================================\
    \n    # === Check VLAN- 13 (VLAN-2013-L1) ===\
    \n    # ==========================================\
    \n    :local run3 [/interface get \"VLAN-2013-L1\" running];\
    \n    \
    \n    :if (\$run3) do={\
    \n        /interface monitor-traffic \"VLAN-2013-L1\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st13 = \"UP\") do={\
    \n                :if (\$rx > 40000 || \$tx > 80000 || (\$rx > \$tx && \$r\
    x > 15000)) do={\
    \n                    :set tm13 0;\
    \n                } else={\
    \n                    :if (\$tx > 25000 && \$rx < 15000) do={\
    \n                        :set tm13 (\$tm13 + 1);\
    \n                        :log warning (\"[] VLAN-2013 Suspect: TX=\" . \$\
    tx . \" RX=\" . \$rx . \" (Strike: \" . \$tm13 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm13 >= 4) do={\
    \n                            :set st13 \"DOWN\"; :set tm13 0;\
    \n                            /ip route disable [find comment=\"Line13 Pri\
    mary\"];\
    \n                            :log error \"[!!!] VLAN-2013 CONFIRMED DEAD \
    (Logical) - Route Disabled\";\
    \n                            :do {/tool fetch url=\"https://api.telegram.\
    org/bot8786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7\
    562205396&text=\\F0\\9F\\94\\B4%20VLAN-%2013%20DOWN\" keep-result=no check\
    -certificate=no;} on-error={ :log error \"Failed to send TG VLAN-2013 aler\
    t\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st13 = \"DOWN\") do={\
    \n                :set tm13 (\$tm13 + 1);\
    \n                :if (\$tm13 >= 12) do={\
    \n                    :set st13 \"PROBATION\"; :set tm13 0;\
    \n                    /ip route enable [find comment=\"Line13 Primary\"];\
    \n                    :log warning \"[*] VLAN-2013 PROBATION - Checking fo\
    r Real Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st13 = \"PROBATION\") do={\
    \n                :set tm13 (\$tm13 + 1);\
    \n                :if (\$rx > 40000 || \$tx > 80000) do={\
    \n                    :set st13 \"UP\"; :set tm13 0;\
    \n                    :log info \"[+++] VLAN-2013 STABLE - Internet Restor\
    ed\";\
    \n                    :do {/tool fetch url=\"https://api.telegram.org/bot8\
    786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=756220539\
    6&text=\\F0\\9F\\9F\\A2%20VLAN-%2013%20BACK\" keep-result=no check-certifi\
    cate=no;} on-error={ :log error \"Failed to send TG VLAN-2013 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm13 >= 8) do={\
    \n                        :set st13 \"DOWN\"; :set tm13 0;\
    \n                        /ip route disable [find comment=\"Line13 Primary\
    \"];\
    \n                        :log error \"[-] VLAN-2013 Test Failed - Still D\
    ead\";\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        :if (\$st13 = \"UP\" || \$st13 = \"PROBATION\") do={\
    \n            :set st13 \"DOWN\"; :set tm13 0;\
    \n            /ip route disable [find comment=\"Line13 Primary\"];\
    \n            :log error \"[!!!] VLAN-2013 PHYSICAL LINK DOWN (Instant Cut\
    off)\";\
    \n            :do {/tool fetch url=\"https://api.telegram.org/bot878646659\
    3:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7562205396&text=\
    \\E2\\9D\\8C%20VLAN-%2013%20Cable%20Unplugged\" keep-result=no check-certi\
    ficate=no;} on-error={ :log error \"Failed to send TG VLAN-2013 alert\"; }\
    \n        }\
    \n        :if (\$st13 = \"DOWN\") do={\
    \n            :set tm13 0;\
    \n        }\
    \n    }\
    \n\
    \n    # ==========================================\
    \n    # === Check VLAN- 14 (VLAN-2014-L1) ===\
    \n    # ==========================================\
    \n    :local run4 [/interface get \"VLAN-2014-L1\" running];\
    \n    \
    \n    :if (\$run4) do={\
    \n        /interface monitor-traffic \"VLAN-2014-L1\" once do={\
    \n            :local rx \$\"rx-bits-per-second\"\
    \n            :local tx \$\"tx-bits-per-second\"\
    \n\
    \n            :if (\$st14 = \"UP\") do={\
    \n                :if (\$rx > 40000 || \$tx > 80000 || (\$rx > \$tx && \$r\
    x > 15000)) do={\
    \n                    :set tm14 0;\
    \n                } else={\
    \n                    :if (\$tx > 20000 && \$rx < 60000) do={\
    \n                        :set tm14 (\$tm14 + 1);\
    \n                        :log warning (\"[] VLAN-2014 Suspect: TX=\" . \$\
    tx . \" RX=\" . \$rx . \" (Strike: \" . \$tm14 . \"/4)\");\
    \n                        \
    \n                        :if (\$tm14 >= 4) do={\
    \n                            :set st14 \"DOWN\"; :set tm14 0;\
    \n                            /ip route disable [find comment=\"Line14 Pri\
    mary\"];\
    \n                            :log error \"[!!!] VLAN-2014 CONFIRMED DEAD \
    (Logical) - Route Disabled\";\
    \n                            :do {/tool fetch url=\"https://api.telegram.\
    org/bot8786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7\
    562205396&text=\\F0\\9F\\94\\B4%20VLAN-%2014%20DOWN\" keep-result=no check\
    -certificate=no;} on-error={ :log error \"Failed to send TG VLAN-2014 aler\
    t\"; }\
    \n                        }\
    \n                    }\
    \n                }\
    \n            }\
    \n            :if (\$st14 = \"DOWN\") do={\
    \n                :set tm14 (\$tm14 + 1);\
    \n                :if (\$tm14 >= 12) do={\
    \n                    :set st14 \"PROBATION\"; :set tm14 0;\
    \n                    /ip route enable [find comment=\"Line14 Primary\"];\
    \n                    :log warning \"[*] VLAN-2014 PROBATION - Checking fo\
    r Real Traffic...\";\
    \n                }\
    \n            }\
    \n            :if (\$st14 = \"PROBATION\") do={\
    \n                :set tm14 (\$tm14 + 1);\
    \n                :if (\$rx > 40000 || \$tx > 80000) do={\
    \n                    :set st14 \"UP\"; :set tm14 0;\
    \n                    :log info \"[+++] VLAN-2014 STABLE - Internet Restor\
    ed\";\
    \n                    :do {/tool fetch url=\"https://api.telegram.org/bot8\
    786466593:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=756220539\
    6&text=\\F0\\9F\\9F\\A2%20VLAN-%2014%20BACK\" keep-result=no check-certifi\
    cate=no;} on-error={ :log error \"Failed to send TG VLAN-2014 alert\"; }\
    \n                } else={\
    \n                    :if (\$tm14 >= 8) do={\
    \n                        :set st14 \"DOWN\"; :set tm14 0;\
    \n                        /ip route disable [find comment=\"LINE-22 Primar\
    y\"];\
    \n                        :log error \"[-] VLAN-2014 Test Failed - Still D\
    ead\";\
    \n                    }\
    \n                }\
    \n            }\
    \n        }\
    \n    } else={\
    \n        :if (\$st14 = \"UP\" || \$st14 = \"PROBATION\") do={\
    \n            :set st14 \"DOWN\"; :set tm14 0;\
    \n            /ip route disable [find comment=\"Line14 Primary\"];\
    \n            :log error \"[!!!] VLAN-2014 PHYSICAL LINK DOWN (Instant Cut\
    off)\";\
    \n            :do {/tool fetch url=\"https://api.telegram.org/bot878646659\
    3:AAGsRZhiJWwGKK4LNaGs9ErmwaBLSuovCc8/sendMessagechat_id=7562205396&text=\
    \\E2\\9D\\8C%20VLAN-%2014%20Cable%20Unplugged\" keep-result=no check-certi\
    ficate=no;} on-error={ :log error \"Failed to send TG VLAN-2014 alert\"; }\
    \n        }\
    \n        :if (\$st14 = \"DOWN\") do={\
    \n            :set tm14 0;\
    \n        }\
    \n    }\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
/system script
add dont-require-permissions=no name=expire_user owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff source="{ :global todayHo\
    urs; { :local d [ /system clock get date ]; :local t [ /system clock get t\
    ime ]; :set d (\$d.\" \".\$t); :local montharray ( \"jan\",\"feb\",\"mar\"\
    ,\"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" )\
    ; :local monthdays ( 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30 ); :loc\
    al days [ :pick \$d 4 6 ]; :local monthtxt [ :pick \$d 0 3 ]; :local year \
    [ :pick \$d 9 11 ]; :local monthsIndex ([ :find \$montharray \$monthtxt]);\
    \_:local h [ :pick \$d 12 14 ]; :local m [ :pick \$d 15 17 ]; :local s [ :\
    pick \$d 18 20 ]; :for nodays from=0 to=\$monthsIndex do={ :set days ( \$d\
    ays + [ :pick \$monthdays \$nodays ] ); }; :set days (\$days + \$year * 36\
    5); :local totalHours (\$h + (\$days * 24)); :set todayHours \$totalHours;\
    \_}; :foreach i in=[ /ip hotspot user find where disabled=no ] do={ :if ([\
    \_:find [ /ip hotspot user get \$i comment ] ] = 0 && [ :find [ /ip hotspo\
    t user get \$i email ] ] = 0) do={ :local d [ /ip hotspot user get \$i com\
    ment ]; :local oldemail [ /ip hotspot user get \$i email ]; :local atmark \
    [ :find \$oldemail \"@\" ]; :local dotmark [ :find \$oldemail \".\" ]; :if\
    \_( \$atmark >= 0 && \$dotmark >= 0 ) do={ :local validity [ :pick \$oldem\
    ail 0 \$atmark]; :local rest [ :pick \$oldemail (\$atmark + 1) [ :len \$ol\
    demail] ]; :local validityInHours false; :local hmark [ :find \$validity \
    \"h\" ]; :if ( \$hmark >= 0) do={ :set validityInHours true; :set validity\
    \_[ :pick \$validity 0 \$hmark]; }; :if ( [:tonum \$validity] != \"\" ) do\
    ={ :if ( [:tonum \$validity] != \"0\" ) do={ :if ([:len \$d] != 20) do={ :\
    set d ( \$d.\" 00:00:00\" ); }; :local montharray ( \"jan\",\"feb\",\"mar\
    \",\"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\"\
    \_); :local monthdays ( 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30 ); :\
    local days [ :pick \$d 4 6 ]; :local monthtxt [ :pick \$d 0 3 ]; :local ye\
    ar [ :pick \$d 9 11 ]; :local monthsIndex ([ :find \$montharray \$monthtxt\
    ]); :local h [ :pick \$d 12 14 ]; :local m [ :pick \$d 15 17 ]; :local s [\
    \_:pick \$d 18 20 ]; :for nodays from=0 to=\$monthsIndex do={ :set days ( \
    \$days + [ :pick \$monthdays \$nodays ] ); }; :set days (\$days + \$year *\
    \_365); :local totalHours (\$h + (\$days * 24)); :local totalValidity \$va\
    lidity; :if (\$validityInHours = false) do={ :set totalValidity (\$validit\
    y * 24); }; :if ( (\$totalHours + \$totalValidity) <= \$todayHours ) do={ \
    :local n [/ip hotspot user get \$i name]; :log info \"HOTSPOT VALITITY EXP\
    IRE: Disabling Hotspot user \$n first logged in \$d\"; [ /ip hotspot user \
    disable \$i ]; }; }; }; }; }; }; };"
add dont-require-permissions=no name=lgmac owner=user1 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    foreach i in=[/ip hotspot host find where mac-address=\"00:00:11:CF:D5:71\
    \" || mac-address=\"0C:70:4A:54:4E:69\"|| mac-address=\"44:6D:57:D0:24:AA\
    \" || mac-address=\"78:e8:b6:2a:b9:11\"|| mac-address=\"F0:08:F1:69:FF:46\
    \"] do={\r\
    \n:local macayman [/ip hotspot host get \$i mac-address];\r\
    \n/ip hotspot cookie remove [find where mac-address=\$macayman];}"
add dont-require-permissions=no name=ex_dis_user_new owner=user1 policy=\
    read,write source="{:global today;{:local date [ /system clock get date ];\
    :local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\",\"jul\
    \",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local monthdays ( 31, 28, 31\
    , 30, 31, 30, 31, 31, 30, 31, 30, 31 );:local days [ :pick \$date 4 6 ];:l\
    ocal monthtxt [ :pick \$date 0 3 ];:local year [ :pick \$date 7 11 ];:loca\
    l months ([ :find \$montharray \$monthtxt]);:for nodays from=0 to=\$months\
    \_do={:set days ( \$days + [ :pick \$monthdays \$nodays ] )};:set days (\$\
    days + \$year * 365);:set today \$days;};:foreach i in [ /ip hotspot user \
    find where disabled=no ] do={:if ([ :find [ /ip hotspot user get \$i comme\
    nt ] ] = 0 && [ :find [ /ip hotspot user get \$i email ] ] = 0) do={:local\
    \_datee [ /ip hotspot user get \$i comment ];:local mums [ :pick \$datee 0\
    \_4 ]; :if ( \$mums = \"mums\" ) do={ :local date [ :pick \$datee 5 16 ];:\
    local oldemail [ /ip hotspot user get \$i email ];:local atmark [ :find \$\
    oldemail \"@\" ];:local dotmark [ :find \$oldemail \".\" ];:if ( \$atmark \
    >= 0 && \$dotmark >= 0 ) do={:local validity [ :pick \$oldemail 0 \$atmark\
    ];:local rest [ :pick \$oldemail (\$atmark + 1) [ :len \$oldemail] ];:if (\
    \_[:tonum \$validity] != \"\" ) do={:if ( [:tonum \$validity] != \"0\" ) d\
    o={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\",\"j\
    ul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local monthdays ( 31, 28, \
    31, 30, 31, 30, 31, 31, 30, 31, 30, 31 );:local days [ :pick \$date 4 6 ];\
    :local monthtxt [ :pick \$date 0 3 ];:local year [ :pick \$date 7 11 ];:lo\
    cal months ( [ :find \$montharray \$monthtxt ] );:for nodays from=0 to=\$m\
    onths do={:set days ( \$days + [ :pick \$monthdays \$nodays ] )};:set days\
    \_(\$days + \$year * 365);:if ( (\$days + \$validity) < \$today ) do={ :lo\
    cal name [/ip hotspot user get \$i name];:log info \"HOTSPOT VALITITY EXPI\
    RE: Disabling Hotspot user \$name first logged in \$date\";[ /ip hotspot u\
    ser disable \$i ];}}}}}}}}"
add dont-require-permissions=no name=userman owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local months {\"jan\"=1;\"feb\"=2;\"mar\"=3;\"apr\"=4;\"may\"=5;\"jun\"=6;\
    \"jul\"=7;\"aug\"=8;\"sep\"=9;\"oct\"=10;\"nov\"=11;\"dec\"=12};\
    \n\
    \n:local nowDate [/system clock get date];\
    \n:local nowYear [:tonum [:pick \$nowDate 7 11]];\
    \n:local nowMonthName [:pick \$nowDate 0 3];\
    \n:local nowDay [:tonum [:pick \$nowDate 4 6]];\
    \n:local nowMonth (\$months->\$nowMonthName);\
    \n\
    \n:local nowDays ((\$nowYear * 365) + ((\$nowMonth - 1) * 30) + \$nowDay);\
    \n\
    \n:log info (\"current-days=\" . \$nowDays);\
    \n\
    \n/ip hotspot disable [find];\
    \n:delay 15s;\
    \n\
    \n:foreach u in=[/tool user-manager user find where !actual-profile and up\
    time-used>0s] do={\
    \n    :local lastSeen [/tool user-manager user get \$u last-seen];\
    \n    :if (\$lastSeen != \"never\") do={\
    \n        :local lsYear [:tonum [:pick \$lastSeen 7 11]];\
    \n        :local lsMonthName [:pick \$lastSeen 0 3];\
    \n        :local lsDay [:tonum [:pick \$lastSeen 4 6]];\
    \n        :local lsMonth (\$months->\$lsMonthName);\
    \n        :local lsDays ((\$lsYear * 365) + ((\$lsMonth - 1) * 30) + \$lsD\
    ay);\
    \n\
    \n        :if ((\$nowDays - \$lsDays) > 10) do={\
    \n            /tool user-manager user remove \$u;\
    \n            :log info (\"removed user=\" . \$u . \" last-seen=\" . \$las\
    tSeen);\
    \n        };\
    \n    };\
    \n};\
    \n\
    \n:log info \"________1__________\";\
    \n\
    \n:foreach s in=[/tool user-manager session find] do={\
    \n    :local tillTime [/tool user-manager session get \$s till-time];\
    \n    :if ((\$tillTime != \"\") && (\$tillTime != \"never\")) do={\
    \n        :local ttYear [:tonum [:pick \$tillTime 7 11]];\
    \n        :local ttMonthName [:pick \$tillTime 0 3];\
    \n        :local ttDay [:tonum [:pick \$tillTime 4 6]];\
    \n        :local ttMonth (\$months->\$ttMonthName);\
    \n        :local ttDays ((\$ttYear * 365) + ((\$ttMonth - 1) * 30) + \$ttD\
    ay);\
    \n\
    \n        :if ((\$nowDays - \$ttDays) > 10) do={\
    \n            /tool user-manager session remove \$s;\
    \n            :log info (\"removed session=\" . \$s . \" till-time=\" . \$\
    tillTime);\
    \n        };\
    \n    };\
    \n};\
    \n\
    \n:log info \"________3__________\";\
    \n/tool user-manager database rebuild;\
    \n:delay 40;\
    \n:log info \"________4__________\";\
    \n/ip hotspot enable [find];\
    \n:delay 2;\
    \n/interface reset-counters [find];\
    \n/ip firewall filter reset-counters-all;\
    \n/ip firewall nat reset-counters-all;\
    \n/ip firewall mangle reset-counters-all;\
    \n/system reboot;\
    \ny;"
add dont-require-permissions=no name=ex_dis_user owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive source="{:globa\
    l today;{:local date [ /system clock get date ];:local montharray ( \"jan\
    \",\"feb\",\"mar\",\"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\"\
    ,\"nov\",\"dec\" );:local monthdays ( 31, 28, 31, 30, 31, 30, 31, 31, 30, \
    31, 30, 31 );:local days [ :pick \$date 4 6 ];:local monthtxt [ :pick \$da\
    te 0 3 ];:local year [ :pick \$date 7 11 ];:local months ([ :find \$montha\
    rray \$monthtxt]);:for nodays from=0 to=\$months do={:set days ( \$days + \
    [ :pick \$monthdays \$nodays ] )};:set days (\$days + \$year * 365);:set t\
    oday \$days;};:foreach i in [ /ip hotspot user find where disabled=no ] do\
    ={:if ([ :find [ /ip hotspot user get \$i comment ] ] = 0 && [ :find [ /ip\
    \_hotspot user get \$i email ] ] = 0) do={:local date [ /ip hotspot user g\
    et \$i comment ];:local oldemail [ /ip hotspot user get \$i email ];:local\
    \_atmark [ :find \$oldemail \"@\" ];:local dotmark [ :find \$oldemail \".\
    \" ];:if ( \$atmark >= 0 && \$dotmark >= 0 ) do={:local validity [ :pick \
    \$oldemail 0 \$atmark];:local rest [ :pick \$oldemail (\$atmark + 1) [ :le\
    n \$oldemail] ];:if ( [:tonum \$validity] != \"\" ) do={:if ( [:tonum \$va\
    lidity] != \"0\" ) do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\"\
    ,\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local \
    monthdays ( 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 );:local days [\
    \_:pick \$date 4 6 ];:local monthtxt [ :pick \$date 0 3 ];:local year [ :p\
    ick \$date 7 11 ];:local months ( [ :find \$montharray \$monthtxt ] );:for\
    \_nodays from=0 to=\$months do={:set days ( \$days + [ :pick \$monthdays \
    \$nodays ] )};:set days (\$days + \$year * 365);:if ( (\$days + \$validity\
    ) < \$today ) do={ :local name [/ip hotspot user get \$i name];:log info \
    \"HOTSPOT VALITITY EXPIRE: Disabling Hotspot user \$name first logged in \
    \$date\";[ /ip hotspot user disable \$i ];}}}}}}}"
add dont-require-permissions=no name=ArafatScript owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    \_:local MyUser [:toarray (\"1079343087\" , \"1080712544\" , \"1057129762\
    \" , \"1032529330\")];:for i from=0 to=([:len \$MyUser]-1) do={:do {[/tool\
    \_user-manager user add customer=admin username=[:pick \$MyUser \$i]  call\
    er-id-bind-on-first-use=yes  shared-users=1 last-name=1] ; :do {[/tool use\
    r-manager user create-and-activate-profile customer=admin numbers=[:pick \
    \$MyUser \$i] profile=100YR ];}}}}"
add dont-require-permissions=no name="Sending to email" owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    \_\D8\B3\D9\83\D8\B1\D8\A8\D8\AA \D8\A5\D8\B1\D8\B3\D8\A7\D9\84 \D8\A7\D9\
    \84\D9\86\D8\B3\D8\AE\D8\A9 \D8\A7\D9\84\D8\A7\D8\AD\D8\AA\D9\8A\D8\A7\D8\
    \B7\D9\8A\D8\A9 \D9\84\D9\84\D8\A5\D9\8A\D9\85\D9\8A\D9\84 - \D8\A7\D9\84\
    \D8\AD\D9\81\D8\B8 \D8\B9\D9\84\D9\89 disk1\
    \n:log info \"=== \D8\A8\D8\AF\D8\A1 \D8\B3\D9\83\D8\B1\D9\8A\D8\A8\D8\AA \
    \D8\A7\D9\84\D8\A8\D8\A7\D9\83 \D8\A7\D8\A8 ===\"\
    \n\
    \n:local identity [/system identity get name];\
    \n:local date [/system clock get date];\
    \n\
    \n# \D8\AA\D9\86\D8\B8\D9\8A\D9\81 \D8\A7\D9\84\D8\AA\D8\A7\D8\B1\D9\8A\D8\
    \AE \D9\85\D9\86 \D8\A7\D9\84\D8\B4\D8\B1\D8\B7\D8\A7\D8\AA \D8\A7\D9\84\
    \D9\85\D8\A7\D8\A6\D9\84\D8\A9\
    \n:local cleanDate \"\"\
    \n:for i from=0 to=([:len \$date] - 1) do={\
    \n    :local char [:pick \$date \$i]\
    \n    :if (\$char = \"/\") do={\
    \n        :set cleanDate (\$cleanDate . \"-\")\
    \n    } else={\
    \n        :set cleanDate (\$cleanDate . \$char)\
    \n    }\
    \n}\
    \n\
    \n# \D8\AA\D9\86\D8\B8\D9\8A\D9\81 \D8\A7\D8\B3\D9\85 \D8\A7\D9\84\D8\AC\
    \D9\87\D8\A7\D8\B2 \D9\85\D9\86 \D8\A7\D9\84\D9\85\D8\B3\D8\A7\D9\81\D8\A7\
    \D8\AA\
    \n:local cleanIdentity \"\"\
    \n:for i from=0 to=([:len \$identity] - 1) do={\
    \n    :local char [:pick \$identity \$i]\
    \n    :if (\$char = \" \") do={\
    \n        :set cleanIdentity (\$cleanIdentity . \"_\")\
    \n    } else={\
    \n        :set cleanIdentity (\$cleanIdentity . \$char)\
    \n    }\
    \n}\
    \n\
    \n:local fileName \"disk1/\$cleanIdentity-\$cleanDate.backup\"\
    \n:log info \"\D9\85\D8\B3\D8\A7\D8\B1 \D8\A7\D9\84\D9\85\D9\84\D9\81: \$f\
    ileName\"\
    \n\
    \n# \D8\A7\D9\84\D8\AA\D8\AD\D9\82\D9\82 \D9\85\D9\86 \D9\88\D8\AC\D9\88\
    \D8\AF disk1\
    \n:local diskExists [/file find name=\"disk1\" type=disk]\
    \n:if ([:len \$diskExists] = 0) do={\
    \n    :log error \"\D8\A7\D9\84\D9\82\D8\B1\D8\B5 disk1 \D8\BA\D9\8A\D8\B1\
    \_\D9\85\D9\88\D8\AC\D9\88\D8\AF\"\
    \n    :error \"disk1 not found\"\
    \n}\
    \n\
    \n# \D8\A7\D9\84\D8\AA\D8\AD\D9\82\D9\82 \D9\85\D9\86 \D8\A7\D9\84\D9\85\
    \D8\B3\D8\A7\D8\AD\D8\A9\
    \n:local freeSpace [/file get disk1 free]\
    \n:log info \"\D9\85\D8\B3\D8\A7\D8\AD\D8\A9 \D8\AD\D8\B1\D8\A9 \D8\B9\D9\
    \84\D9\89 disk1: \$(\$freeSpace / 1048576) \D9\85\D9\8A\D8\AC\D8\A7\D8\A8\
    \D8\A7\D9\8A\D8\AA\"\
    \n\
    \n# \D8\AD\D8\B0\D9\81 \D9\85\D9\84\D9\81 \D9\82\D8\AF\D9\8A\D9\85 \D8\A5\
    \D8\B0\D8\A7 \D9\88\D8\AC\D8\AF\
    \n/file remove \$fileName\
    \n\
    \n# \D8\A5\D9\86\D8\B4\D8\A7\D8\A1 \D8\A7\D9\84\D9\86\D8\B3\D8\AE\D8\A9 \
    \D8\A7\D9\84\D8\A7\D8\AD\D8\AA\D9\8A\D8\A7\D8\B7\D9\8A\D8\A9\
    \n/do {\
    \n    /system backup save name=\$fileName\
    \n    :log info \"\D8\AA\D9\85 \D8\AA\D9\86\D9\81\D9\8A\D8\B0 \D8\A3\D9\85\
    \D8\B1 backup save\"\
    \n} on-error={\
    \n    :log error \"\D9\81\D8\B4\D9\84 \D8\AA\D9\86\D9\81\D9\8A\D8\B0 backu\
    p save\"\
    \n}\
    \n\
    \n:delay 5s\
    \n\
    \n# \D8\A7\D9\84\D8\AA\D8\AD\D9\82\D9\82 \D9\85\D9\86 \D9\88\D8\AC\D9\88\
    \D8\AF \D8\A7\D9\84\D9\85\D9\84\D9\81\
    \n:if ([:len [/file find name=\$fileName]] > 0) do={\
    \n    :local fileSize [/file get \$fileName size]\
    \n    :log info \"\D8\AA\D9\85 \D8\A5\D9\86\D8\B4\D8\A7\D8\A1 \D8\A7\D9\84\
    \D9\85\D9\84\D9\81\D8\8C \D8\A7\D9\84\D8\AD\D8\AC\D9\85: \$(\$fileSize / 1\
    024) \D9\83\D9\8A\D9\84\D9\88\D8\A8\D8\A7\D9\8A\D8\AA\"\
    \n    \
    \n    # \D8\A5\D8\B1\D8\B3\D8\A7\D9\84 \D8\A7\D9\84\D8\A8\D8\B1\D9\8A\D8\
    \AF\
    \n    /tool e-mail send to=\"salah22app@gmail.com\" subject=(\"\$cleanIden\
    tity Backup \$cleanDate\") file=\$fileName\
    \n    :log info \"\D8\AA\D9\85 \D8\A5\D8\B1\D8\B3\D8\A7\D9\84 \D8\A7\D9\84\
    \D8\A8\D8\A7\D9\83 \D8\A7\D8\A8 \D8\A5\D9\84\D9\89 \D8\A7\D9\84\D8\A8\D8\
    \B1\D9\8A\D8\AF\"\
    \n} else={\
    \n    :log error \"\D8\A7\D9\84\D9\85\D9\84\D9\81 \D9\84\D9\85 \D9\8A\D8\
    \AA\D9\85 \D8\A5\D9\86\D8\B4\D8\A7\D8\A4\D9\87: \$fileName\"\
    \n}\
    \n\
    \n:log info \"=== \D8\A7\D9\86\D8\AA\D9\87\D9\89 \D8\A7\D9\84\D8\B3\D9\83\
    \D8\B1\D9\8A\D8\A8\D8\AA ===\""
add dont-require-permissions=no name=Block_Failed_Logins owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local count 0;:foreach i in=[/log find message~\"login failure\" scope~\"h\
    otspot\"] do={:local msg [/log get \$i message];:local mac [[:pick \$mac 0\
    \_[:find \$mac \" \"]]];/ip firewall address-list add address=\$mac list=B\
    anned_1h timeout=1h;}"
add comment=HourlyStatusReport dont-require-permissions=no name=\
    HourlyStatusReport owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    \n:local mainToken \"8778752232:AAGiXj4p1wkvmoaY9ecf_4PFPMIYeUUYYnU\";\
    \n:local mainChatID \"7562205396\";\
    \n:local cpu [/system resource get cpu-load];\
    \n:local uptime [/system resource get uptime];\
    \n:local activeUsers [/ip hotspot active print count-only];\
    \n:local neighList \"\";\
    \n\
    \n\
    \n:local interfaceName1 \"ISP1\";\
    \n:local rxByte1 [/interface get [find name=\$interfaceName1] rx-byte];\
    \n:local txByte1 [/interface get [find name=\$interfaceName1] tx-byte];\
    \n:local rxTotal1 (\$rxByte1 / 1048576);\
    \n:local txTotal1 (\$txByte1 / 1048576);\
    \n\
    \n# \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A7\D9\84\D9\86\D9\81\D9\82\
    \n:local interfaceName \"ISP3\";\
    \n:local rxByte [/interface get [find name=\$interfaceName] rx-byte];\
    \n:local txByte [/interface get [find name=\$interfaceName] tx-byte];\
    \n:local rxTotal (\$rxByte / 1048576);\
    \n:local txTotal (\$txByte / 1048576);\
    \n# \D8\AD\D8\B3\D8\A7\D8\A8 \D8\A7\D9\84\D8\A5\D8\AC\D9\85\D8\A7\D9\84\D9\
    \8A \D9\84\D9\80 ISP1 + ISP3\
    \n:local totalDownload (\$rxTotal1 + \$rxTotal);\
    \n:local totalUpload (\$txTotal1 + \$txTotal);\
    \n# \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\AF\D8\A7\D9\87\D9\88\D8\A7\
    \n:local dahuaInterfaceName \"ether10\";\
    \n:local rxByteDahua [/interface get [find name=\$dahuaInterfaceName] rx-b\
    yte];\
    \n:local txByteDahua [/interface get [find name=\$dahuaInterfaceName] tx-b\
    yte];\
    \n:local rxTotalDahua (\$rxByteDahua / 1048576);\
    \n:local txTotalDahua (\$txByteDahua / 1048576);\
    \n\
    \n:local istraha \"ether13\";\
    \n:local rxByteIstraha [/interface get [find name=\$istraha] rx-byte];\
    \n:local txByteIstraha [/interface get [find name=\$istraha] tx-byte];\
    \n:local rxTotalIstraha (\$rxByteIstraha / 1048576);\
    \n:local txTotalIstraha (\$txByteIstraha / 1048576);\
    \n\
    \n# \D8\AC\D9\84\D8\A8 \D8\A7\D9\84\D8\AC\D9\8A\D8\B1\D8\A7\D9\86\
    \n/ip neighbor {\
    \n    :foreach i in=[find] do={\
    \n        :set neighList (\$neighList . \"- \" . [get \$i identity] . \" (\
    \" . [get \$i interface] . \")%0A\");\
    \n    }\
    \n}\
    \n\
    \n# \D8\A8\D9\86\D8\A7\D8\A1 \D8\A7\D9\84\D8\B1\D8\B3\D8\A7\D9\84\D8\A9 \
    \D9\85\D8\B9 \D8\A7\D9\84\D8\A3\D9\8A\D9\82\D9\88\D9\86\D8\A7\D8\AA \D8\A7\
    \D9\84\D8\B5\D8\AD\D9\8A\D8\AD\D8\A9\
    \n:local msg (\"ENAN_MAIN STATUS%0A------------------%0A%F0%9F%92%BB CPU: \
    \$cpu%25%0A%E2%8F%B1 Uptime: \$uptime%0A%F0%9F%91%A5 Active Users: \$activ\
    eUsers%0A--------ISP1-------%0A%F0%9F%93%A5 download: \$rxTotal1 MB%0A%F0%\
    9F%93%A4 upload1: \$txTotal1 MB%0A--------ISP3--------%0A%F0%9F%93%A5 down\
    load: \$rxTotal MB%0A%F0%9F%93%A4 upload: \$txTotal MB%0A-------total-----\
    --%0A%F0%9F%93%A5 download: \$totalDownload MB%0A%F0%9F%93%A4 upload: \$to\
    talUpload MB%0A------------------%0A%F0%9F%93%A5 dahua download: \$txTotal\
    Dahua MB%0A%F0%9F%93%A4 dahua upload: \$rxTotalDahua MB%0A----------------\
    --%0A%F0%9F%93%A5 Istraha download: \$txTotalIstraha MB%0A%F0%9F%93%A4 Ist\
    raha upload: \$rxTotalIstraha MB%0A------------------%0A%F0%9F%93%B6 Neigh\
    bors: %0A\$neighList\");\
    \n\
    \n# \D8\A3\D9\85\D8\B1 \D8\A7\D9\84\D8\A5\D8\B1\D8\B3\D8\A7\D9\84 (\D8\AA\
    \D8\A3\D9\83\D8\AF \D9\85\D9\86 \D8\B9\D8\AF\D9\85 \D9\88\D8\AC\D9\88\D8\
    \AF \D9\85\D8\B3\D8\A7\D9\81\D8\A7\D8\AA \D8\B2\D8\A7\D8\A6\D8\AF\D8\A9 \
    \D8\A3\D9\88 \D9\81\D9\88\D8\A7\D8\B5\D9\84 \D9\82\D8\A8\D9\84 \D8\A7\D9\
    \84\D8\B3\D8\B7\D8\B1)\
    \n/tool fetch url=(\"https://api.telegram.org/bot\" . \$mainToken . \"/sen\
    dMessage\?chat_id=\" . \$mainChatID . \"&text=\" . \$msg) keep-result=no c\
    heck-certificate=no\
    \n}"
add comment=HourlyTrafficReport dont-require-permissions=no name=\
    HourlyTrafficReport owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    \n:local mainToken \"8778752232:AAGiXj4p1wkvmoaY9ecf_4PFPMIYeUUYYnU\";\
    \n:local mainChatID \"7562205396\";\
    \n:local cpu [/system resource get cpu-load];\
    \n:local uptime [/system resource get uptime];\
    \n:local activeUsers [/ip hotspot active print count-only];\
    \n:local neighList \"\";\
    \n\
    \n\
    \n:local interfaceName1 \"ISP1\";\
    \n:local rxByte1 [/interface get [find name=\$interfaceName1] rx-byte];\
    \n:local txByte1 [/interface get [find name=\$interfaceName1] tx-byte];\
    \n:local rxTotal1 (\$rxByte1 / 1048576);\
    \n:local txTotal1 (\$txByte1 / 1048576);\
    \n\
    \n# \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A7\D9\84\D9\86\D9\81\D9\82\
    \n:local interfaceName \"ISP3\";\
    \n:local rxByte [/interface get [find name=\$interfaceName] rx-byte];\
    \n:local txByte [/interface get [find name=\$interfaceName] tx-byte];\
    \n:local rxTotal (\$rxByte / 1048576);\
    \n:local txTotal (\$txByte / 1048576);\
    \n# \D8\AD\D8\B3\D8\A7\D8\A8 \D8\A7\D9\84\D8\A5\D8\AC\D9\85\D8\A7\D9\84\D9\
    \8A \D9\84\D9\80 ISP1 + ISP3\
    \n:local totalDownload (\$rxTotal1 + \$rxTotal);\
    \n:local totalUpload (\$txTotal1 + \$txTotal);\
    \n# \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\AF\D8\A7\D9\87\D9\88\D8\A7\
    \n:local dahuaInterfaceName \"ether10\";\
    \n:local rxByteDahua [/interface get [find name=\$dahuaInterfaceName] rx-b\
    yte];\
    \n:local txByteDahua [/interface get [find name=\$dahuaInterfaceName] tx-b\
    yte];\
    \n:local rxTotalDahua (\$rxByteDahua / 1048576);\
    \n:local txTotalDahua (\$txByteDahua / 1048576);\
    \n\
    \n# \D8\AC\D9\84\D8\A8 \D8\A7\D9\84\D8\AC\D9\8A\D8\B1\D8\A7\D9\86\
    \n/ip neighbor {\
    \n    :foreach i in=[find] do={\
    \n        :set neighList (\$neighList . \"- \" . [get \$i identity] . \" (\
    \" . [get \$i interface] . \")%0A\");\
    \n    }\
    \n}\
    \n\
    \n# \D8\A8\D9\86\D8\A7\D8\A1 \D8\A7\D9\84\D8\B1\D8\B3\D8\A7\D9\84\D8\A9 \
    \D9\85\D8\B9 \D8\A7\D9\84\D8\A3\D9\8A\D9\82\D9\88\D9\86\D8\A7\D8\AA \D8\A7\
    \D9\84\D8\B5\D8\AD\D9\8A\D8\AD\D8\A9\
    \n:local msg (\"ENAN_MAIN STATUS%0A------------------%0A%F0%9F%92%BB CPU: \
    \$cpu%25%0A%E2%8F%B1 Uptime: \$uptime%0A%F0%9F%91%A5 Active Users: \$activ\
    eUsers%0A--------ISP1-------%0A%F0%9F%93%A5 download: \$rxTotal1 MB%0A%F0%\
    9F%93%A4 upload1: \$txTotal MB%0A--------ISP3--------%0A%F0%9F%93%A5 downl\
    oad: \$rxTotal MB%0A%F0%9F%93%A4 upload: \$txTotal MB%0A-------total------\
    -%0A%F0%9F%93%A5 download: \$totalDownload MB%0A%F0%9F%93%A4 upload: \$tot\
    alUpload MB%0A------------------%0A%F0%9F%93%A5 dahua download: \$txTotalD\
    ahua MB%0A%F0%9F%93%A4 dahua upload: \$rxTotalDahua MB%0A-----------------\
    -%0A%F0%9F%93%B6 Neighbors: %0A\$neighList\");\
    \n\
    \n# \D8\A3\D9\85\D8\B1 \D8\A7\D9\84\D8\A5\D8\B1\D8\B3\D8\A7\D9\84 (\D8\AA\
    \D8\A3\D9\83\D8\AF \D9\85\D9\86 \D8\B9\D8\AF\D9\85 \D9\88\D8\AC\D9\88\D8\
    \AF \D9\85\D8\B3\D8\A7\D9\81\D8\A7\D8\AA \D8\B2\D8\A7\D8\A6\D8\AF\D8\A9 \
    \D8\A3\D9\88 \D9\81\D9\88\D8\A7\D8\B5\D9\84 \D9\82\D8\A8\D9\84 \D8\A7\D9\
    \84\D8\B3\D8\B7\D8\B1)\
    \n/tool fetch url=\"https://api.telegram.org/bot8778752232:AAGiXj4p1wkvmoa\
    Y9ecf_4PFPMIYeUUYYnU/sendMessage\?chat_id=7562205396&text=\$msg\" keep-res\
    ult=no check-certificate=no;\
    \n}"
add comment=SmartNeighborWatch dont-require-permissions=no name=\
    SmartNeighborWatch owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    \n:local botToken \"8778752232:AAGiXj4p1wkvmoaY9ecf_4PFPMIYeUUYYnU\";\
    \n:local chatID \"7562205396\";\
    \n           do={\
    \n                :local cpu [/system resource get cpu-load];\
    \n                :local uptime [/system resource get uptime];\
    \n                :local activeUsers [/ip hotspot active print count-only]\
    ;\
    \n\
    \n                # \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA ISP1\
    \n                :local interfaceName1 \"ISP1\";\
    \n                :local rxByte1 [/interface get [find name=\$interfaceNam\
    e1] rx-byte];\
    \n                :local txByte1 [/interface get [find name=\$interfaceNam\
    e1] tx-byte];\
    \n                :local rxTotal1 (\$rxByte1 / 1048576);\
    \n                :local txTotal1 (\$txByte1 / 1048576);\
    \n\
    \n                # \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA ISP3\
    \n                :local interfaceName \"ISP3\";\
    \n                :local rxByte [/interface get [find name=\$interfaceName\
    ] rx-byte];\
    \n                :local txByte [/interface get [find name=\$interfaceName\
    ] tx-byte];\
    \n                :local rxTotal (\$rxByte / 1048576);\
    \n                :local txTotal (\$txByte / 1048576);\
    \n\
    \n                # \D8\AD\D8\B3\D8\A7\D8\A8 \D8\A7\D9\84\D8\A5\D8\AC\D9\
    \85\D8\A7\D9\84\D9\8A \D9\84\D9\80 ISP1 + ISP3\
    \n                :local totalDownload (\$rxTotal1 + \$rxTotal);\
    \n                :local totalUpload (\$txTotal1 + \$txTotal);\
    \n\
    \n                # \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\AF\D8\A7\D9\
    \87\D9\88\D8\A7 (ether12)\
    \n                :local dahuaInterfaceName \"ether12\";\
    \n                :local rxByteDahua [/interface get [find name=\$dahuaInt\
    erfaceName] rx-byte];\
    \n                :local txByteDahua [/interface get [find name=\$dahuaInt\
    erfaceName] tx-byte];\
    \n                :local rxTotalDahua (\$rxByteDahua / 1048576);\
    \n                :local txTotalDahua (\$txByteDahua / 1048576);\
    \n\
    \n                # \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A7\D9\84\D8\
    \A7\D8\B3\D8\AA\D8\B1\D8\A7\D8\AD\D8\A9 (ether13)\
    \n                :local istraha \"ether13\";\
    \n                :local rxByteIstraha [/interface get [find name=\$istrah\
    a] rx-byte];\
    \n                :local txByteIstraha [/interface get [find name=\$istrah\
    a] tx-byte];\
    \n                :local rxTotalIstraha (\$rxByteIstraha / 1048576);\
    \n                :local txTotalIstraha (\$txByteIstraha / 1048576);\
    \n\
    \n\
    \n:local interfaceNameBr \"out\";\
    \n:local rxByteBr [/interface get [find name=\$interfaceNameBr] rx-byte];\
    \n:local txByteBr [/interface get [find name=\$interfaceNameBr] tx-byte];\
    \n:local rxTotalBr (\$rxByteBr / 1048576);\
    \n:local txTotalBr (\$txByteBr / 1048576);\
    \n:local totalConsum (\$rxTotalBr + \$txTotalBr);\
    \n:local totalIncome (\$rxTotal1 + \$rxTotal + \$txTotal1 + \$txTotal);\
    \n                  :local totalISP1 (\$txTotal1 + \$rxTotal1);\
    \n                :local totalISP3 (\$txTotal + \$rxTotal);\
    \n                :local istrahaConsum (\$totalIncome - \$totalConsum);\
    \n       \
    \n                # \D8\A8\D9\86\D8\A7\D8\A1 \D8\A7\D9\84\D8\B1\D8\B3\D8\
    \A7\D9\84\D8\A9 \D8\A8\D9\86\D9\81\D8\B3 \D8\A7\D9\84\D8\AA\D9\86\D8\B3\D9\
    \8A\D9\82 \D8\A7\D9\84\D9\85\D8\B7\D9\84\D9\88\D8\A8\
    \n                :local finalMsg (\"ENAN_MAIN STATUS%0A------------------\
    %0A%F0%9F%92%BB CPU: \$cpu%25%0A%E2%8F%B1 Uptime: \$uptime%0A%F0%9F%91%A5 \
    Active Users: \$activeUsers%0A--------ISP1-------%0A%F0%9F%93%A5 download:\
    \_\$rxTotal1 MB%0A%F0%9F%93%A4 upload1: \$txTotal1 MB%0A%F0%9F%93%A4 Total\
    : \$totalISP1 MB%0A--------ISP3--------%0A%F0%9F%93%A5 download: \$rxTotal\
    \_MB%0A%F0%9F%93%A4 upload: \$txTotal MB%0A%F0%9F%93%A4 Total: \$totalISP3\
    \_MB%0A-------total-------%0A%F0%9F%93%A5 download: \$totalDownload MB%0A%\
    F0%9F%93%A4 upload: \$totalUpload MB%0A%F0%9F%93%A4 Total: \$totalIncome M\
    B%0A------------------%0A%F0%9F%93%A5 dahua download: \$txTotalDahua MB%0A\
    %F0%9F%93%A4 dahua upload: \$rxTotalDahua MB%0A------------------%0A%F0%9F\
    %93%A5 Istraha download: \$txTotalIstraha MB%0A%F0%9F%93%A4 Istraha upload\
    : \$rxTotalIstraha MB%0ATotal_Consum: \$istrahaConsum%0A------------------\
    \");\
    \n\
    \n                /tool fetch url=(\"https://api.telegram.org/bot877875223\
    2:AAGiXj4p1wkvmoaY9ecf_4PFPMIYeUUYYnU/sendMessage\?chat_id=7562205396&text\
    =\$finalMsg\") keep-result=no check-certificate=no;\
    \n            }\
    \n\
    \n}"
add dont-require-permissions=no name=AntiSpoof owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    \n# \D8\AA\D8\B9\D8\B1\D9\8A\D9\81 \D8\A7\D9\84\D9\82\D9\8A\D9\85 \D9\85\
    \D8\A8\D8\A7\D8\B4\D8\B1\D8\A9 \D9\84\D8\B6\D9\85\D8\A7\D9\86 \D8\B9\D8\AF\
    \D9\85 \D8\A7\D9\84\D9\81\D8\B4\D9\84\
    \n:local token \"8778752232:AAGiXj4p1wkvmoaY9ecf_4PFPMIYeUUYYnU\";\
    \n:local chatID \"7562205396\";\
    \n:local foundConflict false;\
    \n\
    \n/ip arp {\
    \n    :foreach i in=[find] do={\
    \n        :local m [get \$i mac-address];\
    \n        # \D8\A7\D9\84\D8\A8\D8\AD\D8\AB \D8\B9\D9\86 \D8\AA\D9\83\D8\B1\
    \D8\A7\D8\B1 \D9\84\D9\87\D8\B0\D8\A7 \D8\A7\D9\84\D9\85\D8\A7\D9\83\
    \n        :if ([:len [find where mac-address=\$m]] > 1) do={\
    \n            :set foundConflict true;\
    \n            :local ip [get \$i address];\
    \n            :local msg (\"%E2%9A%A0%EF%B8%8F [ENAN_MAIN] MAC CONFLICT AL\
    ERT!%0AMAC: \$m%0AIP: \$ip\");\
    \n            /tool fetch url=\"https://api.telegram.org/bot\$token/sendMe\
    ssage\?chat_id=\$chatID&text=\$msg\" keep-result=no check-certificate=no;\
    \n        }\
    \n    }\
    \n}\
    \n\
    \n:if (\$foundConflict = false) do={\
    \n    #:log info \"AntiSpoof: \D8\A7\D9\84\D9\81\D8\AD\D8\B5 \D8\A7\D9\86\
    \D8\AA\D9\87\D9\89.. \D9\84\D8\A7 \D9\8A\D9\88\D8\AC\D8\AF \D8\AA\D8\B6\D8\
    \A7\D8\B1\D8\A8 \D9\81\D9\8A \D8\A7\D9\84\D9\85\D8\A7\D9\83 \D8\A3\D8\AF\
    \D8\B1\D8\B3 \D8\AD\D8\A7\D9\84\D9\8A\D8\A7\";\
    \n}\
    \n}"
add comment=Telegram-Daily-Report dont-require-permissions=no name=\
    Telegram-Daily-Report owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    \_\D8\B6\D8\B9 \D8\AA\D9\88\D9\83\D9\86 \D8\A7\D9\84\D8\A8\D9\88\D8\AA \D9\
    \88\D9\85\D8\B9\D8\B1\D9\81 \D8\A7\D9\84\D9\85\D8\AD\D8\A7\D8\AF\D8\AB\D8\
    \A9 \D9\87\D9\86\D8\A7\
    \n:local botToken \"8691220295:AAFJ3Wqp756sVPaaeF4Fzxx5C45lgaDFlKg\";\
    \n:local chatID \"7562205396\";\
    \n\
    \n# 1. \D8\AC\D9\84\D8\A8 \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A7\D9\
    \84\D9\86\D8\B8\D8\A7\D9\85\
    \n:local cpu [/system resource get cpu-load];\
    \n:local uptime [/system resource get uptime];\
    \n:local activeUsers [/ip hotspot active print count-only];\
    \n\
    \n# 2. \D8\AC\D9\84\D8\A8 \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A7\D9\
    \84\D8\AE\D8\B7\D9\88\D8\B7 (ISPs)\
    \n:local interfaceName1 \"ISP1\";\
    \n:local rxByte1 [/interface get [find name=\$interfaceName1] rx-byte];\
    \n:local txByte1 [/interface get [find name=\$interfaceName1] tx-byte];\
    \n:local rxTotal1 (\$rxByte1 / 1048576);\
    \n:local txTotal1 (\$txByte1 / 1048576);\
    \n\
    \n:local interfaceName11 \"ISP2\";\
    \n:local rxByte11 [/interface get [find name=\$interfaceName11] rx-byte];\
    \n:local txByte11 [/interface get [find name=\$interfaceName11] tx-byte];\
    \n:local rxTotal11 (\$rxByte11 / 1048576);\
    \n:local txTotal11 (\$txByte11 / 1048576);\
    \n\
    \n:local interfaceName12 \"ISP4\";\
    \n:local rxByte12 [/interface get [find name=\$interfaceName12] rx-byte];\
    \n:local txByte12 [/interface get [find name=\$interfaceName12] tx-byte];\
    \n:local rxTotal12 (\$rxByte12 / 1048576);\
    \n:local txTotal12 (\$txByte12 / 1048576);\
    \n\
    \n:local interfaceName13 \"ISP5\";\
    \n:local rxByte13 [/interface get [find name=\$interfaceName13] rx-byte];\
    \n:local txByte13 [/interface get [find name=\$interfaceName13] tx-byte];\
    \n:local rxTotal13 (\$rxByte13 / 1048576);\
    \n:local txTotal13 (\$txByte13 / 1048576);\
    \n\
    \n:local interfaceName14 \"ISP6\";\
    \n:local rxByte14 [/interface get [find name=\$interfaceName14] rx-byte];\
    \n:local txByte14 [/interface get [find name=\$interfaceName14] tx-byte];\
    \n:local rxTotal14 (\$rxByte14 / 1048576);\
    \n:local txTotal14 (\$txByte14 / 1048576);\
    \n\
    \n:local interfaceName15 \"ether7\";\
    \n:local rxByte15 [/interface get [find name=\$interfaceName15] rx-byte];\
    \n:local txByte15 [/interface get [find name=\$interfaceName15] tx-byte];\
    \n:local rxTotal15 (\$rxByte15 / 1048576);\
    \n:local txTotal15 (\$txByte15 / 1048576);\
    \n\
    \n:local interfaceName16 \"ether7\";\
    \n:local rxByte16 [/interface get [find name=\$interfaceName16] rx-byte];\
    \n:local txByte16 [/interface get [find name=\$interfaceName16] tx-byte];\
    \n:local rxTotal16 (\$rxByte16 / 1048576);\
    \n:local txTotal16 (\$txByte16 / 1048576);\
    \n\
    \n:local interfaceName17 \"ether7\";\
    \n:local rxByte17 [/interface get [find name=\$interfaceName17] rx-byte];\
    \n:local txByte17 [/interface get [find name=\$interfaceName17] tx-byte];\
    \n:local rxTotal17 (\$rxByte17 / 1048576);\
    \n:local txTotal17 (\$txByte17 / 1048576);\
    \n\
    \n:local interfaceName18 \"ether7\";\
    \n:local rxByte18 [/interface get [find name=\$interfaceName18] rx-byte];\
    \n:local txByte18 [/interface get [find name=\$interfaceName18] tx-byte];\
    \n:local rxTotal18 (\$rxByte18 / 1048576);\
    \n:local txTotal18 (\$txByte18 / 1048576);\
    \n\
    \n:local interfaceName19 \"ISP-eoip-19\";\
    \n:local rxByte19 [/interface get [find name=\$interfaceName19] rx-byte];\
    \n:local txByte19 [/interface get [find name=\$interfaceName19] tx-byte];\
    \n:local rxTotal19 (\$rxByte19 / 1048576);\
    \n:local txTotal19 (\$txByte19 / 1048576);\
    \n\
    \n:local interfaceName20 \"ISP-eoip-20\";\
    \n:local rxByte20 [/interface get [find name=\$interfaceName20] rx-byte];\
    \n:local txByte20 [/interface get [find name=\$interfaceName20] tx-byte];\
    \n:local rxTotal20 (\$rxByte20 / 1048576);\
    \n:local txTotal20 (\$txByte20 / 1048576);\
    \n\
    \n:local interfaceName21 \"ISP-eoip-21\";\
    \n:local rxByte21 [/interface get [find name=\$interfaceName21] rx-byte];\
    \n:local txByte21 [/interface get [find name=\$interfaceName21] tx-byte];\
    \n:local rxTotal21 (\$rxByte21 / 1048576);\
    \n:local txTotal21 (\$txByte21 / 1048576);\
    \n\
    \n:local interfaceName22 \"ISP-eoip-22\";\
    \n:local rxByte22 [/interface get [find name=\$interfaceName22] rx-byte];\
    \n:local txByte22 [/interface get [find name=\$interfaceName22] tx-byte];\
    \n:local rxTotal22 (\$rxByte22 / 1048576);\
    \n:local txTotal22 (\$txByte22 / 1048576);\
    \n\
    \n# \D8\AD\D8\B3\D8\A7\D8\A8 \D8\A5\D8\AC\D9\85\D8\A7\D9\84\D9\8A \D9\83\
    \D9\84 \D8\AE\D8\B7 \D9\84\D9\84\D8\A5\D8\B1\D8\B3\D8\A7\D9\84\
    \n:local totalISP1 (\$txTotal1 + \$rxTotal1);\
    \n:local totalISP11 (\$txTotal11 + \$rxTotal11);\
    \n:local totalISP12 (\$txTotal12 + \$rxTotal12);\
    \n:local totalISP13 (\$txTotal13 + \$rxTotal13);\
    \n:local totalISP14 (\$txTotal14 + \$rxTotal14);\
    \n:local totalISP15 (\$txTotal15 + \$rxTotal15);\
    \n:local totalISP16 (\$txTotal16 + \$rxTotal16);\
    \n:local totalISP17 (\$txTotal17 + \$rxTotal17);\
    \n:local totalISP18 (\$txTotal18 + \$rxTotal18);\
    \n:local totalISP19 (\$txTotal19 + \$rxTotal19);\
    \n:local totalISP20 (\$txTotal20 + \$rxTotal20);\
    \n:local totalISP21 (\$txTotal21 + \$rxTotal21);\
    \n:local totalISP22 (\$txTotal22 + \$rxTotal22);\
    \n\
    \n# 3. \D8\AC\D9\84\D8\A8 \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A7\D9\
    \84\D9\83\D8\A7\D9\85\D9\8A\D8\B1\D8\A7\D8\AA \D9\88\D8\A7\D9\84\D8\A7\D8\
    \B3\D8\AA\D8\B1\D8\A7\D8\AD\D8\A9 \D9\88\D8\A7\D9\84\D8\A7\D8\B3\D8\AA\D9\
    \87\D9\84\D8\A7\D9\83\
    \n:local dahuaInterfaceName \"ether12\";\
    \n:local rxByteDahua [/interface get [find name=\$dahuaInterfaceName] rx-b\
    yte];\
    \n:local txByteDahua [/interface get [find name=\$dahuaInterfaceName] tx-b\
    yte];\
    \n:local rxTotalDahua (\$rxByteDahua / 1048576);\
    \n:local txTotalDahua (\$txByteDahua / 1048576);\
    \n\
    \n:local istraha \"ether13\";\
    \n:local rxByteIstraha [/interface get [find name=\$istraha] rx-byte];\
    \n:local txByteIstraha [/interface get [find name=\$istraha] tx-byte];\
    \n:local rxTotalIstraha (\$rxByteIstraha / 1048576);\
    \n:local txTotalIstraha (\$txByteIstraha / 1048576);\
    \n\
    \n:local interfaceNameBr \"IN-OUT\";\
    \n:local rxByteBr [/interface get [find name=\$interfaceNameBr] rx-byte];\
    \n:local txByteBr [/interface get [find name=\$interfaceNameBr] tx-byte];\
    \n:local rxTotalBr (\$rxByteBr / 1048576);\
    \n:local txTotalBr (\$txByteBr / 1048576);\
    \n:local totalConsum (\$rxTotalBr + \$txTotalBr);\
    \n\
    \n# 4. \D8\AD\D8\B3\D8\A7\D8\A8 \D8\A7\D9\84\D8\A5\D8\AC\D9\85\D8\A7\D9\84\
    \D9\8A\D8\A7\D8\AA (\D8\AA\D9\85 \D8\AD\D8\B0\D9\81 \D8\A7\D9\84\D8\AA\D9\
    \83\D8\B1\D8\A7\D8\B1 \D8\A7\D9\84\D8\AE\D8\A7\D8\B7\D8\A6 \D9\88\D8\A7\D9\
    \84\D8\A5\D8\A8\D9\82\D8\A7\D8\A1 \D8\B9\D9\84\D9\89 \D9\87\D8\B0\D8\A7 \
    \D9\81\D9\82\D8\B7)\
    \n:local totalDownload (\$rxTotal1 + \$rxTotal11 + \$rxTotal12 + \$rxTotal\
    13 + \$rxTotal14 + \$rxTotal15 + \$rxTotal16 + \$rxTotal17 + \$rxTotal18 +\
    \_\$rxTotal19 + \$rxTotal20 + \$rxTotal21 + \$rxTotal22);\
    \n:local totalUpload (\$txTotal1 + \$txTotal11 + \$txTotal12 + \$txTotal13\
    \_+ \$txTotal14 + \$txTotal15 + \$txTotal16 + \$txTotal17 + \$txTotal18 + \
    \$txTotal19 + \$txTotal20 + \$txTotal21 + \$txTotal22);\
    \n:local totalIncome (\$totalUpload + \$totalDownload);\
    \n:local istrahaConsum (\$totalIncome - \$totalConsum);\
    \n \
    \n# 5. \D8\AA\D8\B9\D8\B1\D9\8A\D9\81 \D8\A7\D9\84\D8\B1\D9\85\D9\88\D8\B2\
    \_\D8\A7\D9\84\D8\AA\D8\B9\D8\A8\D9\8A\D8\B1\D9\8A\D8\A9 \D9\88\D8\A7\D9\
    \84\D8\AA\D9\86\D8\B3\D9\8A\D9\82\
    \n:local iconCPU \"%F0%9F%92%BB\";\
    \n:local iconTime \"%E2%8F%B1\";\
    \n:local iconUsers \"%F0%9F%91%A5\";\
    \n:local iconDown \"%F0%9F%93%A5\";\
    \n:local iconUp \"%F0%9F%93%A4\";\
    \n# \D8\B1\D9\85\D8\B2 \D8\A7\D9\84\D9\86\D8\B2\D9\88\D9\84 \D9\84\D8\B3\
    \D8\B7\D8\B1 \D8\AC\D8\AF\D9\8A\D8\AF\
    \n:local nl \"%0A\"; \
    \n\
    \n# 6. \D8\A8\D9\86\D8\A7\D8\A1 \D8\B1\D8\B3\D8\A7\D9\84\D8\A9 \D8\A7\D9\
    \84\D9\86\D8\B8\D8\A7\D9\85 \D8\A7\D9\84\D9\85\D8\AC\D8\B2\D8\A3\D8\A9\
    \n:local finalMsg \"ENAN%20MAIN%20STATUS\$nl------------------\$nl\";\
    \n:set finalMsg (\$finalMsg . \"\$iconCPU%20CPU:%20\$cpu%25\$nl\");\
    \n:set finalMsg (\$finalMsg . \"\$iconTime%20Uptime:%20\$uptime\$nl\");\
    \n:set finalMsg (\$finalMsg . \"\$iconUsers%20Active%20Users:%20\$activeUs\
    ers\$nl\");\
    \n\
    \n# \D8\A8\D9\86\D8\A7\D8\A1 \D8\B1\D8\B3\D8\A7\D9\84\D8\A9 \D8\A7\D9\84\
    \D8\AE\D8\B7\D9\88\D8\B7\
    \n:set finalMsg (\$finalMsg . \"--------ISP1-------\$nl\$iconDown%20downlo\
    ad:%20\$rxTotal1%20MB\$nl\$iconUp%20upload1:%20\$txTotal1%20MB\$nl\$iconUp\
    %20Total:%20\$totalISP1%20MB\$nl\");\
    \n:set finalMsg (\$finalMsg . \"--------ISP11--------\$nl\$iconDown%20down\
    load:%20\$rxTotal11%20MB\$nl\$iconUp%20upload:%20\$txTotal11%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP11%20MB\$nl\");\
    \n:set finalMsg (\$finalMsg . \"--------ISP12--------\$nl\$iconDown%20down\
    load:%20\$rxTotal12%20MB\$nl\$iconUp%20upload:%20\$txTotal12%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP12%20MB\$nl\");\
    \n:set finalMsg (\$finalMsg . \"--------ISP13--------\$nl\$iconDown%20down\
    load:%20\$rxTotal13%20MB\$nl\$iconUp%20upload:%20\$txTotal13%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP13%20MB\$nl\");\
    \n:set finalMsg (\$finalMsg . \"--------ISP14--------\$nl\$iconDown%20down\
    load:%20\$rxTotal14%20MB\$nl\$iconUp%20upload:%20\$txTotal14%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP14%20MB\$nl\");\
    \n:set finalMsg (\$finalMsg . \"--------ISP19--------\$nl\$iconDown%20down\
    load:%20\$rxTotal19%20MB\$nl\$iconUp%20upload:%20\$txTotal19%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP19%20MB\$nl\");\
    \n:set finalMsg (\$finalMsg . \"--------ISP20--------\$nl\$iconDown%20down\
    load:%20\$rxTotal20%20MB\$nl\$iconUp%20upload:%20\$txTotal20%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP20%20MB\$nl\");\
    \n:set finalMsg (\$finalMsg . \"--------ISP21--------\$nl\$iconDown%20down\
    load:%20\$rxTotal21%20MB\$nl\$iconUp%20upload:%20\$txTotal21%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP21%20MB\$nl\");\
    \n:set finalMsg (\$finalMsg . \"--------ISP22--------\$nl\$iconDown%20down\
    load:%20\$rxTotal22%20MB\$nl\$iconUp%20upload:%20\$txTotal22%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP22%20MB\$nl\");\
    \n\
    \n# \D8\A8\D9\86\D8\A7\D8\A1 \D8\A7\D9\84\D8\A5\D8\AC\D9\85\D8\A7\D9\84\D9\
    \8A \D9\88\D8\A7\D9\84\D9\83\D8\A7\D9\85\D9\8A\D8\B1\D8\A7\D8\AA \D9\88\D8\
    \A7\D9\84\D8\A7\D8\B3\D8\AA\D8\B1\D8\A7\D8\AD\D8\A9\
    \n:set finalMsg (\$finalMsg . \"-------total-------\$nl\$iconDown%20downlo\
    ad:%20\$totalDownload%20MB\$nl\$iconUp%20upload:%20\$totalUpload%20MB\$nl\
    \$iconUp%20Total:%20\$totalIncome%20MB\$nl\");\
    \n:set finalMsg (\$finalMsg . \"------------------\$nl\$iconDown%20dahua%2\
    0download:%20\$txTotalDahua%20MB\$nl\$iconUp%20dahua%20upload:%20\$rxTotal\
    Dahua%20MB\$nl\");\
    \n:set finalMsg (\$finalMsg . \"------------------\$nl\$iconDown%20Istraha\
    %20download:%20\$txTotalIstraha%20MB\$nl\$iconUp%20Istraha%20upload:%20\$r\
    xTotalIstraha%20MB\$nl\");\
    \n:set finalMsg (\$finalMsg . \"Total_Consum:%20\$istrahaConsum\$nl-------\
    -----------\");\
    \n\
    \n# 7. \D8\A7\D9\84\D8\B7\D8\A8\D8\A7\D8\B9\D8\A9 \D9\81\D9\8A \D8\A7\D9\
    \84\D9\84\D9\88\D8\AC (\D9\84\D9\84\D8\AA\D8\A3\D9\83\D8\AF)\
    \n:log info \$finalMsg;\
    \n\
    \n# 8. \D8\A7\D9\84\D8\A5\D8\B1\D8\B3\D8\A7\D9\84 \D8\A5\D9\84\D9\89 \D8\
    \AA\D9\84\D8\AC\D8\B1\D8\A7\D9\85\
    \n/tool fetch url=(\"https://api.telegram.org/bot\$botToken/sendMessage\\\
    \?chat_id=\$chatID&text=\$finalMsg\") keep-result=no;\
    \n"
add comment=sendRotursStatus dont-require-permissions=no name=\
    sendRotursStatus owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    global tgMessage;\
    \n:local botToken \"8778752232:AAGiXj4p1wkvmoaY9ecf_4PFPMIYeUUYYnU\";\
    \n:local chatId \"7562205396\";\
    \n\
    \n/tool fetch url=(\"https://api.telegram.org/bot\$botToken/sendMessage\?c\
    hat_id=\$chatId&text=\$tgMessage\") keep-result=no check-certificate=no;"
add dont-require-permissions=no name=netcut owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    \_\D8\B3\D9\83\D8\B1\D9\8A\D8\A8\D8\AA \D8\A7\D9\84\D8\AD\D9\85\D8\A7\D9\
    \8A\D8\A9 \D9\85\D9\86 \D8\A7\D9\84\D9\80 NetCut \D9\88\D8\A8\D8\B1\D8\A7\
    \D9\85\D8\AC \D8\A7\D9\84\D8\AA\D8\AE\D8\B1\D9\8A\D8\A8 (\D8\A7\D9\84\D9\
    \86\D8\B3\D8\AE\D8\A9 \D8\A7\D9\84\D8\A2\D9\85\D9\86\D8\A9)\
    \n:local listName \"netcutuser\";\
    \n\
    \n# \D8\A7\D9\84\D8\A8\D8\AD\D8\AB \D8\B9\D9\86 \D8\A3\D9\8A \D8\A3\D9\8A\
    \D8\A8\D9\8A \D9\85\D9\88\D8\AC\D9\88\D8\AF \D9\81\D9\8A \D9\82\D8\A7\D8\
    \A6\D9\85\D8\A9 \D8\A7\D9\84\D9\85\D8\AE\D8\B1\D8\A8\D9\8A\D9\86\
    \n:foreach i in=[/ip firewall address-list find list=\$listName] do={\
    \n    :local attackerIP [/ip firewall address-list get \$i address];\
    \n    :local attackerMAC \"\";\
    \n    \
    \n    # \D9\85\D8\AD\D8\A7\D9\88\D9\84\D8\A9 \D8\AC\D9\84\D8\A8 \D8\A7\D9\
    \84\D9\85\D8\A7\D9\83 \D8\A3\D8\AF\D8\B1\D8\B3 \D9\84\D9\84\D9\85\D8\AE\D8\
    \B1\D8\A8 \D9\85\D9\86 \D8\AC\D8\AF\D9\88\D9\84 \D8\A7\D9\84\D9\80 ARP\
    \n    :local arpFind [/ip arp find address=\$attackerIP];\
    \n    :if ([:len \$arpFind] > 0) do={\
    \n        :set attackerMAC [/ip arp get \$arpFind mac-address];\
    \n    } else={\
    \n        # \D8\A5\D8\B0\D8\A7 \D9\84\D9\85 \D9\8A\D9\88\D8\AC\D8\AF \D9\
    \81\D9\8A \D8\A7\D9\84\D9\80 ARP\D8\8C \D9\86\D8\AD\D8\A7\D9\88\D9\84 \D8\
    \AC\D9\84\D8\A8\D9\87 \D9\85\D9\86 \D8\B3\D9\8A\D8\B1\D9\81\D8\B1 \D8\A7\
    \D9\84\D9\80 DHCP\
    \n        :local dhcpFind [/ip dhcp-server lease find address=\$attackerIP\
    ];\
    \n        :if ([:len \$dhcpFind] > 0) do={\
    \n            :set attackerMAC [/ip dhcp-server lease get \$dhcpFind mac-a\
    ddress];\
    \n        }\
    \n    }\
    \n\
    \n    # \D8\A5\D8\B0\D8\A7 \D8\AA\D9\85 \D8\A7\D9\84\D8\B9\D8\AB\D9\88\D8\
    \B1 \D8\B9\D9\84\D9\89 \D8\A7\D9\84\D9\85\D8\A7\D9\83 \D8\A3\D8\AF\D8\B1\
    \D8\B3 \D8\A8\D9\86\D8\AC\D8\A7\D8\AD\D8\8C \D9\86\D8\A8\D8\AF\D8\A3 \D8\
    \B9\D9\85\D9\84\D9\8A\D8\A9 \D8\A7\D9\84\D8\AD\D8\B8\D8\B1\
    \n    :if ([:len \$attackerMAC] > 0) do={\
    \n        \
    \n        # 1. \D8\B7\D8\B1\D8\AF \D8\A7\D9\84\D9\85\D8\AE\D8\B1\D8\A8 \D9\
    \85\D9\86 \D8\A7\D9\84\D9\87\D9\88\D8\AA\D8\B3\D8\A8\D9\88\D8\AA \D8\A5\D8\
    \B0\D8\A7 \D9\83\D8\A7\D9\86 \D9\85\D8\AA\D8\B5\D9\84\D8\A7\D9\8B \D8\AD\
    \D8\A7\D9\84\D9\8A\D8\A7\D9\8B\
    \n        :local hotActive [/ip hotspot active find address=\$attackerIP];\
    \n        :if ([:len \$hotActive] > 0) do={\
    \n            /ip hotspot active remove \$hotActive;\
    \n        }\
    \n\
    \n        # 2. \D8\AD\D8\B8\D8\B1 \D8\A7\D9\84\D9\85\D8\A7\D9\83 \D8\A3\D8\
    \AF\D8\B1\D8\B3 \D9\81\D9\8A \D8\A7\D9\84\D9\87\D9\88\D8\AA\D8\B3\D8\A8\D9\
    \88\D8\AA (IP-Binding)\
    \n        :if ([:len [/ip hotspot ip-binding find mac-address=\$attackerMA\
    C]] = 0) do={\
    \n            /ip hotspot ip-binding add mac-address=\$attackerMAC type=bl\
    ocked comment=\"NetCut / Scanner Auto Block\";\
    \n        }\
    \n\
    \n        # 3. \D8\AD\D8\B8\D8\B1 \D8\A7\D9\84\D9\85\D8\A7\D9\83 \D8\A3\D8\
    \AF\D8\B1\D8\B3 \D9\81\D9\8A \D8\B3\D9\8A\D8\B1\D9\81\D8\B1 \D8\A7\D9\84\
    \D9\80 DHCP\
    \n        :if ([:len [/ip dhcp-server lease find mac-address=\$attackerMAC\
    \_block-access=yes]] = 0) do={\
    \n            :local oldLease [/ip dhcp-server lease find mac-address=\$at\
    tackerMAC];\
    \n            :if ([:len \$oldLease] > 0) do={ /ip dhcp-server lease remov\
    e \$oldLease; }\
    \n            /ip dhcp-server lease add mac-address=\$attackerMAC block-ac\
    cess=yes comment=\"NetCut Auto Block\";\
    \n        }\
    \n\
    \n        # \D8\AA\D8\B3\D8\AC\D9\8A\D9\84 \D8\B1\D8\B3\D8\A7\D9\84\D8\A9 \
    \D9\81\D9\8A \D8\A7\D9\84\D8\B3\D8\AC\D9\84 (Log) \D9\84\D8\A7\D8\B7\D9\84\
    \D8\A7\D8\B9\D9\83 \D8\B9\D9\84\D9\8A\D9\87\D8\A7\
    \n        :log warning (\"\D8\AA\D9\85 \D8\AD\D8\B8\D8\B1 \D9\85\D8\AE\D8\
    \B1\D8\A8 \D8\A8\D9\86\D8\AC\D8\A7\D8\AD! \D8\A7\D9\84\D8\A2\D9\8A\D8\A8\
    \D9\8A: \" . \$attackerIP . \" \D8\A7\D9\84\D9\85\D8\A7\D9\83: \" . \$atta\
    ckerMAC);\
    \n\t\t:local botToken \"8778752232:AAGiXj4p1wkvmoaY9ecf_4PFPMIYeUUYYnU\";\
    \n:local chatID \"7562205396\";\
    \n:local textMsg (\"%E2%9A%A0%20NetCut%20Auto%20Block!%0AIP:%20\" . \$atta\
    ckerIP . \"%0AMAC:%20\" . \$attackerMAC);\
    \n:local tgUrl (\"https://api.telegram.org/bot\" . \$botToken . \"/sendMes\
    sage\?chat_id=\" . \$chatID . \"&text=\" . \$textMsg);\
    \n:do { /tool fetch url=\$tgUrl keep-result=no check-certificate=no; } on-\
    error={ :log error \"Failed to send TG NetCut alert\"; }\
    \n\
    \n    } else={\
    \n        :log warning (\"\D8\AA\D9\85 \D8\B1\D8\B5\D8\AF \D8\A3\D9\8A\D8\
    \A8\D9\8A \D9\85\D8\AE\D8\B1\D8\A8: \" . \$attackerIP . \" \D9\88\D9\84\D9\
    \83\D9\86 \D9\84\D9\85 \D9\8A\D8\AA\D9\85 \D8\A7\D9\84\D8\B9\D8\AB\D9\88\
    \D8\B1 \D8\B9\D9\84\D9\89 \D8\A7\D9\84\D9\85\D8\A7\D9\83 \D8\A3\D8\AF\D8\
    \B1\D8\B3 \D8\A7\D9\84\D8\AE\D8\A7\D8\B5 \D8\A8\D9\87.\");\
    \n    }\
    \n\
    \n    # \D8\A3\D8\AE\D9\8A\D8\B1\D8\A7\D9\8B: \D8\A5\D8\B2\D8\A7\D9\84\D8\
    \A9 \D8\A7\D9\84\D8\A2\D9\8A\D8\A8\D9\8A \D9\85\D9\86 \D9\82\D8\A7\D8\A6\
    \D9\85\D8\A9 \D8\A7\D9\84\D9\81\D8\A7\D9\8A\D8\B1\D9\88\D8\A7\D9\84 \D8\A8\
    \D8\B9\D8\AF \D8\A7\D9\84\D8\AA\D8\B9\D8\A7\D9\85\D9\84 \D9\85\D8\B9\D9\87\
    \n    /ip firewall address-list remove \$i;\
    \n}\
    \n\
    \n\
    \n"
add dont-require-permissions=no name=Ghost_Hunter owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    foreach i in=[/ip hotspot active find] do={\
    \n    :local curUser [/ip hotspot active get \$i user];\
    \n    :local curAddr [/ip hotspot active get \$i address];\
    \n    :local curMac [/ip hotspot active get \$i mac-address];\
    \n    \
    \n    # \D8\A7\D9\84\D9\81\D8\AD\D8\B5: \D8\A5\D8\B0\D8\A7 \D9\83\D8\A7\D9\
    \86 \D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85 \D9\85\D8\B3\D8\AC\D9\
    \84\D8\A7\D9\8B \D9\88\D9\84\D9\83\D9\86 \D9\84\D8\A7 \D9\8A\D9\88\D8\AC\
    \D8\AF \D9\84\D9\87 Queue \D8\A8\D8\B3\D9\8A\D8\B7 (\D8\A7\D9\84\D8\B0\D9\
    \8A \D9\8A\D9\86\D8\B4\D8\A6\D9\87 \D8\B3\D9\83\D8\B1\D9\8A\D8\A8\D8\AA \
    \D8\A7\D9\84\D8\AF\D8\AE\D9\88\D9\84)\
    \n    :if ([:len [/queue simple find where target=(\$curAddr . \"/32\")]] \
    = 0) do={\
    \n        :log error (\"!!! SECURITY ALERT: User \" . \$curUser . \" (IP: \
    \" . \$curAddr . \") has no Queue! Potential Bypass. Blocking MAC: \" . \$\
    curMac);\
    \n        \
    \n        # \D8\AD\D8\B8\D8\B1 \D8\A7\D9\84\D9\85\D8\A7\D9\83 \D8\A3\D8\AF\
    \D8\B1\D8\B3 \D9\81\D9\88\D8\B1\D8\A7\D9\8B \D9\84\D9\85\D9\86\D8\B9 \D8\
    \A7\D9\84\D8\AA\D8\AC\D8\A7\D9\88\D8\B2\
    \n        /ip hotspot ip-binding add mac-address=\$curMac type=blocked com\
    ment=(\"Ghost Bypass: \" . \$curUser);\
    \n        \
    \n        # \D8\B7\D8\B1\D8\AF \D8\A7\D9\84\D8\AC\D9\84\D8\B3\D8\A9 \D8\A7\
    \D9\84\D9\85\D8\B4\D8\A8\D9\88\D9\87\D8\A9\
    \n        /ip hotspot active remove \$i;\
    \n    }\
    \n}"
add dont-require-permissions=no name=User_Manager_Opserver owner=admin \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="# \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A8\D9\88\D8\AA \D8\A7\
    \D9\84\D8\AA\D9\8A\D9\84\D9\8A\D8\AC\D8\B1\D8\A7\D9\85\
    \n:local botToken \"8778752232:AAGiXj4p1wkvmoaY9ecf_4PFPMIYeUUYYnU\";\
    \n:local chatID \"7562205396\";\
    \n\
    \n# \D8\A7\D9\84\D9\81\D8\AD\D8\B5 \D9\8A\D8\B4\D9\85\D9\84 \D9\81\D9\82\
    \D8\B7 \D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85\D9\8A\D9\86 \D8\A7\
    \D9\84\D8\B0\D9\8A\D9\86 \D8\AA\D8\AC\D8\A7\D9\88\D8\B2 \D9\88\D9\82\D8\AA\
    \_\D8\A7\D8\AA\D8\B5\D8\A7\D9\84\D9\87\D9\85 \D8\AF\D9\82\D9\8A\D9\82\D8\
    \AA\D9\8A\D9\86 (\D9\84\D8\AA\D8\AC\D8\A7\D9\88\D8\B2 \D8\AA\D8\A3\D8\AE\
    \D9\8A\D8\B1 \D8\A7\D9\84\D9\8A\D9\88\D8\B2\D8\B1 \D9\85\D8\A7\D9\86\D8\AC\
    \D8\B1)\
    \n:foreach i in=[/ip hotspot active find where uptime > 4m] do={\
    \n    :local au [/ip hotspot active get \$i user];\
    \n    :local am [/ip hotspot active get \$i mac-address];\
    \n    \
    \n    # \D8\A7\D9\84\D8\A8\D8\AD\D8\AB \D8\B9\D9\86 \D8\AC\D9\84\D8\B3\D8\
    \A9 \D9\84\D9\87\D8\B0\D8\A7 \D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\
    \85 \D9\81\D9\8A \D8\A7\D9\84\D9\8A\D9\88\D8\B2\D8\B1 \D9\85\D9\86\D8\AC\
    \D8\B1\
    \n    :local sessions [/tool user-manager session find where user=\$au act\
    ive=yes];\
    \n    \
    \n    :if ([:len \$sessions] = 0) do={\
    \n        :log warning (\"!Ghost Session Detected: User \" . \$au . \" is \
    active in Hotspot but NOT in User-Manager. MAC: \" . \$am);\
    \n        \
    \n        # \D8\AA\D8\AC\D9\87\D9\8A\D8\B2 \D8\A7\D9\84\D8\B1\D8\B3\D8\A7\
    \D9\84\D8\A9 (\D8\A8\D8\AF\D9\88\D9\86 \D9\85\D8\B3\D8\A7\D9\81\D8\A7\D8\
    \AA \D9\85\D8\B9\D9\82\D8\AF\D8\A9 \D9\84\D8\AA\D8\AC\D9\86\D8\A8 \D8\A3\
    \D8\AE\D8\B7\D8\A7\D8\A1 \D8\A7\D9\84\D8\B1\D8\A7\D8\A8\D8\B7)\
    \n        :local textMsg (\"%E2%9A%A0%20Ghost%20Session%20Detected!%0AUser\
    :%20\" . \$au . \"%0AMAC:%20\" . \$am);\
    \n        :local tgUrl (\"https://api.telegram.org/bot\" . \$botToken . \"\
    /sendMessage\?chat_id=\" . \$chatID . \"&text=\" . \$textMsg);\
    \n        \
    \n        # \D9\85\D8\AD\D8\A7\D9\88\D9\84\D8\A9 \D8\A5\D8\B1\D8\B3\D8\A7\
    \D9\84 \D8\A7\D9\84\D8\A5\D8\B4\D8\B9\D8\A7\D8\B1\D8\8C \D9\88\D8\A5\D8\B0\
    \D8\A7 \D9\81\D8\B4\D9\84 \D9\8A\D8\AA\D9\85 \D8\AA\D8\B3\D8\AC\D9\8A\D9\
    \84 \D8\AE\D8\B7\D8\A3 \D9\81\D9\8A \D8\A7\D9\84\D8\B3\D8\AC\D9\84 \D8\AF\
    \D9\88\D9\86 \D8\A5\D9\8A\D9\82\D8\A7\D9\81 \D8\A7\D9\84\D8\B3\D9\83\D8\B1\
    \D9\8A\D8\A8\D8\AA\
    \n        :do {\
    \n            /tool fetch url=\$tgUrl keep-result=no check-certificate=no;\
    \n        } on-error={\
    \n            :log error (\"\D9\81\D8\B4\D9\84 \D8\A5\D8\B1\D8\B3\D8\A7\D9\
    \84 \D8\A5\D8\B4\D8\B9\D8\A7\D8\B1 \D8\A7\D9\84\D8\AA\D9\8A\D9\84\D9\8A\D8\
    \AC\D8\B1\D8\A7\D9\85 \D9\84\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85: \"\
    \_. \$au);\
    \n        }\
    \n        \
    \n        # \D9\8A\D9\85\D9\83\D9\86\D9\83 \D8\A5\D8\B2\D8\A7\D9\84\D8\A9 \
    \D8\B9\D9\84\D8\A7\D9\85\D8\A9 \D8\A7\D9\84\D9\85\D8\B1\D8\A8\D8\B9 (#) \
    \D9\85\D9\86 \D8\A7\D9\84\D8\B3\D8\B7\D8\B1 \D8\A7\D9\84\D8\AA\D8\A7\D9\84\
    \D9\8A \D9\84\D8\AA\D9\81\D8\B9\D9\8A\D9\84 \D8\B7\D8\B1\D8\AF \D8\A7\D9\
    \84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85 \D8\A8\D8\B9\D8\AF \D8\A7\D9\84\D8\
    \AA\D8\A3\D9\83\D8\AF \D9\85\D9\86 \D8\B9\D9\85\D9\84 \D8\A7\D9\84\D8\A5\
    \D8\B4\D8\B9\D8\A7\D8\B1\D8\A7\D8\AA\
    \n        /ip hotspot active remove \$i;\
    \n    }\
    \n}# \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A8\D9\88\D8\AA \D8\A7\D9\84\
    \D8\AA\D9\8A\D9\84\D9\8A\D8\AC\D8\B1\D8\A7\D9\85\
    \n:local botToken \"8778752232:AAGiXj4p1wkvmoaY9ecf_4PFPMIYeUUYYnU\";\
    \n:local chatID \"7562205396\";\
    \n\
    \n# \D8\A7\D9\84\D9\81\D8\AD\D8\B5 \D9\8A\D8\B4\D9\85\D9\84 \D9\81\D9\82\
    \D8\B7 \D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85\D9\8A\D9\86 \D8\A7\
    \D9\84\D8\B0\D9\8A\D9\86 \D8\AA\D8\AC\D8\A7\D9\88\D8\B2 \D9\88\D9\82\D8\AA\
    \_\D8\A7\D8\AA\D8\B5\D8\A7\D9\84\D9\87\D9\85 \D8\AF\D9\82\D9\8A\D9\82\D8\
    \AA\D9\8A\D9\86 (\D9\84\D8\AA\D8\AC\D8\A7\D9\88\D8\B2 \D8\AA\D8\A3\D8\AE\
    \D9\8A\D8\B1 \D8\A7\D9\84\D9\8A\D9\88\D8\B2\D8\B1 \D9\85\D8\A7\D9\86\D8\AC\
    \D8\B1)\
    \n:foreach i in=[/ip hotspot active find where uptime > 4m] do={\
    \n    :local au [/ip hotspot active get \$i user];\
    \n    :local am [/ip hotspot active get \$i mac-address];\
    \n    \
    \n    # \D8\A7\D9\84\D8\A8\D8\AD\D8\AB \D8\B9\D9\86 \D8\AC\D9\84\D8\B3\D8\
    \A9 \D9\84\D9\87\D8\B0\D8\A7 \D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\
    \85 \D9\81\D9\8A \D8\A7\D9\84\D9\8A\D9\88\D8\B2\D8\B1 \D9\85\D9\86\D8\AC\
    \D8\B1\
    \n    :local sessions [/tool user-manager session find where user=\$au act\
    ive=yes];\
    \n    \
    \n    :if ([:len \$sessions] = 0) do={\
    \n        :log warning (\"!Ghost Session Detected: User \" . \$au . \" is \
    active in Hotspot but NOT in User-Manager. MAC: \" . \$am);\
    \n        \
    \n        # \D8\AA\D8\AC\D9\87\D9\8A\D8\B2 \D8\A7\D9\84\D8\B1\D8\B3\D8\A7\
    \D9\84\D8\A9 (\D8\A8\D8\AF\D9\88\D9\86 \D9\85\D8\B3\D8\A7\D9\81\D8\A7\D8\
    \AA \D9\85\D8\B9\D9\82\D8\AF\D8\A9 \D9\84\D8\AA\D8\AC\D9\86\D8\A8 \D8\A3\
    \D8\AE\D8\B7\D8\A7\D8\A1 \D8\A7\D9\84\D8\B1\D8\A7\D8\A8\D8\B7)\
    \n        :local textMsg (\"%E2%9A%A0%20Ghost%20Session%20Detected!%0AUser\
    :%20\" . \$au . \"%0AMAC:%20\" . \$am);\
    \n        :local tgUrl (\"https://api.telegram.org/bot\" . \$botToken . \"\
    /sendMessage\?chat_id=\" . \$chatID . \"&text=\" . \$textMsg);\
    \n        \
    \n        # \D9\85\D8\AD\D8\A7\D9\88\D9\84\D8\A9 \D8\A5\D8\B1\D8\B3\D8\A7\
    \D9\84 \D8\A7\D9\84\D8\A5\D8\B4\D8\B9\D8\A7\D8\B1\D8\8C \D9\88\D8\A5\D8\B0\
    \D8\A7 \D9\81\D8\B4\D9\84 \D9\8A\D8\AA\D9\85 \D8\AA\D8\B3\D8\AC\D9\8A\D9\
    \84 \D8\AE\D8\B7\D8\A3 \D9\81\D9\8A \D8\A7\D9\84\D8\B3\D8\AC\D9\84 \D8\AF\
    \D9\88\D9\86 \D8\A5\D9\8A\D9\82\D8\A7\D9\81 \D8\A7\D9\84\D8\B3\D9\83\D8\B1\
    \D9\8A\D8\A8\D8\AA\
    \n        :do {\
    \n            /tool fetch url=\$tgUrl keep-result=no check-certificate=no;\
    \n        } on-error={\
    \n            :log error (\"\D9\81\D8\B4\D9\84 \D8\A5\D8\B1\D8\B3\D8\A7\D9\
    \84 \D8\A5\D8\B4\D8\B9\D8\A7\D8\B1 \D8\A7\D9\84\D8\AA\D9\8A\D9\84\D9\8A\D8\
    \AC\D8\B1\D8\A7\D9\85 \D9\84\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85: \"\
    \_. \$au);\
    \n        }\
    \n        \
    \n        # \D9\8A\D9\85\D9\83\D9\86\D9\83 \D8\A5\D8\B2\D8\A7\D9\84\D8\A9 \
    \D8\B9\D9\84\D8\A7\D9\85\D8\A9 \D8\A7\D9\84\D9\85\D8\B1\D8\A8\D8\B9 (#) \
    \D9\85\D9\86 \D8\A7\D9\84\D8\B3\D8\B7\D8\B1 \D8\A7\D9\84\D8\AA\D8\A7\D9\84\
    \D9\8A \D9\84\D8\AA\D9\81\D8\B9\D9\8A\D9\84 \D8\B7\D8\B1\D8\AF \D8\A7\D9\
    \84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85 \D8\A8\D8\B9\D8\AF \D8\A7\D9\84\D8\
    \AA\D8\A3\D9\83\D8\AF \D9\85\D9\86 \D8\B9\D9\85\D9\84 \D8\A7\D9\84\D8\A5\
    \D8\B4\D8\B9\D8\A7\D8\B1\D8\A7\D8\AA\
    \n      #  /ip hotspot active remove \$i;\
    \n    }\
    \n}"
add dont-require-permissions=no name=MAC_Blocking owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    \_\D8\B3\D9\83\D8\B1\D9\8A\D8\A8\D8\AA \D8\AD\D8\B8\D8\B1 \D8\A7\D9\84\D9\
    \85\D8\AE\D8\B1\D8\A8\D9\8A\D9\86 \D9\85\D9\86 \D8\A7\D9\84\D8\B3\D8\AC\D9\
    \84\D8\A7\D8\AA\
    \n:foreach i in=[/log find message~\"invalid password\" || message~\"user \
    not found\"] do={\
    \n    :local lmsg [/log get \$i message];\
    \n    :local start [:find \$lmsg \"(\"];\
    \n    :local end [:find \$lmsg \")\"];\
    \n    \
    \n    :if (\$start >= 0 && \$end >= 0) do={\
    \n        :local m [:pick \$lmsg (\$start + 1) \$end];\
    \n        \
    \n        # \D8\A5\D8\B0\D8\A7 \D9\84\D9\85 \D9\8A\D9\83\D9\86 \D9\85\D8\
    \AD\D8\B8\D9\88\D8\B1\D8\A7\D9\8B \D9\85\D8\B3\D8\A8\D9\82\D8\A7\D9\8B\D8\
    \8C \D9\82\D9\85 \D8\A8\D8\AD\D8\B8\D8\B1\D9\87\
    \n        :if ([:len [/ip hotspot ip-binding find where mac-address=\$m]] \
    = 0) do={\
    \n            /ip hotspot ip-binding add mac-address=\$m type=blocked comm\
    ent=\"Auto Block: Too many failed logins\";\
    \n            :log error (\"Blacklisted MAC: \" . \$m . \" due to brute fo\
    rce attempt.\");\
    \n        }\
    \n    }\
    \n}"
add comment="Daily Clean Users" dont-require-permissions=no name="Bulk Clean" \
    owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    \n:local netRange \"10.33.0.0/16\";\
    \n:log warning \"--- STARTING CUSTOM DAILY CLEANUP (PRESERVING COOKIES & N\
    ETCUT) ---\";\
    \n\
    \n# 1. \D8\AA\D9\86\D8\B8\D9\8A\D9\81 \D8\AC\D8\AF\D9\88\D9\84 \D8\A7\D9\
    \84\D9\80 ARP (\D9\84\D8\A5\D8\B9\D8\A7\D8\AF\D8\A9 \D8\A5\D9\86\D8\B9\D8\
    \A7\D8\B4 \D8\A7\D9\84\D8\A7\D8\AA\D8\B5\D8\A7\D9\84 \D8\A7\D9\84\D9\81\D9\
    \8A\D8\B2\D9\8A\D8\A7\D8\A6\D9\8A \D8\A8\D8\A7\D9\84\D8\A3\D8\AC\D9\87\D8\
    \B2\D8\A9)\
    \n/ip arp remove [find where address in \$netRange];\
    \n\
    \n# 2. \D8\AA\D9\86\D8\B8\D9\8A\D9\81 \D8\A7\D9\84\D9\80 Hosts \D8\BA\D9\
    \8A\D8\B1 \D8\A7\D9\84\D9\85\D8\B5\D8\B1\D8\AD \D9\84\D9\87\D9\85 \D9\81\
    \D9\82\D8\B7\
    \n# \D9\87\D8\B0\D8\A7 \D9\8A\D8\B3\D8\A7\D8\B9\D8\AF \D9\81\D9\8A \D8\B8\
    \D9\87\D9\88\D8\B1 \D8\B5\D9\81\D8\AD\D8\A9 \D8\A7\D9\84\D8\AF\D8\AE\D9\88\
    \D9\84 \D9\84\D9\84\D8\A3\D8\AC\D9\87\D8\B2\D8\A9 \D8\A7\D9\84\D8\AA\D9\8A\
    \_\D9\83\D8\A7\D9\86\D8\AA \"\D8\B9\D9\84\D9\82\D8\A9\" \D8\A3\D9\88 \"\D9\
    \85\D8\AE\D9\81\D9\8A\D8\A9\"\
    \n/ip hotspot host remove [find where !authorized and address in \$netRang\
    e];\
    \n\
    \n# 3. \D8\AA\D9\86\D8\B8\D9\8A\D9\81 \D9\82\D9\88\D8\A7\D8\A6\D9\85 \D8\
    \A7\D9\84\D9\80 Address List \D8\A7\D9\84\D9\85\D8\AD\D8\AF\D8\AF\D8\A9 (\
    \D8\AA\D8\AC\D8\AF\D9\8A\D8\AF \D8\A7\D9\84\D8\B5\D9\84\D8\A7\D8\AD\D9\8A\
    \D8\A7\D8\AA)\
    \n# \D8\B3\D9\8A\D8\AA\D9\85 \D8\AD\D8\B0\D9\81 \D8\A7\D9\84\D9\85\D8\B3\
    \D8\AA\D8\AE\D8\AF\D9\85\D9\8A\D9\86 \D9\85\D9\86 \D9\82\D9\88\D8\A7\D8\A6\
    \D9\85 \D8\A7\D9\84\D9\80 VPN \D9\88\D9\85\D9\86\D8\B9 \D8\A7\D9\84\D8\AA\
    \D8\AD\D8\AF\D9\8A\D8\AB\D8\A7\D8\AA \D9\84\D8\A5\D8\B9\D8\A7\D8\AF\D8\A9 \
    \D8\AA\D8\B7\D8\A8\D9\8A\D9\82\D9\87\D8\A7 \D8\B9\D9\86\D8\AF \D8\AA\D8\B3\
    \D8\AC\D9\8A\D9\84 \D8\A7\D9\84\D8\AF\D8\AE\D9\88\D9\84 \D8\A7\D9\84\D8\AC\
    \D8\AF\D9\8A\D8\AF\
    \n/ip firewall address-list remove [find where list=\"VPN_Users\" and addr\
    ess in \$netRange];\
    \n/ip firewall address-list remove [find where list=\"Users_No_Update\" an\
    d address in \$netRange];\
    \n\
    \n# 4. \D8\AA\D9\86\D8\B8\D9\8A\D9\81 \D9\82\D9\88\D8\A7\D8\A6\D9\85 \D8\
    \A7\D9\84\D8\AD\D9\85\D8\A7\D9\8A\D8\A9 \D8\A7\D9\84\D8\AA\D9\84\D9\82\D8\
    \A7\D8\A6\D9\8A\D8\A9 (Blacklists)\
    \n/ip firewall address-list remove [find where list~\"Stage\" and address \
    in \$netRange];\
    \n/ip firewall address-list remove [find where list~\"Blacklist\" and addr\
    ess in \$netRange];\
    \n\
    \n# 5. \D8\A7\D8\B3\D8\AA\D8\AB\D9\86\D8\A7\D8\A1 \D9\82\D8\A7\D8\A6\D9\85\
    \D8\A9 netcutuser (\D9\85\D9\87\D9\85)\
    \n# \D8\A7\D9\84\D8\B3\D9\83\D8\B1\D9\8A\D8\A8\D8\AA \D9\84\D9\86 \D9\8A\
    \D9\82\D8\AA\D8\B1\D8\A8 \D9\85\D9\86 \D9\82\D8\A7\D8\A6\D9\85\D8\A9 netcu\
    tuser \D9\84\D8\B6\D9\85\D8\A7\D9\86 \D8\A7\D8\B3\D8\AA\D9\85\D8\B1\D8\A7\
    \D8\B1 \D8\AD\D8\B8\D8\B1 \D8\A7\D9\84\D9\85\D9\87\D8\A7\D8\AC\D9\85\D9\8A\
    \D9\86\
    \n\
    \n# 6. \D8\AA\D9\86\D8\B8\D9\8A\D9\81 \D8\A7\D9\84\D9\80 Simple Queues \D8\
    \A7\D9\84\D8\AF\D9\8A\D9\86\D8\A7\D9\85\D9\8A\D9\83\D9\8A\D8\A9\
    \n# \D9\84\D8\B6\D9\85\D8\A7\D9\86 \D8\B9\D8\AF\D9\85 \D9\88\D8\AC\D9\88\
    \D8\AF \D8\B7\D9\88\D8\A7\D8\A8\D9\8A\D8\B1 \D9\82\D8\AF\D9\8A\D9\85\D8\A9\
    \_\D8\A8\D8\A3\D8\B3\D9\85\D8\A7\D8\A1 \D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\
    \85\D9\8A\D9\86 \D8\AE\D8\B1\D8\AC\D9\88\D8\A7 \D9\85\D9\86 \D8\A7\D9\84\
    \D8\B4\D8\A8\D9\83\D8\A9\
    \n#/queue simple remove [find where dynamic=yes and target in \$netRange];\
    \n\
    \n:log warning \"--- CUSTOM CLEANUP COMPLETED: VPN/Updates reset | Netcut/\
    Cookies Preserved ---\";\
    \n}"
add dont-require-permissions=no name=expire_user_remove_notifi owner=admin \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="# \D8\A7\D8\B3\D9\85 \D8\A7\D9\84\D9\82\D8\A7\D8\A6\D9\85\D8\A9 \
    \D8\A7\D9\84\D9\85\D8\B1\D8\A7\D8\AF \D8\AA\D9\86\D8\B8\D9\8A\D9\81\D9\87\
    \D8\A7\
    \n:local listName \"Telegram_Notified\";\
    \n\
    \n# \D8\A7\D9\84\D9\85\D8\B1\D9\88\D8\B1 \D8\B9\D9\84\D9\89 \D8\AC\D9\85\
    \D9\8A\D8\B9 \D8\A7\D9\84\D9\85\D8\AF\D8\AE\D9\84\D8\A7\D8\AA \D9\81\D9\8A\
    \_\D8\A7\D9\84\D9\82\D8\A7\D8\A6\D9\85\D8\A9\
    \n:foreach i in=[/ip firewall address-list find list=\$listName] do={\
    \n    # \D8\AC\D9\84\D8\A8 \D8\A7\D8\B3\D9\85 \D8\A7\D9\84\D9\85\D8\B3\D8\
    \AA\D8\AE\D8\AF\D9\85 \D9\85\D9\86 \D8\AD\D9\82\D9\84 \D8\A7\D9\84\D8\AA\
    \D8\B9\D9\84\D9\8A\D9\82\
    \n    :local uName [/ip firewall address-list get \$i comment];\
    \n    \
    \n    :if ([:len \$uName] > 0) do={\
    \n        # \D8\A7\D9\84\D8\AA\D8\AD\D9\82\D9\82 \D9\85\D9\86 \D9\88\D8\AC\
    \D9\88\D8\AF \D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85 \D9\81\D9\8A\
    \_\D8\A7\D9\84\D9\8A\D9\88\D8\B2\D8\B1 \D9\85\D9\86\D8\AC\D8\B1 (v7 syntax\
    )\
    \n        :local userExists [/user-manager user find name=\$uName];\
    \n        \
    \n        # \D8\A5\D8\B0\D8\A7 \D9\84\D9\85 \D9\8A\D8\AA\D9\85 \D8\A7\D9\
    \84\D8\B9\D8\AB\D9\88\D8\B1 \D8\B9\D9\84\D9\8A\D9\87 (\D8\AA\D9\85 \D8\AD\
    \D8\B0\D9\81\D9\87 \D8\A3\D9\88 \D8\A7\D9\86\D8\AA\D9\87\D8\A7\D8\A1\D9\87\
    \_\D9\88\D8\A5\D8\B2\D8\A7\D9\84\D8\AA\D9\87)\
    \n        :if ([:len \$userExists] = 0) do={\
    \n            /ip firewall address-list remove \$i;\
    \n            :log info (\"Cleanup Script: Removed user \" . \$uName . \" \
    from Telegram_Notified list.\");\
    \n        }\
    \n    }\
    \n}\
    \n\
    \n"
add comment=TelegramRemote dont-require-permissions=no name=TelegramRemote \
    owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="\
    \n\
    \n# --- \D8\A5\D8\B9\D8\AF\D8\A7\D8\AF\D8\A7\D8\AA \D8\A7\D9\84\D8\A8\D9\
    \88\D8\AA ---\
    \n:local botToken \"8691220295:AAFJ3Wqp756sVPaaeF4Fzxx5C45lgaDFlKg\";\
    \n:local chatID \"7562205396\";\
    \n\
    \n# --- \D8\A7\D9\84\D9\85\D8\AA\D8\BA\D9\8A\D8\B1 \D8\A7\D9\84\D8\B9\D8\
    \A7\D9\84\D9\85\D9\8A \D9\84\D9\85\D8\AA\D8\A7\D8\A8\D8\B9\D8\A9 \D8\A7\D9\
    \84\D8\B1\D8\B3\D8\A7\D8\A6\D9\84 ---\
    \n:global lastUpdateID;\
    \n:if ([:typeof \$lastUpdateID] = \"nothing\") do={ :set lastUpdateID 0 };\
    \n\
    \n# 1. \D8\AC\D9\84\D8\A8 \D8\A7\D9\84\D8\AA\D8\AD\D8\AF\D9\8A\D8\AB\D8\A7\
    \D8\AA\
    \n:local url \"https://api.telegram.org/bot\$botToken/getUpdates\\\?offset\
    =\$(\$lastUpdateID + 1)&limit=1&timeout=5\";\
    \n:do {\
    \n    /tool fetch url=\$url mode=https keep-result=yes dst-path=\"tg_resul\
    t.txt\";\
    \n} on-error={ :log error \"[TG-BOT] Fetch error\" };\
    \n\
    \n:delay 1s;\
    \n\
    \n# 2. \D8\AA\D8\AD\D9\84\D9\8A\D9\84 \D8\A7\D9\84\D9\85\D9\84\D9\81 \D9\
    \88\D8\A7\D8\B3\D8\AA\D8\AE\D8\B1\D8\A7\D8\AC \D8\A7\D9\84\D8\A3\D9\85\D8\
    \B1\
    \n:if ([:len [/file find name=\"tg_result.txt\"]] > 0) do={\
    \n    :local content [/file get \"tg_result.txt\" contents];\
    \n    :local idKey \"update_id\\\":\";\
    \n    :local idPos [:find \$content \$idKey];\
    \n\
    \n    :if (\$idPos != \"\") do={\
    \n        # \D8\AA\D8\AD\D8\AF\D9\8A\D8\AB ID \D8\A7\D9\84\D8\AA\D8\AD\D8\
    \AF\D9\8A\D8\AB \D9\81\D9\88\D8\B1\D8\A7\D9\8B \D9\84\D8\B6\D9\85\D8\A7\D9\
    \86 \D8\B9\D8\AF\D9\85 \D8\A7\D9\84\D8\AA\D9\83\D8\B1\D8\A7\D8\B1\
    \n        :local uID [:pick \$content (\$idPos + [:len \$idKey]) [:find \$\
    content \",\" (\$idPos + [:len \$idKey])]];\
    \n        :set lastUpdateID [:tonum \$uID];\
    \n\
    \n        :local textKey \"text\\\":\\\"\";\
    \n        :local textPos [:find \$content \$textKey];\
    \n        #:log warning (\"MSG TEXT: \" .\$textPos);\
    \n\
    \n        :if (\$textPos != \"\") do={\
    \n            :local tStart (\$textPos + [:len \$textKey]);\
    \n            :local tEnd [:find \$content \"\\\"\" \$tStart];\
    \n            :local msgText [:pick \$content \$tStart \$tEnd];\
    \n            # ==========================================\
    \n            # [1] \D8\A3\D9\85\D8\B1 \D8\A7\D9\84\D8\AD\D8\A7\D9\84\D8\
    \A9 (\D8\A7\D9\84\D8\AA\D9\82\D8\B1\D9\8A\D8\B1 \D8\A7\D9\84\D9\85\D8\B7\
    \D9\84\D9\88\D8\A8 \D8\A8\D8\A7\D9\84\D8\AA\D8\B1\D8\AA\D9\8A\D8\A8 \D8\A7\
    \D9\84\D9\85\D8\AE\D8\B5\D8\B5)\
    \n            # ==========================================\
    \n            :if (\$msgText = \"/status\") do={\
    \n               \
    \n              :local cpu [/system resource get cpu-load];\
    \n                :local uptime [/system resource get uptime];\
    \n                :local activeUsers [/ip hotspot active print count-only]\
    ;\
    \n\
    \n:local interfaceName1 \"ISP1\";\
    \n:local rxByte1 [/interface get [find name=\$interfaceName1] rx-byte];\
    \n:local txByte1 [/interface get [find name=\$interfaceName1] tx-byte];\
    \n:local rxTotal1 (\$rxByte1 / 1048576);\
    \n:local txTotal1 (\$txByte1 / 1048576);\
    \n:local totalISP1 (\$txTotal1 + \$rxTotal1);\
    \n\
    \n\
    \n\
    \n:local interfaceName11 \"VLAN-2011-L1\";\
    \n:local rxByte11 [/interface get [find name=\$interfaceName11] rx-byte];\
    \n:local txByte11 [/interface get [find name=\$interfaceName11] tx-byte];\
    \n:local rxTotal11 (\$rxByte11 / 1048576);\
    \n:local txTotal11 (\$txByte11 / 1048576);\
    \n:local totalISP11 (\$txTotal11 + \$rxTotal11);\
    \n\
    \n:local interfaceName12 \"VLAN-2012-L1\";\
    \n:local rxByte12 [/interface get [find name=\$interfaceName12] rx-byte];\
    \n:local txByte12 [/interface get [find name=\$interfaceName12] tx-byte];\
    \n:local rxTotal12 (\$rxByte12 / 1048576);\
    \n:local txTotal12 (\$txByte12 / 1048576);\
    \n:local totalISP12 (\$txTotal12 + \$rxTotal12);\
    \n\
    \n:local interfaceName13 \"VLAN-2013-L1\";\
    \n:local rxByte13 [/interface get [find name=\$interfaceName13] rx-byte];\
    \n:local txByte13 [/interface get [find name=\$interfaceName13] tx-byte];\
    \n:local rxTotal13 (\$rxByte13 / 1048576);\
    \n:local txTotal13 (\$txByte13 / 1048576);\
    \n:local totalISP13 (\$txTotal13 + \$rxTotal13);\
    \n\
    \n:local interfaceName14 \"VLAN-2014-L1\";\
    \n:local rxByte14 [/interface get [find name=\$interfaceName14] rx-byte];\
    \n:local txByte14 [/interface get [find name=\$interfaceName14] tx-byte];\
    \n:local rxTotal14 (\$rxByte14 / 1048576);\
    \n:local txTotal14 (\$txByte14 / 1048576);\
    \n:local totalISP14 (\$txTotal14 + \$rxTotal14);\
    \n\
    \n:local interfaceName15 \"ether7\";\
    \n:local rxByte15 [/interface get [find name=\$interfaceName15] rx-byte];\
    \n:local txByte15 [/interface get [find name=\$interfaceName15] tx-byte];\
    \n:local rxTotal15 (\$rxByte15 / 1048576);\
    \n:local txTotal15 (\$txByte15 / 1048576);\
    \n:local totalISP15 (\$txTotal15 + \$rxTotal15);\
    \n\
    \n:local interfaceName16 \"ether7\";\
    \n:local rxByte16 [/interface get [find name=\$interfaceName16] rx-byte];\
    \n:local txByte16 [/interface get [find name=\$interfaceName16] tx-byte];\
    \n:local rxTotal16 (\$rxByte16 / 1048576);\
    \n:local txTotal16 (\$txByte16 / 1048576);\
    \n:local totalISP16 (\$txTotal16 + \$rxTotal16);\
    \n\
    \n:local interfaceName17 \"ether7\";\
    \n:local rxByte17 [/interface get [find name=\$interfaceName17] rx-byte];\
    \n:local txByte17 [/interface get [find name=\$interfaceName17] tx-byte];\
    \n:local rxTotal17 (\$rxByte17 / 1048576);\
    \n:local txTotal17 (\$txByte17 / 1048576);\
    \n:local totalISP17 (\$txTotal17 + \$rxTotal17);\
    \n\
    \n:local interfaceName18 \"ether7\";\
    \n:local rxByte18 [/interface get [find name=\$interfaceName18] rx-byte];\
    \n:local txByte18 [/interface get [find name=\$interfaceName18] tx-byte];\
    \n:local rxTotal18 (\$rxByte18 / 1048576);\
    \n:local txTotal18 (\$txByte18 / 1048576);\
    \n:local totalISP18 (\$txTotal18 + \$rxTotal18);\
    \n\
    \n:local interfaceName19 \"VLAN-2019-L3\";\
    \n:local rxByte19 [/interface get [find name=\$interfaceName19] rx-byte];\
    \n:local txByte19 [/interface get [find name=\$interfaceName19] tx-byte];\
    \n:local rxTotal19 (\$rxByte19 / 1048576);\
    \n:local txTotal19 (\$txByte19 / 1048576);\
    \n:local totalISP19 (\$txTotal19 + \$rxTotal19);\
    \n\
    \n:local interfaceName20 \"VLAN-2020-L3\";\
    \n:local rxByte20 [/interface get [find name=\$interfaceName20] rx-byte];\
    \n:local txByte20 [/interface get [find name=\$interfaceName20] tx-byte];\
    \n:local rxTotal20 (\$rxByte20 / 1048576);\
    \n:local txTotal20 (\$txByte20 / 1048576);\
    \n:local totalISP20 (\$txTotal20 + \$rxTotal20);\
    \n\
    \n:local interfaceName21 \"VLAN-2021-L3\";\
    \n:local rxByte21 [/interface get [find name=\$interfaceName21] rx-byte];\
    \n:local txByte21 [/interface get [find name=\$interfaceName21] tx-byte];\
    \n:local rxTotal21 (\$rxByte21 / 1048576);\
    \n:local txTotal21 (\$txByte21 / 1048576);\
    \n:local totalISP21 (\$txTotal21 + \$rxTotal21);\
    \n\
    \n:local interfaceName22 \"VLAN-2022-L3\";\
    \n:local rxByte22 [/interface get [find name=\$interfaceName22] rx-byte];\
    \n:local txByte22 [/interface get [find name=\$interfaceName22] tx-byte];\
    \n:local rxTotal22 (\$rxByte22 / 1048576);\
    \n:local txTotal22 (\$txByte22 / 1048576);\
    \n:local totalISP22 (\$txTotal22 + \$rxTotal22);\
    \n\
    \n                :local totalDownload (\$rxTotal1 + \$rxTotal11 + \$rxTot\
    al12 + \$rxTotal13 + \$rxTotal14 + \$rxTotal5 \$rxTotal16 + \$rxTotal17 + \
    \$rxTotal18 + \$rxTotal19 + \$rxTotal20 + \$rxTotal21  + \$rxTotal22);\
    \n                :local totalUpload (\$txTotal1 + \$txTotal11 + \$txTotal\
    12 + \$txTotal13 + \$txTotal14 + \$txTotal5 + \$txTotal16 + \$txTotal17 + \
    \$txTotal18 + \$txTotal19 + \$txTota20 + \$txTotal21 + \$txTotal22);\
    \n\
    \n                # \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\AF\D8\A7\D9\
    \87\D9\88\D8\A7 (ether12)\
    \n                :local dahuaInterfaceName \"ether12\";\
    \n                :local rxByteDahua [/interface get [find name=\$dahuaInt\
    erfaceName] rx-byte];\
    \n                :local txByteDahua [/interface get [find name=\$dahuaInt\
    erfaceName] tx-byte];\
    \n                :local rxTotalDahua (\$rxByteDahua / 1048576);\
    \n                :local txTotalDahua (\$txByteDahua / 1048576);\
    \n\
    \n                # \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A7\D9\84\D8\
    \A7\D8\B3\D8\AA\D8\B1\D8\A7\D8\AD\D8\A9 (ether13)\
    \n                :local istraha \"ether13\";\
    \n                :local rxByteIstraha [/interface get [find name=\$istrah\
    a] rx-byte];\
    \n                :local txByteIstraha [/interface get [find name=\$istrah\
    a] tx-byte];\
    \n                :local rxTotalIstraha (\$rxByteIstraha / 1048576);\
    \n                :local txTotalIstraha (\$txByteIstraha / 1048576);\
    \n\
    \n:local interfaceNameBr \"IN-OUT\";\
    \n:local rxByteBr [/interface get [find name=\$interfaceNameBr] rx-byte];\
    \n:local txByteBr [/interface get [find name=\$interfaceNameBr] tx-byte];\
    \n:local rxTotalBr (\$rxByteBr / 1048576);\
    \n:local txTotalBr (\$txByteBr / 1048576);\
    \n:local totalConsum (\$rxTotalBr + \$txTotalBr);\
    \n\
    \n:local totalDownload (\$rxTotal1 + \$rxTotal11 + \$rxTotal12 + \$rxTotal\
    13 + \$rxTotal14 + \$rxTotal15 + \$rxTotal16 + \$rxTotal17 + \$rxTotal18 +\
    \_\$rxTotal19 + \$rxTotal20 + \$rxTotal21 + \$rxTotal22);\
    \n\
    \n:local totalUpload (\$txTotal1 + \$txTotal11 + \$txTotal12 + \$txTotal13\
    \_+ \$txTotal14 + \$txTotal15 + \$txTotal16 + \$txTotal17 + \$txTotal18 + \
    \$txTotal19 + \$txTotal20 + \$txTotal21 + \$txTotal22);\
    \n\
    \n:local totalIncome (\$totalUpload + \$totalDownload);\
    \n\
    \n         :local istrahaConsum (\$totalIncome - \$totalConsum);\
    \n \
    \n # ==========================================\
    \n# 1. \D8\AA\D8\B9\D8\B1\D9\8A\D9\81 \D8\A7\D9\84\D8\B1\D9\85\D9\88\D8\B2\
    \_\D8\A7\D9\84\D8\AA\D8\B9\D8\A8\D9\8A\D8\B1\D9\8A\D8\A9 \D9\88\D8\A7\D9\
    \84\D8\AA\D9\86\D8\B3\D9\8A\D9\82\
    \n# ==========================================\
    \n:local iconCPU \"%F0%9F%92%BB\"\
    \n:local iconTime \"%E2%8F%B1\"\
    \n:local iconUsers \"%F0%9F%91%A5\"\
    \n:local iconDown \"%F0%9F%93%A5\"\
    \n:local iconUp \"%F0%9F%93%A4\"\
    \n:local nl \"%0A\"  # \D8\B1\D9\85\D8\B2 \D8\A7\D9\84\D9\86\D8\B2\D9\88\
    \D9\84 \D9\84\D8\B3\D8\B7\D8\B1 \D8\AC\D8\AF\D9\8A\D8\AF\
    \n\
    \n\
    \n# ==========================================\
    \n# 2. \D8\A8\D9\86\D8\A7\D8\A1 \D8\B1\D8\B3\D8\A7\D9\84\D8\A9 \D8\A7\D9\
    \84\D9\86\D8\B8\D8\A7\D9\85\
    \n# ==========================================\
    \n\
    \n\
    \n :local finalMsgOld (\"ENAN%20MAIN%20STATUS%0A------------------%0A%F0%9\
    F%92%BB%20CPU:%20\$cpu%25%0A%E2%8F%B1%20Uptime:%20\$uptime%0A%F0%9F%91%A5%\
    20Active%20Users:%20\$activeUsers%0A--------ISP1-------%0A%F0%9F%93%A5%20d\
    ownload:%20\$rxTotal1%20MB%0A%F0%9F%93%A4%20upload1:%20\$txTotal1%20MB%0A%\
    F0%9F%93%A4%20Total:%20\$totalISP1%20MB%0A--------ISP11--------%0A%F0%9F%9\
    3%A5%20download:%20\$rxTotal11%20MB%0A%F0%9F%93%A4%20upload:%20\$txTotal11\
    %20MB%0A%F0%9F%93%A4%20Total:%20\$totalISP11%20MB%0A--------ISP12--------%\
    0A%F0%9F%93%A5%20download:%20\$rxTotal12%20MB%0A%F0%9F%93%A4%20upload:%20\
    \$txTotal12%20MB%0A%F0%9F%93%A4%20Total:%20\$totalISP12%20MB%0A--------ISP\
    13--------%0A%F0%9F%93%A5%20download:%20\$rxTotal13%20MB%0A%F0%9F%93%A4%20\
    upload:%20\$txTotal13%20MB%0A%F0%9F%93%A4%20Total:%20\$totalISP13%20MB%0A-\
    -------ISP14--------%0A%F0%9F%93%A5%20download:%20\$rxTotal14%20MB%0A%F0%9\
    F%93%A4%20upload:%20\$txTotal14%20MB%0A%F0%9F%93%A4%20Total:%20\$totalISP1\
    4%20MB%0A--------ISP19--------%0A%F0%9F%93%A5%20download:%20\$rxTotal19%20\
    MB%0A%F0%9F%93%A4%20upload:%20\$txTotal19%20MB%0A%F0%9F%93%A4%20Total:%20\
    \$totalISP19%20MB%0A--------ISP20--------%0A%F0%9F%93%A5%20download:%20\$r\
    xTotal20%20MB%0A%F0%9F%93%A4%20upload:%20\$txTotal20%20MB%0A%F0%9F%93%A4%2\
    0Total:%20\$totalISP20%20MB%0A--------ISP21--------%0A%F0%9F%93%A5%20downl\
    oad:%20\$rxTotal21%20MB%0A%F0%9F%93%A4%20upload:%20\$txTotal21%20MB%0A%F0%\
    9F%93%A4%20Total:%20\$totalISP21%20MB%0A--------ISP22--------%0A%F0%9F%93%\
    A5%20download:%20\$rxTotal22%20MB%0A%F0%9F%93%A4%20upload:%20\$txTotal22%2\
    0MB%0A%F0%9F%93%A4%20Total:%20\$totalISP22%20MB%0A-------total-------%0A%F\
    0%9F%93%A5%20download:%20\$totalDownload%20MB%0A%F0%9F%93%A4%20upload:%20\
    \$totalUpload%20MB%0A%F0%9F%93%A4%20Total:%20\$totalIncome%20MB%0A--------\
    ----------%0A%F0%9F%93%A5%20dahua%20download:%20\$txTotalDahua%20MB%0A%F0%\
    9F%93%A4%20dahua%20upload:%20\$rxTotalDahua%20MB%0A------------------%0A%F\
    0%9F%93%A5%20Istraha%20download:%20\$txTotalIstraha%20MB%0A%F0%9F%93%A4%20\
    Istraha%20upload:%20\$rxTotalIstraha%20MB%0ATotal_Consum:%20\$istrahaConsu\
    m%0A------------------\");\
    \n:log info \$finalMsgOld\
    \n\
    \n\
    \n\
    \n:local finalMsg \"ENAN%20MAIN%20STATUS\$nl------------------\$nl\"\
    \n:set finalMsg (\$finalMsg . \"\$iconCPU%20CPU:%20\$cpu%25\$nl\")\
    \n:set finalMsg (\$finalMsg . \"\$iconTime%20Uptime:%20\$uptime\$nl\")\
    \n:set finalMsg (\$finalMsg . \"\$iconUsers%20Active%20Users:%20\$activeUs\
    ers\$nl\")\
    \n\
    \n# ==========================================\
    \n# 3. \D8\A8\D9\86\D8\A7\D8\A1 \D8\B1\D8\B3\D8\A7\D9\84\D8\A9 \D8\A7\D9\
    \84\D8\AE\D8\B7\D9\88\D8\B7 (ISPs)\
    \n# ==========================================\
    \n:set finalMsg (\$finalMsg . \"--------ISP1-------\$nl\$iconDown%20downlo\
    ad:%20\$rxTotal1%20MB\$nl\$iconUp%20upload1:%20\$txTotal1%20MB\$nl\$iconUp\
    %20Total:%20\$totalISP1%20MB\$nl\")\
    \n:set finalMsg (\$finalMsg . \"--------ISP11--------\$nl\$iconDown%20down\
    load:%20\$rxTotal11%20MB\$nl\$iconUp%20upload:%20\$txTotal11%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP11%20MB\$nl\")\
    \n:set finalMsg (\$finalMsg . \"--------ISP12--------\$nl\$iconDown%20down\
    load:%20\$rxTotal12%20MB\$nl\$iconUp%20upload:%20\$txTotal12%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP12%20MB\$nl\")\
    \n:set finalMsg (\$finalMsg . \"--------ISP13--------\$nl\$iconDown%20down\
    load:%20\$rxTotal13%20MB\$nl\$iconUp%20upload:%20\$txTotal13%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP13%20MB\$nl\")\
    \n:set finalMsg (\$finalMsg . \"--------ISP14--------\$nl\$iconDown%20down\
    load:%20\$rxTotal14%20MB\$nl\$iconUp%20upload:%20\$txTotal14%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP14%20MB\$nl\")\
    \n:set finalMsg (\$finalMsg . \"--------ISP19--------\$nl\$iconDown%20down\
    load:%20\$rxTotal19%20MB\$nl\$iconUp%20upload:%20\$txTotal19%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP19%20MB\$nl\")\
    \n:set finalMsg (\$finalMsg . \"--------ISP20--------\$nl\$iconDown%20down\
    load:%20\$rxTotal20%20MB\$nl\$iconUp%20upload:%20\$txTotal20%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP20%20MB\$nl\")\
    \n:set finalMsg (\$finalMsg . \"--------ISP21--------\$nl\$iconDown%20down\
    load:%20\$rxTotal21%20MB\$nl\$iconUp%20upload:%20\$txTotal21%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP21%20MB\$nl\")\
    \n:set finalMsg (\$finalMsg . \"--------ISP22--------\$nl\$iconDown%20down\
    load:%20\$rxTotal22%20MB\$nl\$iconUp%20upload:%20\$txTotal22%20MB\$nl\$ico\
    nUp%20Total:%20\$totalISP22%20MB\$nl\")\
    \n\
    \n# ==========================================\
    \n# 4. \D8\A8\D9\86\D8\A7\D8\A1 \D8\A7\D9\84\D8\A5\D8\AC\D9\85\D8\A7\D9\84\
    \D9\8A \D9\88\D8\A7\D9\84\D9\83\D8\A7\D9\85\D9\8A\D8\B1\D8\A7\D8\AA \D9\88\
    \D8\A7\D9\84\D8\A7\D8\B3\D8\AA\D8\B1\D8\A7\D8\AD\D8\A9\
    \n# ==========================================\
    \n# \D8\A7\D9\84\D8\A5\D8\AC\D9\85\D8\A7\D9\84\D9\8A \D8\A7\D9\84\D9\83\D9\
    \84\D9\8A\
    \n:set finalMsg (\$finalMsg . \"-------total-------\$nl\$iconDown%20downlo\
    ad:%20\$totalDownload%20MB\$nl\$iconUp%20upload:%20\$totalUpload%20MB\$nl\
    \$iconUp%20Total:%20\$totalIncome%20MB\$nl\")\
    \n\
    \n# \D9\83\D8\A7\D9\85\D9\8A\D8\B1\D8\A7\D8\AA \D8\AF\D8\A7\D9\87\D9\88\D8\
    \A7\
    \n:set finalMsg (\$finalMsg . \"------------------\$nl\$iconDown%20dahua%2\
    0download:%20\$txTotalDahua%20MB\$nl\$iconUp%20dahua%20upload:%20\$rxTotal\
    Dahua%20MB\$nl\")\
    \n\
    \n# \D8\A7\D9\84\D8\A7\D8\B3\D8\AA\D8\B1\D8\A7\D8\AD\D8\A9\
    \n:set finalMsg (\$finalMsg . \"------------------\$nl\$iconDown%20Istraha\
    %20download:%20\$txTotalIstraha%20MB\$nl\$iconUp%20Istraha%20upload:%20\$r\
    xTotalIstraha%20MB\$nl\")\
    \n:set finalMsg (\$finalMsg . \"Total_Consum:%20\$istrahaConsum\$nl-------\
    -----------\")\
    \n\
    \n# (\D9\84\D9\84\D8\AA\D8\A3\D9\83\D8\AF \D9\85\D9\86 \D8\B4\D9\83\D9\84 \
    \D8\A7\D9\84\D8\B1\D8\B3\D8\A7\D9\84\D8\A9 \D9\82\D8\A8\D9\84 \D8\A7\D9\84\
    \D8\A5\D8\B1\D8\B3\D8\A7\D9\84 \D9\8A\D9\85\D9\83\D9\86\D9\83 \D8\A7\D8\B3\
    \D8\AA\D8\AE\D8\AF\D8\A7\D9\85 \D8\A7\D9\84\D8\A3\D9\85\D8\B1 \D8\A7\D9\84\
    \D8\AA\D8\A7\D9\84\D9\8A \D9\84\D8\B1\D8\A4\D9\8A\D8\AA\D9\87\D8\A7 \D9\81\
    \D9\8A \D8\A7\D9\84\D9\80 Log)\
    \n :log info \$finalMsg\
    \n\
    \n\
    \n#         %0A--------ISP15--------%0A%F0%9F%93%A5%20download:%20\$rxTota\
    l15%20MB%0A%F0%9F%93%A4%20upload:%20\$txTotal15%20MB%0A%F0%9F%93%A4%20Tota\
    l:%20\$totalISP15%20MB%\
    \n#         %0A--------ISP16--------%0A%F0%9F%93%A5%20download:%20\$rxTota\
    l16%20MB%0A%F0%9F%93%A4%20upload:%20\$txTotal16%20MB%0A%F0%9F%93%A4%20Tota\
    l:%20\$totalISP16%20MB%\
    \n#         %0A--------ISP17--------%0A%F0%9F%93%A5%20download:%20\$rxTota\
    l17%20MB%0A%F0%9F%93%A4%20upload:%20\$txTotal17%20MB%0A%F0%9F%93%A4%20Tota\
    l:%20\$totalISP17%20MB%\
    \n#         %0A--------ISP18--------%0A%F0%9F%93%A5%20download:%20\$rxTota\
    l18%20MB%0A%F0%9F%93%A4%20upload:%20\$txTotal18%20MB%0A%F0%9F%93%A4%20Tota\
    l:%20\$totalISP18%20MB%\
    \n\
    \n               # \D8\A8\D9\86\D8\A7\D8\A1 \D8\A7\D9\84\D8\B1\D8\B3\D8\A7\
    \D9\84\D8\A9 \D8\A8\D9\86\D9\81\D8\B3 \D8\A7\D9\84\D8\AA\D9\86\D8\B3\D9\8A\
    \D9\82 \D8\A7\D9\84\D9\85\D8\B7\D9\84\D9\88\D8\A8\
    \n                /tool fetch url=(\"https://api.telegram.org/bot\$botToke\
    n/sendMessage\?chat_id=\$chatID&text=\$finalMsg\") keep-result=no;\
    \n         }\
    \n\
    \n            # ==========================================\
    \n            # [2] \D8\A3\D9\85\D8\B1 \D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\
    \AE\D8\AF\D9\85\D9\8A\D9\86 \D8\A7\D9\84\D8\AC\D8\AF\D8\AF\
    \n            # ==========================================\
    \n            :if (\$msgText = \"/users\") do={\
    \n                :local newUserList \"\"; :local count 0;\
    \n                /ip hotspot active { :foreach i in=[find] do={\
    \n                    :if (\$count < 5) do={ :set newUserList (\$newUserLi\
    st . \"%F0%9F%91%A4 \" . [get \$i user] . \" (\" . [get \$i uptime] . \")%\
    0A\"); :set count (\$count + 1); }\
    \n                } }\
    \n                :if (\$newUserList = \"\") do={ :set newUserList \"\D9\
    \84\D8\A7 \D9\8A\D9\88\D8\AC\D8\AF \D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85\D9\
    \8A\D9\86 \D9\86\D8\B4\D8\B7\D9\8A\D9\86.\" };\
    \n                /tool fetch url=(\"https://api.telegram.org/bot\$botToke\
    n/sendMessage\?chat_id=\$chatID&text=%F0%9F%91%A5 *Active Users:*%0A\$newU\
    serList&parse_mode=Markdown\") keep-result=no;\
    \n            }\
    \n\
    \n            # ==========================================\
    \n            # [3] \D8\A3\D9\85\D8\B1 \D8\A2\D8\AE\D8\B1 10 \D9\84\D9\88\
    \D8\AC\D8\A7\D8\AA\
    \n            # ==========================================\
    \n            :if (\$msgText = \"/report\") do={\
    \n               :local botToken1 \"8736583790:AAEqJRo36wMKbVMhwUnGJoDYCNe\
    J0tr6RZg\";\
    \n    :local chatId1 \"7562205396\";\
    \n    :local bridageName \"IN-OUT\";\
    \n   \
    \n    :local toSeconds do={\
    \n    :local str \$1;\
    \n    :local months { \"jan\"=0; \"feb\"=1; \"mar\"=2; \"apr\"=3; \"may\"=\
    4; \"jun\"=5; \"jul\"=6; \"aug\"=7; \"sep\"=8; \"oct\"=9; \"nov\"=10; \"de\
    c\"=11 };\
    \n    :local monthStr [:pick \$str 0 3];\
    \n    :local month (\$months->\$monthStr);\
    \n    :if ([:len \$monthStr] < 3) do={ :return 0; }\
    \n    :local day [:tonum [:pick \$str 4 6]];\
    \n    :local year [:tonum [:pick \$str 7 11]];\
    \n    :local hour [:tonum [:pick \$str 12 14]];\
    \n    :local min  [:tonum [:pick \$str 15 17]];\
    \n    :local sec  [:tonum [:pick \$str 18 20]];\
    \n\
    \n      :local yearDays ((\$year - 1970) * 365 + ((\$year - 1970) / 4));\
    \n     :local monthDays { 31;28;31;30;31;30;31;31;30;31;30;31 };\
    \n    :local totalDays 0;\
    \n    :for i from=0 to=(\$month - 1) do={\
    \n      :set totalDays (\$totalDays + (\$monthDays->\$i));\
    \n    }\
    \n    :set totalDays (\$totalDays + \$day - 1 + \$yearDays);\
    \n    :local seconds (\$totalDays * 86400 + \$hour * 3600 + \$min * 60 + \
    \$sec);\
    \n    :return \$seconds;\
    \n  };\
    \n\
    \n   :local currentDate [/system clock get date];\
    \n  :local currentTime [/system clock get time];\
    \n  :local nowStr (\$currentDate . \" \" . \$currentTime);\
    \n  :local nowSec [\$toSeconds \$nowStr];\
    \n\
    \n  :local nl \"%0A\";\
    \n  :local sp \"%20\";\
    \n\
    \n  :local grandUsers 0;\
    \n  :local grandPrice 0;\
    \n  :local reportMessage (\"\F0\9F\93\8A *ENAN NET Summary* \F0\9F\93\8A\"\
    \_. \$nl);\
    \n\
    \n   /tool user-manager\
    \n  :foreach p in=[/tool user-manager profile find] do={\
    \n    :do {\
    \n      :local pName [/tool user-manager profile get \$p name];\
    \n      :local pPriceRaw [/tool user-manager profile get \$p price];\
    \n      :local pPrice 0;\
    \n      :if ([:len \$pPriceRaw] > 0) do={ :set pPrice (\$pPriceRaw / 100);\
    \_}\
    \n\
    \n      :local allUsers [/tool user-manager user find where actual-profile\
    =\$pName and disabled=no];\
    \n      :local count 0;\
    \n\
    \n        :foreach u in=\$allUsers do={\
    \n        :do {\
    \n          :local lastSeenStr [/tool user-manager user get \$u last-seen]\
    ;\
    \n          :if (\$lastSeenStr != \"never\" && [:len \$lastSeenStr] > 0) d\
    o={\
    \n            :local lastSec [\$toSeconds \$lastSeenStr];\
    \n            :if (\$lastSec > 0 && (\$nowSec - \$lastSec) < 86400) do={\
    \n              :set count (\$count + 1);\
    \n            }\
    \n          }\
    \n        } on-error={ }\
    \n      }\
    \n\
    \n      :if (\$count > 0) do={\
    \n        :local pTotalPrice (\$count * \$pPrice);\
    \n        :set grandUsers (\$grandUsers + \$count);\
    \n        :set grandPrice (\$grandPrice + \$pTotalPrice);\
    \n        :set reportMessage (\$reportMessage . \"\F0\9F\91\A4 *\$pName*  \
    |  Users: \$count  |  Sales: \$pTotalPrice\" . \$nl);\
    \n      }\
    \n    } on-error={\
    \n      :log error (\"Script Error: Failed processing profile.\");\
    \n    }\
    \n  }\
    \n\
    \n  :local rxByteBr [/interface get [find name=\$bridageName] rx-byte];\
    \n  :local txByteBr [/interface get [find name=\$bridageName] tx-byte];\
    \n  :local grandDLMB (\$rxByteBr / 1048576);\
    \n  :local grandULMB (\$txByteBr / 1048576);\
    \n  :local totalMB (\$grandDLMB + \$grandULMB);\
    \n\
    \n  :set reportMessage (\$reportMessage . \"-------------------\" . \$nl);\
    \n  :set reportMessage (\$reportMessage . \"\F0\9F\93\8C Total Users  : \$\
    grandUsers\" . \$nl);\
    \n  :set reportMessage (\$reportMessage . \"\F0\9F\93\A5 Total DL    : \$g\
    randDLMB MB\" . \$nl);\
    \n  :set reportMessage (\$reportMessage . \"\F0\9F\93\A4 Total UL    : \$g\
    randULMB MB\" . \$nl);\
    \n  :set reportMessage (\$reportMessage . \"\F0\9F\93\88 Grand Total : \$t\
    otalMB MB\" . \$nl);\
    \n  :set reportMessage (\$reportMessage . \"\F0\9F\92\B0 Total Sales : \$g\
    randPrice\");\
    \n\
    \n  :do {\
    \n    /tool fetch http-method=post url=\"https://api.telegram.org/bot\$bot\
    Token1/sendMessage\" http-data=\"chat_id=\$chatId1&text=\$reportMessage&pa\
    rse_mode=Markdown\" keep-result=no;\
    \n    :log info \"Telegram Script: Report Sent Successfully!\";\
    \n  } on-error={\
    \n    :log error \"Telegram Script: Failed to Send!\";\
    \n  } \
    \n                \
    \n                  }\
    \n        }\
    \n    }\
    \n}\
    \n\
    \n# \D8\AD\D8\B0\D9\81 \D9\85\D9\84\D9\81 \D8\A7\D9\84\D9\85\D8\A4\D9\82\
    \D8\AA \D9\81\D9\8A \D9\86\D9\87\D8\A7\D9\8A\D8\A9 \D8\A7\D9\84\D8\AF\D9\
    \88\D8\B1\D8\A9\
    \n/file remove [find name=\"tg_result.txt\"];\
    \n\
    \n"
add comment=script1 dont-require-permissions=no name=script1 owner=admin \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="# \D8\A7\D9\84\D8\A7\D9\86\D8\AA\D9\82\D8\A7\D9\84 \D8\A5\D9\84\D9\
    \89 \D9\85\D8\B3\D8\A7\D8\B1 \D8\A7\D9\84\D9\8A\D9\88\D8\B2\D8\B1 \D9\85\
    \D9\86\D8\AC\D8\B1\
    \n/tool user-manager\
    \n\
    \n# \D9\85\D8\AA\D8\BA\D9\8A\D8\B1\D8\A7\D8\AA \D8\A7\D9\84\D8\AA\D9\84\D9\
    \8A\D8\AC\D8\B1\D8\A7\D9\85\
    \n:local botToken \"8736583790:AAEqJRo36wMKbVMhwUnGJoDYCNeJ0tr6RZg\";\
    \n:local chatId \"7562205396\";\
    \n\
    \n# \D8\B1\D9\85\D9\88\D8\B2 \D8\A7\D9\84\D8\AA\D9\86\D8\B3\D9\8A\D9\82 \
    \D9\84\D9\84\D8\AA\D9\84\D9\8A\D8\AC\D8\B1\D8\A7\D9\85\
    \n:local nl \"%0A\";    \
    \n:local sp \"%20\";    \
    \n:local pipe \"%7C\";\
    \n\
    \n# \D8\AC\D9\84\D8\A8 \D8\AA\D8\A7\D8\B1\D9\8A\D8\AE \D8\A7\D9\84\D9\8A\
    \D9\88\D9\85\
    \n:local today [/system clock get date];\
    \n:local month [:pick \$today 0 3];\
    \n:local day [:tonum [:pick \$today 4 6]];\
    \n\
    \n# \D8\AD\D8\B3\D8\A7\D8\A8 \D8\A3\D9\8A\D8\A7\D9\85 \D8\A7\D9\84\D9\80 4\
    8 \D8\B3\D8\A7\D8\B9\D8\A9 \D8\A7\D9\84\D9\85\D8\A7\D8\B6\D9\8A\D8\A9\
    \n:local d1 \$day;\
    \n:local d2 (\$day - 1);\
    \n:local d3 (\$day - 2);\
    \n\
    \n# \D8\AA\D9\86\D8\B3\D9\8A\D9\82 \D8\A7\D9\84\D8\A3\D9\8A\D8\A7\D9\85 \
    \D8\A8\D8\A5\D8\B6\D8\A7\D9\81\D8\A9 \D8\B5\D9\81\D8\B1 \D8\A5\D8\B0\D8\A7\
    \_\D9\83\D8\A7\D9\86 \D8\A7\D9\84\D8\B1\D9\82\D9\85 \D8\A3\D8\AD\D8\A7\D8\
    \AF\D9\8A\D8\A7\D9\8B\
    \n:local strD1 ([:tostr \$d1]); :if ([:len \$strD1] = 1) do={ :set strD1 (\
    \"0\" . \$strD1) }\
    \n:local strD2 ([:tostr \$d2]); :if ([:len \$strD2] = 1) do={ :set strD2 (\
    \"0\" . \$strD2) }\
    \n:local strD3 ([:tostr \$d3]); :if ([:len \$strD3] = 1) do={ :set strD3 (\
    \"0\" . \$strD3) }\
    \n\
    \n# \D9\85\D8\B9\D8\A7\D9\84\D8\AC\D8\A9 \D8\AA\D9\82\D8\B1\D9\8A\D8\A8\D9\
    \8A\D8\A9 \D9\84\D9\88 \D9\83\D9\86\D8\A7 \D9\81\D9\8A \D8\A8\D8\AF\D8\A7\
    \D9\8A\D8\A9 \D8\A7\D9\84\D8\B4\D9\87\D8\B1 (\D9\8A\D9\88\D9\85 1 \D8\A3\
    \D9\88 2) \D9\84\D9\84\D8\A8\D8\AD\D8\AB \D9\81\D9\8A \D9\86\D9\87\D8\A7\
    \D9\8A\D8\A9 \D8\A7\D9\84\D8\B4\D9\87\D8\B1 \D8\A7\D9\84\D8\B3\D8\A7\D8\A8\
    \D9\82\
    \n:if (\$d2 <= 0) do={ :set strD2 \"31\"; :set strD3 \"30\" }\
    \n:if (\$d3 <= 0) do={ :set strD3 \"31\" }\
    \n\
    \n# \D8\AA\D9\83\D9\88\D9\8A\D9\86 \D9\86\D8\B5\D9\88\D8\B5 \D8\A7\D9\84\
    \D8\AA\D9\88\D8\A7\D8\B1\D9\8A\D8\AE \D9\84\D9\84\D9\85\D8\B7\D8\A7\D8\A8\
    \D9\82\D8\A9 (\D8\B7\D8\B1\D9\8A\D9\82\D8\A9 \D8\A2\D9\85\D9\86\D8\A9 \D8\
    \AC\D8\AF\D8\A7\D9\8B \D9\84\D9\80 v6)\
    \n:local date1 (\$month . \"/\" . \$strD1);\
    \n:local date2 (\$month . \"/\" . \$strD2);\
    \n:local date3 (\$month . \"/\" . \$strD3);\
    \n\
    \n# \D8\A7\D9\84\D9\85\D8\AA\D8\BA\D9\8A\D8\B1\D8\A7\D8\AA \D8\A7\D9\84\D8\
    \A5\D8\AC\D9\85\D8\A7\D9\84\D9\8A\D8\A9 \D8\A7\D9\84\D9\83\D8\A8\D8\B1\D9\
    \89\
    \n:local grandUsers 0;\
    \n:local grandPrice 0;\
    \n\
    \n# \D8\A8\D9\86\D8\A7\D8\A1 \D8\B9\D9\86\D9\88\D8\A7\D9\86 \D8\A7\D9\84\
    \D8\AA\D9\82\D8\B1\D9\8A\D8\B1\
    \n:local reportMessage (\"%F0%9F%93%8A\".\$sp.\"Enan\".\$sp.\"Net\".\$sp.\
    \"Sales\".\$sp.\"(48H)\".\$nl.\"-------------------\".\$nl);\
    \n\
    \n# 1. \D8\AA\D8\AC\D9\85\D9\8A\D8\B9 \D8\A7\D9\84\D9\85\D8\A8\D9\8A\D8\B9\
    \D8\A7\D8\AA \D9\88\D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85\D9\8A\
    \D9\86\
    \n:foreach p in=[/tool user-manager profile find] do={\
    \n    :local pName \"unknown\";\
    \n    \
    \n    :do {\
    \n        :set pName [/tool user-manager profile get \$p name];\
    \n        :local pPriceRaw [/tool user-manager profile get \$p price];\
    \n        :local pPrice 0;\
    \n        \
    \n        # \D8\AA\D8\B5\D8\AD\D9\8A\D8\AD \D8\AE\D8\B7\D8\A3 \D8\A7\D9\84\
    \D8\B3\D8\B9\D8\B1 \D8\A8\D9\82\D8\B3\D9\85\D8\AA\D9\87 \D8\B9\D9\84\D9\89\
    \_100\
    \n        :if ([:len \$pPriceRaw] > 0) do={ :set pPrice (\$pPriceRaw / 100\
    ); }\
    \n        :local pUserCount 0;\
    \n\
    \n        # \D8\A7\D8\B3\D8\AA\D8\AE\D8\AF\D8\A7\D9\85 \D8\A7\D9\84\D8\B5\
    \D9\8A\D8\A7\D8\BA\D8\A9 \D8\A7\D9\84\D8\B5\D8\AD\D9\8A\D8\AD\D8\A9 (where\
    \_... and ...) \D9\84\D9\84\D8\A8\D8\AD\D8\AB \D9\81\D9\8A v6\
    \n        :local activeUsers [/tool user-manager user find where actual-pr\
    ofile=\$pName and disabled=no and last-seen!=\"never\"];\
    \n\
    \n        :foreach u in=\$activeUsers do={\
    \n            :local uName [/tool user-manager user get \$u username];\
    \n            :local isActive false;\
    \n\
    \n            :do {\
    \n                # \D8\AC\D9\84\D8\A8 \D9\85\D9\84\D9\81 \D8\A7\D9\84\D9\
    \85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85 \D9\88\D9\85\D8\B7\D8\A7\D8\A8\D9\82\D8\
    \AA\D9\87 \D9\85\D8\B9 \D8\AA\D9\88\D8\A7\D8\B1\D9\8A\D8\AE \D8\A7\D9\84\
    \D9\80 48 \D8\B3\D8\A7\D8\B9\D8\A9\
    \n                :local userProfs [/tool user-manager user profile find w\
    here user=\$uName and profile=\$pName];\
    \n                \
    \n                :foreach up in=\$userProfs do={\
    \n                    :local sTime [/tool user-manager user profile get \$\
    up start-time];\
    \n                    :if ([:len \$sTime] > 0) do={\
    \n                        :if ([:typeof [:find \$sTime \$date1]] != \"nil\
    \" or \\\
    \n                             [:typeof [:find \$sTime \$date2]] != \"nil\
    \" or \\\
    \n                             [:typeof [:find \$sTime \$date3]] != \"nil\
    \") do={\
    \n                            :set isActive true;\
    \n                        }\
    \n                    }\
    \n                }\
    \n            } on-error={\
    \n                # \D8\A5\D8\B0\D8\A7 \D8\AD\D8\AF\D8\AB \D8\AE\D8\B7\D8\
    \A3 \D9\81\D9\8A \D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85 \D9\85\D8\B9\D9\8A\
    \D9\86\D8\8C \D8\AA\D8\AC\D8\A7\D9\87\D9\84\D9\87 \D9\88\D8\A3\D9\83\D9\85\
    \D9\84 \D9\84\D9\84\D8\B0\D9\8A \D8\A8\D8\B9\D8\AF\D9\87 \D8\A8\D8\B5\D9\
    \85\D8\AA\
    \n            }\
    \n            \
    \n            # \D8\B2\D9\8A\D8\A7\D8\AF\D8\A9 \D8\A7\D9\84\D8\B9\D8\AF\D8\
    \A7\D8\AF \D8\A5\D8\B0\D8\A7 \D9\83\D8\A7\D9\86 \D8\A7\D9\84\D9\85\D8\B3\
    \D8\AA\D8\AE\D8\AF\D9\85 \D8\AC\D8\AF\D9\8A\D8\AF\D8\A7\D9\8B\
    \n            :if (\$isActive = true) do={\
    \n                :set pUserCount (\$pUserCount + 1);\
    \n            }\
    \n        }\
    \n\
    \n        # \D8\A5\D8\B6\D8\A7\D9\81\D8\A9 \D8\A7\D9\84\D8\A8\D8\B1\D9\88\
    \D9\81\D8\A7\D9\8A\D9\84 \D9\84\D9\84\D8\AA\D9\82\D8\B1\D9\8A\D8\B1 \D9\81\
    \D9\82\D8\B7 \D8\A5\D8\B0\D8\A7 \D9\83\D8\A7\D9\86 \D9\8A\D8\AD\D8\AA\D9\
    \88\D9\8A \D8\B9\D9\84\D9\89 \D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85\D9\8A\D9\
    \86\
    \n        :if (\$pUserCount > 0) do={\
    \n            :local pSales (\$pUserCount * \$pPrice);\
    \n            :set grandUsers (\$grandUsers + \$pUserCount);\
    \n            :set grandPrice (\$grandPrice + \$pSales);\
    \n            \
    \n            :set reportMessage (\$reportMessage . \"%E2%96%AA\".\$sp.\"P\
    :\".\$pName.\$sp.\$pipe.\$sp.\"U:\".\$pUserCount.\$sp.\$pipe.\$sp.\"S:\".\
    \$pSales.\$nl);\
    \n        }\
    \n        \
    \n    } on-error={\
    \n        :log error (\"Error processing profile: \" . \$pName);\
    \n    }\
    \n}\
    \n\
    \n# 2. \D8\AD\D8\B3\D8\A7\D8\A8 \D8\A7\D9\84\D8\A7\D8\B3\D8\AA\D9\87\D9\84\
    \D8\A7\D9\83 \D8\A7\D9\84\D9\81\D8\B9\D9\84\D9\8A \D9\84\D9\84\D8\B4\D8\A8\
    \D9\83\D8\A9 \D9\85\D9\86 \D9\88\D8\A7\D8\AC\D9\87\D8\A9 IN-OUT\
    \n:local interfaceNameBr \"IN-OUT\";\
    \n:local rxByteBr 0;\
    \n:local txByteBr 0;\
    \n\
    \n:do {\
    \n    :set rxByteBr [/interface get [find where name=\$interfaceNameBr] rx\
    -byte];\
    \n    :set txByteBr [/interface get [find where name=\$interfaceNameBr] tx\
    -byte];\
    \n} on-error={\
    \n    :log error \"Failed to read IN-OUT interface. Please verify interfac\
    e name.\";\
    \n}\
    \n\
    \n:local rxTotalBr (\$rxByteBr / 1048576);\
    \n:local txTotalBr (\$txByteBr / 1048576);\
    \n:local totalConsum (\$rxTotalBr + \$txTotalBr);\
    \n\
    \n# 3. \D8\B5\D9\8A\D8\A7\D8\BA\D8\A9 \D8\A7\D9\84\D8\A5\D8\AC\D9\85\D8\A7\
    \D9\84\D9\8A\D8\A7\D8\AA \D8\A7\D9\84\D9\86\D9\87\D8\A7\D8\A6\D9\8A\D8\A9 \
    \D9\81\D9\8A \D8\A7\D9\84\D8\AA\D9\82\D8\B1\D9\8A\D8\B1\
    \n:set reportMessage (\$reportMessage . \"-------------------\".\$nl);\
    \n:set reportMessage (\$reportMessage . \"%F0%9F%91%A5\".\$sp.\"New\".\$sp\
    .\"Users:\".\$sp.\$grandUsers.\$nl);\
    \n:set reportMessage (\$reportMessage . \"%F0%9F%92%B0\".\$sp.\"Total\".\$\
    sp.\"Sales:\".\$sp.\$grandPrice.\$nl);\
    \n:set reportMessage (\$reportMessage . \"-------------------\".\$nl);\
    \n:set reportMessage (\$reportMessage . \"%F0%9F%8C%90\".\$sp.\"Actual\".\
    \$sp.\"Consumption\".\$nl);\
    \n:set reportMessage (\$reportMessage . \"%F0%9F%93%A5\".\$sp.\"DL:\".\$sp\
    .\$rxTotalBr.\$sp.\"MB\".\$nl);\
    \n:set reportMessage (\$reportMessage . \"%F0%9F%93%A4\".\$sp.\"UL:\".\$sp\
    .\$txTotalBr.\$sp.\"MB\".\$nl);\
    \n:set reportMessage (\$reportMessage . \"%F0%9F%93%88\".\$sp.\"Total:\".\
    \$sp.\$totalConsum.\$sp.\"MB\");\
    \n\
    \n# \D8\A5\D8\B1\D8\B3\D8\A7\D9\84 \D8\A7\D9\84\D8\AA\D9\82\D8\B1\D9\8A\D8\
    \B1 \D8\A7\D9\84\D9\86\D9\87\D8\A7\D8\A6\D9\8A \D9\84\D9\84\D8\AA\D9\84\D9\
    \8A\D8\AC\D8\B1\D8\A7\D9\85\
    \n:do {\
    \n    /tool fetch http-method=post url=\"https://api.telegram.org/bot\$bot\
    Token/sendMessage\" http-data=\"chat_id=\$chatId&text=\$reportMessage\" ke\
    ep-result=no;\
    \n    :log info \"Telegram Script: Report Sent Successfully!\";\
    \n} on-error={\
    \n    :log error \"Telegram Script: Failed to Send to Telegram.\";\
    \n}\
    \n"
add dont-require-permissions=no name=script_run owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    /ip firewall mangle\
    \n:for i from=114 to=133 do={ disable \$i; }\
    \n\
    \nadd chain=prerouting in-interface=IN-OUT dst-address-type=!local action=\
    jump jump-target=wan-cc\
    \nadd chain=output dst-address-type=!local action=jump jump-target=wan-cc\
    \n\
    \nadd chain=wan-cc connection-mark=no-mark action=mark-connection new-conn\
    ection-mark=wan1_conn per-connection-classifier=both-addresses-and-ports:9\
    /0\
    \nadd chain=wan-cc connection-mark=no-mark action=mark-connection new-conn\
    ection-mark=wan2_conn per-connection-classifier=both-addresses-and-ports:9\
    /1\
    \nadd chain=wan-cc connection-mark=no-mark action=mark-connection new-conn\
    ection-mark=wan3_conn per-connection-classifier=both-addresses-and-ports:9\
    /2\
    \nadd chain=wan-cc connection-mark=no-mark action=mark-connection new-conn\
    ection-mark=wan4_conn per-connection-classifier=both-addresses-and-ports:9\
    /3\
    \nadd chain=wan-cc connection-mark=no-mark action=mark-connection new-conn\
    ection-mark=wan5_conn per-connection-classifier=both-addresses-and-ports:9\
    /4\
    \nadd chain=wan-cc connection-mark=no-mark action=mark-connection new-conn\
    ection-mark=wan6_conn per-connection-classifier=both-addresses-and-ports:9\
    /5\
    \nadd chain=wan-cc connection-mark=no-mark action=mark-connection new-conn\
    ection-mark=wan7_conn per-connection-classifier=both-addresses-and-ports:9\
    /6\
    \nadd chain=wan-cc connection-mark=no-mark action=mark-connection new-conn\
    ection-mark=wan8_conn per-connection-classifier=both-addresses-and-ports:9\
    /7\
    \nadd chain=wan-cc connection-mark=no-mark action=mark-connection new-conn\
    ection-mark=wan9_conn per-connection-classifier=both-addresses-and-ports:9\
    /8\
    \n\
    \nadd chain=wan-cc connection-mark=wan1_conn action=mark-routing new-routi\
    ng-mark=to_Local\
    \nadd chain=wan-cc connection-mark=wan2_conn action=mark-routing new-routi\
    ng-mark=to_Local2\
    \nadd chain=wan-cc connection-mark=wan3_conn action=mark-routing new-routi\
    ng-mark=to_Line19\
    \nadd chain=wan-cc connection-mark=wan4_conn action=mark-routing new-routi\
    ng-mark=to_Line20\
    \nadd chain=wan-cc connection-mark=wan5_conn action=mark-routing new-routi\
    ng-mark=to_Line21\
    \nadd chain=wan-cc connection-mark=wan6_conn action=mark-routing new-routi\
    ng-mark=to_Line22\
    \nadd chain=wan-cc connection-mark=wan7_conn action=mark-routing new-routi\
    ng-mark=to_line12\
    \nadd chain=wan-cc connection-mark=wan8_conn action=mark-routing new-routi\
    ng-mark=to_line13\
    \nadd chain=wan-cc connection-mark=wan9_conn action=mark-routing new-routi\
    ng-mark=to_line14\
    \n/ip firewall connection remove [find]}"
add dont-require-permissions=no name="finansial report" owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    system script add name=\"user-usage-log\" source={\
    \n  :local users [/tool user-manager user find]\
    \n  :foreach user in=\$users do={\
    \n    :local username [/tool user-manager user get \$user name]\
    \n    :local profile  [/tool user-manager user get \$user profile]\
    \n    :local upload   [/tool user-manager user get \$user upload-bytes]\
    \n    :local download [/tool user-manager user get \$user download-bytes]\
    \n    :local total    (\$upload + \$download)\
    \n    :log info (\"User: \$username, Profile: \$profile, Upload: \$upload,\
    \_Download: \$download, Total: \$total\")\
    \n  }\
    \n}"
add dont-require-permissions=no name=user-usage-log owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    \_\D8\A7\D9\84\D8\A7\D9\86\D8\AA\D9\82\D8\A7\D9\84 \D8\A5\D9\84\D9\89 \D9\
    \85\D8\B3\D8\A7\D8\B1 \D8\A7\D9\84\D9\8A\D9\88\D8\B2\D8\B1 \D9\85\D9\86\D8\
    \AC\D8\B1\
    \n/tool user-manager user\
    \n\
    \n# \D8\B9\D9\85\D9\84 \D8\AD\D9\84\D9\82\D8\A9 \D8\AA\D9\83\D8\B1\D8\A7\
    \D8\B1\D9\8A\D8\A9 \D8\AA\D9\85\D8\B1 \D8\B9\D9\84\D9\89 \D8\A7\D9\84\D9\
    \85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85\D9\8A\D9\86 \D8\A7\D9\84\D8\B0\D9\8A\D9\
    \86 \D8\A8\D8\AF\D8\A3\D9\88\D8\A7 \D8\A7\D9\84\D8\A7\D8\B3\D8\AA\D8\AE\D8\
    \AF\D8\A7\D9\85\
    \n:foreach i in=[find where disabled=no and last-seen!=\"never\"] do={\
    \n    \
    \n    # \D8\A7\D8\B3\D8\AA\D8\AE\D8\AF\D8\A7\D9\85 \D8\AF\D8\A7\D9\84\D8\
    \A9 do \D9\88 on-error \D9\84\D8\A7\D9\84\D8\AA\D9\82\D8\A7\D8\B7 \D8\A7\
    \D9\84\D8\A3\D8\AE\D8\B7\D8\A7\D8\A1\
    \n    :do {\
    \n        # \D8\AC\D9\84\D8\A8 \D8\A7\D9\84\D8\A8\D9\8A\D8\A7\D9\86\D8\A7\
    \D8\AA \D8\A7\D9\84\D8\A3\D8\B3\D8\A7\D8\B3\D9\8A\D8\A9\
    \n        :local uName [get \$i username];\
    \n        :local uProf [get \$i actual-profile];\
    \n        :local dlUsed [get \$i download-used];\
    \n        :local ulUsed [get \$i upload-used];\
    \n        \
    \n        # \D8\A7\D9\84\D8\AA\D8\A3\D9\83\D8\AF \D9\85\D9\86 \D8\A3\D9\86\
    \_\D8\A7\D9\84\D9\82\D9\8A\D9\85 \D9\84\D9\8A\D8\B3\D8\AA \D9\81\D8\A7\D8\
    \B1\D8\BA\D8\A9 \D9\84\D8\AA\D8\AC\D9\86\D8\A8 \D8\A3\D8\AE\D8\B7\D8\A7\D8\
    \A1 \D8\A7\D9\84\D8\AD\D8\B3\D8\A7\D8\A8\
    \n        :if ([:len \$dlUsed] = 0) do={:set dlUsed 0};\
    \n        :if ([:len \$ulUsed] = 0) do={:set ulUsed 0};\
    \n        \
    \n        # \D8\AA\D8\AD\D9\88\D9\8A\D9\84 \D8\A7\D9\84\D8\AA\D8\AD\D9\85\
    \D9\8A\D9\84 \D9\88\D8\A7\D9\84\D8\B1\D9\81\D8\B9 \D8\A5\D9\84\D9\89 \D9\
    \85\D9\8A\D8\AC\D8\A7\D8\A8\D8\A7\D9\8A\D8\AA\
    \n        :local dlMB (\$dlUsed / 1048576);\
    \n        :local ulMB (\$ulUsed / 1048576);\
    \n        \
    \n        # \D8\AD\D8\B3\D8\A7\D8\A8 \D8\A7\D9\84\D8\A5\D8\AC\D9\85\D8\A7\
    \D9\84\D9\8A \D8\A8\D8\A7\D9\84\D9\85\D9\8A\D8\AC\D8\A7\D8\A8\D8\A7\D9\8A\
    \D8\AA\
    \n        :local totalMB (\$dlMB + \$ulMB);\
    \n        \
    \n        # \D8\B7\D8\A8\D8\A7\D8\B9\D8\A9 \D8\A7\D9\84\D9\86\D8\AA\D9\8A\
    \D8\AC\D8\A9 \D9\81\D9\8A \D8\A7\D9\84\D9\84\D9\88\D8\AC \D9\81\D9\82\D8\
    \B7 \D8\A5\D8\B0\D8\A7 \D9\83\D8\A7\D9\86 \D9\87\D9\86\D8\A7\D9\83 \D8\A7\
    \D8\B3\D8\AA\D9\87\D9\84\D8\A7\D9\83 \D9\81\D8\B9\D9\84\D9\8A\
    \n        :if ((\$dlUsed + \$ulUsed) > 0) do={\
    \n            :log info (\"User: \$uName | Profile: \$uProf | Upload: \$ul\
    MB MB | Download: \$dlMB MB | Total: \$totalMB MB\");\
    \n        }\
    \n        \
    \n    } on-error={\
    \n        # \D9\81\D9\8A \D8\AD\D8\A7\D9\84 \D8\AD\D8\AF\D9\88\D8\AB \D8\
    \AE\D8\B7\D8\A3\D8\8C \D8\B3\D9\8A\D8\AA\D9\85 \D8\A7\D9\84\D8\AA\D9\82\D8\
    \A7\D8\B7\D9\87 \D9\87\D9\86\D8\A7 \D9\88\D8\B7\D8\A8\D8\A7\D8\B9\D8\AA\D9\
    \87 \D8\A8\D8\A7\D9\84\D9\84\D9\88\D9\86 \D8\A7\D9\84\D8\A3\D8\AD\D9\85\D8\
    \B1 \D9\81\D9\8A \D8\A7\D9\84\D9\84\D9\88\D8\AC\
    \n        :local errorUser [get \$i username];\
    \n        :log error (\"\D8\AD\D8\AF\D8\AB \D8\AE\D8\B7\D8\A3 \D8\A3\D8\AB\
    \D9\86\D8\A7\D8\A1 \D9\85\D8\B9\D8\A7\D9\84\D8\AC\D8\A9 \D8\A8\D9\8A\D8\A7\
    \D9\86\D8\A7\D8\AA \D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85: \$err\
    orUser\");\
    \n    }\
    \n}\
    \n"
add dont-require-permissions=no name=user-usage-mb owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    \_\D8\A7\D9\84\D8\A7\D9\86\D8\AA\D9\82\D8\A7\D9\84 \D8\A5\D9\84\D9\89 \D9\
    \85\D8\B3\D8\A7\D8\B1 \D8\A7\D9\84\D9\8A\D9\88\D8\B2\D8\B1 \D9\85\D9\86\D8\
    \AC\D8\B1\
    \n/tool user-manager\
    \n\
    \n# \D8\AA\D8\B9\D8\B1\D9\8A\D9\81 \D9\85\D8\AA\D8\BA\D9\8A\D8\B1\D8\A7\D8\
    \AA \D8\A7\D9\84\D8\AA\D9\84\D9\8A\D8\AC\D8\B1\D8\A7\D9\85\
    \n:local botToken \"8736583790:AAEqJRo36wMKbVMhwUnGJoDYCNeJ0tr6RZg\";\
    \n:local chatId \"7562205396\";\
    \n\
    \n# \D8\A7\D9\84\D8\B1\D9\85\D9\88\D8\B2 \D8\A7\D9\84\D9\85\D8\B4\D9\81\D8\
    \B1\D8\A9 \D9\84\D8\AA\D8\AC\D9\86\D8\A8 \D9\83\D8\B3\D8\B1 \D8\A7\D9\84\
    \D8\B1\D8\A7\D8\A8\D8\B7\
    \n:local nl \"%0A\";    \
    \n:local sp \"%20\";    \
    \n\
    \n# \D8\AA\D8\B9\D8\B1\D9\8A\D9\81 \D9\85\D8\AA\D8\BA\D9\8A\D8\B1\D8\A7\D8\
    \AA \D8\A7\D9\84\D8\AA\D8\AC\D9\85\D9\8A\D8\B9 \D8\A7\D9\84\D9\83\D8\A8\D8\
    \B1\D9\89\
    \n:local grandUsers 0;\
    \n:local grandPrice 0;\
    \n:local grandDL 0;\
    \n:local grandUL 0;\
    \n\
    \n# \D8\A8\D8\AF\D8\A7\D9\8A\D8\A9 \D8\A8\D9\86\D8\A7\D8\A1 \D8\B1\D8\B3\
    \D8\A7\D9\84\D8\A9 \D8\A7\D9\84\D8\AA\D9\82\D8\B1\D9\8A\D8\B1\
    \n:local reportMessage (\"===Enan\".\$sp.\"Net\".\$sp.\"Summary===\".\$nl)\
    ;\
    \n\
    \n# \D8\AD\D9\84\D9\82\D8\A9 \D8\AA\D9\85\D8\B1 \D8\B9\D9\84\D9\89 \D8\AC\
    \D9\85\D9\8A\D8\B9 \D8\A7\D9\84\D8\A8\D8\B1\D9\88\D9\81\D8\A7\D9\8A\D9\84\
    \D8\A7\D8\AA \D9\81\D9\8A \D8\A7\D9\84\D9\8A\D9\88\D8\B2\D8\B1 \D9\85\D9\
    \86\D8\AC\D8\B1\
    \n:foreach p in=[/tool user-manager profile find] do={\
    \n    :do {\
    \n        # \D8\AC\D9\84\D8\A8 \D8\A7\D8\B3\D9\85 \D8\A7\D9\84\D8\A8\D8\B1\
    \D9\88\D9\81\D8\A7\D9\8A\D9\84 \D9\88\D8\B3\D8\B9\D8\B1\D9\87\
    \n        :local pName [/tool user-manager profile get \$p name];\
    \n        :local pPrice [/tool user-manager profile get \$p price];\
    \n        :if ([:len \$pPrice] = 0) do={:set pPrice 0};\
    \n\
    \n        # \D8\AC\D9\84\D8\A8 \D8\AC\D9\85\D9\8A\D8\B9 \D8\A7\D9\84\D9\85\
    \D8\B3\D8\AA\D8\AE\D8\AF\D9\85\D9\8A\D9\86 \D8\A7\D9\84\D9\86\D8\B4\D8\B7\
    \D9\8A\D9\86 \D8\A7\D9\84\D8\AA\D8\A7\D8\A8\D8\B9\D9\8A\D9\86 \D9\84\D9\87\
    \D8\B0\D8\A7 \D8\A7\D9\84\D8\A8\D8\B1\D9\88\D9\81\D8\A7\D9\8A\D9\84\
    \n        :local activeUsers [/tool user-manager user find where actual-pr\
    ofile=\$pName and disabled=no and last-seen!=\"never\"];\
    \n        :local pUserCount [:len \$activeUsers];\
    \n\
    \n        # \D8\A5\D8\B0\D8\A7 \D9\83\D8\A7\D9\86 \D9\87\D9\86\D8\A7\D9\83\
    \_\D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85\D9\88\D9\86 \D9\86\D8\B4\D8\B7\D9\
    \88\D9\86 \D9\81\D9\8A \D9\87\D8\B0\D8\A7 \D8\A7\D9\84\D8\A8\D8\B1\D9\88\
    \D9\81\D8\A7\D9\8A\D9\84\D8\8C \D8\A7\D8\A8\D8\AF\D8\A3 \D8\A7\D9\84\D8\AD\
    \D8\B3\D8\A7\D8\A8\
    \n        :if (\$pUserCount > 0) do={\
    \n            \
    \n            # \D8\AD\D8\B3\D8\A7\D8\A8 \D8\A5\D8\AC\D9\85\D8\A7\D9\84\D9\
    \8A \D8\A7\D9\84\D9\85\D8\A8\D9\8A\D8\B9\D8\A7\D8\AA \D9\84\D9\87\D8\B0\D8\
    \A7 \D8\A7\D9\84\D8\A8\D8\B1\D9\88\D9\81\D8\A7\D9\8A\D9\84 (\D8\A7\D9\84\
    \D8\B9\D8\AF\D8\AF \C3\97 \D8\A7\D9\84\D8\B3\D8\B9\D8\B1)\
    \n            :local pTotalPrice 0;\
    \n            :do { :set pTotalPrice (\$pUserCount * \$pPrice); } on-error\
    ={ :set pTotalPrice 0; }\
    \n\
    \n            # \D9\85\D8\AA\D8\BA\D9\8A\D8\B1\D8\A7\D8\AA \D9\84\D8\AA\D8\
    \AC\D9\85\D9\8A\D8\B9 \D8\A7\D9\84\D8\B1\D9\81\D8\B9 \D9\88\D8\A7\D9\84\D8\
    \AA\D9\86\D8\B2\D9\8A\D9\84 \D9\84\D9\84\D8\A8\D8\B1\D9\88\D9\81\D8\A7\D9\
    \8A\D9\84\
    \n            :local pDL 0;\
    \n            :local pUL 0;\
    \n\
    \n            # \D8\A7\D9\84\D9\85\D8\B1\D9\88\D8\B1 \D8\B9\D9\84\D9\89 \
    \D9\85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85\D9\8A \D9\87\D8\B0\D8\A7 \D8\A7\D9\84\
    \D8\A8\D8\B1\D9\88\D9\81\D8\A7\D9\8A\D9\84 \D9\84\D8\AC\D9\85\D8\B9 \D8\A7\
    \D8\B3\D8\AA\D9\87\D9\84\D8\A7\D9\83\D9\87\D9\85\
    \n            :foreach u in=\$activeUsers do={\
    \n                :local uDL [/tool user-manager user get \$u download-use\
    d];\
    \n                :local uUL [/tool user-manager user get \$u upload-used]\
    ;\
    \n                :if ([:len \$uDL] = 0) do={:set uDL 0};\
    \n                :if ([:len \$uUL] = 0) do={:set uUL 0};\
    \n                \
    \n                :set pDL (\$pDL + \$uDL);\
    \n                :set pUL (\$pUL + \$uUL);\
    \n            }\
    \n\
    \n            # \D8\A5\D8\B6\D8\A7\D9\81\D8\A9 \D8\A3\D8\B1\D9\82\D8\A7\D9\
    \85 \D9\87\D8\B0\D8\A7 \D8\A7\D9\84\D8\A8\D8\B1\D9\88\D9\81\D8\A7\D9\8A\D9\
    \84 \D8\A5\D9\84\D9\89 \D8\A7\D9\84\D9\85\D8\AC\D8\A7\D9\85\D9\8A\D8\B9 \
    \D8\A7\D9\84\D9\83\D8\A8\D8\B1\D9\89\
    \n            :set grandUsers (\$grandUsers + \$pUserCount);\
    \n            :set grandPrice (\$grandPrice + \$pTotalPrice);\
    \n            :set grandDL (\$grandDL + \$pDL);\
    \n            :set grandUL (\$grandUL + \$pUL);\
    \n\
    \n            # \D8\A5\D8\B6\D8\A7\D9\81\D8\A9 \D8\B3\D8\B7\D8\B1 \D8\A7\
    \D9\84\D8\A8\D8\B1\D9\88\D9\81\D8\A7\D9\8A\D9\84 \D8\A5\D9\84\D9\89 \D8\A7\
    \D9\84\D8\AA\D9\82\D8\B1\D9\8A\D8\B1\
    \n            :set reportMessage (\$reportMessage . \"Prof:\" . \$pName . \
    \$sp . \"Usrs:\" . \$pUserCount . \$sp . \"Sales:\" . \$pTotalPrice . \$nl\
    );\
    \n        }\
    \n    } on-error={\
    \n        :log error (\"Script Error: Failed processing a profile.\");\
    \n    }\
    \n}\
    \n\
    \n# \D8\AA\D8\AD\D9\88\D9\8A\D9\84 \D8\A7\D9\84\D8\A7\D8\B3\D8\AA\D9\87\D9\
    \84\D8\A7\D9\83 \D8\A7\D9\84\D9\83\D9\84\D9\8A \D8\A5\D9\84\D9\89 \D9\85\
    \D9\8A\D8\AC\D8\A7\D8\A8\D8\A7\D9\8A\D8\AA (\D8\A8\D8\B9\D8\AF \D8\A7\D9\
    \84\D8\A7\D9\86\D8\AA\D9\87\D8\A7\D8\A1 \D9\85\D9\86 \D8\AC\D9\85\D9\8A\D8\
    \B9 \D8\A7\D9\84\D8\AD\D8\B3\D8\A7\D8\A8\D8\A7\D8\AA)\
    \n:local grandDLMB (\$grandDL / 1048576);\
    \n:local grandULMB (\$grandUL / 1048576);\
    \n:local totalMB (\$grandDLMB + \$grandULMB);\
    \n\
    \n# \D8\A5\D8\B6\D8\A7\D9\81\D8\A9 \D8\A7\D9\84\D8\A5\D8\AC\D9\85\D8\A7\D9\
    \84\D9\8A\D8\A7\D8\AA \D8\A3\D8\B3\D9\81\D9\84 \D8\A7\D9\84\D8\AA\D9\82\D8\
    \B1\D9\8A\D8\B1\
    \n:set reportMessage (\$reportMessage . \"-------------------\" . \$nl);\
    \n:set reportMessage (\$reportMessage . \"Total\".\$sp.\"Users:\".\$sp . \
    \$grandUsers . \$nl);\
    \n:set reportMessage (\$reportMessage . \"Total\".\$sp.\"DL:\".\$sp . \$gr\
    andDLMB . \$sp . \"MB\" . \$nl);\
    \n:set reportMessage (\$reportMessage . \"Total\".\$sp.\"UL:\".\$sp . \$gr\
    andULMB . \$sp . \"MB\" . \$nl);\
    \n:set reportMessage (\$reportMessage . \"Grand\".\$sp.\"Total:\".\$sp . \
    \$totalMB . \$sp . \"MB\" . \$nl);\
    \n:set reportMessage (\$reportMessage . \"Total\".\$sp.\"Sales:\".\$sp . \
    \$grandPrice);\
    \n\
    \n# \D8\B7\D8\A8\D8\A7\D8\B9\D8\A9 \D8\A7\D9\84\D8\AA\D9\82\D8\B1\D9\8A\D8\
    \B1 \D8\A8\D8\A7\D9\84\D9\83\D8\A7\D9\85\D9\84 \D9\81\D9\8A \D8\A7\D9\84\
    \D9\84\D9\88\D8\AC (LogCat) \D9\84\D9\84\D8\AA\D8\A3\D9\83\D8\AF \D9\85\D9\
    \86 \D8\A7\D9\84\D9\85\D8\AE\D8\B1\D8\AC\D8\A7\D8\AA\
    \n:log warning \"--- BEGIN REPORT TEXT ---\";\
    \n:log info \$reportMessage;\
    \n:log warning \"--- END REPORT TEXT ---\";\
    \n\
    \n# \D8\A5\D8\B1\D8\B3\D8\A7\D9\84 \D8\A7\D9\84\D8\AA\D9\82\D8\B1\D9\8A\D8\
    \B1 \D8\A7\D9\84\D9\86\D9\87\D8\A7\D8\A6\D9\8A \D8\A5\D9\84\D9\89 \D8\A7\
    \D9\84\D8\AA\D9\84\D9\8A\D8\AC\D8\B1\D8\A7\D9\85\
    \n:do {\
    \n    :local tgUrl (\"https://api.telegram.org/bot\" . \$botToken . \"/sen\
    dMessage\?chat_id=\" . \$chatId . \"&text=\" . \$reportMessage);\
    \n    /tool fetch url=\$tgUrl keep-result=no;\
    \n    :log info \"Telegram Script: Report Sent Successfully to Telegram!\"\
    ;\
    \n} on-error={\
    \n    :log error \"Telegram Script: Failed to Send! (Internet issue or inv\
    alid characters)\";\
    \n}\
    \n"
add dont-require-permissions=no name="A user-usage-mb" owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=" \
    :log warning \"--- START ENAN NET REPORT ---\";\
    \n\
    \n  # ----- \D8\AF\D8\A7\D9\84\D8\A9 \D8\AA\D8\AD\D9\88\D9\8A\D9\84 \D8\A7\
    \D9\84\D8\AA\D8\A7\D8\B1\D9\8A\D8\AE (\D9\85\D8\AB\D9\84 \"jun/28/2026 01:\
    38:33\") \D8\A5\D9\84\D9\89 \D8\AB\D9\88\D8\A7\D9\86\D9\8A \D9\85\D9\86\D8\
    \B0 1970 -----\
    \n  :local toSeconds do={\
    \n    :local str \$1;\
    \n    :local months { \"jan\"=0; \"feb\"=1; \"mar\"=2; \"apr\"=3; \"may\"=\
    4; \"jun\"=5; \"jul\"=6; \"aug\"=7; \"sep\"=8; \"oct\"=9; \"nov\"=10; \"de\
    c\"=11 };\
    \n    :local monthStr [:pick \$str 0 3];\
    \n    :local month (\$months->\$monthStr);\
    \n    :if ([:len \$monthStr] < 3) do={ :return 0; }\
    \n    :local day [:tonum [:pick \$str 4 6]];\
    \n    :local year [:tonum [:pick \$str 7 11]];\
    \n    :local hour [:tonum [:pick \$str 12 14]];\
    \n    :local min  [:tonum [:pick \$str 15 17]];\
    \n    :local sec  [:tonum [:pick \$str 18 20]];\
    \n\
    \n    # \D8\AD\D8\B3\D8\A7\D8\A8 \D8\B9\D8\AF\D8\AF \D8\A7\D9\84\D8\A3\D9\
    \8A\D8\A7\D9\85 \D9\85\D9\86 1970 \D8\A5\D9\84\D9\89 \D8\A7\D9\84\D8\B3\D9\
    \86\D8\A9 \D8\A7\D9\84\D9\85\D8\B7\D9\84\D9\88\D8\A8\D8\A9 (\D9\85\D8\B9 \
    \D8\AA\D8\AC\D8\A7\D9\87\D9\84 \D8\A7\D9\84\D8\B3\D9\86\D9\88\D8\A7\D8\AA \
    \D8\A7\D9\84\D9\83\D8\A8\D9\8A\D8\B3\D8\A9 \D9\84\D9\84\D8\AA\D8\A8\D8\B3\
    \D9\8A\D8\B7)\
    \n    :local yearDays ((\$year - 1970) * 365 + ((\$year - 1970) / 4));\
    \n    # \D8\A3\D9\8A\D8\A7\D9\85 \D8\A7\D9\84\D8\B4\D9\87\D9\88\D8\B1 \D8\
    \AD\D8\AA\D9\89 \D8\A7\D9\84\D8\B4\D9\87\D8\B1 \D8\A7\D9\84\D8\AD\D8\A7\D9\
    \84\D9\8A\
    \n    :local monthDays { 31;28;31;30;31;30;31;31;30;31;30;31 };\
    \n    :local totalDays 0;\
    \n    :for i from=0 to=(\$month - 1) do={\
    \n      :set totalDays (\$totalDays + (\$monthDays->\$i));\
    \n    }\
    \n    :set totalDays (\$totalDays + \$day - 1 + \$yearDays);\
    \n    :local seconds (\$totalDays * 86400 + \$hour * 3600 + \$min * 60 + \
    \$sec);\
    \n    :return \$seconds;\
    \n  };\
    \n\
    \n  # ----- \D8\A7\D9\84\D8\AD\D8\B5\D9\88\D9\84 \D8\B9\D9\84\D9\89 \D8\A7\
    \D9\84\D9\88\D9\82\D8\AA \D8\A7\D9\84\D8\AD\D8\A7\D9\84\D9\8A \D8\A8\D8\A7\
    \D9\84\D8\AB\D9\88\D8\A7\D9\86\D9\8A (\D9\85\D9\86 \D8\AE\D9\84\D8\A7\D9\
    \84 \D8\AA\D8\AD\D9\88\D9\8A\D9\84 \D8\AA\D8\A7\D8\B1\D9\8A\D8\AE \D8\A7\
    \D9\84\D8\A2\D9\86) -----\
    \n  :local currentDate [/system clock get date];\
    \n  :local currentTime [/system clock get time];\
    \n  :local nowStr (\$currentDate . \" \" . \$currentTime);\
    \n  :local nowSec [\$toSeconds \$nowStr];\
    \n\
    \n  # ----- \D8\A5\D8\B9\D8\AF\D8\A7\D8\AF\D8\A7\D8\AA \D8\A7\D9\84\D8\AA\
    \D9\8A\D9\84\D9\8A\D8\AC\D8\B1\D8\A7\D9\85 -----\
    \n  :local botToken \"8736583790:AAEqJRo36wMKbVMhwUnGJoDYCNeJ0tr6RZg\";\
    \n  :local chatId \"7562205396\";\
    \n  :local nl \"%0A\";\
    \n  :local sp \"%20\";\
    \n\
    \n  :local grandUsers 0;\
    \n  :local grandPrice 0;\
    \n  :local reportMessage (\"\F0\9F\93\8A *Enan Net Summary* \F0\9F\93\8A\"\
    \_. \$nl);\
    \n\
    \n  # ----- \D8\AC\D9\84\D8\A8 \D8\A7\D9\84\D8\A8\D8\B1\D9\88\D9\81\D8\A7\
    \D9\8A\D9\84\D8\A7\D8\AA -----\
    \n  /tool user-manager\
    \n  :foreach p in=[/tool user-manager profile find] do={\
    \n    :do {\
    \n      :local pName [/tool user-manager profile get \$p name];\
    \n      :local pPriceRaw [/tool user-manager profile get \$p price];\
    \n      :local pPrice 0;\
    \n      :if ([:len \$pPriceRaw] > 0) do={ :set pPrice (\$pPriceRaw / 100);\
    \_}\
    \n\
    \n      # \D8\AC\D9\84\D8\A8 \D8\AC\D9\85\D9\8A\D8\B9 \D8\A7\D9\84\D9\85\
    \D8\B3\D8\AA\D8\AE\D8\AF\D9\85\D9\8A\D9\86 \D8\A7\D9\84\D9\86\D8\B4\D8\B7\
    \D9\8A\D9\86 (\D8\BA\D9\8A\D8\B1 \D9\85\D8\B9\D8\B7\D9\84\D9\8A\D9\86)\
    \n      :local allUsers [/tool user-manager user find where actual-profile\
    =\$pName and disabled=no];\
    \n      :local count 0;\
    \n\
    \n      # \D8\AA\D8\B5\D9\81\D9\8A\D8\A9 \D8\A7\D9\84\D9\85\D8\B3\D8\AA\D8\
    \AE\D8\AF\D9\85\D9\8A\D9\86 \D8\A7\D9\84\D8\B0\D9\8A\D9\86 last-seen \D8\
    \AE\D9\84\D8\A7\D9\84 24 \D8\B3\D8\A7\D8\B9\D8\A9\
    \n      :foreach u in=\$allUsers do={\
    \n        :do {\
    \n          :local lastSeenStr [/tool user-manager user get \$u last-seen]\
    ;\
    \n          :if (\$lastSeenStr != \"never\" && [:len \$lastSeenStr] > 0) d\
    o={\
    \n            :local lastSec [\$toSeconds \$lastSeenStr];\
    \n            :if (\$lastSec > 0 && (\$nowSec - \$lastSec) < 86400) do={\
    \n              :set count (\$count + 1);\
    \n            }\
    \n          }\
    \n        } on-error={ }\
    \n      }\
    \n\
    \n      :if (\$count > 0) do={\
    \n        :local pTotalPrice (\$count * \$pPrice);\
    \n        :set grandUsers (\$grandUsers + \$count);\
    \n        :set grandPrice (\$grandPrice + \$pTotalPrice);\
    \n        :set reportMessage (\$reportMessage . \"\F0\9F\91\A4 *\$pName*  \
    |  Users: \$count  |  Sales: \$pTotalPrice\" . \$nl);\
    \n      }\
    \n    } on-error={\
    \n      :log error (\"Script Error: Failed processing profile.\");\
    \n    }\
    \n  }\
    \n\
    \n  # ----- \D8\A7\D8\B3\D8\AA\D9\87\D9\84\D8\A7\D9\83 \D8\A7\D9\84\D9\88\
    \D8\A7\D8\AC\D9\87\D8\A9 IN-OUT -----\
    \n  :local rxByteBr [/interface get [find name=\"IN-OUT\"] rx-byte];\
    \n  :local txByteBr [/interface get [find name=\"IN-OUT\"] tx-byte];\
    \n  :local grandDLMB (\$rxByteBr / 1048576);\
    \n  :local grandULMB (\$txByteBr / 1048576);\
    \n  :local totalMB (\$grandDLMB + \$grandULMB);\
    \n\
    \n  # ----- \D8\A5\D8\B6\D8\A7\D9\81\D8\A9 \D8\A7\D9\84\D8\A5\D8\AC\D9\85\
    \D8\A7\D9\84\D9\8A\D8\A7\D8\AA \D9\85\D8\B9 \D8\A5\D9\8A\D9\85\D9\88\D8\AC\
    \D9\8A -----\
    \n  :set reportMessage (\$reportMessage . \"-------------------\" . \$nl);\
    \n  :set reportMessage (\$reportMessage . \"\F0\9F\93\8C Total Users  : \$\
    grandUsers\" . \$nl);\
    \n  :set reportMessage (\$reportMessage . \"\F0\9F\93\A5 Total DL    : \$g\
    randDLMB MB\" . \$nl);\
    \n  :set reportMessage (\$reportMessage . \"\F0\9F\93\A4 Total UL    : \$g\
    randULMB MB\" . \$nl);\
    \n  :set reportMessage (\$reportMessage . \"\F0\9F\93\88 Grand Total : \$t\
    otalMB MB\" . \$nl);\
    \n  :set reportMessage (\$reportMessage . \"\F0\9F\92\B0 Total Sales : \$g\
    randPrice\");\
    \n\
    \n  # ----- \D8\B9\D8\B1\D8\B6 \D8\A7\D9\84\D8\AA\D9\82\D8\B1\D9\8A\D8\B1 \
    \D9\81\D9\8A \D8\A7\D9\84\D9\84\D9\88\D8\AC \D9\84\D9\84\D8\AA\D8\A3\D9\83\
    \D8\AF -----\
    \n  :log info \$reportMessage;\
    \n\
    \n  # ----- \D8\A5\D8\B1\D8\B3\D8\A7\D9\84 \D8\A7\D9\84\D8\AA\D9\82\D8\B1\
    \D9\8A\D8\B1 \D8\B9\D8\A8\D8\B1 \D8\AA\D9\8A\D9\84\D9\8A\D8\AC\D8\B1\D8\A7\
    \D9\85 -----\
    \n  :do {\
    \n    /tool fetch http-method=post url=\"https://api.telegram.org/bot\$bot\
    Token/sendMessage\" http-data=\"chat_id=\$chatId&text=\$reportMessage&pars\
    e_mode=Markdown\" keep-result=no;\
    \n    :log info \"Telegram Script: Report Sent Successfully!\";\
    \n  } on-error={\
    \n    :log error \"Telegram Script: Failed to Send!\";\
    \n  }"
add dont-require-permissions=no name=A owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local prof \"limity\";\
    \n:local d [/system clock get date];\
    \n:local m [:pick \$d 0 3];\
    \n:local day [:pick \$d 4 6];\
    \n:local y [:pick \$d 7 11];\
    \n\
    \n:if (\$day = \"07\" || \$day = \"7\") do={\
    \n    :local marker (\"um_reset_profile_\" . \$m . \"_\" . \$y);\
    \n    \
    \n    :if ([:len [/file find name=(\$marker . \".txt\")]] = 0) do={\
    \n        :log info (\"Searching directly in users for actual-profile: \" \
    . \$prof);\
    \n        \
    \n        # \D8\A7\D9\84\D8\A8\D8\AD\D8\AB \D8\A7\D9\84\D9\85\D8\A8\D8\A7\
    \D8\B4\D8\B1 \D9\88\D8\A7\D9\84\D8\A2\D9\85\D9\86 \D8\A8\D8\A7\D8\B3\D8\AA\
    \D8\AE\D8\AF\D8\A7\D9\85 actual-profile\
    \n        :local usersToReset [/tool user-manager user find where actual-p\
    rofile=\$prof];\
    \n        :local resetCount [:len \$usersToReset];\
    \n        \
    \n        :log info (\"Found \" . \$resetCount . \" users. Starting reset \
    process...\");\
    \n        \
    \n        :if (\$resetCount > 0) do={\
    \n            :foreach u in=\$usersToReset do={\
    \n                :local uname [/tool user-manager user get \$u username];\
    \n                \
    \n                # \D8\AA\D8\B5\D9\81\D9\8A\D8\B1 \D8\A7\D9\84\D8\B9\D8\
    \AF\D8\A7\D8\AF\
    \n                /tool user-manager user reset-counters \$u;\
    \n                :log info (\"Counters reset successfully for: \" . \$una\
    me);\
    \n            };\
    \n            \
    \n            # \D8\A5\D9\86\D8\B4\D8\A7\D8\A1 \D8\A7\D9\84\D9\85\D8\A7\D8\
    \B1\D9\83\D8\B1 \D9\84\D9\85\D9\86\D8\B9 \D8\A7\D9\84\D8\AA\D9\83\D8\B1\D8\
    \A7\D8\B1\
    \n            /file print file=\$marker;\
    \n            :log info (\"Success: \" . \$resetCount . \" users reset for\
    \_profile \" . \$prof);\
    \n        } else={\
    \n            :log warning (\"No users found actively using profile: \" . \
    \$prof);\
    \n        };\
    \n    } else={\
    \n        :log warning (\"Marker file already exists. Reset skipped.\");\
    \n    };\
    \n} else={\
    \n    :log info (\"Today is not the 7th. Script stopped.\");\
    \n};\
    \n"
add dont-require-permissions=no name=AB owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    \n    :log info \"SES-DBG: start\";\
    \n    :local c [/tool user-manager session print count-only];\
    \n    :log info (\"SES-DBG: total sessions=\" . \$c);\
    \n\
    \n    :foreach s in=[/tool user-manager session find] do={\
    \n        :local u [/tool user-manager session get \$s user];\
    \n        :local n [/tool user-manager session get \$s nas-port-id];\
    \n        :local ip [/tool user-manager session get \$s user-ip];\
    \n        :local ft [/tool user-manager session get \$s from-time];\
    \n        :local tt [/tool user-manager session get \$s till-time];\
    \n        :log info (\"SES-DBG: user=\" . \$u . \" nas-port-id=\" . \$n . \
    \" ip=\" . \$ip . \" from=\" . \$ft . \" till=\" . \$tt);\
    \n    };\
    \n\
    \n    :log info \"SES-DBG: end\";\
    \n}"
add dont-require-permissions=no name=AC owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    \n    :log info \"UM-EXPORT: start\";\
    \n\
    \n    :foreach u in=[/tool user-manager user find] do={\
    \n        :local uname [/tool user-manager user get \$u username];\
    \n        :local prof [/tool user-manager user get \$u actual-profile];\
    \n        :local lastSeen [/tool user-manager user get \$u last-seen];\
    \n        :local upUsed [/tool user-manager user get \$u uptime-used];\
    \n        :local dlUsed [/tool user-manager user get \$u download-used];\
    \n        :local ulUsed [/tool user-manager user get \$u upload-used];\
    \n\
    \n        :if ([:len \$uname] > 0) do={\
    \n            :if ((\$lastSeen != \"never\") || ([:len [:tostr \$upUsed]] \
    > 0) || ([:len [:tostr \$dlUsed]] > 0) || ([:len [:tostr \$ulUsed]] > 0)) \
    do={\
    \n\
    \n                :local lastNasPort \"\";\
    \n                :local lastUserIP \"\";\
    \n                :local lastFromTime \"\";\
    \n                :local lastTillTime \"\";\
    \n\
    \n                :foreach s in=[/tool user-manager session find] do={\
    \n                    :local su [/tool user-manager session get \$s user];\
    \n                    :if (\$su = \$uname) do={\
    \n                        :set lastNasPort [/tool user-manager session get\
    \_\$s nas-port-id];\
    \n                        :set lastUserIP [/tool user-manager session get \
    \$s user-ip];\
    \n                        :set lastFromTime [/tool user-manager session ge\
    t \$s from-time];\
    \n                        :set lastTillTime [/tool user-manager session ge\
    t \$s till-time];\
    \n                    };\
    \n                };\
    \n\
    \n                :put (\"username=\" . \$uname . \";profile=\" . \$prof .\
    \_\";last-seen=\" . \$lastSeen . \";nas-port-id=\" . \$lastNasPort . \";us\
    er-ip=\" . \$lastUserIP . \";from-time=\" . \$lastFromTime . \";till-time=\
    \" . \$lastTillTime . \";uptime-used=\" . \$upUsed . \";download-used=\" .\
    \_\$dlUsed . \";upload-used=\" . \$ulUsed);\
    \n            };\
    \n        };\
    \n    };\
    \n\
    \n    :log info \"UM-EXPORT: end\";\
    \n}"
add dont-require-permissions=no name=A-LogActiveUMUsers owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    log warning \"=========================================================\";\
    \n:log warning \"=== \D8\AC\D8\A7\D8\B1\D9\8A \D8\A7\D8\B3\D8\AA\D8\AE\D8\
    \B1\D8\A7\D8\AC \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A7\D9\84\D9\85\D8\
    \B3\D8\AA\D8\AE\D8\AF\D9\85\D9\8A\D9\86 \D8\A7\D9\84\D9\86\D8\B4\D8\B7\D9\
    \8A\D9\86 ===\";\
    \n\
    \n# \D8\A7\D9\84\D8\A8\D8\AD\D8\AB \D8\B9\D9\86 \D8\A7\D9\84\D8\AC\D9\84\
    \D8\B3\D8\A7\D8\AA \D8\A7\D9\84\D9\86\D8\B4\D8\B7\D8\A9 \D8\AD\D8\A7\D9\84\
    \D9\8A\D8\A7\D9\8B\
    \n:local activeSessions [/tool user-manager session find where active=yes]\
    ;\
    \n\
    \n:if ([:len \$activeSessions] = 0) do={\
    \n    :log info \"\D9\84\D8\A7 \D9\8A\D9\88\D8\AC\D8\AF \D8\A3\D9\8A \D9\
    \85\D8\B3\D8\AA\D8\AE\D8\AF\D9\85\D9\8A\D9\86 \D9\86\D8\B4\D8\B7\D9\8A\D9\
    \86 \D8\AD\D8\A7\D9\84\D9\8A\D8\A7\D9\8B \D9\81\D9\8A User Manager.\";\
    \n} else={\
    \n    :foreach session in=\$activeSessions do={\
    \n        \
    \n        # \D8\A7\D8\B3\D8\AA\D8\AE\D8\B1\D8\A7\D8\AC \D8\A7\D9\84\D8\A8\
    \D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A7\D9\84\D8\A3\D8\B3\D8\A7\D8\B3\D9\8A\
    \D8\A9 \D9\88\D8\AA\D8\B5\D8\AD\D9\8A\D8\AD \D8\A7\D8\B3\D9\85 \D8\A7\D9\
    \84\D9\85\D8\AA\D8\BA\D9\8A\D8\B1 \D8\A5\D9\84\D9\89 host-ip\
    \n        :local username [/tool user-manager session get \$session user];\
    \n        :local ipAddress [/tool user-manager session get \$session host-\
    ip];\
    \n        :local nasPort [/tool user-manager session get \$session nas-por\
    t-id];\
    \n        :local startTime [/tool user-manager session get \$session from-\
    time];\
    \n        :local downBytes [/tool user-manager session get \$session downl\
    oad];\
    \n        :local upBytes [/tool user-manager session get \$session upload]\
    ;\
    \n        \
    \n        # \D8\AD\D9\85\D8\A7\D9\8A\D8\A9 \D8\A7\D9\84\D8\B3\D9\83\D8\B1\
    \D9\8A\D8\A8\D8\AA \D9\85\D9\86 \D8\A7\D9\84\D8\AA\D9\88\D9\82\D9\81 \D8\
    \A5\D8\B0\D8\A7 \D9\83\D8\A7\D9\86\D8\AA \D8\A8\D8\B9\D8\B6 \D8\A7\D9\84\
    \D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D9\81\D8\A7\D8\B1\D8\BA\D8\A9\
    \n        :if ([:len \$nasPort] = 0) do={ :set nasPort \"N/A\"; }\
    \n        :if ([:len \$ipAddress] = 0) do={ :set ipAddress \"N/A\"; }\
    \n        :if ([:len \$downBytes] = 0) do={ :set downBytes \"0\"; }\
    \n        :if ([:len \$upBytes] = 0) do={ :set upBytes \"0\"; }\
    \n        \
    \n        # \D8\AA\D8\AD\D9\88\D9\8A\D9\84 \D8\A7\D9\84\D8\A8\D9\8A\D8\A7\
    \D9\86\D8\A7\D8\AA \D8\A5\D9\84\D9\89 \D8\A3\D8\B1\D9\82\D8\A7\D9\85 \D8\
    \AB\D9\85 \D8\A5\D9\84\D9\89 \D9\85\D9\8A\D8\BA\D8\A7\D8\A8\D8\A7\D9\8A\D8\
    \AA\
    \n        :local downMB ([:tonum \$downBytes] / 1048576);\
    \n        :local upMB ([:tonum \$upBytes] / 1048576);\
    \n        \
    \n        # \D8\A7\D8\B3\D8\AA\D8\AE\D8\B1\D8\A7\D8\AC \D8\A7\D9\84\D8\A8\
    \D8\B1\D9\88\D9\81\D8\A7\D9\8A\D9\84 \D9\88\D8\AA\D8\A7\D8\B1\D9\8A\D8\AE \
    \D8\A7\D9\84\D8\A7\D9\86\D8\AA\D9\87\D8\A7\D8\A1\
    \n        :local userRef [/tool user-manager user find username=\$username\
    ];\
    \n        :local profile \"N/A\";\
    \n        :local tillTime \"N/A\";\
    \n        \
    \n        :if ([:len \$userRef] > 0) do={\
    \n            :local uID (\$userRef->0);\
    \n            :local foundProfile [/tool user-manager user get \$uID actua\
    l-profile];\
    \n            :if ([:len \$foundProfile] > 0) do={ :set profile \$foundPro\
    file; }\
    \n            \
    \n            :local foundTill [/tool user-manager user get \$uID till-tim\
    e];\
    \n            :if ([:len \$foundTill] > 0) do={ :set tillTime \$foundTill;\
    \_}\
    \n        }\
    \n        \
    \n        # \D8\B7\D8\A8\D8\A7\D8\B9\D8\A9 \D8\A7\D9\84\D9\86\D8\AA\D9\8A\
    \D8\AC\D8\A9 \D9\81\D9\8A \D8\A7\D9\84\D9\84\D9\88\D8\AC\
    \n        :log info \"\$username | \$profile | \$startTime | \$nasPort | \
    \$ipAddress | \$tillTime | DL: \$downMB MB | UL: \$upMB MB\";\
    \n    }\
    \n}\
    \n:log warning \"=== \D8\AA\D9\85 \D8\A7\D9\84\D8\A7\D9\86\D8\AA\D9\87\D8\
    \A7\D8\A1 \D9\85\D9\86 \D8\A7\D8\B3\D8\AA\D8\AE\D8\B1\D8\A7\D8\AC \D8\A7\
    \D9\84\D8\A8\D9\8A\D8\A7\D9\86\D8\A7\D8\AA \D8\A8\D9\86\D8\AC\D8\A7\D8\AD \
    ===\";\
    \n:log warning \"=========================================================\
    \";\
    \n"
add dont-require-permissions=no name=A_list-active-users owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="{\
    \n    :log info \"UM-DBG: start\";\
    \n\
    \n    :local total [/tool user-manager user print count-only];\
    \n    :log info (\"UM-DBG: total users=\" . \$total);\
    \n\
    \n    :foreach u in=[/tool user-manager user find] do={\
    \n        :log info (\"UM-DBG: checking item=\" . \$u);\
    \n\
    \n        :local uname [/tool user-manager user get \$u username];\
    \n        :local lastSeen [/tool user-manager user get \$u last-seen];\
    \n        :local upUsed [/tool user-manager user get \$u uptime-used];\
    \n        :local dlUsed [/tool user-manager user get \$u download-used];\
    \n        :local ulUsed [/tool user-manager user get \$u upload-used];\
    \n\
    \n        :log info (\"UM-DBG: uname=\" . \$uname . \" lastSeen=\" . \$las\
    tSeen . \" upUsed=\" . \$upUsed . \" dlUsed=\" . \$dlUsed . \" ulUsed=\" .\
    \_\$ulUsed);\
    \n\
    \n        :if ([:len \$uname] > 0) do={\
    \n            :if ((\$lastSeen != \"never\") || ([:len [:tostr \$upUsed]] \
    > 0) || ([:len [:tostr \$dlUsed]] > 0) || ([:len [:tostr \$ulUsed]] > 0)) \
    do={\
    \n                :log info (\"UM-DBG: MATCH username=\" . \$uname);\
    \n                :put (\"username=\" . \$uname . \";last-seen=\" . \$last\
    Seen . \";uptime-used=\" . \$upUsed . \";download-used=\" . \$dlUsed . \";\
    upload-used=\" . \$ulUsed);\
    \n            } else={\
    \n                :log info (\"UM-DBG: skip username=\" . \$uname . \" not\
    \_used\");\
    \n            };\
    \n        } else={\
    \n            :log warning (\"UM-DBG: empty username at item=\" . \$u);\
    \n        };\
    \n    };\
    \n\
    \n    :log info \"UM-DBG: end\";\
    \n}"
add dont-require-permissions=no name=A2 owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-\
    3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9C%85%20Router%\
    20101%20ONLINE\" keep-result=no check-certificate=no"
add dont-require-permissions=no name=1 owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local identity [/system identity get name]\
    \n:local date [/system clock get date]\
    \n:local time [/system clock get time]\
    \n\
    \n:local month [:pick \$date 0 3]\
    \n:local day [:pick \$date 4 6]\
    \n:local year [:pick \$date 7 11]\
    \n\
    \n:local hour [:pick \$time 0 2]\
    \n:local min [:pick \$time 3 5]\
    \n:local sec [:pick \$time 6 8]\
    \n\
    \n:local fileName \"\$identity-\$year-\$month-\$day-\$hour-\$min-\$sec.bac\
    kup\"\
    \n\
    \n/system backup save name=\$fileName dont-encrypt=yes\
    \n:log info \"Backup saved: \$fileName\"\
    \n\
    \n# \D8\A7\D9\84\D8\A7\D8\AD\D8\AA\D9\81\D8\A7\D8\B8 \D8\A8\D8\A3\D8\AD\D8\
    \AF\D8\AB 3 \D9\86\D8\B3\D8\AE \D9\81\D9\82\D8\B7\
    \n:local backupFiles [/file find type=backup]\
    \n:local total [:len \$backupFiles]\
    \n\
    \n:if (\$total > 3) do={\
    \n    :local extra (\$total - 3)\
    \n    :for i from=0 to=(\$extra - 1) do={\
    \n        /file remove (\$backupFiles->\$i)\
    \n    }\
    \n    :log info (\"Old backups removed: \" . \$extra)\
    \n}"
add dont-require-permissions=no name=2 owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local identity [/system identity get name]\
    \n:local date [/system clock get date]\
    \n:local time [/system clock get time]\
    \n\
    \n:local month [:pick \$date 0 3]\
    \n:local day [:pick \$date 4 6]\
    \n:local year [:pick \$date 7 11]\
    \n\
    \n:local hour [:pick \$time 0 2]\
    \n:local min [:pick \$time 3 5]\
    \n:local sec [:pick \$time 6 8]\
    \n\
    \n:local fileName \"\$identity-\$year-\$month-\$day-\$hour-\$min-\$sec.bac\
    kup\"\
    \n\
    \n/system backup save name=\$fileName dont-encrypt=yes\
    \n:log info \"Backup saved: \$fileName\"\
    \n\
    \n# \D8\A7\D9\84\D8\A7\D8\AD\D8\AA\D9\81\D8\A7\D8\B8 \D8\A8\D8\A3\D8\AD\D8\
    \AF\D8\AB 3 \D9\86\D8\B3\D8\AE \D9\81\D9\82\D8\B7\
    \n:local backupFiles [/file find type=backup]\
    \n:local total [:len \$backupFiles]\
    \n\
    \n:if (\$total > 3) do={\
    \n    :local extra (\$total - 3)\
    \n    :for i from=0 to=(\$extra - 1) do={\
    \n        /file remove (\$backupFiles->\$i)\
    \n    }\
    \n    :log info (\"Old backups removed: \" . \$extra)\
    \n}"
add dont-require-permissions=no name=11 owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    ip firewall nat\
    \nadd chain=srcnat dst-address=192.168.1.1 action=masquerade comment=\"Acc\
    ess Einan Net Remote Router 192.168.1.1\" place-before=0\
    \n/ip firewall filter\
    \nadd chain=forward action=accept dst-address=192.168.1.1 comment=\"Allow \
    access to remote router\" place-before=0\
    \nadd chain=forward action=accept src-address=192.168.1.1 comment=\"Allow \
    return traffic from remote router\"  place-before=0\
    \n/ip address\
    \nadd address=192.168.1.254/24 interface=IN-OUT comment=\"Secondary IP for\
    \_remote management\"\
    \n/ip hotspot ip-binding\
    \nadd address=192.168.1.1 type=bypassed comment=\"Bypass for Einan Net rem\
    ote router setup\""
add dont-require-permissions=no name=1-mangle-method-2 owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local i 0\r\
    \n:foreach id in=[/ip firewall mangle find] do={\r\
    \n    :if (\$i >= 46 && \$i <= 54) do={ /ip firewall mangle disable \$id }\
    \r\
    \n    :if (\$i >= 55 && \$i <= 63) do={ /ip firewall mangle enable \$id }\
    \r\
    \n    :set i (\$i + 1)\r\
    \n}\r\
    \n:set i 0\r\
    \n/ip firewall mangle reset-counters [find]"
add dont-require-permissions=no name=1-mangle-method-1 owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local i 0\r\
    \n:foreach id in=[/ip firewall mangle find] do={\r\
    \n    :if (\$i >= 55 && \$i <= 63) do={ /ip firewall mangle disable \$id }\
    \r\
    \n    :if (\$i >= 46 && \$i <= 54) do={ /ip firewall mangle enable \$id }\
    \r\
    \n    :set i (\$i + 1)\r\
    \n}\r\
    \n:set i 0\r\
    \n/ip firewall mangle reset-counters [find]"
/system watchdog
set automatic-supout=no watchdog-timer=no
/tool bandwidth-server
set enabled=no
/tool e-mail
set address=74.125.142.108 from=<mikrotik> port=587 start-tls=yes user=\
    salah22app@gmail.com
/tool mac-server
set allowed-interface-list=none
/tool mac-server ping
set enabled=no
/tool netwatch
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20103%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.103 interval=10s timeout=3s up-script="/tool fetch url=\"\
    https://api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc\
    /sendMessage\?chat_id=7562205396&text=%E2%9C%85%20Router%20103%20ONLINE\" \
    keep-result=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%2010%20OFFLINE\" keep-result=no check-certificate=no" host=\
    192.168.100.10 interval=10s timeout=3s up-script="/tool fetch url=\"https:\
    //api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendM\
    essage\?chat_id=7562205396&text=%E2%9C%85%20Router%2010%20ONLINE\" keep-re\
    sult=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20101%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.101 interval=10s timeout=3s up-script="/tool fetch url=\"\
    https://api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc\
    /sendMessage\?chat_id=7562205396&text=%E2%9C%85%20Router%20101%20ONLINE\" \
    keep-result=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%2020%20OFFLINE\" keep-result=no check-certificate=no" host=\
    192.168.100.20 interval=10s timeout=3s up-script="/tool fetch url=\"https:\
    //api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendM\
    essage\?chat_id=7562205396&text=%E2%9C%85%20Router%2020%20ONLINE\" keep-re\
    sult=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%2030%20OFFLINE\" keep-result=no check-certificate=no" host=\
    192.168.100.30 interval=20s timeout=3s up-script="/tool fetch url=\"https:\
    //api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendM\
    essage\?chat_id=7562205396&text=%E2%9C%85%20Router%2030%20ONLINE\" keep-re\
    sult=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Sender%20is%20OFFLINE\" keep-result=no check-certificate=no" host=\
    10.10.4.20 interval=10s timeout=3s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessa\
    ge\?chat_id=7562205396&text=%E2%9C%85%20Sender%20is%20ONLINE\" keep-result\
    =no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20102%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.102 timeout=3s up-script="/tool fetch url=\"https://api.t\
    elegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\
    \?chat_id=7562205396&text=%E2%9C%85%20Router%20102%20ONLINE\" keep-result=\
    no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20131%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.131 interval=10s timeout=3s up-script="/tool fetch url=\"\
    https://api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc\
    /sendMessage\?chat_id=7562205396&text=%E2%9C%85%20Router%20131%20ONLINE\" \
    keep-result=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20104%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.104 up-script="/tool fetch url=\"https://api.telegram.org\
    /bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=75\
    62205396&text=%E2%9C%85%20Router%20104%20ONLINE\" keep-result=no check-cer\
    tificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20132%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.132 timeout=3s up-script="/tool fetch url=\"https://api.t\
    elegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\
    \?chat_id=7562205396&text=%E2%9C%85%20Router%20132%20ONLINE\" keep-result=\
    no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20113%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.113 interval=10s timeout=3s up-script="/tool fetch url=\"\
    https://api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc\
    /sendMessage\?chat_id=7562205396&text=%E2%9C%85%20Router%20113%20ONLINE\" \
    keep-result=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20111%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.111 interval=30s timeout=3s up-script="/tool fetch url=\"\
    https://api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc\
    /sendMessage\?chat_id=7562205396&text=%E2%9C%85%20Router%20111%20ONLINE\" \
    keep-result=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20105%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.105 up-script="/tool fetch url=\"https://api.telegram.org\
    /bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=75\
    62205396&text=%E2%9C%85%20Router%20105%20ONLINE\" keep-result=no check-cer\
    tificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20133%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.133 interval=3m timeout=3s up-script="/tool fetch url=\"h\
    ttps://api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/\
    sendMessage\?chat_id=7562205396&text=%E2%9C%85%20Router%20133%20ONLINE\" k\
    eep-result=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Istraha%20is%20OFFLINE\" keep-result=no check-certificate=no" \
    host=10.10.10.10 up-script="/tool fetch url=\"https://api.telegram.org/bot\
    8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=756220\
    5396&text=%E2%9C%85%20Istrahah%20is%20ONLINE\" keep-result=no check-certif\
    icate=no"
add comment="Check Mikrotik Lines 1" down-script=\
    "#/ip route disable [find comment=\"MainLines_1 ISP3\"];" host=\
    10.10.5.103 interval=7s timeout=700ms up-script=\
    "/ip route enable [find comment=\"MainLines_1 ISP3\"];"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20106%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.106 up-script="/tool fetch url=\"https://api.telegram.org\
    /bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=75\
    62205396&text=%E2%9C%85%20Router%20106%20ONLINE\" keep-result=no check-cer\
    tificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Dahua%20OFFLINE\" keep-result=no check-certificate=no" host=\
    192.168.100.250 interval=10s timeout=3s up-script="/tool fetch url=\"https\
    ://api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/send\
    Message\?chat_id=7562205396&text=%E2%9C%85%20Dahua%20ONLINE\" keep-result=\
    no check-certificate=no"
add down-script="/ip route disable [find comment=\"Line19 Primary\"]\
    \n/ip firewall mangle disable [find comment=\"PCC-TO-LINE19\"]\
    \n  :delay 1s\
    \n  /ip firewall mangle enable [find comment=\"PCC-TO-LINE19\"]\
    \n # /ip firewall connection remove [find where connection-mark~\"line19_c\
    onn\"]" host=192.168.19.1 interval=2s timeout=2s up-script=":delay 30s\
    \n/ip route enable [find comment=\"Line19 Primary\"]\
    \n/ip firewall mangle disable [find comment=\"PCC-TO-LINE19\"]\
    \n  :delay 1s\
    \n/ip firewall mangle enable [find comment=\"PCC-TO-LINE19\"]\
    \n # /ip firewall connection remove [find where connection-mark~\"line19_c\
    onn\"]"
add down-script="/ip route disable [find comment=\"Line20 Primary\"]\
    \n/ip firewall mangle disable [find comment=\"PCC-TO-LINE20\"]\
    \n  :delay 1s\
    \n  /ip firewall mangle enable [find comment=\"PCC-TO-LINE20\"]" host=\
    192.168.20.1 interval=10s timeout=2s up-script=":delay 30s\
    \n/ip route enable [find comment=\"Line20 Primary\"]\
    \n/ip firewall mangle disable [find comment=\"PCC-TO-LINE20\"]\
    \n:delay 1s\
    \n/ip firewall mangle enable [find comment=\"PCC-TO-LINE20\"]"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Reciver-10%20is%20OFFLINE\" keep-result=no check-certificate=no" \
    host=10.10.4.10 interval=10s timeout=3s up-script="/tool fetch url=\"https\
    ://api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/send\
    Message\?chat_id=7562205396&text=%E2%9C%85%20Reciver-10%20is%20ONLINE\" ke\
    ep-result=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%2012%20OFFLINE\" keep-result=no check-certificate=no" host=\
    192.168.12.1 interval=10s timeout=3s up-script="/tool fetch url=\"https://\
    api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMes\
    sage\?chat_id=7562205396&text=%E2%9C%85%20Router%2012%20ONLINE\" keep-resu\
    lt=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%2013%20OFFLINE\" keep-result=no check-certificate=no" host=\
    192.168.13.1 interval=10s timeout=3s up-script="/tool fetch url=\"https://\
    api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMes\
    sage\?chat_id=7562205396&text=%E2%9C%85%20Router%2013%20ONLINE\" keep-resu\
    lt=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%2014%20OFFLINE\" keep-result=no check-certificate=no" host=\
    192.168.14.1 interval=10s timeout=3s up-script="/tool fetch url=\"https://\
    api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMes\
    sage\?chat_id=7562205396&text=%E2%9C%85%20Router%2014%20ONLINE\" keep-resu\
    lt=no check-certificate=no"
add host=192.168.8.1
add host=192.168.11.1
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20107%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.107 up-script="/tool fetch url=\"https://api.telegram.org\
    /bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=75\
    62205396&text=%E2%9C%85%20Router%20107%20ONLINE\" keep-result=no check-cer\
    tificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20117%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.117 up-script="/tool fetch url=\"https://api.telegram.org\
    /bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=75\
    62205396&text=%E2%9C%85%20Router%20117%20ONLINE\" keep-result=no check-cer\
    tificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%20134%20OFFLINE\" keep-result=no check-certificate=no" \
    host=192.168.100.134 interval=10s timeout=3s up-script="/tool fetch url=\"\
    https://api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc\
    /sendMessage\?chat_id=7562205396&text=%E2%9C%85%20Router%20134%20ONLINE\" \
    keep-result=no check-certificate=no"
add down-script="/tool fetch url=\"https://api.telegram.org/bot8271821868:AAH8\
    kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMessage\?chat_id=7562205396&text=%E2%9\
    A%A0%20Router%2022%20OFFLINE\" keep-result=no check-certificate=no" host=\
    192.168.100.22 interval=2s timeout=3s up-script="/tool fetch url=\"https:/\
    /api.telegram.org/bot8271821868:AAH8kVk149laDfLxg-3OHOPEA9idglcJxOc/sendMe\
    ssage\?chat_id=7562205396&text=%E2%9C%85%20Router%2022%20ONLINE\" keep-res\
    ult=no check-certificate=no"
/tool romon
set enabled=yes
/tool traffic-monitor
add disabled=yes interface=IN-OUT name=tmon1