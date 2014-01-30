# .cshrc: executed by C shells on startup
# 
# This is intended to be a means of launching always 
# Bash even if Csh/Tcsh is configured as the login 
# shell (think: old-fashioned IT departments).

# If this is login or some command is to be executed
# then change to a sane shell
if ($?loginsh || $?command) then # switch to bash
    setenv SHELL /bin/bash
    if ($?loginsh) then 
        if ($?command) then 
            exec /bin/bash --login -c "$command"
        endif
        exec /bin/bash --login 
    endif
    # not a login shell, so there must be command
    exec /bin/bash -c "$command"
endif
# go ahead, use csh

########################################
# Set up Subversion path.              #
########################################
if [ -d /proj/STBTools/tools/svn ]; then 
    setenv SVNPATH /proj/STBTools/tools/svn/`uname -m`
    setenv PATH ${SVNPATH}/bin:${PATH}
    setenv PYTHONPATH $SVNPATH/lib/svn-python
    if ($?LD_LIBRARY_PATH) then
        setenv LD_LIBRARY_PATH ${SVNPATH}/lib:${LD_LIBRARY_PATH}
    else
        setenv LD_LIBRARY_PATH ${SVNPATH}/lib
    endif
fi
