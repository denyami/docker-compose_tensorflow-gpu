install:
	docker exec nvidia-container bash -c "cd app && pipenv install"
test-tensorflow-gpu:
	docker exec nvidia-container bash -c "cd app && pipenv run python src/check_tensorflow.py"
