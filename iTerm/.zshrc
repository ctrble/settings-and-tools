# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/charlottetrible/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  # user          # Username section
  # host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubecontext   # Kubectl context section
  # terraform     # Terraform workspace section
  # exec_time     # Execution time
  # line_sep      # Line break
  # battery       # Battery level and status
  # vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  line_sep
  char          # Prompt character
)

# Prompt
# SPACESHIP_PROMPT_ADD_NEWLINE=true           # Adds a newline character before each prompt line
# SPACESHIP_PROMPT_SEPARATE_LINE=true         # Make the prompt span across two lines
# SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=false    # Shows a prefix of the first section in prompt
# SPACESHIP_PROMPT_PREFIXES_SHOW=true         # Show prefixes before prompt sections or not
# SPACESHIP_PROMPT_SUFFIXES_SHOW=true         # Show suffixes before prompt sections or not
# SPACESHIP_PROMPT_DEFAULT_PREFIX=via         # Default prefix for prompt sections❯
SPACESHIP_PROMPT_DEFAULT_SUFFIX=' '         # Default suffix for prompt section

# Char
SPACESHIP_CHAR_PREFIX=' '                               # Prefix before prompt character
SPACESHIP_CHAR_SUFFIX=' '                               # Suffix after prompt character
SPACESHIP_CHAR_SYMBOL='❯'                               # Prompt character to be shown before any command
SPACESHIP_CHAR_SYMBOL_ROOT=$SPACESHIP_CHAR_SYMBOL       # Prompt character to be shown before any command for the root user
SPACESHIP_CHAR_SYMBOL_SECONDARY=$SPACESHIP_CHAR_SYMBOL  # Secondary prompt character to be shown for incomplete commands
SPACESHIP_CHAR_COLOR_SUCCESS='green'                    # Color of prompt character if last command completes successfully
SPACESHIP_CHAR_COLOR_FAILURE='red'                      # Color of prompt character if last command returns non-zero exit-code
SPACESHIP_CHAR_COLOR_SECONDARY='yellow'                 # Color of secondary prompt character

# Time
SPACESHIP_TIME_SHOW=true                                  # Show time (set to true for enabling)
SPACESHIP_TIME_PREFIX='at '                               # Prefix before time section
SPACESHIP_TIME_SUFFIX=$SPACESHIP_PROMPT_DEFAULT_SUFFIX    # Suffix after time section
SPACESHIP_TIME_COLOR='yellow'                             # Color of time section
SPACESHIP_TIME_FORMAT=false                               # Custom date formatting ZSH date formats
SPACESHIP_TIME_12HR=false                                 # Format time using 12-hour clock (am/pm)

# User
SPACESHIP_USER_SHOW=true                                  # Show user section (true, false, always or needed)
SPACESHIP_USER_PREFIX='with '                             # Prefix before user section
SPACESHIP_USER_SUFFIX=$SPACESHIP_PROMPT_DEFAULT_SUFFIX    # Suffix after user section
SPACESHIP_USER_COLOR='yellow'                             # Color of user section
SPACESHIP_USER_COLOR_ROOT='red'                           # Color of user section when it's root

# Host
SPACESHIP_HOST_SHOW=true                                  # Show host section (true, false or always)
SPACESHIP_HOST_SHOW_FULL=false                            # Show full hostname section (true, false)
SPACESHIP_HOST_PREFIX='at '                               # Prefix before the connected SSH machine name
SPACESHIP_HOST_SUFFIX=$SPACESHIP_PROMPT_DEFAULT_SUFFIX    # Suffix after the connected SSH machine name
SPACESHIP_HOST_COLOR='blue'                               # Color of host section
SPACESHIP_HOST_COLOR_SSH='green'                          # Color of host in SSH connection

# Dir
SPACESHIP_DIR_SHOW=true                                    # Show directory section
SPACESHIP_DIR_PREFIX=''                                    # Prefix before current directory
SPACESHIP_DIR_SUFFIX=$SPACESHIP_PROMPT_DEFAULT_SUFFIX      # Suffix after current directory
SPACESHIP_DIR_TRUNC=3                                      # Number of folders of cwd to show in prompt, 0 to show all
SPACESHIP_DIR_TRUNC_PREFIX=''                              # Prefix before cwd when it's truncated. For example …/ or .../, empty to disable
SPACESHIP_DIR_TRUNC_REPO=true                              # While in git repo, show only root directory and folders inside it
SPACESHIP_DIR_COLOR='cyan'                                 # Color of directory section
SPACESHIP_DIR_LOCK_SYMBOL=''                              # The symbol displayed if directory is write-protected (requires powerline patched font)
SPACESHIP_DIR_LOCK_COLOR='red'                             # Color for the lock symbol

# GIT
SPACESHIP_GIT_SHOW=true                                  # Show Git section
SPACESHIP_GIT_PREFIX='on '                               # Prefix before Git section
SPACESHIP_GIT_SUFFIX=$SPACESHIP_PROMPT_DEFAULT_SUFFIX    # Suffix after Git section
SPACESHIP_GIT_SYMBOL=''                                 # Character to be shown before Git section (requires powerline patched font)

# GIT Branch
SPACESHIP_GIT_BRANCH_SHOW=true                        # Show Git branch subsection
SPACESHIP_GIT_BRANCH_PREFIX=$SPACESHIP_GIT_SYMBOL     # Prefix before Git branch subsection
SPACESHIP_GIT_BRANCH_SUFFIX=' '                        # Suffix after Git branch subsection
SPACESHIP_GIT_BRANCH_COLOR='magenta'                  # Color of Git branch subsection

# GIT Status
SPACESHIP_GIT_STATUS_SHOW=true        # Show Git status subsection
SPACESHIP_GIT_STATUS_PREFIX=' ['      # Prefix before Git status subsection
SPACESHIP_GIT_STATUS_SUFFIX=']'      # Suffix after Git status subsection
SPACESHIP_GIT_STATUS_COLOR='red'      # Color of Git status subsection
SPACESHIP_GIT_STATUS_UNTRACKED='?'    # Indicator for untracked changes
SPACESHIP_GIT_STATUS_ADDED='+'        # Indicator for added changes
SPACESHIP_GIT_STATUS_MODIFIED='!'     # Indicator for unstaged files
SPACESHIP_GIT_STATUS_RENAMED='»'      # Indicator for renamed files
SPACESHIP_GIT_STATUS_DELETED='✘'      # Indicator for deleted files
SPACESHIP_GIT_STATUS_STASHED='$'      # Indicator for stashed changes
SPACESHIP_GIT_STATUS_UNMERGED='='     # Indicator for unmerged changes
SPACESHIP_GIT_STATUS_AHEAD='⇡'        # Indicator for unpushed changes (ahead of remote branch)
SPACESHIP_GIT_STATUS_BEHIND='⇣'       # Indicator for unpulled changes (behind of remote branch)
SPACESHIP_GIT_STATUS_DIVERGED='⇕'     # Indicator for diverged changes (diverged with remote branch)

# Battery
SPACESHIP_BATTERY_SHOW=always                                    # Show battery section or not (true, false, always or charged)
SPACESHIP_BATTERY_PREFIX=''                                      # Prefix before battery section
SPACESHIP_BATTERY_SUFFIX=$SPACESHIP_PROMPT_DEFAULT_SUFFIX        # Suffix after battery section
SPACESHIP_BATTERY_SYMBOL_CHARGING='⇡'                            # Character to be shown if battery is charging
SPACESHIP_BATTERY_SYMBOL_DISCHARGING='⇣'                         # Character to be shown if battery is discharging
SPACESHIP_BATTERY_SYMBOL_FULL='•'                                # Character to be shown if battery is full
SPACESHIP_BATTERY_THRESHOLD=10                                   # Battery level below which battery section will be shown

# Jobs
SPACESHIP_JOBS_SHOW=true              # Show background jobs indicator
SPACESHIP_JOBS_PREFIX=' '             # Prefix before the jobs indicator
SPACESHIP_JOBS_SUFFIX=' '             # Suffix after the jobs indicator
SPACESHIP_JOBS_SYMBOL='✦'             # Character to be shown when jobs are hiding
SPACESHIP_JOBS_COLOR='blue'           # Color of background jobs section
SPACESHIP_JOBS_AMOUNT_PREFIX=''       # Prefix before the number of jobs (between jobs indicator and jobs amount)
SPACESHIP_JOBS_AMOUNT_SUFFIX=' '      # Suffix after the number of jobs
SPACESHIP_JOBS_AMOUNT_THRESHOLD=1     # Number of jobs after which job count will be shown

# Exit Code
SPACESHIP_EXIT_CODE_SHOW=true          # Show exit code of last command
SPACESHIP_EXIT_CODE_PREFIX=' '          # Prefix before exit code section
SPACESHIP_EXIT_CODE_SUFFIX=' '          # Suffix after exit code section
SPACESHIP_EXIT_CODE_SYMBOL='✘'          # Character to be shown before exit code
SPACESHIP_EXIT_CODE_COLOR='red'         # Color of exit code section

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git node bundler thefuck nvm osx rake ruby yarn)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Fonts
# https://github.com/powerline/fonts

# Homebrewed plugins
eval $(thefuck --alias)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
