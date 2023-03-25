export MODEL_NAME="CompVis/stable-diffusion-v1-4"
export INSTANCE_DIR="path-to-instance-images"
export OUTPUT_DIR="path-to-save-model"

accelerate launch train_dreambooth.py \
  --pretrained_model_name_or_path=$MODEL_NAME  \
  --instance_data_dir=$INSTANCE_DIR \
  --output_dir=$OUTPUT_DIR \
  --instance_prompt="a photo of [V]" \
  --resolution=256 \
  --train_batch_size=1 \ #if you have A100 can use 2
  --gradient_accumulation_steps=1 \
  --learning_rate=1e-6 \
  --lr_scheduler="linear" \
  --lr_warmup_steps=500 \
  --max_train_steps=2000 # first 2000 and adding to 5000