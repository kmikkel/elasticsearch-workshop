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

index: pyclean
	$(DOCKER_RUN) python manage.py index_data

clean: pyclean
	$(DOCKER_RUN_API_ONLY) rm $(BUILD_DIR)/*
	$(DOCKER_RUN_API_ONLY) rm $(REPORTS_DIR)/*

# Docker Compose aliases

run: pyclean
	$(DOCKER_COMPOSE) up

start: pyclean
	$(DOCKER_COMPOSE) up -d

stop:
	$(DOCKER_COMPOSE) stop

rm: stop
	$(DOCKER_COMPOSE) rm -f

ps:
	$(DOCKER_COMPOSE) ps

logs:
	$(DOCKER_COMPOSE) logs

# Workshop

tests: pyclean
	$(DOCKER_RUN_TESTS) behave -v --format=json.pretty --color --junit --outfile=build/behave-results.json