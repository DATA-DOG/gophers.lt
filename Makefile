.PHONY: run release deps

run:
	hugo server --theme=hyde-x --buildDrafts --watch

release:
	tar --exclude-from=.tarignore --exclude-vcs -czf ansible/app.tar.gz .

deps:
	@$(call installed,curl)
	@$(call installed,tar)
	@$(call installed,hugo)
	@$(call theme,zyro/hyde-x,c3fa78c)

# download theme at specific commit from github
define theme =
$(eval _LOCATION := themes/$(shell cut -d '/' -f 2- <<< $(1)))
mkdir -p $(_LOCATION)
curl -L https://github.com/$(1)/tarball/$(2) | tar -C $(_LOCATION) -zx --strip-components 1
endef

# checks whether a command is installed
define installed =
command -v $(1) >/dev/null 2>&1 || (echo "$(1) needs to be installed and available in your PATH"; exit 1)
endef
