PROJECT_NAME = bigone
API_SERVICE = api
BUILD_DIR = build
REPORTS_DIR = reports
DOCKER_COMPOSE = docker-compose -p $(PROJECT_NAME)
DOCKER_RUN = $(DOCKER_COMPOSE) run --rm $(API_SERVICE)
DOCKER_RUN_API_ONLY = $(DOCKER_COMPOSE) run --rm --no-deps  -e ELASTICSEARCH_URL='' $(API_SERVICE)
DOCKER_RUN_TESTS = $(DOCKER_COMPOSE) run --rm -e ENVIRONMENT='testing' $(API_SERVICE)

# Build / clean

build: .
	$(DOCKER_COMPOSE) build

pyclean: build
	$(DOCKER_RUN_API_ONLY) find . -name "*.pyc" -delete

clean: pyclean
	$(DOCKER_RUN_API_ONLY) rm $(BUILD_DIR)/*
	$(DOCKER_RUN_API_ONLY) rm $(REPORTS_DIR)/*

# Docker Compose aliases

rm: stop
	$(DOCKER_COMPOSE) rm -f

ps:
	$(DOCKER_COMPOSE) ps

logs:
	$(DOCKER_COMPOSE) logs

# Test

nosetests: pyclean
	$(DOCKER_RUN_API_ONLY) nosetests \
        --where=tests_unit \
        --debug \
        --no-byte-compile \
        --with-xcoverage \
        --xcoverage-file=build/coverage.xml \
        --with-xunit \
        --xunit-file=build/nosetests.xml \
        --cover-erase \
        --cover-package=.

# Workshop

run-tasks: pyclean
	$(DOCKER_RUN_TESTS) behave -v --format=json.pretty --color --junit --outfile=build/behave-results.json
