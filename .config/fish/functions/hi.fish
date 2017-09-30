function hi
  nvim -c PlugUpdate -c qa!
	fisher up
  brew update
  brew upgrade
  brew prune
  brew cleanup
	echo "You're all upgraded ✨"
end

