# NPM Registry
[ -f $HOME/.npmrc ] &&
	export NPM_TOKEN=$(cat $HOME/.npmrc|grep npm.famoco.com/repository/npm-all|egrep -o "authToken=(.+)" | cut -d= -f2)

# Rust
[ -d "$HOME/.cargo/bin:$PATH" ] && export PATH="$HOME/.cargo/bin:$PATH"
type rustc &> /dev/null && [ -d "$(rustc --print sysroot)/lib/rustlib/src/rust/src" ] && export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# GPG
GPG_TTY=$(tty)
export GPG_TTY
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent updatestartuptty /bye > /dev/null