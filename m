From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: XEN on R-CAR H3
Date: Wed, 20 Feb 2019 23:28:36 +0200
Message-ID: <CAPD2p-=U3Hfi9g-PhcU6ztAWwAhTES2aoMAJjJ0nY6quj_9m0Q@mail.gmail.com>
References: <CABHD4K9_hG0deTR4idTz167SN3Ak1EPXr7ck9=dhbwsoGoQhBw@mail.gmail.com>
 <475a03a5-5017-c333-ad32-249960d7f50f@gmail.com>
 <CABHD4K83md1PdVtmUGnHrxEgzBrAPmHeF6wyeSG+3cuTDJ+t+g@mail.gmail.com>
 <CABHD4K9_G__3-u3ma-WGTeiB+DhBW+w4LGLPQJ0JKEDf56_MYw@mail.gmail.com>
 <62049eee-60e5-a770-908a-43b1014f3fea@gmail.com>
 <CABHD4K_4PmGwqK30dQ=7XhBPoVHGk=yizLv5ACaP+tscBcHV3Q@mail.gmail.com>
 <95239898-60f5-e3d3-440d-4c88b5ab7023@gmail.com>
 <CABHD4K91iqMYU-Hm0LaF_uiOt_wPAyk5svd3j34qMHLFt3rwtQ@mail.gmail.com>
 <172f815e-65d1-1f02-5653-0308c5c1604e@gmail.com>
 <CABHD4K_vMN+QRJgxkJjRuZ+_NSGTyXnJC=qvAw5cKGn_nsvV2A@mail.gmail.com>
 <06da3bda-93ba-82a8-d155-02224a79bb8a@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0052757312410077869=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dYg4=Q3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gwZQB-0002t2-4n
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 21:28:51 +0000
Received: by mail-it1-x142.google.com with SMTP id d125so7578958ith.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 13:28:49 -0800 (PST)
In-Reply-To: <06da3bda-93ba-82a8-d155-02224a79bb8a@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, andrii_chepurnyi@epam.com, amittomer25@gmail.com
List-Id: xen-devel@lists.xenproject.org

--===============0052757312410077869==
Content-Type: multipart/alternative; boundary="00000000000022319f05825a0bcc"

--00000000000022319f05825a0bcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 20 =D1=84=D0=B5=D0=B2=D1=80. 2019 =D0=B3., 22:14 Julien Grall=
 <julien.grall@arm.com>:

> Hi Amit,


Hi, Julien, Amit.

Sorry for formatting, writing from my mobile.

If I am not mistaken, the diff between BSP's and mainline device trees is
in reserved memory area. BSP device tree (1) contains reserved memory
regions, but the mainline one (2) doesn't.
>From the log you provided, I see that Xen is trying to copy device-tree to
the address which is located in reserved area (0x58000000). FYI, we always
remove these reserved area nodes from the device-tree. Maybe that's why we
didn't face an issue. Julien, what do you think, can this be a reason?

(1)
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/tree/=
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts?h=3Dv4.14.75-ltsi/rcar-3.9.3=
.rc1

(2)
https://elixir.bootlin.com/linux/v5.0-rc7/source/arch/arm64/boot/dts/renesa=
s/r8a7795-h3ulcb.dts


> Thank you for the report.
>
> On 2/19/19 4:46 PM, Amit Tomer wrote:
> > (XEN) CPU7 MIDR (0x410fd034) does not match boot CPU MIDR (0x411fd073),
> > (XEN) disable cpu (see big.LITTLE.txt under docs/).
> > (XEN) CPU7 never came online
> > (XEN) Failed to bring up CPU 7 (error -5)
> > (XEN) Brought up 4 CPUs
> > (XEN) P2M: 44-bit IPA with 44-bit PA and 8-bit VMID
> > (XEN) P2M: 4 levels with order-0 root, VTCR 0x80043594
> > (XEN) I/O virtualisation disabled
> > (XEN) build-id: 74f80103afa98953c029eea87d69696bcd5ef69d
> > (XEN) alternatives: Patching with alt table 00000000002abba8 ->
> 00000000002ac1f0
> > (XEN) CPU0 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> > (XEN) CPU2 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> > (XEN) CPU3 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> > (XEN) CPU1 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> > (XEN) *** LOADING DOMAIN 0 ***
> > (XEN) Loading Domd0 kernel from boot module @ 000000007a000000
> > (XEN) Allocating 1:1 mappings totalling 512MB for dom0:
> > (XEN) BANK[0] 0x00000050000000-0x00000070000000 (512MB)
> > (XEN) Grant table range: 0x00000048000000-0x00000048040000
> > (XEN) Allocating PPI 16 for event channel interrupt
> > (XEN) Loading zImage from 000000007a000000 to
> 0000000050080000-0000000051880000
> > (XEN) Loading dom0 DTB to 0x0000000058000000-0x0000000058010a48
> > (XEN)
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) Unable to copy the DTB to dom0 memory (left =3D 68168 bytes)
> > (XEN) ****************************************
>
> This is a bit odd. The function copy_to_guest_phys_flush_dcache can
> only fail when the P2M entry is invalid or it is not a RAM page.
>
> From the log, it can't even copy the first page. However, this seems
> to belong to the RAM (see BANK[0] message). Would you mind to apply the
> following patch and send the log?
>
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d9836779d1..08b9cd2c44 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1805,6 +1805,8 @@ static void __init dtb_load(struct kernel_info
> *kinfo)
>      printk("Loading dom0 DTB to 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
>             kinfo->dtb_paddr, kinfo->dtb_paddr +
> fdt_totalsize(kinfo->fdt));
>
> +    dump_p2m_lookup(kinfo->d, kinfo->dtb_paddr);
> +
>      left =3D copy_to_guest_phys_flush_dcache(kinfo->d, kinfo->dtb_paddr,
>                                             kinfo->fdt,
>                                             fdt_totalsize(kinfo->fdt));
>
> Cheers,
>
> --
> Julien Grall
>

--00000000000022319f05825a0bcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br></div><div dir=3D"auto"><br><div class=3D"gmail_=
quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 20 =
=D1=84=D0=B5=D0=B2=D1=80. 2019 =D0=B3., 22:14 Julien Grall &lt;<a href=3D"m=
ailto:julien.grall@arm.com" target=3D"_blank" rel=3D"noreferrer">julien.gra=
ll@arm.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Amit,</block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Hi, Julien,=
 Amit.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry for formatt=
ing, writing from my mobile.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">If I am not mistaken, the diff between BSP&#39;s and mainline device t=
rees is in reserved memory area. BSP device tree (1) contains reserved memo=
ry regions, but the mainline one (2) doesn&#39;t.</div><div dir=3D"auto">Fr=
om the log you provided, I see that Xen is trying to copy device-tree to th=
e address which is located in reserved area (<span style=3D"font-family:san=
s-serif">0x58000000). FYI, we always remove these reserved area nodes from =
the device-tree. Maybe that&#39;s why we didn&#39;t face an issue. Julien, =
what do you think, can this be a reason?</span></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">(1)=C2=A0<a href=3D"https://git.kernel.org/pub/scm/=
linux/kernel/git/horms/renesas-bsp.git/tree/arch/arm64/boot/dts/renesas/r8a=
7795-h3ulcb.dts?h=3Dv4.14.75-ltsi/rcar-3.9.3.rc1">https://git.kernel.org/pu=
b/scm/linux/kernel/git/horms/renesas-bsp.git/tree/arch/arm64/boot/dts/renes=
as/r8a7795-h3ulcb.dts?h=3Dv4.14.75-ltsi/rcar-3.9.3.rc1</a></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">(2) <a href=3D"https://elixir.bootlin.co=
m/linux/v5.0-rc7/source/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts">htt=
ps://elixir.bootlin.com/linux/v5.0-rc7/source/arch/arm64/boot/dts/renesas/r=
8a7795-h3ulcb.dts</a></div><div dir=3D"auto"><br></div><div dir=3D"auto"></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<br>
Thank you for the report.<br>
<br>
On 2/19/19 4:46 PM, Amit Tomer wrote:<br>
&gt; (XEN) CPU7 MIDR (0x410fd034) does not match boot CPU MIDR (0x411fd073)=
,<br>
&gt; (XEN) disable cpu (see big.LITTLE.txt under docs/).<br>
&gt; (XEN) CPU7 never came online<br>
&gt; (XEN) Failed to bring up CPU 7 (error -5)<br>
&gt; (XEN) Brought up 4 CPUs<br>
&gt; (XEN) P2M: 44-bit IPA with 44-bit PA and 8-bit VMID<br>
&gt; (XEN) P2M: 4 levels with order-0 root, VTCR 0x80043594<br>
&gt; (XEN) I/O virtualisation disabled<br>
&gt; (XEN) build-id: 74f80103afa98953c029eea87d69696bcd5ef69d<br>
&gt; (XEN) alternatives: Patching with alt table 00000000002abba8 -&gt; 000=
00000002ac1f0<br>
&gt; (XEN) CPU0 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry<br=
>
&gt; (XEN) CPU2 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry<br=
>
&gt; (XEN) CPU3 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry<br=
>
&gt; (XEN) CPU1 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry<br=
>
&gt; (XEN) *** LOADING DOMAIN 0 ***<br>
&gt; (XEN) Loading Domd0 kernel from boot module @ 000000007a000000<br>
&gt; (XEN) Allocating 1:1 mappings totalling 512MB for dom0:<br>
&gt; (XEN) BANK[0] 0x00000050000000-0x00000070000000 (512MB)<br>
&gt; (XEN) Grant table range: 0x00000048000000-0x00000048040000<br>
&gt; (XEN) Allocating PPI 16 for event channel interrupt<br>
&gt; (XEN) Loading zImage from 000000007a000000 to 0000000050080000-0000000=
051880000<br>
&gt; (XEN) Loading dom0 DTB to 0x0000000058000000-0x0000000058010a48<br>
&gt; (XEN)<br>
&gt; (XEN) ****************************************<br>
&gt; (XEN) Panic on CPU 0:<br>
&gt; (XEN) Unable to copy the DTB to dom0 memory (left =3D 68168 bytes)<br>
&gt; (XEN) ****************************************<br>
<br>
This is a bit odd. The function copy_to_guest_phys_flush_dcache can<br>
only fail when the P2M entry is invalid or it is not a RAM page.<br>
<br>
>From the log, it can&#39;t even copy the first page. However, this seems <b=
r>
to belong to the RAM (see BANK[0] message). Would you mind to apply the<br>
following patch and send the log?<br>
<br>
<br>
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c<br>
index d9836779d1..08b9cd2c44 100644<br>
--- a/xen/arch/arm/domain_build.c<br>
+++ b/xen/arch/arm/domain_build.c<br>
@@ -1805,6 +1805,8 @@ static void __init dtb_load(struct kernel_info *kinfo=
)<br>
=C2=A0 =C2=A0 =C2=A0printk(&quot;Loading dom0 DTB to 0x%&quot;PRIpaddr&quot=
;-0x%&quot;PRIpaddr&quot;\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kinfo-&gt;dtb_paddr, kinfo-&gt;dt=
b_paddr + fdt_totalsize(kinfo-&gt;fdt));<br>
<br>
+=C2=A0 =C2=A0 dump_p2m_lookup(kinfo-&gt;d, kinfo-&gt;dtb_paddr);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0left =3D copy_to_guest_phys_flush_dcache(kinfo-&gt;d, k=
info-&gt;dtb_paddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 kinfo-&gt;fdt,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fdt_totalsize(kinfo-&gt;fdt));<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div></div></div>

--00000000000022319f05825a0bcc--


--===============0052757312410077869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0052757312410077869==--
