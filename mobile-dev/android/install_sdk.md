To download the Android SDK and tools without using Android Studio, follow these steps. The process uses terminal commands to manage the installation and setup.

---

### 1. Download Command-Line Tools

1. **Visit the Official Site**: Go to the [Android Command-Line Tools download page](https://developer.android.com/studio#downloads).
2. **Find Command-Line Tools**: Under "Command-line tools only," choose the package for your operating system (Windows, macOS, or Linux).
3. **Download the File**: Use the terminal to download the file directly (e.g., using `wget` or `curl`).

   Example for Linux:

   ```bash
   wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdline-tools.zip
   ```

4. **Extract the Files**:
   ```bash
   unzip cmdline-tools.zip -d cmdline-tools
   ```

---

### 2. Set Up the SDK Directory

Create a directory to house the Android SDK:

```bash
mkdir -p ~/Android/Sdk/cmdline-tools
mv cmdline-tools ~/Android/Sdk/cmdline-tools/latest
```

---

### 3. Add SDK Tools to PATH

Update your shell configuration file (e.g., `.bashrc`, `.zshrc`) to include the SDK in your `PATH`:

```bash
echo 'export ANDROID_HOME=~/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH' >> ~/.bashrc
source ~/.bashrc
```

---

### 4. Install SDK Components

Use the `sdkmanager` tool to install necessary components. Run the following to ensure `sdkmanager` is available:

```bash
sdkmanager --list
```

To install essential components:

```bash
sdkmanager --install "platform-tools" "platforms;android-33" "build-tools;33.0.0" "system-images;android-33;google_apis;x86_64" --verbose
```

---

### 5. Verify Installation

To confirm that the tools are installed, check the versions of key tools:

```bash
adb --version
sdkmanager --version
```

---

### Summary of Key Commands

```bash
# Download and extract
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip -O cmdline-tools.zip
unzip cmdline-tools.zip -d ~/Android/Sdk/cmdline-tools/latest

# Set environment variables
echo 'export ANDROID_HOME=~/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH' >> ~/.bashrc
source ~/.bashrc

# Install components
sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.0"

# Verify
adb --version
sdkmanager --version
```

This method avoids installing Android Studio and provides all the tools needed for Android development from the command line.

To install and run an Android emulator for the specified SDK components (`platform-tools`, `platforms;android-33`, `build-tools;33.0.0`), follow these steps:

---

### 1. **Install Required Components**

You have already mentioned using `sdkmanager` to install the tools. To ensure you have everything needed, run:

```bash
sdkmanager --install "platform-tools" "platforms;android-33" "build-tools;33.0.0" "system-images;android-33;google_apis;x86_64" --verbose
```

---

### 2. **Create an AVD (Android Virtual Device)**

After installing the SDK tools and system image, create an emulator using the `avdmanager` command:

```bash
avdmanager create avd -n pixel_5 -k "system-images;android-33;google_apis;x86_64" --device "pixel_5"
avdmanager create avd -n pixel_7_pro -k "system-images;android-33;google_apis;x86_64" --device "pixel_7_pro"

```

- Replace `android33_emulator` with your preferred name for the emulator.
- The `--device` parameter specifies the hardware profile; here, `pixel_5` is used.

---

### 3. **Start the Emulator**

Use the `emulator` command to start the newly created AVD:

```bash
emulator -avd android33_emulator
```

---

### 4. **Verify Installation**

To confirm everything is installed correctly:

- Check the list of available AVDs:
  ```bash
  emulator -list-avds
  ```
- Launch the AVD if listed:
  ```bash
  emulator -avd <avd_name>
  ```

---

### Notes

- **Dependencies**: Ensure you have installed Java (preferably OpenJDK) and added the Android SDK tools to your `PATH`.
- **Starting the Emulator**: If the emulator fails to start, check if your CPU supports virtualization and that it's enabled in your BIOS.

Would you like help with a specific step or debugging emulator issues?
