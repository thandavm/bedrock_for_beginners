# Quickstart for Amazon Bedrock

This readme file describes the steps to quickly get started with Bedrock in your AWS account. We start with a AWS CloudFormation template that creates a Amazon SageMaker Notebook and an AWS IAM Role for trying out the Bedrock SDK. The IAM role is created with the required Trust relationship and policies to access Bedrock and other services such as Amazon S3 and SageMaker. The Notebook uses this IAM role to access Bedrock.

This repository contains two notebooks:
- [`hello_bedrock.ipynb`](./hello_bedrock.ipynb) notebook that demonstrates the text generation use-case and the embeddings generation use-case with the Amazon Titan models.
- [`hello_bedrock_w_langchain.ipynb`](./hello_bedrock_w_langchain.ipynb) notebook as the name suggests uses the [LangChain](https://python.langchain.com/en/latest/index.html) package to interface with Bedrock for the text generation and embeddings use-case.

Here are the steps in detail:

1. Use the [`template.yml`](./template.yml) to create a CloudFormation stack.

1. Open the notebook in JupyterLab and upload the `bedrock_setup.zip` file to the Notebook.

1. Unzip the `bedrock_setup.zip` file using the following command.

    ```{.bash}
    unzip /home/ec2-user/SageMaker/bedrock_setup.zip
    ```

1. Run the `setup.sh` script. The setup script will install a new conda environment called `bedrock_py39`, create a new directory called `bedrock` and copy the sample notebooks in that directory, installs the Bedrock SDK and LangChain and finally patches the LangChain installation to support providing additional parameters to the Titan models (see `hello_bedrock_w_langchain.ipynb` notebook).

    ```{.bash}
    chmod +x  /home/ec2-user/SageMaker/bedrock_setup/setup.sh
    /home/ec2-user/SageMaker/bedrock_setup/setup.sh
    ```

1. Open the `/home/ec2-user/SageMaker/bedrock/hello_bedrock.ipynb` notebook and click on `Run All Cells`. This will illustrate the text generation and embeddings use-case using the Bedrock SDK.

1. Open the `/home/ec2-user/SageMaker/bedrock/hello_bedrock_w_langchain.ipynb` notebook and click on `Run All Cells`. This will illustrate the text generation and embeddings use-case using LangChain which uses the Bedrock SDK under the hood.

1. Open the `/home/ec2-user/SageMaker/bedrock/hello_bedrock_w_rest_api.ipynb` notebook and click on Run All Cells. This will illustrate the text generation and embeddings use-case using Bedrock REST API.

Congratulations! You now have a working Bedrock testbed.
