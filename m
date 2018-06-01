From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v4 08/10] arm: add QEMU,
 Rcar3 and MPSoC configs
Date: Fri, 1 Jun 2018 03:45:09 +0100
Message-ID: <CAF3u54BTrLmE6BxvEKA2wdxHbDcHf+Y0DqNvP4xErGYns5x63A@mail.gmail.com>
References: <alpine.DEB.2.10.1805311447570.23991@sstabellini-ThinkPad-X260>
 <1527803317-31750-8-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5145143994222867106=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527803317-31750-8-git-send-email-sstabellini@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, andrii_anisov@epam.com, dfaggioli@suse.com, julien.grall@arm.com, xen-devel@lists.xen.org, volodymyr_babchuk@epam.com
List-Id: xen-devel@lists.xenproject.org

--===============5145143994222867106==
Content-Type: multipart/alternative; boundary="0000000000002b2f91056d8b9395"

--0000000000002b2f91056d8b9395
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

Sorry for formatting.

On Thu, 31 May 2018, 22:50 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> Add a "Platform Support" menu with three umbrella kconfig options: QEMU,
> RCAR3 and MPSOC. They enable the required options for their hardware
> platform.
>

This patch is nothing close to what we discussed. As far as I can tell, the
tiny.config will end up to select all the platforms with their driver. It
will not be possible to deselect the driver selected for a platform
afterwards.

I still think the best if providing a choice list where only one option can
be selected. I would like to understand why you didn't go this path.

Cheers,


> In the case of the MPSOC that has a platform file under
> arch/arm/platforms/, build the file if MPSOC.
>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> CC: artem_mygaiev@epam.com
> CC: volodymyr_babchuk@epam.com
>
> ---
> Changes in v4:
> - fix GICv3/GICV3
> - default y to all options
> - build xilinx-zynqmp if MPSOC
> ---
>  xen/arch/arm/Kconfig            |  2 ++
>  xen/arch/arm/platforms/Kconfig  | 30 ++++++++++++++++++++++++++++++
>  xen/arch/arm/platforms/Makefile |  2 +-
>  3 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/platforms/Kconfig
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 2b87111..75cacfb 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -213,6 +213,8 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
>  config ARM32_HARDEN_BRANCH_PREDICTOR
>      def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
>
> +source "arch/arm/platforms/Kconfig"
> +
>  source "common/Kconfig"
>
>  source "drivers/Kconfig"
> diff --git a/xen/arch/arm/platforms/Kconfig
> b/xen/arch/arm/platforms/Kconfig
> new file mode 100644
> index 0000000..fea8f9a
> --- /dev/null
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -0,0 +1,30 @@
> +menu "Platform Support"
> +
> +config QEMU
> +       bool "QEMU aarch virt machine support"
> +       default y
> +       depends on ARM_64
> +       select GICV3
> +       select HAS_PL011
> +       ---help---
> +       Enable all the required drivers for QEMU aarch64 virt emulated
> +       machine.
> +
> +config RCAR3
> +       bool "Renesas RCar3 support"
> +       default y
> +       depends on ARM_64
> +       select HAS_SCIF
> +       ---help---
> +       Enable all the required drivers for Renesas RCar3
> +
> +config MPSOC
> +       bool "Xilinx Ultrascale+ MPSoC support"
> +       default y
> +       depends on ARM_64
> +       select HAS_CADENCE_UART
> +       select ARM_SMMU
> +       ---help---
> +       Enable all the required drivers for Xilinx Ultrascale+ MPSoC
> +
> +endmenu
> diff --git a/xen/arch/arm/platforms/Makefile
> b/xen/arch/arm/platforms/Makefile
> index 80e555c..f4ff411 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -8,4 +8,4 @@ obj-$(CONFIG_ARM_64) += seattle.o
>  obj-y += sunxi.o
>  obj-$(CONFIG_ARM_64) += thunderx.o
>  obj-$(CONFIG_ARM_64) += xgene-storm.o
> -obj-$(CONFIG_ARM_64) += xilinx-zynqmp.o
> +obj-$(CONFIG_MPSOC)  += xilinx-zynqmp.o
> --
> 1.9.1
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000002b2f91056d8b9395
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>Hi Stefano,</span><div><br></div><div>Sorry for formatting.<br><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 31 May 2018, 22:50 Stefan=
o Stabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@ker=
nel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add a &quot;=
Platform Support&quot; menu with three umbrella kconfig options: QEMU,<br>
RCAR3 and MPSOC. They enable the required options for their hardware<br>
platform.<br></blockquote></div></div><div><br></div><div>This patch is not=
hing close to what we discussed. As far as I can tell, the tiny.config will=
 end up to select all the platforms with their driver. It will not be possi=
ble to deselect the driver selected for a platform afterwards.</div><div><b=
r></div><div>I still think the best if providing a choice list where only o=
ne option can be selected. I would like to understand why you didn&#39;t go=
 this path.</div><div><br></div><div>Cheers,</div><div><br></div><div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
In the case of the MPSOC that has a platform file under<br>
arch/arm/platforms/, build the file if MPSOC.<br>
<br>
Signed-off-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.=
org" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
CC: <a href=3D"mailto:artem_mygaiev@epam.com" target=3D"_blank">artem_mygai=
ev@epam.com</a><br>
CC: <a href=3D"mailto:volodymyr_babchuk@epam.com" target=3D"_blank">volodym=
yr_babchuk@epam.com</a><br>
<br>
---<br>
Changes in v4:<br>
- fix GICv3/GICV3<br>
- default y to all options<br>
- build xilinx-zynqmp if MPSOC<br>
---<br>
=C2=A0xen/arch/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 2 ++<br>
=C2=A0xen/arch/arm/platforms/Kconfig=C2=A0 | 30 +++++++++++++++++++++++++++=
+++<br>
=C2=A0xen/arch/arm/platforms/Makefile |=C2=A0 2 +-<br>
=C2=A03 files changed, 33 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 xen/arch/arm/platforms/Kconfig<br>
<br>
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig<br>
index 2b87111..75cacfb 100644<br>
--- a/xen/arch/arm/Kconfig<br>
+++ b/xen/arch/arm/Kconfig<br>
@@ -213,6 +213,8 @@ config ARM64_HARDEN_BRANCH_PREDICTOR<br>
=C2=A0config ARM32_HARDEN_BRANCH_PREDICTOR<br>
=C2=A0 =C2=A0 =C2=A0def_bool y if ARM_32 &amp;&amp; HARDEN_BRANCH_PREDICTOR=
<br>
<br>
+source &quot;arch/arm/platforms/Kconfig&quot;<br>
+<br>
=C2=A0source &quot;common/Kconfig&quot;<br>
<br>
=C2=A0source &quot;drivers/Kconfig&quot;<br>
diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfi=
g<br>
new file mode 100644<br>
index 0000000..fea8f9a<br>
--- /dev/null<br>
+++ b/xen/arch/arm/platforms/Kconfig<br>
@@ -0,0 +1,30 @@<br>
+menu &quot;Platform Support&quot;<br>
+<br>
+config QEMU<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;QEMU aarch virt machine support&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARM_64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select GICV3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select HAS_PL011<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0---help---<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable all the required drivers for QEMU aarch6=
4 virt emulated<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0machine.<br>
+<br>
+config RCAR3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Renesas RCar3 support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARM_64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select HAS_SCIF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0---help---<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable all the required drivers for Renesas RCa=
r3<br>
+<br>
+config MPSOC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Xilinx Ultrascale+ MPSoC support&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARM_64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select HAS_CADENCE_UART<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select ARM_SMMU<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0---help---<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable all the required drivers for Xilinx Ultr=
ascale+ MPSoC<br>
+<br>
+endmenu<br>
diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makef=
ile<br>
index 80e555c..f4ff411 100644<br>
--- a/xen/arch/arm/platforms/Makefile<br>
+++ b/xen/arch/arm/platforms/Makefile<br>
@@ -8,4 +8,4 @@ obj-$(CONFIG_ARM_64) +=3D seattle.o<br>
=C2=A0obj-y +=3D sunxi.o<br>
=C2=A0obj-$(CONFIG_ARM_64) +=3D thunderx.o<br>
=C2=A0obj-$(CONFIG_ARM_64) +=3D xgene-storm.o<br>
-obj-$(CONFIG_ARM_64) +=3D xilinx-zynqmp.o<br>
+obj-$(CONFIG_MPSOC)=C2=A0 +=3D xilinx-zynqmp.o<br>
-- <br>
1.9.1<br>
<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div></div>

--0000000000002b2f91056d8b9395--


--===============5145143994222867106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5145143994222867106==--
