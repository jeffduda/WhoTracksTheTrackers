# WhoTracksTheTrackers
A survey of fiber tractography [1] software with practical examples. Here we will
attempt to identify a variety of open-source fiber tractography software tools
and provide examples of how to use these packages on a common dataset. When
possible, we attempt to provide a full chain of commands that takes the data
from nifti to connectivity matrix.

# The Trackers
Software to examine

- [ ] [Camino](http://camino.cs.ucl.ac.uk/)
  * commit: af55b0acd7895b7d1dafa040df60c494369b138a
- [ ] [FSL](https://fsl.fmrib.ox.ac.uk/fslcourse/lectures/practicals/fdt2/index.html)
  * version: 5.0.9-eddy-patch
- [ ] [MRtrix3](http://www.mrtrix.org/)
  * commit: c16a3d0e7593c702b12d050092e21b320d7d294e
- [ ] [dsistudio](http://dsi-studio.labsolver.org/)
  * commit: 49348753795f7e6c731f50c836e7a957861ab8b7
- [ ] [slicer](https://na-mic.org/w/images/3/3e/UKF-Tractography_TutorialContestWinter2016.pdf)
  * version: Slicer-4.5.0-1
- [ ] [Freesurfer](https://surfer.nmr.mgh.harvard.edu/fswiki/Tracula)
  * version: freesurfer-x86_64-unknown-linux-gnu-stable6-20170118
- [ ] [TractoR](http://www.tractor-mri.org.uk/)

# The Helpers
Others tools that we will use

- [dcm2niix](https://github.com/rordenlab/dcm2niix)
  * commit: 82b92102c77ce92cfbf3dc297d9201353ce80e66
- [ANTs](https://github.com/ANTsX/ANTs)
  * commit: c95e77abe72b0df5679e4728787b87489595517e
- [ANTsRCore](https://github.com/ANTsX/ANTsRCore)
  * commit: b8d5ae3a69135b1c02e26a67fb8718ef574e5ce5
- [ANTsR](https://github.com/ANTsX/ANTsR)
  * commit: 61b66e8a6475ed840f0c86ba1a8678944c16c1ac

# Trust The Process
We will attempt to use each package to accomplish the following general steps:

1. Preprocessing
  * Motion correction
  * Distortion correction
  * Tensor reconstruction
  * Scalar metric calculation (mean diffusion, fractional anisotropy, etc)
2. Whole brain tracking
  * Deterministic
  * Probabilistic
3. Connectivity analysis
  * Anatomical connectivity mapping
  * Region labeling
  * Streamline counting
  * Connection metrics (mean FA, etc)
  * Connection matrices


# References
[1] Basser, P. J., Pajevic, S., Pierpaoli, C., Duda, J., & Aldroubi, A. (2000). In vivo fiber tractography using DT‐MRI data. Magnetic resonance in medicine, 44(4), 625-632.
