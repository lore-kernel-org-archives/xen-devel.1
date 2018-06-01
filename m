From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v4 07/10] arm: add a tiny kconfig
 configuration
Date: Fri, 1 Jun 2018 03:39:01 +0100
Message-ID: <CAF3u54D0uj8_UJw+oBP4QvxXEJXnQzSA1oKowquKDEOem5B+=Q@mail.gmail.com>
References: <alpine.DEB.2.10.1805311447570.23991@sstabellini-ThinkPad-X260>
 <1527803317-31750-7-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8865595329073210280=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527803317-31750-7-git-send-email-sstabellini@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, andrii_anisov@epam.com, xen-devel@lists.xen.org, julien.grall@arm.com, dfaggioli@suse.com
List-Id: xen-devel@lists.xenproject.org

--===============8865595329073210280==
Content-Type: multipart/alternative; boundary="0000000000003e3bc9056d8b7d93"

--0000000000003e3bc9056d8b7d93
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

On Thu, 31 May 2018, 22:50 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> Add a tiny kconfig configuration. Enabled NULL and Credit schedulers.
> Support only 8 cpus. It only carries non-default options (use make
> olddefconfig to produce a complete .config file).
>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
>
> ---
> Note that this approach has a limitation: it is not possible to "select
> a range". In other words, using tiny.config NR_CPUS is set to 4. It is
> not possible to increase it to 8 from config RCAR3.
>

Is that still true? I thought we discussed a solution to do it yesterday.

By that, I mean the platform would be selected at olddefconfig.

Cheers,

---
>  xen/arch/arm/configs/tiny.conf | 43
> ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 xen/arch/arm/configs/tiny.conf
>
> diff --git a/xen/arch/arm/configs/tiny.conf
> b/xen/arch/arm/configs/tiny.conf
> new file mode 100644
> index 0000000..e9a5e65
> --- /dev/null
> +++ b/xen/arch/arm/configs/tiny.conf
> @@ -0,0 +1,43 @@
> +CONFIG_ARM_64=y
> +CONFIG_ARM=y
> +
> +#
> +# Architecture Features
> +#
> +# CONFIG_GICV3 is not set
> +# CONFIG_MEM_ACCESS is not set
> +# CONFIG_SBSA_VUART_CONSOLE is not set
> +
> +#
> +# Common Features
> +#
> +# CONFIG_TMEM is not set
> +
> +#
> +# Schedulers
> +#
> +# CONFIG_SCHED_CREDIT2 is not set
> +# CONFIG_SCHED_RTDS is not set
> +# CONFIG_SCHED_ARINC653 is not set
> +CONFIG_SCHED_NULL=y
> +CONFIG_SCHED_NULL_DEFAULT=y
> +CONFIG_SCHED_DEFAULT="null"
> +# CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
> +
> +#
> +# Device Drivers
> +#
> +# CONFIG_HAS_NS16550 is not set
> +# CONFIG_HAS_CADENCE_UART is not set
> +# CONFIG_HAS_MVEBU is not set
> +# CONFIG_HAS_PL011 is not set
> +# CONFIG_HAS_SCIF is not set
> +# CONFIG_ARM_SMMU is not set
> +
> +#
> +# Debugging Options
> +#
> +# CONFIG_DEBUG is not set
> +# CONFIG_FRAME_POINTER is not set
> +# CONFIG_VERBOSE_DEBUG is not set
> +# CONFIG_SCRUB_DEBUG is not set
> --
> 1.9.1
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000003e3bc9056d8b7d93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Sorry for the formatting.<br><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Thu, 31 May 2018, 22:50 Stefano Stabellini, &lt=
;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Add a tiny kconfig configurat=
ion. Enabled NULL and Credit schedulers.<br>
Support only 8 cpus. It only carries non-default options (use make<br>
olddefconfig to produce a complete .config file).<br>
<br>
Signed-off-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.=
org" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
<br>
---<br>
Note that this approach has a limitation: it is not possible to &quot;selec=
t<br>
a range&quot;. In other words, using tiny.config NR_CPUS is set to 4. It is=
<br>
not possible to increase it to 8 from config RCAR3.<br></blockquote></div><=
/div><div><br></div><div>Is that still true? I thought we discussed a solut=
ion to do it yesterday.</div><div><br></div><div>By that, I mean the platfo=
rm would be selected at olddefconfig.</div><div><br></div><div>Cheers,</div=
><div><br></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
---<br>
=C2=A0xen/arch/arm/configs/tiny.conf | 43 +++++++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A01 file changed, 43 insertions(+)<br>
=C2=A0create mode 100644 xen/arch/arm/configs/tiny.conf<br>
<br>
diff --git a/xen/arch/arm/configs/tiny.conf b/xen/arch/arm/configs/tiny.con=
f<br>
new file mode 100644<br>
index 0000000..e9a5e65<br>
--- /dev/null<br>
+++ b/xen/arch/arm/configs/tiny.conf<br>
@@ -0,0 +1,43 @@<br>
+CONFIG_ARM_64=3Dy<br>
+CONFIG_ARM=3Dy<br>
+<br>
+#<br>
+# Architecture Features<br>
+#<br>
+# CONFIG_GICV3 is not set<br>
+# CONFIG_MEM_ACCESS is not set<br>
+# CONFIG_SBSA_VUART_CONSOLE is not set<br>
+<br>
+#<br>
+# Common Features<br>
+#<br>
+# CONFIG_TMEM is not set<br>
+<br>
+#<br>
+# Schedulers<br>
+#<br>
+# CONFIG_SCHED_CREDIT2 is not set<br>
+# CONFIG_SCHED_RTDS is not set<br>
+# CONFIG_SCHED_ARINC653 is not set<br>
+CONFIG_SCHED_NULL=3Dy<br>
+CONFIG_SCHED_NULL_DEFAULT=3Dy<br>
+CONFIG_SCHED_DEFAULT=3D&quot;null&quot;<br>
+# CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set<br>
+<br>
+#<br>
+# Device Drivers<br>
+#<br>
+# CONFIG_HAS_NS16550 is not set<br>
+# CONFIG_HAS_CADENCE_UART is not set<br>
+# CONFIG_HAS_MVEBU is not set<br>
+# CONFIG_HAS_PL011 is not set<br>
+# CONFIG_HAS_SCIF is not set<br>
+# CONFIG_ARM_SMMU is not set<br>
+<br>
+#<br>
+# Debugging Options<br>
+#<br>
+# CONFIG_DEBUG is not set<br>
+# CONFIG_FRAME_POINTER is not set<br>
+# CONFIG_VERBOSE_DEBUG is not set<br>
+# CONFIG_SCRUB_DEBUG is not set<br>
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

--0000000000003e3bc9056d8b7d93--


--===============8865595329073210280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8865595329073210280==--
