# Parsing  LUA-script for nginx logs
Hi there!

When i'm come to FluentBit, it was a little disappointment for me. Early i'am uses Filebeat for parse Nginx logs and collect them to Kibana.
And, you know, Filebeat can show `user_agent.os.name` for OS and `user_agent.name` for the Browser.

This LUA-script helps you do same things, but with FluentBit!

Supporting OS for parse:
- Windows Vista
- Windows 7
- Windows 8
- Windows 8.1
- Windows 10
- Mac OS X
- Other (collect all other OS)

Supporting browsers for parse:
- Yandex Browser
- Opera
- Firefox
- Edge
- Safari
- Internet Explorer
- Chrome (may collect all other, less popular browsers)

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

