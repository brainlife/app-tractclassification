<h1 align="center">AFQ Tract Classification</h1>

<p align="center">
  A white matter classification of the 20 AFQ major tracts from a tractogram (or a LiFE-evaluated connectome) and dtiInit output.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.207"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.207-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

> 📍 **This branch, `1.4`, runs 2 brainlife.io Apps** that share the same code:
>
> - AFQ Tract Classification ([doi:10.25663/brainlife.app.207](https://doi.org/10.25663/brainlife.app.207))
> - AFQ Tract Classification with LiFE ([doi:10.25663/brainlife.app.206](https://doi.org/10.25663/brainlife.app.206))
>
> The other Apps in this repository are listed under **Versions on brainlife.io** below.

## 🧠 At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

### 🧩 AFQ Tract Classification

> **Classifies major white matter tracts with AFQ (AFQ_SegmentFiberGroups) from a .tck tractogram and dtiInit output and outputs a white matter classification.**

Imports the tractogram, runs AFQ_SegmentFiberGroups with the dtiInit dt6.mat to label the 20 AFQ major tracts, and writes a classification structure (tract names and per-streamline index) with tract JSON files. useinterhemisphericsplit cuts fibers crossing the midsagittal plane below z=-10 to remove CST fibers crossing at the brainstem. Tractogram and dtiInit must be from the same subject and space. For more information about AFQ see https://github.com/yeatmanlab/AFQ/wiki

| | |
|---|---|
| 📥 **Inputs** | `neuro/track/tck` · `neuro/dtiinit` |
| 📤 **Outputs** | `neuro/wmc` |
| 🐳 **Container** | `brainlife/mcr:r2019a` |
| ⚙️ **Resources** | 8 CPUs · 58 GB memory · 5 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.207](https://doi.org/10.25663/brainlife.app.207) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `track` | `neuro/track/tck` | yes | Whole-brain tractogram (.tck). |
| `dtiinit` | `neuro/dtiinit` | yes | dtiInit output; its dt6.mat is used by AFQ to segment the fibers. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `wmc` | `neuro/wmc` | White matter classification (classification.mat with AFQ tract names and per-streamline index) and tract JSON files. |

<details>
<summary><b>⚙️ Parameters</b> (1)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `useinterhemisphericsplit` | boolean | `false` | If true, AFQ cuts fibers crossing between hemispheres with a midsagittal plane below z=-10, removing CST fibers that appear to cross at the brainstem. |

</details>

### 🧩 AFQ Tract Classification with LiFE

> **Classifies major white matter tracts with AFQ (AFQ_SegmentFiberGroups) from a LiFE-evaluated tractogram and dtiInit output, optionally removing zero-weight LiFE fascicles, and outputs a tract classification.**

This service uses Automated fiber quantification AFQ and fe structure output from LiFE to identify major tract segments and quantify tissue properties along their trajectories. You can choose to have the zero weighted fibers (as determined by LiFE) removed before or after AFQ is applied. useinterhemisphericsplit is a variable from AFQ, which if set to true will cut fibers crossing between hemispheres with a midsaggital plane below z=-10. This is to get rid of CST fibers that appear to cross at the level of the brainstem. For more information about AFQ see https://github.com/yeatmanlab/AFQ/wiki

| | |
|---|---|
| 📥 **Inputs** | `neuro/LiFE` · `neuro/dtiinit` |
| 📤 **Outputs** | `neuro/wmc` |
| 🐳 **Container** | `brainlife/mcr:r2019a` |
| ⚙️ **Resources** | 8 CPUs · 58 GB memory · 5 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.206](https://doi.org/10.25663/brainlife.app.206) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `fe` | `neuro/LiFE` | yes | LiFE fe structure (.mat) containing the tractogram and fascicle weights. |
| `dtiinit` | `neuro/dtiinit` | yes | dtiInit output; its dt6.mat is used by AFQ to segment the fibers. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `wmc` | `neuro/wmc` | White matter classification (classification.mat with AFQ tract names and per-streamline index) and tract JSON files. |

<details>
<summary><b>⚙️ Parameters</b> (2)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `useinterhemisphericsplit` | boolean | `false` | Cut fibers crossing between hemispheres with a midsaggital plane below z=-10. This is to get rid of CST (corticospinal tract) fibers that appear to cross at the level of the brainstem |
| `remove_zero_weighted_fibers` | enum | `before` | Select when you would like the zero weighted fibers removed Options: `before`, `after`. |

</details>

<!-- brainlife-app:end -->

## 🏷️ Versions on brainlife.io

Each version is a separate App on brainlife.io, built from its own branch of this repository. The "with LiFE" Apps take a LiFE `fe` structure instead of a `.tck` tractogram and can drop the streamlines that LiFE gave zero weight.

| App | Input | Branch | Run it | Status |
|---|---|---|---|---|
| **AFQ Tract Classification** (this branch) | `.tck` tractogram | [`1.4`](https://github.com/brainlife/app-tractclassification/tree/1.4) | [doi:10.25663/brainlife.app.207](https://doi.org/10.25663/brainlife.app.207) | current |
| **AFQ Tract Classification with LiFE** (this branch) | LiFE `fe` | [`1.4`](https://github.com/brainlife/app-tractclassification/tree/1.4) | [doi:10.25663/brainlife.app.206](https://doi.org/10.25663/brainlife.app.206) | current |
| AFQ Tract Classification | `.tck` tractogram | [`1.2`](https://github.com/brainlife/app-tractclassification/tree/1.2) | [doi:10.25663/bl.app.13](https://doi.org/10.25663/bl.app.13) | deprecated |
| AFQ Tract Classification with LiFE | LiFE `fe` | [`1.2`](https://github.com/brainlife/app-tractclassification/tree/1.2) | [doi:10.25663/bl.app.56](https://doi.org/10.25663/bl.app.56) | deprecated |

## 🚀 Running the App

### ☁️ On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.207](https://doi.org/10.25663/brainlife.app.207), choose a `neuro/track/tck` tractogram and the `neuro/dtiinit` output of the same subject (or, for the LiFE version, a `neuro/LiFE` dataset and its `neuro/dtiinit`), set the options and press **Execute**. The classification is archived to your project as a `neuro/wmc` dataset tagged `afq`.

Options:

- `useinterhemisphericsplit`: an AFQ option that, when true, cuts fibers crossing between hemispheres with a midsagittal plane below z=-10. This removes corticospinal tract fibers that appear to cross at the level of the brainstem.
- `remove_zero_weighted_fibers` (LiFE version only): remove the streamlines with zero LiFE weight `before` or `after` AFQ segmentation. Choosing `after` takes longer.

For more on AFQ see the [AFQ wiki](https://github.com/yeatmanlab/AFQ/wiki).

### 💻 Locally

You need [Singularity/Apptainer](https://apptainer.org/) and [`jq`](https://jqlang.github.io/jq/). `main` runs the compiled MATLAB code (`compiled/main`) in the `brainlife/mcr:r2019a` container, so no MATLAB licence is needed.

1. Clone this repository and check out the version you want (for example `git checkout 1.4`).
2. Create `config.json` with the paths to your inputs:

   ```json
   {
       "dtiinit": "testdata/dtiinit",
       "track": "testdata/track/track.tck",
       "useinterhemisphericsplit": false
   }
   ```

   For the LiFE version, replace `track` with `"fe": "path/to/output_fe.mat"` and add `"remove_zero_weighted_fibers": "before"` (or `"after"`).

3. Run the App:

   ```bash
   ./main
   ```

`main` copies the `dtiinit` directory into the working directory first, because AFQ writes into its input ([yeatmanlab/AFQ#35](https://github.com/yeatmanlab/AFQ/issues/35)). To recompile the MATLAB code, see `compile.sh` (MATLAB R2019a with AFQ, vistasoft, encode and jsonlab on the path).

## 📦 Outputs

```text
wmc/
├── classification.mat   tract names and a per-streamline tract index
└── tracts/              tracts.json and one JSON file per tract (up to 1000 streamlines each) for the viewer
```

The App also writes `output_fibercounts.txt` (streamline count per tract) and `product.json` (bar and box plots of the counts shown on brainlife.io).

## 🩺 Troubleshooting

- **`output missing`**: AFQ did not write `classification.mat`. Check the logs, and make sure the tractogram (or LiFE `fe`) and the dtiInit output come from the same subject and space.
- **`ERROR: Some tracts have less than 20 streamlines. Check quality of data!`**: reported on brainlife.io when any tract has fewer than 20 streamlines; check the tractography and alignment before using those tracts.

## 📚 Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- AFQ Tract Classification. brainlife.io App. [doi:10.25663/brainlife.app.207](https://doi.org/10.25663/brainlife.app.207)
- AFQ Tract Classification with LiFE. brainlife.io App. [doi:10.25663/brainlife.app.206](https://doi.org/10.25663/brainlife.app.206)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## 👥 Authors

- Franco Pestilli (project director)
- Lindsey Kitchell

**Contributors:** Soichi Hayashi

## 💰 Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## ⚖️ License

[MIT](LICENSE). AFQ and vistasoft are distributed under their own licences.
