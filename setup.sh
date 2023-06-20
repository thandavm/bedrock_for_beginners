#!/bin/bash

# constants
BEDROCK_SDK_S3_PATH=s3://amazon-bedrock-limited-preview-documents/Documentation/SDK/bedrock-python-sdk.zip
BEDROCK_CONDA_ENV=bedrock_py39
BEDROCK_DIR=/home/ec2-user/SageMaker/bedrock
BEDROCK_SAMPLE_NOTEBOOKS=(hello_bedrock.ipynb hello_bedrock_w_langchain.ipynb hello_bedrock_w_rest_api.ipynb)
PY_VER=3.9

# create conda env
conda remove -n $BEDROCK_CONDA_ENV --all -y
conda create --name $BEDROCK_CONDA_ENV -y python=$PY_VER ipykernel
source activate $BEDROCK_CONDA_ENV

# create bedrock dir
rm -rf $BEDROCK_DIR
mkdir -p $BEDROCK_DIR

# download and install sdk
aws s3 cp $BEDROCK_SDK_S3_PATH $BEDROCK_DIR
sdk_file_name=`basename $BEDROCK_SDK_S3_PATH`
unzip $BEDROCK_DIR/$sdk_file_name -d $BEDROCK_DIR

# all set to pip install the bedrock packages, these are awscli, boto3 and botocore
pip install $BEDROCK_DIR/*.whl
pip install langchain==0.0.187

# now copy the sample notebook to bedrock dir
curr_dir=`dirname $0`
for nb in "${BEDROCK_SAMPLE_NOTEBOOKS[@]}"
do
   nb_fpath=$curr_dir/$nb
   cp $nb_fpath $BEDROCK_DIR
done

# monkeypath bedrock.py in LangChain
cp $curr_dir/bedrock.py ~/anaconda3/envs/$BEDROCK_CONDA_ENV/lib/python$PY_VER/site-packages/langchain/llms/bedrock.py
cp $0 $BEDROCK_DIR
echo "all done"
