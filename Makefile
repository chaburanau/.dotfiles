PWD := $(PWD)
HOME := $(HOME)
CONFIG := $(HOME)/.config
OLD := $(HOME)/.oldfiles

NAME_ZSH_RC := ".zshrc"
NAME_GIT_CONFIG := ".gitconfig"
NAME_TMUX_CONFIG := ".tmux.conf"
NAME_NEOVIM_CONFIG := "nvim"
NAME_GHOSTTY_CONFIG := "config"

CONFIG_PATH_ZSH := $(HOME)/$(NAME_ZSH_RC)
CONFIG_PATH_GIT := $(HOME)/$(NAME_GIT_CONFIG)
CONFIG_PATH_TMUX := $(HOME)/$(NAME_TMUX_CONFIG)
CONFIG_PATH_NEOVIM := $(CONFIG)/$(NAME_NEOVIM_CONFIG)
CONFIG_PATH_GHOSTTY := $(CONFIG)/ghostty/$(NAME_GHOSTTY_CONFIG)

install:
	@ echo "-> Installing..."
	@ $(MAKE) install_zsh
	@ $(MAKE) install_git
	@ $(MAKE) install_tmux
	@ $(MAKE) install_neovim
	@ $(MAKE) install_ghostty
	@ echo "<- Installation has been successfully"

install_zsh:
	@ echo "  -> Installing zsh config..."
	@ $(MAKE) move_files MOVE_SRC=$(CONFIG_PATH_ZSH) MOVE_DST=$(OLD)/zsh/
	@ $(MAKE) link_files LINK_SRC=$(CONFIG_PATH_ZSH) LINK_DST=$(PWD)/zsh/$(NAME_ZSH_RC)
	@ echo "  <- zsh config has been installed successfully"

install_git:
	@ echo "  -> Installing git config..."
	@ $(MAKE) move_files MOVE_SRC=$(CONFIG_PATH_GIT) MOVE_DST=$(OLD)/git/
	@ $(MAKE) link_files LINK_SRC=$(CONFIG_PATH_GIT) LINK_DST=$(PWD)/git/$(NAME_GIT_CONFIG)
	@ echo "  <- git config has been installed successfully"

install_tmux:
	@ echo "  -> Installing tmux config..."
	@ $(MAKE) move_files MOVE_SRC=$(CONFIG_PATH_TMUX) MOVE_DST=$(OLD)/tmux/
	@ $(MAKE) link_files LINK_SRC=$(CONFIG_PATH_TMUX) LINK_DST=$(PWD)/tmux/$(NAME_TMUX_CONFIG)
	@ echo "  <- tmux config has been installed successfully"

install_neovim:
	@ echo "  -> Installing neovim config..."
	@ $(MAKE) move_files MOVE_SRC=$(CONFIG_PATH_NEOVIM) MOVE_DST=$(OLD)/nvim
	@ $(MAKE) link_files LINK_SRC=$(CONFIG_PATH_NEOVIM) LINK_DST=$(PWD)/nvim
	@ echo "  <- neovim config has been installed successfully"

install_ghostty:
	@ echo "  -> Installing ghostty config..."
	@ $(MAKE) move_files MOVE_SRC=$(CONFIG_PATH_GHOSTTY) MOVE_DST=$(OLD)/ghostty/
	@ $(MAKE) link_files LINK_SRC=$(CONFIG_PATH_GHOSTTY) LINK_DST=$(PWD)/ghostty/$(NAME_GHOSTTY_CONFIG)
	@ echo "  <- ghostty config has been installed successfully"

move_files:
	@ mkdir -p $(MOVE_DST)
	@ test -s $(MOVE_SRC) && test ! -L $(MOVE_SRC) && mv $(MOVE_SRC) $(MOVE_DST) || true
	@ rm -rf $(MOVE_SRC)

link_files:
	@ ln -s $(LINK_DST) $(LINK_SRC)

clean_backup:
	@ rm -rf $(OLD)

print:
	@ echo "Config"
	@ echo " pwd: $(PWD)"
	@ echo " home: $(HOME)"
	@ echo " config: $(CONFIG)"
	@ echo " zsh: $(CONFIG_PATH_ZSH)"
	@ echo " git: $(CONFIG_PATH_GIT)"
	@ echo " tmux: $(CONFIG_PATH_TMUX)"
	@ echo " neovim: $(CONFIG_PATH_NEOVIM)"
	@ echo " ghostty: $(CONFIG_PATH_GHOSTTY)"

