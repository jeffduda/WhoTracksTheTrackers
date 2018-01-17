# WhoTracksTheTrackers
A survey of fiber tractography [1] software with practical examples. Here we will
attempt to identify a variety of open-source fiber tractography software tools
and provide examples of how to use these packages on a common dataset. When
possible, we attempt to provide a full chain of commands that takes the data
from dicom to connectivity matrix.

# The Trackers
Software to examine

- [ ] [Camino](http://camino.cs.ucl.ac.uk/)
  * commit: af55b0acd7895b7d1dafa040df60c494369b138a
- [ ] [FSL](https://fsl.fmrib.ox.ac.uk/fslcourse/lectures/practicals/fdt2/index.html)
- [ ] [MRtrix3](http://www.mrtrix.org/)
- [ ] [dtistudio](http://dsi-studio.labsolver.org/)
- [ ] [slicer](https://na-mic.org/w/images/3/3e/UKF-Tractography_TutorialContestWinter2016.pdf)
- [ ] [Freesurfer](https://surfer.nmr.mgh.harvard.edu/fswiki/Tracula) - TRACULA
- [ ] [TractoR](http://www.tractor-mri.org.uk/)

# The Helpers
Others tools that we will use

- dcm2niix
  * commit: 82b92102c77ce92cfbf3dc297d9201353ce80e66
- ANTs
  * commit:
- ANTsRCore
  * commit:
- ANTsR
  * commit:
- Labels


# The Process
We will attempt to use each package to accomplish the following general steps:

1. Preprocessing
  * Motion correction
  * Distortion correction
  * Tensor reconstruction
  * Scalar metric calculation (mean diffusion, fractional anisotropy, etc)
2. Whole brain tracking
  * Deterministic
  * Probabilistic
3. Connectivity matrix calculation
  * Region labeling
  * Connection counting
  * Connection metrics (mean FA, etc)


# References
[1] Basser, P. J., Pajevic, S., Pierpaoli, C., Duda, J., & Aldroubi, A. (2000). In vivo fiber tractography using DT‐MRI data. Magnetic resonance in medicine, 44(4), 625-632.
