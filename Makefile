up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
remake:
	@make destroy
	@make init
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
restart:
	@make down
	@make up
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
	rm -rf ./mediawiki/skins/Timeless
	rm -rf ./mediawiki/skins/Tweeki
	rm -rf ./mediawiki/extensions/VisualEditor
	rm -rf ./mediawiki/extensions/Elastica
	rm -rf ./mediawiki/extensions/CirrusSearch

destroy-volumes:
	docker-compose down --volumes --remove-orphans
ps:
	docker-compose ps
logs:
	docker-compose logs
logs-watch:
	docker-compose logs --follow
init:
	cp .env.example .env
	docker-compose up -d --build
	git clone https://github.com/wikimedia/mediawiki-skins-Timeless.git ./mediawiki/skins/Timeless
	git clone https://github.com/thaider/Tweeki.git ./mediawiki/skins/Tweeki
	git clone https://github.com/wikimedia/mediawiki-extensions-VisualEditor.git ./mediawiki/extensions/VisualEditor
	git clone https://github.com/wikimedia/mediawiki-extensions-Elastica.git ./mediawiki/extensions/Elastica
	docker-compose exec mediawiki bash -c "cd ./extensions/Elastica && composer install"
	git clone https://github.com/wikimedia/mediawiki-extensions-CirrusSearch.git ./mediawiki/extensions/CirrusSearch
