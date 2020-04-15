#!/usr/bin/env sh

# Configuration
KEYBOARD="planck/rev6"
KEYMAP="biosan"
KEYBOARD_SHORT="planck"

# Keymap folder path
KEYMAP_FOLDER="/qmk_firmware/keyboards/${KEYBOARD}/keymaps/${KEYMAP}/"
# Command to execute inside the container
COMMAND="qmk compile --keyboard ${KEYBOARD} --keymap ${KEYMAP} && cp *.bin /binary"

# BUILD IT!
# (and copy binary firmware into current folder)
docker run --rm \
    -v $(pwd)/keymap:${KEYMAP_FOLDER} \
    -v $(pwd)/binary:/binary \
    qmkfm/qmk_firmware \
    /bin/sh -c "${COMMAND}"

