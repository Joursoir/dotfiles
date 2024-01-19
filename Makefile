MOVE = mv -i
COPY = cp -i

.PHONY: nop bash grub i3 polybar fonts

nop:
	@echo "Please, look over Makefile before executing any targets."
	@echo "They can overwrite your script. Be careful!"

bash:
	$(MOVE) ~/.bashrc ~/.bashrc-old
	$(COPY) .bashrc ~
	$(MOVE) ~/.bash_profile ~/.bash_profile-old
	$(COPY) .bash_profile ~
	$(MOVE) ~/.bash_prompt ~/.bash_prompt-old
	$(COPY) .bash_prompt ~
	$(MOVE) ~/.aliases ~/.aliases-old
	$(COPY) .aliases ~

grub:
	$(MOVE) /etc/default/grub /etc/default/grub-old
	$(COPY) grub/default/grub /etc/default/grub

i3:
	$(MOVE) ~/.config/i3/config ~/.config/i3/config-old
	$(COPY) dotconfig/i3/config ~/.config/i3/config

polybar:
	$(MOVE) ~/.config/polybar/* ~/.config/polybar-old/.
	$(COPY) -r dotconfig/polybar ~/.config/.

fonts:
	$(COPY) -r fonts ~/.local/share