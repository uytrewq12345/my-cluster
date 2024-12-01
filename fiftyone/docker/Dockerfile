FROM voxel51/fiftyone:v1.0.2

RUN fiftyone plugins download https://github.com/voxel51/fiftyone-plugins --plugin-names @voxel51/annotation
RUN fiftyone plugins download https://github.com/voxel51/fiftyone-plugins --plugin-names @voxel51/brain

RUN pip install umap-learn torch torchvision numpy==2.0
