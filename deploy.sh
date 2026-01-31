#!/bin/bash
# Скрипт для развертывания конфигов

echo "Deploying dotfiles..."

# Создаем backup текущих конфигов
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Функция для безопасного копирования
deploy_config() {
    local src="$1"
    local dst="$2"
    
    if [ -e "$dst" ]; then
        echo "Backing up $dst to $BACKUP_DIR"
        cp -r "$dst" "$BACKUP_DIR/"
    fi
    
    echo "Deploying $src to $dst"
    cp -r "$src" "$dst"
}

# Развертываем конфиги
deploy_config ".config/hypr" "$HOME/.config/"
deploy_config ".config/waybar" "$HOME/.config/"
deploy_config ".config/kitty" "$HOME/.config/"
deploy_config ".config/rofi" "$HOME/.config/"
deploy_config ".zshrc" "$HOME/"

echo "Deployment complete! Backup saved to $BACKUP_DIR"
