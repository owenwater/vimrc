"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"File:	Lazyfill
"Maintainer: owen_water<owen200104 at gmail dot com>
"Version: 0.2.1
"Last Change: change filetype to djangohtml for .html file in django project
"License: ..
"
"Change Log: 
"   0.2.1: change filetype to djangohtml for .html file in django project
"
"   0.2: change default template name for .html file in django project
"
"   0.1: First version
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if exists("loaded_lazy_fill")
	finish
endif

let loaded_lazy_fill = 1

function! LazyFill()
python << EOF
try:
    import vim
    from os import environ

    template_path = "~/.vim/template/".replace("~", environ["HOME"])
    template_file_name="tem"

    buf = vim.current.buffer
    cur = vim.current.window.cursor
    path, slash, file_name = buf.name.rpartition('/')
    dirname = path.split('/')[-1]
    name, dot, suffix = file_name.rpartition('.')
    if dirname == "template" and suffix == "html":
        #change defalut template name for django template
        template_file_name = "django"
        vim.command("setfiletype htmldjango")
    fp = None
    try:
        #try template with same name
        fp = open(template_path+file_name)
    except IOError:
        try:
            if name != "" and dot != "":
                #try defalut template
                fp = open(template_path+template_file_name+"."+suffix)
            else:
                raise IOError
        except IOError:
            print "Template not found"

    if fp != None:
        data = fp.readlines()
        data = [line.replace("[filename]", name).replace("[FILENAME]", name.upper()) for line in data]
        if len(buf) == 1 and buf[0] == "":
            buf[cur[0]-1:cur[0]]=data
        else:
            buf[cur[0]:cur[0]]=data

except Exception as e:
    sys.stderr.write(str(e)+"\n")

EOF
endfunction

command! Lazyfill call LazyFill()
