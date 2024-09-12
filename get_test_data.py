import json
from datasets import load_dataset
import pandas as pd

mmlu = load_dataset("cais/mmlu","all",split="test")

# Write to file
with open("mmlu_test.jsonl", "w") as fout:
    for row in mmlu:
        fout.write(json.dumps({"text": row["question"]}) + "\n") #Only need to check questions because answers are just A,B,C or D

gpqa_main = load_dataset("Idavidrein/gpqa","gpqa_main",split="train")

# Write to file
with open("gpqa_main_test.jsonl", "w") as fout:
    for row in gpqa_main:
        fout.write(json.dumps({"text": row["Question"]}) + "\n") #Only need to check questions because answers are just A,B,C or D

human_eval = load_dataset("openai/openai_humaneval",split="test")

# Write to file
with open("human_eval_test.jsonl", "w") as fout:
    for row in human_eval:
        fout.write(json.dumps({"text": row["prompt"]}) + "\n")

gsm = load_dataset("openai/gsm8k","main",split="test")

# Write to file
with open("gsm8k.jsonl", "w") as fout:
    for row in gsm:
        fout.write(json.dumps({"text": row["question"]+"\n"+row["answer"]}) + "\n")


ifeval = load_dataset("google/IFEval",split="train")

# Write to file
with open("ifeval.jsonl", "w") as fout:
    for row in ifeval:
        fout.write(json.dumps({"text": row["prompt"]}) + "\n")

df = pd.read_csv(
            "https://openaipublic.blob.core.windows.net/simple-evals/math_test.csv"
        )
math = [row.to_dict() for _, row in df.iterrows()]


# Write to file
with open("math.jsonl", "w") as fout:
    for row in math:
        fout.write(json.dumps({"text": row["Question"]+"\n"+row["Answer"]}) + "\n")
