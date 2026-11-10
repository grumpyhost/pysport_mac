# Intel macOS preview

This recipe builds the x86_64 SportOrg desktop bundle with Python 3.12. On an
Intel Mac, install the Xcode command-line tools and run these commands from the
root of the source tree.

```sh
python3.12 -m venv .venv
.venv/bin/python -m pip install -r packaging/macos/requirements-build.txt
SPORTORG_PYTHON=.venv/bin/python packaging/macos/build.sh
```

Open `dist/SportOrg.app` in Finder. PyInstaller applies an ad-hoc signature.
The app stores settings, operator resources, and logs in
`~/Library/Application Support/SportOrg`. Competition files can be saved to a
folder of your choice.

SPORTident uses the macOS serial backend. The SFR USB reader still uses the
Windows HID backend. SFRX file import and export are separate from USB readout.
