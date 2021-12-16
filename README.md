Device configuration for Sony Xperia XZ1 (poplar)
========================================================

Description
-----------

This repository is for NusantaraOS LTS a10 on Sony Xperia XZ1 (poplar).

How to build NusantaraOS
----------------------

* Make a workspace:

        mkdir -p ~/nusantaraos
        cd ~/nusantaraos

* Initialize the repo:

          repo init -u https://github.com/NusantaraProject-ROM/android_manifest -b 10

* Create a local manifest:

        vim .repo/local_manifests/local_nad.xml

        <?xml version="1.0" encoding="UTF-8"?>
        <manifest>
            <!-- SONY -->
            <project name="whatawurst/android_kernel_sony_msm8998" path="kernel/sony/msm8998" remote="github" revision="lineage-17.1" />
            <project name="fazrul1994/nusantara_device_sony_yoshino-common" path="device/sony/yoshino-common" remote="github" revision="ten" />
            <project name="fazrul1994/nusantara_device_sony_poplar" path="device/sony/poplar" remote="github" revision="ten" />

            <!-- Pinned blobs for poplar -->
            <project name="whatawurst/android_vendor_sony_poplar" path="vendor/sony/poplar" remote="github" revision="lineage-17.1" />
        </manifest>

* Sync the repo:

        repo sync -c --force-sync --no-tags --no-clone-bundle

* Extract vendor blobs

        cd device/sony/poplar
        ./extract-files.sh

* Setup the environment

        . build/envsetup.sh
        lunch nad_poplar-userdebug

* Build NusantaraOS

        make nad -j
