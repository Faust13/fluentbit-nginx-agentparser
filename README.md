# Parsing  LUA-script for nginx logs
Hi there!

When i'm come to FluentBit, it was a little disappointment for me. Early i'am uses Filebeat for parse Nginx logs and collect them to Kibana.
And, you know, Filebeat can show `user_agent.os.name` for OS and `user_agent.name` for the Browser.

This LUA-script helps you do same things, but with FluentBit!

Supporting OS for parse:
- Windows family (starts from XP up to Win10. Olders Windows family OS will be marked as Legacy)
- Mac OS X family (starts from El Capitan up to Mojave. Olders OS X family OS will be marked as Legacy)
- iOS (11 and 12)
- Android (starts from KitKat 4.4 up to 9.0)
- Linux (can define, is Ubuntu or not, lol)
- Other (collect all other OS)

Supporting browsers for parse:
- Mobile Chrome
- Samsung Browser
- UC Browser
- Opera Mobile
- Opera Mini
- Yandex Browser
- Opera
- Firefox
- Edge
- Safari
- Internet Explorer
- Chrome 
- Unknown Browser (collect all other, less popular browsers)

_Yes, i know, this script is not perfect, but u can fix it :)_

# How to use

Just plase this script to your `td-agent-bit` dirrectory (default is `/etc/td-agent-bit/`) and edit `td-agent-bit.conf`. It can look like this:
```
[SERVICE]
    Flush        5
    Daemon       Off
    Log_Level    info
    Parsers_File parsers.conf
    Plugins_File plugins.conf

    HTTP_Server  Off
    HTTP_Listen  127.0.0.1
    HTTP_Port    2020

[INPUT]
    Name tail
    Tag  nginx.access
    Path /var/log/nginx/nginx-access.log
    Parser nginx

    Interval_Sec 1

[FILTER]
    Name lua
    Match *
    script agentparser.lua
    call defineOS 

[FILTER]
    Name lua
    Match *
    script agentparser.lua
    call defineBrowser


[OUTPUT]
    Name  file
    Match *
    Path /docker/output.log

```

