nested=$(ps | wc -l | awk '{print $1 - 7}')
echo "\n%F{magenta}nix-shell(%{${nested}%}) %n @ %~\n%(!.#.$) %f"
