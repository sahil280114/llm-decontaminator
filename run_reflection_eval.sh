#!/bin/bash

# Set the OpenAI API key
export OPENAI_API_KEY=

echo "Running MMLU check"
python3 main.py --train_path reflection_v5_formatted.jsonl \
    --test_path mmlu_test.jsonl \
    --output_path ./results/reflection_v5_formatted_results_mmlu.jsonl \
    --data-type knowledge \
    --top_k 1

echo "-------------------"

echo "Running GPQA check"
python3 main.py --train_path reflection_v5_formatted.jsonl \
    --test_path gpqa_main_test.jsonl \
    --output_path ./results/reflection_v5_formatted_results_gpqa.jsonl \
    --data-type knowledge \
    --top_k 1

echo "-------------------"

echo "Running HumanEval check"
python3 main.py --train_path reflection_v5_formatted.jsonl \
    --test_path human_eval_test.jsonl \
    --output_path ./results/reflection_v5_formatted_results_humaneval.jsonl \
    --data-type code \
    --top_k 1

echo "-------------------"

echo "Running GSM8K check"
python3 main.py --train_path reflection_v5_formatted.jsonl \
    --test_path gsm8k.jsonl \
    --output_path ./results/reflection_v5_formatted_results_gsm8k.jsonl \
    --data-type math \
    --top_k 1

echo "-------------------"

echo "Running IFEval check"
python3 main.py --train_path reflection_v5_formatted.jsonl \
    --test_path ifeval.jsonl \
    --output_path ./results/reflection_v5_formatted_results_ifeval.jsonl \
    --data-type knowledge \
    --top_k 1

echo "-------------------"

echo "Running MATH check"
python3 main.py --train_path reflection_v5_formatted.jsonl \
    --test_path math.jsonl \
    --output_path ./results/reflection_v5_formatted_results_math.jsonl \
    --data-type math \
    --top_k 1

echo "-------------------"

echo "All tests completed"
