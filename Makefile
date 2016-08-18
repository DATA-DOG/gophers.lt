.PHONY: run deps hugo

run:
	hugo server --theme=hyde-x --buildDrafts --watch

deps:
	@$(call installed,curl)
	@$(call installed,tar)
	@$(call installed,hugo)
	@$(call theme,zyro/hyde-x,c3fa78c)

hugo:
	mkdir /tmp/hug
	curl -s -L https://github.com/spf13/hugo/releases/download/v0.16/hugo_0.16_linux-64bit.tgz | tar -C /tmp/hug -zx
	chmod +x /tmp/hug/hugo
	sudo mv /tmp/hug/hugo /usr/local/bin/hugo
	rm -rf /tmp/hug

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
