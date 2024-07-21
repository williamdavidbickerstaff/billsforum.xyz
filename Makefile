markdowns=$(shell find src/posts/*.md)
htmls := $(patsubst src/posts/%.md, posts/%.html, $(markdowns))

all: clean index posts

index: index.html
index.html: src/index.md
	pandoc -s -c styles/style.css -o $@ $<	

posts: $(htmls)
posts/%.html: src/posts/%.md
	pandoc -s -c ../styles/style.css -o $@ $<

clean: ; rm posts/*.html index.html

serve: all
	python -m http.server
