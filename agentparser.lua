function defineOS(tag, timestamp, record)
    if string.match(record["agent"], "Windows NT 6.1")=="Windows NT 6.1"     
        then new_record = record
            new_record["Client.OS"]="Windows 7"
            return 1, timestamp, new_record

        elseif  string.match(record["agent"], "Windows NT 10.0")=="Windows NT 10.0"    
        then new_record = record
            new_record["Client.OS"]="Windows 10"
            return 1, timestamp, new_record

        elseif  string.match(record["agent"], "Mac OS X")=="Mac OS X"           
        then new_record = record
            new_record["Client.OS"]="Mac OS X"       
            return 1, timestamp, new_record
            
        elseif  string.match(record["agent"], "Windows NT 6.3")=="Windows NT 6.3"     
        then new_record = record
            new_record["Client.OS"]="Windows 8.1"    
            return 1, timestamp, new_record

        elseif  string.match(record["agent"], "Windows NT 6.2")=="Windows NT 6.2"     
            then new_record = record
            new_record["Client.OS"]="Windows 8"      
            return 1, timestamp, new_record
        
        elseif  string.match(record["agent"], "Windows NT 6.0")=="Windows NT 6.0"    
        then new_record = record
            new_record["Client.OS"]="Windows Vista"  
            return 1, timestamp, new_record

        else
            new_record = record
            new_record["Client.OS"]="Other"
            return 1, timestamp, new_record
    end    
end

function defineBrowser(tag, timestamp, record)
    if (string.match(record["agent"], "YaBrowser")=="YaBrowser" or string.match(record["agent"],"Yowser")=="Yowser")
    then new_record = record
        new_record["Client.Browser"]="Yandex Browser"
        return 1, timestamp, new_record

    elseif  string.match(record["agent"], "OPR")=="OPR"
    then new_record = record
        new_record["Client.Browser"]="Opera"
        return 1, timestamp, new_record
    
    elseif  string.match(record["agent"], "Firefox")=="Firefox"
    then new_record = record
        new_record["Client.Browser"]="Firefox"
        return 1, timestamp, new_record

    elseif  string.match(record["agent"], "Edge")=="Edge"
    then new_record = record
        new_record["Client.Browser"]="Edge"
        return 1, timestamp, new_record

    elseif  (string.match(record["agent"], "Safari")=="Safari" and string.match(record["agent"], "Chrome")~="Chrome")  
    then new_record = record
        new_record["Client.Browser"]="Safari"
        return 1, timestamp, new_record
        
    elseif  string.match(record["agent"], "Chrome")~="Chrome"
    then new_record = record
        new_record["Client.Browser"]="Internet Explorer"
        return 1, timestamp, new_record
        
    else 
        new_record = record
        new_record["Client.Browser"]="Chrome"
        return 1, timestamp, new_record
    end    
end
