mp.add_hook('on_load', 10, function ()
    sub_paths = {'Subs/', 'subs/', 'Sub/', 'sub/', 'Subtitles/', 'subtitles/', 'Subtitle/', 'subtitle/'}
    string = {}

    for i,n in ipairs(sub_paths)
    do
    table.insert(string,n..mp.get_property('filename/no-ext'))
    end

    mp.set_property('sub-file-paths', table.concat(string,':')..':subs:sub:Sub:Subs:subtitle:subtitles:Subtitle:Subtitles')
end)
