gitsw() {
	if [ "$1" = "main" ] || [ "$1" = "master" ]
	then
		git switch "$1"
		git pull
	elif [ "$1" = "-c" ]
	then
		git switch "$1" nogarremi/"$2"
	elif [ "$1" = "" ]
	then
		git switch main
		git pull
	else
		git switch "$1"
	fi
}

gitsend() {
	git add .
	if [ "$1" = "-f" ]
	then
		git commit --allow-empty-message --squash=$(git rev-parse --short HEAD) -m ""
		git -c sequence.editor=: rebase -i --autosquash HEAD~2 <<EOF
:wq
EOF
		git push -f origin $(git branch --show-current)
	else
		git commit -m "$1"
		git push origin $(git branch --show-current)
	fi
}

GPG_TTY=$(tty)
export GPG_TTY
