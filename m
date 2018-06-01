From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 08/10] arm: add QEMU,
 Rcar3 and MPSoC configs
Date: Fri, 1 Jun 2018 13:51:53 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806010842320.23991@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1805311447570.23991@sstabellini-ThinkPad-X260>
 <1527803317-31750-8-git-send-email-sstabellini@kernel.org>
 <CAF3u54BTrLmE6BxvEKA2wdxHbDcHf+Y0DqNvP4xErGYns5x63A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1328426404-1527868405=:23991"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAF3u54BTrLmE6BxvEKA2wdxHbDcHf+Y0DqNvP4xErGYns5x63A@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1806010935180.23991@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, dfaggioli@suse.com, julien.grall@arm.com, xen-devel@lists.xen.org, volodymyr_babchuk@epam.com
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1328426404-1527868405=:23991
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1806010935181.23991@sstabellini-ThinkPad-X260>

On Fri, 1 Jun 2018, Julien Grall wrote:
> Hi Stefano,
> Sorry for formatting.
> 
> On Thu, 31 May 2018, 22:50 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       Add a "Platform Support" menu with three umbrella kconfig options: QEMU,
>       RCAR3 and MPSOC. They enable the required options for their hardware
>       platform.
> 
> 
> This patch is nothing close to what we discussed. As far as I can tell, the tiny.config will end up to select all the platforms
> with their driver. It will not be possible to deselect the driver selected for a platform afterwards.
> 
> I still think the best if providing a choice list where only one option can be selected. I would like to understand why you
> didn't go this path.

Yes, sorry, I didn't explain why I did this and what I told you on the
call was wrong, adding to the confusion.

First, it is true that `make olddefconfig' is run automatically on any
make target.

Except for `make menuconfig', that's special. If you copy a partial
config (like tiny.config) to .config, then execute `make menuconfig',
the menu gets automatically populated with the missing values using
defaults (as if olddefconfig was run), but it won't automatically save
them to file (fortunately!!).  That means that all the platform options
below (QEMU, RCAR3, MPSOC) will show as selected in the menu, but if the
user deselects two of them, for instance QEMU and RCAR3, the result is
that *only* MPSOC and related options will be written down to the
.config.

The kconfig infrastructure is not as bad as I initially thought :-)
In short, the following steps work:

- copy tiny.config to .config
- make menuconfig -> deselect QEMU and RCAR3, save .config
- as a results the final .config will have:

  CONFIG_MPSOC=y
  CONFIG_HAS_CADENCE_UART=y

but it won't have GICV3, any other platform options, or any other uart
drivers. Moreover, even NR_CPUS will be set correctly:
  
  CONFIG_NR_CPUS=4

I am attaching the .config for MPSOC produced using these steps as a
reference. More on the NR_CPUS topic in my next email reply.


>       In the case of the MPSOC that has a platform file under
>       arch/arm/platforms/, build the file if MPSOC.
> 
>       Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
>       CC: artem_mygaiev@epam.com
>       CC: volodymyr_babchuk@epam.com
> 
>       ---
>       Changes in v4:
>       - fix GICv3/GICV3
>       - default y to all options
>       - build xilinx-zynqmp if MPSOC
>       ---
>        xen/arch/arm/Kconfig            |  2 ++
>        xen/arch/arm/platforms/Kconfig  | 30 ++++++++++++++++++++++++++++++
>        xen/arch/arm/platforms/Makefile |  2 +-
>        3 files changed, 33 insertions(+), 1 deletion(-)
>        create mode 100644 xen/arch/arm/platforms/Kconfig
> 
>       diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>       index 2b87111..75cacfb 100644
>       --- a/xen/arch/arm/Kconfig
>       +++ b/xen/arch/arm/Kconfig
>       @@ -213,6 +213,8 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
>        config ARM32_HARDEN_BRANCH_PREDICTOR
>            def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
> 
>       +source "arch/arm/platforms/Kconfig"
>       +
>        source "common/Kconfig"
> 
>        source "drivers/Kconfig"
>       diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
>       new file mode 100644
>       index 0000000..fea8f9a
>       --- /dev/null
>       +++ b/xen/arch/arm/platforms/Kconfig
>       @@ -0,0 +1,30 @@
>       +menu "Platform Support"
>       +
>       +config QEMU
>       +       bool "QEMU aarch virt machine support"
>       +       default y
>       +       depends on ARM_64
>       +       select GICV3
>       +       select HAS_PL011
>       +       ---help---
>       +       Enable all the required drivers for QEMU aarch64 virt emulated
>       +       machine.
>       +
>       +config RCAR3
>       +       bool "Renesas RCar3 support"
>       +       default y
>       +       depends on ARM_64
>       +       select HAS_SCIF
>       +       ---help---
>       +       Enable all the required drivers for Renesas RCar3
>       +
>       +config MPSOC
>       +       bool "Xilinx Ultrascale+ MPSoC support"
>       +       default y
>       +       depends on ARM_64
>       +       select HAS_CADENCE_UART
>       +       select ARM_SMMU
>       +       ---help---
>       +       Enable all the required drivers for Xilinx Ultrascale+ MPSoC
>       +
>       +endmenu
>       diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
>       index 80e555c..f4ff411 100644
>       --- a/xen/arch/arm/platforms/Makefile
>       +++ b/xen/arch/arm/platforms/Makefile
>       @@ -8,4 +8,4 @@ obj-$(CONFIG_ARM_64) += seattle.o
>        obj-y += sunxi.o
>        obj-$(CONFIG_ARM_64) += thunderx.o
>        obj-$(CONFIG_ARM_64) += xgene-storm.o
>       -obj-$(CONFIG_ARM_64) += xilinx-zynqmp.o
>       +obj-$(CONFIG_MPSOC)  += xilinx-zynqmp.o
>       --
>       1.9.1
> 
> 
>       _______________________________________________
>       Xen-devel mailing list
>       Xen-devel@lists.xenproject.org
>       https://lists.xenproject.org/mailman/listinfo/xen-devel
> 
> 
> 
--8323329-1328426404-1527868405=:23991
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; NAME=.config
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.10.1806010853250.23991@sstabellini-ThinkPad-X260>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=.config

Iw0KIyBBdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBmaWxlOyBETyBOT1QgRURJ
VC4NCiMgWGVuL2FybSA0LjExLXVuc3RhYmxlIENvbmZpZ3VyYXRpb24NCiMN
CkNPTkZJR182NEJJVD15DQpDT05GSUdfQVJNXzY0PXkNCkNPTkZJR19BUk09
eQ0KQ09ORklHX0FSQ0hfREVGQ09ORklHPSJhcmNoL2FybS9jb25maWdzL2Fy
bTY0X2RlZmNvbmZpZyINCg0KIw0KIyBBcmNoaXRlY3R1cmUgRmVhdHVyZXMN
CiMNCkNPTkZJR19OUl9DUFVTPTQNCiMgQ09ORklHX0FDUEkgaXMgbm90IHNl
dA0KIyBDT05GSUdfR0lDVjMgaXMgbm90IHNldA0KIyBDT05GSUdfTkVXX1ZH
SUMgaXMgbm90IHNldA0KIyBDT05GSUdfU0JTQV9WVUFSVF9DT05TT0xFIGlz
IG5vdCBzZXQNCg0KIw0KIyBBUk0gZXJyYXRhIHdvcmthcm91bmQgdmlhIHRo
ZSBhbHRlcm5hdGl2ZSBmcmFtZXdvcmsNCiMNCkNPTkZJR19BUk02NF9FUlJB
VFVNXzgyNzMxOT15DQpDT05GSUdfQVJNNjRfRVJSQVRVTV84MjQwNjk9eQ0K
Q09ORklHX0FSTTY0X0VSUkFUVU1fODE5NDcyPXkNCkNPTkZJR19BUk02NF9F
UlJBVFVNXzgzMjA3NT15DQpDT05GSUdfQVJNNjRfRVJSQVRVTV84MzQyMjA9
eQ0KQ09ORklHX0hBUkRFTl9CUkFOQ0hfUFJFRElDVE9SPXkNCkNPTkZJR19B
Uk02NF9IQVJERU5fQlJBTkNIX1BSRURJQ1RPUj15DQoNCiMNCiMgUGxhdGZv
cm0gU3VwcG9ydA0KIw0KIyBDT05GSUdfUUVNVSBpcyBub3Qgc2V0DQojIENP
TkZJR19SQ0FSMyBpcyBub3Qgc2V0DQpDT05GSUdfTVBTT0M9eQ0KDQojDQoj
IENvbW1vbiBGZWF0dXJlcw0KIw0KQ09ORklHX0hBU19BTFRFUk5BVElWRT15
DQpDT05GSUdfSEFTX0RFVklDRV9UUkVFPXkNCiMgQ09ORklHX01FTV9BQ0NF
U1MgaXMgbm90IHNldA0KQ09ORklHX0hBU19QRFg9eQ0KIyBDT05GSUdfVE1F
TSBpcyBub3Qgc2V0DQojIENPTkZJR19YU00gaXMgbm90IHNldA0KDQojDQoj
IFNjaGVkdWxlcnMNCiMNCkNPTkZJR19TQ0hFRF9DUkVESVQ9eQ0KIyBDT05G
SUdfU0NIRURfQ1JFRElUMiBpcyBub3Qgc2V0DQojIENPTkZJR19TQ0hFRF9S
VERTIGlzIG5vdCBzZXQNCiMgQ09ORklHX1NDSEVEX0FSSU5DNjUzIGlzIG5v
dCBzZXQNCkNPTkZJR19TQ0hFRF9OVUxMPXkNCiMgQ09ORklHX1NDSEVEX0NS
RURJVF9ERUZBVUxUIGlzIG5vdCBzZXQNCkNPTkZJR19TQ0hFRF9OVUxMX0RF
RkFVTFQ9eQ0KQ09ORklHX1NDSEVEX0RFRkFVTFQ9Im51bGwiDQojIENPTkZJ
R19MSVZFUEFUQ0ggaXMgbm90IHNldA0KIyBDT05GSUdfU1VQUFJFU1NfRFVQ
TElDQVRFX1NZTUJPTF9XQVJOSU5HUyBpcyBub3Qgc2V0DQpDT05GSUdfQ01E
TElORT0iIg0KDQojDQojIERldmljZSBEcml2ZXJzDQojDQojIENPTkZJR19I
QVNfTlMxNjU1MCBpcyBub3Qgc2V0DQpDT05GSUdfSEFTX0NBREVOQ0VfVUFS
VD15DQojIENPTkZJR19IQVNfTVZFQlUgaXMgbm90IHNldA0KIyBDT05GSUdf
SEFTX1BMMDExIGlzIG5vdCBzZXQNCiMgQ09ORklHX0hBU19TQ0lGIGlzIG5v
dCBzZXQNCkNPTkZJR19IQVNfUEFTU1RIUk9VR0g9eQ0KQ09ORklHX0FSTV9T
TU1VPXkNCkNPTkZJR19ERUZDT05GSUdfTElTVD0iJEFSQ0hfREVGQ09ORklH
Ig0KDQojDQojIERlYnVnZ2luZyBPcHRpb25zDQojDQojIENPTkZJR19ERUJV
RyBpcyBub3Qgc2V0DQojIENPTkZJR19GUkFNRV9QT0lOVEVSIGlzIG5vdCBz
ZXQNCiMgQ09ORklHX0NPVkVSQUdFIGlzIG5vdCBzZXQNCiMgQ09ORklHX0xP
Q0tfUFJPRklMRSBpcyBub3Qgc2V0DQojIENPTkZJR19QRVJGX0NPVU5URVJT
IGlzIG5vdCBzZXQNCiMgQ09ORklHX1ZFUkJPU0VfREVCVUcgaXMgbm90IHNl
dA0KIyBDT05GSUdfREVWSUNFX1RSRUVfREVCVUcgaXMgbm90IHNldA0KIyBD
T05GSUdfU0NSVUJfREVCVUcgaXMgbm90IHNldA0K

--8323329-1328426404-1527868405=:23991
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1328426404-1527868405=:23991--
