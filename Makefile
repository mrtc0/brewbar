INTERVAL=24h

install:
	bash -c "ln -sv $$PWD/plugins/brewbar.sh `defaults read com.matryer.BitBar | plutil -convert json -o - - | jq -r '.pluginsDirectory'`/brewbar.${INTERVAL}.sh"
