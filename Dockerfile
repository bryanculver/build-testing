ARG PYTHON_VER=3.11

FROM python:${PYTHON_VER}-slim AS build

ARG NAUTOBOT_VERSION=3.0.0

# Install nautobot at the specified version
RUN echo "nautobot==${NAUTOBOT_VERSION}" >> version.txt

CMD ["echo", "Nautobot version: $(cat version.txt)"]

FROM build AS final
CMD ["echo", "Final Nautobot version: $(cat version.txt)"]

FROM build AS final-dev
CMD ["echo", "Final Dev Nautobot version: $(cat version.txt)"]
