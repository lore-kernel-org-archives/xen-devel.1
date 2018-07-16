From: George John <georgeeldhojohn@gmail.com>
Subject: Re: Error during cross compiling of xen by chroot
Date: Mon, 16 Jul 2018 10:15:57 +0530
Message-ID: <CANou6Spjndj5hSYp6AxSddvWwVgQSr6bGQaZiVk-Tkf0xGAf4A@mail.gmail.com>
References: <CANou6SqQutpd2T7dVhQaX1wcJCUpKoWoDNigDqYP0c_zQu2oUw@mail.gmail.com>
 <81d1d743c73c4e6694c8e8e279ae7aaa@dornerworks.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7330295676729524752=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=e4rv=ka=gmail.com=georgeeldhojohn@srs-us1.protection.inumbo.net>)
 id 1fevOZ-0006PF-8a
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 04:45:59 +0000
Received: by mail-oi0-x232.google.com with SMTP id i12-v6so72384635oik.2
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jul 2018 21:45:58 -0700 (PDT)
In-Reply-To: <81d1d743c73c4e6694c8e8e279ae7aaa@dornerworks.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============7330295676729524752==
Content-Type: multipart/alternative; boundary="0000000000006b77da05711681f5"

--0000000000006b77da05711681f5
Content-Type: text/plain; charset="UTF-8"

Hi Stewart,
Thank you for your support. I solved the error by installing
libpixman-1:arm64. Previously I have installed libpixman-1 for x86. I think
that was the problem.

Thanks and Regards,
George

On Jul 14, 2018 2:41 AM, "Stewart Hildebrand" <
Stewart.Hildebrand@dornerworks.com> wrote:

> > -----Original Message-----
> > From: Xen-devel [mailto:xen-devel-bounces@lists.xenproject.org] On
> Behalf
> > Of George John
> > Sent: Thursday, July 5, 2018 1:41 AM
> > To: xen-devel <xen-devel@lists.xenproject.org>
> > Subject: [Xen-devel] Error during cross compiling of xen by chroot
> >
> > Hi,
> > I am using chroot to cross compile xen. I am getting the error as per
> > the error log. I have installed libpixman. But still this is occuring.
> > what could be the possible reason?
>
> You should be able to gather more info by setting the verbose flag for the
> qemu build
> diff --git a/tools/Makefile b/tools/Makefile
> index 67977ad..fc82f5b 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -280,7 +280,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
>                 $(CONFIG_QEMUU_EXTRA_ARGS) \
>                 --cpu=$(IOEMU_CPU_ARCH) \
>                 $(IOEMU_CONFIGURE_CROSS); \
> -       $(MAKE) all
> +       $(MAKE) V=1 all
>
>  subdir-install-qemu-xen-dir: subdir-all-qemu-xen-dir
>         cd qemu-xen-build; \
>
> Sort of related: if you truly want to cross compile Xen tools for aarch64
> with less dependence on chroot - see the following example around lines
> 224-271 https://gist.github.com/stewdk/110f43e0cc1d905fc6ed4c7e10d8d35e
>
> Thanks,
> Stewart Hildebrand
> DornerWorks, Ltd.
>
> >
> > Thanks and regards,
> > George
>

--0000000000006b77da05711681f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Stewart,=C2=A0<div dir=3D"auto">Thank you for your sup=
port. I solved the error by installing libpixman-1:arm64. Previously I have=
 installed libpixman-1 for x86. I think that was the problem.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks and Regards,</div><div dir=3D"=
auto">George</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Jul 14, 2018 2:41 AM, &quot;Stewart Hildebrand&quot; &lt;<a href=
=3D"mailto:Stewart.Hildebrand@dornerworks.com">Stewart.Hildebrand@dornerwor=
ks.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">&gt; -----Original Message-----<br>
&gt; From: Xen-devel [mailto:<a href=3D"mailto:xen-devel-bounces@lists.xenp=
roject.org">xen-devel-bounces@<wbr>lists.xenproject.org</a>] On Behalf<br>
&gt; Of George John<br>
&gt; Sent: Thursday, July 5, 2018 1:41 AM<br>
&gt; To: xen-devel &lt;<a href=3D"mailto:xen-devel@lists.xenproject.org">xe=
n-devel@lists.xenproject.<wbr>org</a>&gt;<br>
&gt; Subject: [Xen-devel] Error during cross compiling of xen by chroot<br>
&gt; <br>
&gt; Hi,<br>
&gt; I am using chroot to cross compile xen. I am getting the error as per<=
br>
&gt; the error log. I have installed libpixman. But still this is occuring.=
<br>
&gt; what could be the possible reason?<br>
<br>
You should be able to gather more info by setting the verbose flag for the =
qemu build<br>
diff --git a/tools/Makefile b/tools/Makefile<br>
index 67977ad..fc82f5b 100644<br>
--- a/tools/Makefile<br>
+++ b/tools/Makefile<br>
@@ -280,7 +280,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CONFIG_QEMUU_EXTR=
A_ARGS) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --cpu=3D$(IOEMU_CPU=
_ARCH) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(IOEMU_CONFIGURE_C=
ROSS); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) all<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) V=3D1 all<br>
<br>
=C2=A0subdir-install-qemu-xen-dir: subdir-all-qemu-xen-dir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd qemu-xen-build; \<br>
<br>
Sort of related: if you truly want to cross compile Xen tools for aarch64 w=
ith less dependence on chroot - see the following example around lines 224-=
271 <a href=3D"https://gist.github.com/stewdk/110f43e0cc1d905fc6ed4c7e10d8d=
35e" rel=3D"noreferrer" target=3D"_blank">https://gist.github.com/<wbr>stew=
dk/<wbr>110f43e0cc1d905fc6ed4c7e10d8d3<wbr>5e</a><br>
<br>
Thanks,<br>
Stewart Hildebrand<br>
DornerWorks, Ltd.<br>
<br>
&gt; <br>
&gt; Thanks and regards,<br>
&gt; George<br>
</blockquote></div></div>

--0000000000006b77da05711681f5--


--===============7330295676729524752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7330295676729524752==--
