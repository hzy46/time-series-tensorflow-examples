all: examples

venv: requirements.txt
	test -d venv || virtualenv -p python3 venv
	. venv/bin/activate && pip install -r requirements.txt

examples: venv
	./venv/bin/python ./test_input_csv.py
	./venv/bin/python ./test_input_array.py
	./venv/bin/python ./train_csv.py
	./venv/bin/python ./train_array.py
	./venv/bin/python ./train_lstm.py
	./venv/bin/python ./train_lstm_multivariate.py

clean:
	rm -rf venv *.jpg
