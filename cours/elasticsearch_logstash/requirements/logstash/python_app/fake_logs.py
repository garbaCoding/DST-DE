import time
import random
from faker import Faker
import logging
import os

# Initialize Faker to generate fake data
fake = Faker()

# List of log levels
log_levels = ['INFO', 'WARNING', 'ERROR']

# Initialize the logger
log_dir = '../data/to_ingest'
file_path = f'{log_dir}/fake_logs.log'
logging.basicConfig(
    filename=file_path,
    filemode='a'
)
logger = logging.getLogger('fake_logs')
logger.setLevel(logging.INFO)

def get_log_message():
    timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
    log_level = random.choice(log_levels)
    log_message = fake.sentence(nb_words=6, variable_nb_words=True, ext_word_list=None)
    return f" [{timestamp}] {log_message}"

def write_fake_logs(output_file):
    while True:
        log_message = get_log_message()
        level = random.randint(1, 3)
        if level == 1:
            logger.info(log_message)
        elif level == 2:
            logger.warning(log_message)
        else:
            logger.error(log_message)
        time.sleep(0.5)


# Generate 10 fake log messages
if __name__ == '__main__':
    with open(file_path, 'w') as output_file:
        try:
            write_fake_logs(output_file)
        except KeyboardInterrupt as e:
            print("Program ended by CRTL+C")
        except Exception as e:
            print(e)
