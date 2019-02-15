From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V2 0/3] Renesas Stout board support (R-Car
 Gen2)
Date: Fri, 15 Feb 2019 15:39:21 +0200
Message-ID: <2d61bf2b-8398-4b68-7223-81487ce4c32c@gmail.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <82d6e897-d1b2-9b74-64c8-68f1421733cc@gmail.com>
 <CAF3u54BBWhS9N9w5i2zRHsg_uS8FTAHKgoa90oV1AuwfzkgSHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2445913437135195344=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=evfQ=QW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gudiA-0005Cl-T1
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 13:39:26 +0000
Received: by mail-lf1-x144.google.com with SMTP id f5so7184560lfc.13
 for <xen-devel@lists.xenproject.org>; Fri, 15 Feb 2019 05:39:25 -0800 (PST)
In-Reply-To: <CAF3u54BBWhS9N9w5i2zRHsg_uS8FTAHKgoa90oV1AuwfzkgSHQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============2445913437135195344==
Content-Type: multipart/alternative;
 boundary="------------1513F73938DDC8ADA5456B4B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1513F73938DDC8ADA5456B4B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 15.02.19 15:30, Julien Grall wrote:

Hi, Julien

>
>
> On Fri, 15 Feb 2019, 14:25 Oleksandr, <olekstysh@gmail.com 
> <mailto:olekstysh@gmail.com>> wrote:
>
>
>     On 01.02.19 14:37, Oleksandr Tyshchenko wrote:
>     > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com
>     <mailto:oleksandr_tyshchenko@epam.com>>
>     >
>     > Hi, all.
>
>
>     Hi, all
>
>     gentle reminder...
>
>
> This is in my queue of patches to review. Also, as we are in freeze, I 
> tend to prioritize patches for 4.12.
>
> I will try to have a look next week.


I understand. Thank you.


>
> Cheers,
>
>
>
>     >
>     > The purpose of this patch series is to add required support to
>     be able to run
>     > Xen on Renesas Stout board [1] which uses SCIFA compatible UART
>     as a console
>     > interface.
>     >
>     > Actually Xen already has support for SCIF compatible UARTs which
>     are used on
>     > Renesas Lager (R-Car Gen2), Salvator-X, H3ULCB/M3ULCB (R-Car
>     Gen3) and other
>     > development boards. So this patch series extends existing
>     support to be able
>     > to handle both interfaces.
>     >
>     > ----------
>     >
>     > Current patch series is based on the following commit
>     3389a8dc8c5753a3c84744923cd0193395e3f2a9
>     > and tested on Stout (ARM32) and H3ULCB (ARM64) boards.
>     >
>     > You can find current patch series here:
>     > repo: https://github.com/otyshchenko1/xen.git branch: stout_upstream
>     >
>     > You can find previous discussion here:
>     >
>     https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg21058.html
>     >
>     > Please note, that current patch series doesn’t have the
>     following patches:
>     > - xen/arm: drivers: scif: Remove unused #define-s (already
>     upstreamed)
>     > - xen/arm: Reuse R-Car Gen2 platform code for Stout board (was
>     dropped)
>     > but has new one:
>     > - xen/arm: Clarify usage of earlyprintk for Lager board
>     >
>     > ----------
>     >
>     > In order to run Xen on Stout board you need "PSCI-enabled"
>     U-Boot (not upsteamed yet).
>     > You can find corresponding patches for U-Boot here:
>     >
>     http://u-boot.10912.n7.nabble.com/PATCH-0-3-PSCI-support-for-r8a7790-SoC-Lager-Stout-boards-td357352.html
>     >
>     > Have a plan to update Xen Wiki regarding this board.
>     >
>     > [1] https://elinux.org/R-Car/Boards/Stout
>     >
>     > ----------
>     >
>     > Oleksandr Tyshchenko (3):
>     >    xen/arm: drivers: scif: Add support for SCIFA compatible UARTs
>     >    xen/arm: Clarify usage of earlyprintk for Lager board
>     >    xen/arm: Add SCIFA UART support for early printk
>     >
>     >   docs/misc/arm/early-printk.txt     |   2 +-
>     >   xen/arch/arm/arm32/debug-scifa.inc |  51 ++++++++++++++
>     >   xen/drivers/char/scif-uart.c       | 139
>     +++++++++++++++++++++++++++----------
>     >   xen/include/asm-arm/scif-uart.h    |  44 ++++++++++--
>     >   4 files changed, 194 insertions(+), 42 deletions(-)
>     >   create mode 100644 xen/arch/arm/arm32/debug-scifa.inc
>     >
>     -- 
>     Regards,
>
>     Oleksandr Tyshchenko
>
>
>     _______________________________________________
>     Xen-devel mailing list
>     Xen-devel@lists.xenproject.org <mailto:Xen-devel@lists.xenproject.org>
>     https://lists.xenproject.org/mailman/listinfo/xen-devel
>
-- 
Regards,

Oleksandr Tyshchenko


--------------1513F73938DDC8ADA5456B4B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15.02.19 15:30, Julien Grall wrote:</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Hi, Julien<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <blockquote type="cite"
cite="mid:CAF3u54BBWhS9N9w5i2zRHsg_uS8FTAHKgoa90oV1AuwfzkgSHQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <br>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Fri, 15 Feb 2019, 14:25 Oleksandr, &lt;<a
            href="mailto:olekstysh@gmail.com" moz-do-not-send="true">olekstysh@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
          On 01.02.19 14:37, Oleksandr Tyshchenko wrote:<br>
          &gt; From: Oleksandr Tyshchenko &lt;<a
            href="mailto:oleksandr_tyshchenko@epam.com" target="_blank"
            moz-do-not-send="true">oleksandr_tyshchenko@epam.com</a>&gt;<br>
          &gt;<br>
          &gt; Hi, all.<br>
          <br>
          <br>
          Hi, all<br>
          <br>
          gentle reminder...<br>
        </blockquote>
      </div>
      <div><br>
      </div>
      <div>This is in my queue of patches to review. Also, as we are in
        freeze, I tend to prioritize patches for 4.12.</div>
      <div><br>
      </div>
      <div>I will try to have a look next week.</div>
    </blockquote>
    <p><br>
    </p>
    <p>I understand. Thank you.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAF3u54BBWhS9N9w5i2zRHsg_uS8FTAHKgoa90oV1AuwfzkgSHQ@mail.gmail.com">
      <div><br>
      </div>
      <div>Cheers,</div>
      <div><br>
      </div>
      <div class="gmail_quote">
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <br>
          <br>
          &gt;<br>
          &gt; The purpose of this patch series is to add required
          support to be able to run<br>
          &gt; Xen on Renesas Stout board [1] which uses SCIFA
          compatible UART as a console<br>
          &gt; interface.<br>
          &gt;<br>
          &gt; Actually Xen already has support for SCIF compatible
          UARTs which are used on<br>
          &gt; Renesas Lager (R-Car Gen2), Salvator-X, H3ULCB/M3ULCB
          (R-Car Gen3) and other<br>
          &gt; development boards. So this patch series extends existing
          support to be able<br>
          &gt; to handle both interfaces.<br>
          &gt;<br>
          &gt; ----------<br>
          &gt;<br>
          &gt; Current patch series is based on the following commit
          3389a8dc8c5753a3c84744923cd0193395e3f2a9<br>
          &gt; and tested on Stout (ARM32) and H3ULCB (ARM64) boards.<br>
          &gt;<br>
          &gt; You can find current patch series here:<br>
          &gt; repo: <a href="https://github.com/otyshchenko1/xen.git"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/otyshchenko1/xen.git</a>
          branch: stout_upstream<br>
          &gt;<br>
          &gt; You can find previous discussion here:<br>
          &gt; <a
href="https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg21058.html"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg21058.html</a><br>
          &gt;<br>
          &gt; Please note, that current patch series doesn’t have the
          following patches:<br>
          &gt; - xen/arm: drivers: scif: Remove unused #define-s
          (already upstreamed)<br>
          &gt; - xen/arm: Reuse R-Car Gen2 platform code for Stout board
          (was dropped)<br>
          &gt; but has new one:<br>
          &gt; - xen/arm: Clarify usage of earlyprintk for Lager board<br>
          &gt;<br>
          &gt; ----------<br>
          &gt;<br>
          &gt; In order to run Xen on Stout board you need
          "PSCI-enabled" U-Boot (not upsteamed yet).<br>
          &gt; You can find corresponding patches for U-Boot here:<br>
          &gt; <a
href="http://u-boot.10912.n7.nabble.com/PATCH-0-3-PSCI-support-for-r8a7790-SoC-Lager-Stout-boards-td357352.html"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://u-boot.10912.n7.nabble.com/PATCH-0-3-PSCI-support-for-r8a7790-SoC-Lager-Stout-boards-td357352.html</a><br>
          &gt;<br>
          &gt; Have a plan to update Xen Wiki regarding this board.<br>
          &gt;<br>
          &gt; [1] <a href="https://elinux.org/R-Car/Boards/Stout"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://elinux.org/R-Car/Boards/Stout</a><br>
          &gt;<br>
          &gt; ----------<br>
          &gt;<br>
          &gt; Oleksandr Tyshchenko (3):<br>
          &gt;    xen/arm: drivers: scif: Add support for SCIFA
          compatible UARTs<br>
          &gt;    xen/arm: Clarify usage of earlyprintk for Lager board<br>
          &gt;    xen/arm: Add SCIFA UART support for early printk<br>
          &gt;<br>
          &gt;   docs/misc/arm/early-printk.txt     |   2 +-<br>
          &gt;   xen/arch/arm/arm32/debug-scifa.inc |  51 ++++++++++++++<br>
          &gt;   xen/drivers/char/scif-uart.c       | 139
          +++++++++++++++++++++++++++----------<br>
          &gt;   xen/include/asm-arm/scif-uart.h    |  44 ++++++++++--<br>
          &gt;   4 files changed, 194 insertions(+), 42 deletions(-)<br>
          &gt;   create mode 100644 xen/arch/arm/arm32/debug-scifa.inc<br>
          &gt;<br>
          -- <br>
          Regards,<br>
          <br>
          Oleksandr Tyshchenko<br>
          <br>
          <br>
          _______________________________________________<br>
          Xen-devel mailing list<br>
          <a href="mailto:Xen-devel@lists.xenproject.org"
            target="_blank" moz-do-not-send="true">Xen-devel@lists.xenproject.org</a><br>
          <a
            href="https://lists.xenproject.org/mailman/listinfo/xen-devel"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.xenproject.org/mailman/listinfo/xen-devel</a></blockquote>
      </div>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Regards,

Oleksandr Tyshchenko</pre>
  </body>
</html>

--------------1513F73938DDC8ADA5456B4B--


--===============2445913437135195344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2445913437135195344==--
