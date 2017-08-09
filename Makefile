release: build push deploy_json_schemas sync_indices seed_decision_schemas deploy
build:
	scripts/docker/bin/build.sh ## TODO
deploy_json_schemas:
	scripts/update_s3_schema.sh
