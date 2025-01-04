from Helper.VannaObject import MyVanna
import os

os.environ["TOKENIZERS_PARALLELISM"] = "false"

vn = MyVanna(config={'api_key': 'sk-proj-dCuD8lty0RfhpudPewkIT3BlbkFJc5TxBDMPyApHTzkCPdyv', 'model': 'gpt-3.5-turbo-16k'})

# print(vn.get_training_data())

print(vn.generate_sql("Tell me the top client with highest portfolio."))

