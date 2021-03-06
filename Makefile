
.PHONY: test
test: pep8
	DJANGO_SETTINGS_MODULE=tests.settings \
	django-admin.py test core articles boxes channels images sources sitemaps flatpages

.PHONY: travis
travis:
	pip install -r requirements.txt --use-mirrors
	export OPPS_TRAVIS=True
	python setup.py develop 

.PHONY: install
install:
	pip install -r requirements.txt --use-mirrors
	python setup.py develop 

.PHONY: pep8
pep8:
	@flake8 opps --ignore=F403 --exclude=migrations

.PHONY: sdist
sdist: test
	@python setup.py sdist upload

.PHONY: clean
clean:
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
