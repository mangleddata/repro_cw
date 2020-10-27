MODELFILE=model.yaml
MODELNAME=train_model
TRAIN=train.csv
VALID=valid.csv
TEST=test.csv
PREDICTOR=MULTITASK

# Preprocessing doesn't allow same file to be reused. Tensors can change
SKIP_SAVE_INTERMEDIATE=-sspi
MODEL_RESULTS_NAME=experiment_${MODELNAME}
STALL_CHECK_SHUTDOWN_TIME_SECONDS=300

horovodrun -np 1 --stall-check-shutdown-time-seconds ${STALL_CHECK_SHUTDOWN_TIME_SECONDS} ludwig train --training_set ${TRAIN}  --validation_set ${VALID} --random_seed 42 -cf ${MODELFILE}  -uh --model_name ${MODELNAME}  ${SKIP_SAVE_INTERMEDIATE} 
