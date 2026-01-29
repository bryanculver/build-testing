# Nautobot PEP440 Docker Tag Test

Test harness for validating `docker/metadata-action` semver tagging behavior with Nautobot-style PEP440 pre-release versions.

## Purpose

Verify that Docker image tags are generated correctly for all combinations of:

- **Python versions**: 3.10, 3.11, 3.12, 3.13
- **Release types**: stable (`3.0.0`), RC (`3.0.0rc1`), beta (`3.0.0b1`), alpha (`3.0.0a1`)
- **Tag styles**: adorned (`3.0.0-py3.11`) vs unadorned (`3.0.0`)
- **Image variants**: prod (`ghcr.io/<repo>`) and dev (`ghcr.io/<repo>-dev`)

## Usage

1. Push this repo to GitHub
2. Create a GitHub release with a semver tag (e.g., `v3.0.0` or `v3.0.0rc1`)
3. Mark pre-release versions as "pre-release" in the GitHub release UI
4. Check the Actions tab and GHCR packages for the resulting tags

Both prod and dev images are built and pushed to GHCR with identical tag logic.

## Expected Tag Matrix

### Stable release (`v3.0.0`)

Each image (`<repo>` and `<repo>-dev`) gets:

| Tag | Python versions |
|-----|----------------|
| `3.0.0-py3.10` | 3.10 |
| `3.0.0-py3.11` | 3.11 |
| `3.0.0-py3.12` | 3.12 |
| `3.0.0-py3.13` | 3.13 |
| `3.0.0` | 3.13 only |
| `3.0-py3.10` | 3.10 |
| `3.0-py3.11` | 3.11 |
| `3.0-py3.12` | 3.12 |
| `3.0-py3.13` | 3.13 |
| `3.0` | 3.13 only |
| `latest-py3.10` | 3.10 |
| `latest-py3.11` | 3.11 |
| `latest-py3.12` | 3.12 |
| `latest-py3.13` | 3.13 |
| `latest` | 3.13 only |
| `stable-py3.10` | 3.10 |
| `stable-py3.11` | 3.11 |
| `stable-py3.12` | 3.12 |
| `stable-py3.13` | 3.13 |
| `stable` | 3.13 only |

### Pre-release (`v3.0.0rc1`)

| Tag | Python versions |
|-----|----------------|
| `3.0.0rc1-py3.10` | 3.10 |
| `3.0.0rc1-py3.11` | 3.11 |
| `3.0.0rc1-py3.12` | 3.12 |
| `3.0.0rc1-py3.13` | 3.13 |
| `3.0.0rc1` | 3.13 only |

No `major.minor`, `stable`, `latest`, or `latest-py*` tags for pre-releases.
