FROM ghcr.io/shoppal-ai/llm-base:latest

LABEL maintainer="Guangbin Zhu <zhuguangbin@shoppal.ai>"

COPY src/ /workspace/src/
COPY utils/ /workspace/utils/
COPY tests/ /workspace/tests/
COPY scripts/ /workspace/scripts/
COPY examples/ /workspace/examples/
COPY benchmarks/ /workspace/benchmarks/
COPY demo_apps/ /workspace/demo_apps/
COPY docs/ /workspace/docs/

COPY pyproject.toml /workspace/pyproject.toml
COPY requirements.txt /workspace/requirements.txt
COPY dev_requirements.txt /workspace/dev_requirements.txt

WORKDIR /workspace
RUN pip install -U pip setuptools
RUN pip install --no-cache torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
RUN pip install --no-cache --extra-index-url https://download.pytorch.org/whl/test/cu118 -e .