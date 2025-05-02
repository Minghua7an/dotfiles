# ~/.bash_profile: executed by bash for interactive login shells.

#echo '*** this is .bash_profile ***'  # dbg

# On macOS - New iTerm windows/tabs run this file, but NOT .bashrc.
#   .bashrc is also NOT executed even for ssh logins.
# On JupyterHub/JupyterLab - new terminals do NOT run this file, ONLY .bashrc.
#   That is true even if JupyterHub is running on a macOS host.

# Note that the traditional Unix design idea was to have a user's session
# contain a _single_ login shell, with all one-time actions taken there, and
# all subsequent interactive shells started as child processes of that one,
# thus inheriting its setup. Those interactive shells would then only load
# .bashrc. However, OSX starts each new terminal as a login shell, and
# JupyterLab terminals are also login shells. So it makes sense to configure
# this file to load .bashrc directly, and put most user configuration logic
# into .bashrc. We call .bashrc at the bottom.

#############################################################################
# macOS specific config here

# iterm2 integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#############################################################################
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/Users/minghua7an/local/conda/bin/mamba';
export MAMBA_ROOT_PREFIX='/Users/minghua7an/local/conda';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<


#############################################################################
# include .bashrc if it exists - contains all other config common to all OSes
# We call it from here so that ssh and JupyterHub logins get the same config,
# see long explanation above.

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/minghua7an/local/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/minghua7an/local/conda/etc/profile.d/conda.sh" ]; then
        . "/Users/minghua7an/local/conda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/minghua7an/local/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

