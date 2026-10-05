## audio config procedure for pavilion

### 1. Install Required Utilities

```bash
sudo dnf install -y pulseaudio-utils alsa-utils

```

### 2. Enumerate Hardware Audio Devices

```bash
aplay -l

```

*(Locate the HDMI device index, e.g., `card 0, device 3` translates to `hw:0,3`)*

### 3. Force-Spawn and Bind the HDMI Sink

Bypass PipeWire's auto-profiling by injecting the ALSA sink directly via the PulseAudio compatibility layer.

```bash
pactl load-module module-alsa-sink device=hw:0,3 sink_name=hdmi_tv sink_properties=device.description="Samsung_TV_HDMI"
pactl set-default-sink hdmi_tv

```

### 4. Unmute the Bare-Metal Hardware Layer

Ensure the underlying digital ALSA channel was not muted by previous profile switches.

```bash
amixer -c 0 set 'IEC958' unmute

```

### 5. Flush Application Audio Cache

Force all client applications to drop dead audio handles and latch onto the new global default sink.

```bash
killall brave

#Extra's for volume control
wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%

#PulseAudio Fallback
#Bash
pactl set-sink-volume @DEFAULT_SINK@ 100%

#ALSA Hardware Fallback
#Bash
amixer sset Master 100%


```
