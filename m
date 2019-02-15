From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH V2 0/3] Renesas Stout board support (R-Car
 Gen2)
Date: Fri, 15 Feb 2019 14:30:19 +0100
Message-ID: <CAF3u54BBWhS9N9w5i2zRHsg_uS8FTAHKgoa90oV1AuwfzkgSHQ@mail.gmail.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <82d6e897-d1b2-9b74-64c8-68f1421733cc@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7656026145369935114=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q2aB=QW=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gudZa-0004io-Qc
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 13:30:34 +0000
Received: by mail-ua1-x943.google.com with SMTP id v9so3196658uar.11
 for <xen-devel@lists.xenproject.org>; Fri, 15 Feb 2019 05:30:33 -0800 (PST)
In-Reply-To: <82d6e897-d1b2-9b74-64c8-68f1421733cc@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============7656026145369935114==
Content-Type: multipart/alternative; boundary="0000000000008039ff0581eec72f"

--0000000000008039ff0581eec72f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Feb 2019, 14:25 Oleksandr, <olekstysh@gmail.com> wrote:

>
> On 01.02.19 14:37, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > Hi, all.
>
>
> Hi, all
>
> gentle reminder...
>

This is in my queue of patches to review. Also, as we are in freeze, I tend
to prioritize patches for 4.12.

I will try to have a look next week.

Cheers,


>
> >
> > The purpose of this patch series is to add required support to be able
> to run
> > Xen on Renesas Stout board [1] which uses SCIFA compatible UART as a
> console
> > interface.
> >
> > Actually Xen already has support for SCIF compatible UARTs which are
> used on
> > Renesas Lager (R-Car Gen2), Salvator-X, H3ULCB/M3ULCB (R-Car Gen3) and
> other
> > development boards. So this patch series extends existing support to be
> able
> > to handle both interfaces.
> >
> > ----------
> >
> > Current patch series is based on the following commit
> 3389a8dc8c5753a3c84744923cd0193395e3f2a9
> > and tested on Stout (ARM32) and H3ULCB (ARM64) boards.
> >
> > You can find current patch series here:
> > repo: https://github.com/otyshchenko1/xen.git branch: stout_upstream
> >
> > You can find previous discussion here:
> >
> https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg21058.html
> >
> > Please note, that current patch series doesn=E2=80=99t have the followi=
ng
> patches:
> > - xen/arm: drivers: scif: Remove unused #define-s (already upstreamed)
> > - xen/arm: Reuse R-Car Gen2 platform code for Stout board (was dropped)
> > but has new one:
> > - xen/arm: Clarify usage of earlyprintk for Lager board
> >
> > ----------
> >
> > In order to run Xen on Stout board you need "PSCI-enabled" U-Boot (not
> upsteamed yet).
> > You can find corresponding patches for U-Boot here:
> >
> http://u-boot.10912.n7.nabble.com/PATCH-0-3-PSCI-support-for-r8a7790-SoC-=
Lager-Stout-boards-td357352.html
> >
> > Have a plan to update Xen Wiki regarding this board.
> >
> > [1] https://elinux.org/R-Car/Boards/Stout
> >
> > ----------
> >
> > Oleksandr Tyshchenko (3):
> >    xen/arm: drivers: scif: Add support for SCIFA compatible UARTs
> >    xen/arm: Clarify usage of earlyprintk for Lager board
> >    xen/arm: Add SCIFA UART support for early printk
> >
> >   docs/misc/arm/early-printk.txt     |   2 +-
> >   xen/arch/arm/arm32/debug-scifa.inc |  51 ++++++++++++++
> >   xen/drivers/char/scif-uart.c       | 139
> +++++++++++++++++++++++++++----------
> >   xen/include/asm-arm/scif-uart.h    |  44 ++++++++++--
> >   4 files changed, 194 insertions(+), 42 deletions(-)
> >   create mode 100644 xen/arch/arm/arm32/debug-scifa.inc
> >
> --
> Regards,
>
> Oleksandr Tyshchenko
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000008039ff0581eec72f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, 15 Feb 2019, 14=
:25 Oleksandr, &lt;<a href=3D"mailto:olekstysh@gmail.com">olekstysh@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
On 01.02.19 14:37, Oleksandr Tyshchenko wrote:<br>
&gt; From: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_tyshchenko@=
epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<br>
&gt;<br>
&gt; Hi, all.<br>
<br>
<br>
Hi, all<br>
<br>
gentle reminder...<br></blockquote></div><div><br></div><div>This is in my =
queue of patches to review. Also, as we are in freeze, I tend to prioritize=
 patches for 4.12.</div><div><br></div><div>I will try to have a look next =
week.</div><div><br></div><div>Cheers,</div><div><br></div><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
&gt;<br>
&gt; The purpose of this patch series is to add required support to be able=
 to run<br>
&gt; Xen on Renesas Stout board [1] which uses SCIFA compatible UART as a c=
onsole<br>
&gt; interface.<br>
&gt;<br>
&gt; Actually Xen already has support for SCIF compatible UARTs which are u=
sed on<br>
&gt; Renesas Lager (R-Car Gen2), Salvator-X, H3ULCB/M3ULCB (R-Car Gen3) and=
 other<br>
&gt; development boards. So this patch series extends existing support to b=
e able<br>
&gt; to handle both interfaces.<br>
&gt;<br>
&gt; ----------<br>
&gt;<br>
&gt; Current patch series is based on the following commit 3389a8dc8c5753a3=
c84744923cd0193395e3f2a9<br>
&gt; and tested on Stout (ARM32) and H3ULCB (ARM64) boards.<br>
&gt;<br>
&gt; You can find current patch series here:<br>
&gt; repo: <a href=3D"https://github.com/otyshchenko1/xen.git" rel=3D"noref=
errer" target=3D"_blank">https://github.com/otyshchenko1/xen.git</a> branch=
: stout_upstream<br>
&gt;<br>
&gt; You can find previous discussion here:<br>
&gt; <a href=3D"https://www.mail-archive.com/xen-devel@lists.xenproject.org=
/msg21058.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archi=
ve.com/xen-devel@lists.xenproject.org/msg21058.html</a><br>
&gt;<br>
&gt; Please note, that current patch series doesn=E2=80=99t have the follow=
ing patches:<br>
&gt; - xen/arm: drivers: scif: Remove unused #define-s (already upstreamed)=
<br>
&gt; - xen/arm: Reuse R-Car Gen2 platform code for Stout board (was dropped=
)<br>
&gt; but has new one:<br>
&gt; - xen/arm: Clarify usage of earlyprintk for Lager board<br>
&gt;<br>
&gt; ----------<br>
&gt;<br>
&gt; In order to run Xen on Stout board you need &quot;PSCI-enabled&quot; U=
-Boot (not upsteamed yet).<br>
&gt; You can find corresponding patches for U-Boot here:<br>
&gt; <a href=3D"http://u-boot.10912.n7.nabble.com/PATCH-0-3-PSCI-support-fo=
r-r8a7790-SoC-Lager-Stout-boards-td357352.html" rel=3D"noreferrer" target=
=3D"_blank">http://u-boot.10912.n7.nabble.com/PATCH-0-3-PSCI-support-for-r8=
a7790-SoC-Lager-Stout-boards-td357352.html</a><br>
&gt;<br>
&gt; Have a plan to update Xen Wiki regarding this board.<br>
&gt;<br>
&gt; [1] <a href=3D"https://elinux.org/R-Car/Boards/Stout" rel=3D"noreferre=
r" target=3D"_blank">https://elinux.org/R-Car/Boards/Stout</a><br>
&gt;<br>
&gt; ----------<br>
&gt;<br>
&gt; Oleksandr Tyshchenko (3):<br>
&gt;=C2=A0 =C2=A0 xen/arm: drivers: scif: Add support for SCIFA compatible =
UARTs<br>
&gt;=C2=A0 =C2=A0 xen/arm: Clarify usage of earlyprintk for Lager board<br>
&gt;=C2=A0 =C2=A0 xen/arm: Add SCIFA UART support for early printk<br>
&gt;<br>
&gt;=C2=A0 =C2=A0docs/misc/arm/early-printk.txt=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/arm32/debug-scifa.inc |=C2=A0 51 ++++++++++++=
++<br>
&gt;=C2=A0 =C2=A0xen/drivers/char/scif-uart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
39 +++++++++++++++++++++++++++----------<br>
&gt;=C2=A0 =C2=A0xen/include/asm-arm/scif-uart.h=C2=A0 =C2=A0 |=C2=A0 44 ++=
++++++++--<br>
&gt;=C2=A0 =C2=A04 files changed, 194 insertions(+), 42 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 xen/arch/arm/arm32/debug-scifa.inc<br>
&gt;<br>
-- <br>
Regards,<br>
<br>
Oleksandr Tyshchenko<br>
<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--0000000000008039ff0581eec72f--


--===============7656026145369935114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7656026145369935114==--
