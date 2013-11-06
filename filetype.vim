if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufNewFile,BufRead *.ck setf ck
    au! BufRead,BufNewFile *.fst      setfiletype faust
    au! BufRead,BufNewFile *.dsp      setfiletype faust
    au! BufRead,BufNewFile *.mdl      setfiletype sam
augroup END
