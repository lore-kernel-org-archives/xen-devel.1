From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v4 10/10] xen: add per-platform defaults for
 NR_CPUS
Date: Fri, 1 Jun 2018 03:49:17 +0100
Message-ID: <CAF3u54CKgHtX9g+R6wYA4+VL4RHCjWvSKEjxTnnwSiN3P8CuSA@mail.gmail.com>
References: <alpine.DEB.2.10.1805311447570.23991@sstabellini-ThinkPad-X260>
 <1527803317-31750-10-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5422278396345212359=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527803317-31750-10-git-send-email-sstabellini@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, andrii_anisov@epam.com, andrew.cooper3@citrix.com, dfaggioli@suse.com, julien.grall@arm.com, JBeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============5422278396345212359==
Content-Type: multipart/alternative; boundary="00000000000001e5ee056d8ba2d5"

--00000000000001e5ee056d8ba2d5
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting. I am pretty sure you need to CC "THE REST" here.

On Thu, 31 May 2018, 22:50 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> Add specific per-platform defaults for NR_CPUS. Note that the order of
> the defaults matter: they need to go first, otherwise the generic
> defaults will be applied.
>
> This is done so that Xen builds customized for a specific hardware
> platform can have the right NR_CPUS number.
>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> CC: JBeulich@suse.com
> CC: andrew.cooper3@citrix.com
> ---
>  xen/arch/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index cf0acb7..d451eb8 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -2,6 +2,9 @@
>  config NR_CPUS
>         int "Maximum number of physical CPUs"
>         range 1 4095
> +       default "8" if ARM && RCAR3
> +       default "4" if ARM && QEMU
> +       default "4" if ARM && MPSOC
>         default "256" if X86
>         default "128" if ARM
>         ---help---
>

IMHO, it would make sense to move this option in the arch/{arm,x86)/Kconfig.

But I am not sure how this will work as with this series you can select
multiple platforms in on Kconfig. What will be the end result?

Anyway, as I mention the way to go is a option list with only one possible
choice.

Cheers,


-- 
> 1.9.1
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--00000000000001e5ee056d8ba2d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Sorry for the formatting. I am pretty sure you need =
to CC &quot;THE REST&quot; here.</div><div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Thu, 31 May 2018, 22:50 Stefano Stabellini, &lt;<a href=
=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Add specific per-platform defaults fo=
r NR_CPUS. Note that the order of<br>
the defaults matter: they need to go first, otherwise the generic<br>
defaults will be applied.<br>
<br>
This is done so that Xen builds customized for a specific hardware<br>
platform can have the right NR_CPUS number.<br>
<br>
Signed-off-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.=
org" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
CC: <a href=3D"mailto:JBeulich@suse.com" target=3D"_blank">JBeulich@suse.co=
m</a><br>
CC: <a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank">andrew.c=
ooper3@citrix.com</a><br>
---<br>
=C2=A0xen/arch/Kconfig | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig<br>
index cf0acb7..d451eb8 100644<br>
--- a/xen/arch/Kconfig<br>
+++ b/xen/arch/Kconfig<br>
@@ -2,6 +2,9 @@<br>
=C2=A0config NR_CPUS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int &quot;Maximum number of physical CPUs&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 range 1 4095<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;8&quot; if ARM &amp;&amp; RCAR3<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;4&quot; if ARM &amp;&amp; QEMU<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;4&quot; if ARM &amp;&amp; MPSOC<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default &quot;256&quot; if X86<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default &quot;128&quot; if ARM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ---help---<br></blockquote></div></div><div><br=
></div><div>IMHO, it would make sense to move this option in the arch/{arm,=
x86)/Kconfig.</div><div><br></div><div>But I am not sure how this will work=
 as with this series you can select multiple platforms in on Kconfig. What =
will be the end result?</div><div><br></div><div>Anyway, as I mention the w=
ay to go is a option list with only one possible choice.</div><div><br></di=
v><div>Cheers,</div><div><br></div><div><br></div><div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
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

--00000000000001e5ee056d8ba2d5--


--===============5422278396345212359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5422278396345212359==--
