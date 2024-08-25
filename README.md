This is work in progress - my goal was to make a new project & manually add the Godot-vision support to it. It is based on this starter repo: [Godot Vision Starter](https://github.com/kevinw/GodotVisionExample).

More info on Godot Vision here [godot.vision](https://godot.vision).  AFAIK, Godot for visionOS works only with Godot version 4.2.


Initially, the app display a volume with 2 buttons - the joystick icon button opens a window using a Godot view.

Note: there is an issue with the Godot window volume; you need to resize it to get the Godot to render properly. 

## Configuration

The following flags needs to be specified in the build setting:

User script sandboxing: No

C++ and Objective-C Interoperability: C++/Objective-C (raw value objcxx)

## Custom build phase

```
#
# Sign dynamically loaded Godot gdextension .frameworks
#
for i in $(seq 0 $(expr $SCRIPT_INPUT_FILE_COUNT - 1)); do
    inputFileVar="SCRIPT_INPUT_FILE_${i}"
    inputFile="${!inputFileVar}"
    codesign --verbose --force --sign "${EXPANDED_CODE_SIGN_IDENTITY_NAME}" "$inputFile"
done

```

With the input file arguments:

```
${CODESIGNING_FOLDER_PATH}/Godot_Project/addons/godot-jolt/visionos/godot-jolt_visionos.framework
${CODESIGNING_FOLDER_PATH}/Godot_Project/addons/godot-jolt/visionos/godot-jolt_visionos_simulator.framework
```

