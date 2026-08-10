function pwncollege --wraps='ssh -i ~/key hacker@dojo.pwn.college' --description 'alias pwncollege=ssh -i ~/key hacker@dojo.pwn.college'
    ssh -i ~/key hacker@dojo.pwn.college $argv
end
