From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: Re: Problem creating x86_64 PVH mini-os domain
Date: Tue, 2 Jan 2018 10:08:45 +0000
Message-ID: <CADNMjEB1Mh6iNQCRpztMwb_g4aakBvcLbrVbEE-0LMqrEpjjFw@mail.gmail.com>
References: <CADNMjEBvi8P9OxeVfYH8nev+kwsGne=wjSeUQ0T=meUi20kTsw@mail.gmail.com>
 <ec95e89a-a4ef-6701-d7c2-e16d8fcb74e1@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0701169526856711055=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vkcx=d5=gmail.com=bruno.alvisio@srs-us1.protection.inumbo.net>)
 id 1eWJV2-0006ZL-PW
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 10:08:48 +0000
Received: by mail-yw0-x242.google.com with SMTP id w128so11728248ywa.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2018 02:08:46 -0800 (PST)
In-Reply-To: <ec95e89a-a4ef-6701-d7c2-e16d8fcb74e1@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============0701169526856711055==
Content-Type: multipart/alternative; boundary="001a11429284c9745b0561c8487e"

--001a11429284c9745b0561c8487e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2017 at 5:12 PM, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 31/12/2017 15:19, Bruno Alvisio wrote:
>
> Hi all,
>
>
>
> I was trying to create mini-os PVH instances both x86_32 and x86_64. I
> have no issue with x86_32 but when trying to =E2=80=98xl create=E2=80=99 =
x86_64 type I get
> the following error:
>
>
> <snip>
>
> xc: error: panic: xc_dom_hvmloader.c:113: xc_dom_parse_hvm_kernel: ELF
> image is not 32bit: Invalid kernel
>
>
> The domain loader only ever accepts elf32 images, because the starting
> state is 32bit flat mode.
>
> This is how XTF deals with the problem:
>
> http://xenbits.xen.org/gitweb/?p=3Dxtf.git;a=3Dblob;f=3Dbuild/gen.mk;h=3D
> 8d7a6bf89725fedc8343d2e4d3c8e2c93c16811f;hb=3DHEAD#l47
>
> There is a lot of template meta-programming in there, but basically after
> doing the final link, do a further objcopy to convert the image to
> elf32-x86-64 (if available), or elf32-i386.  The former is only available
> if you have an x32 toolchain, and allows the binary to load properly and
> disassemble correctly.
>

Thank you. Doing:

$objcopy <obj_file> -O elf32-x86-64 <new_obj_file>

 worked perfectly!

>
>  Happy New Year!
>
>
> Happy new year.
>
> ~Andrew
>

--001a11429284c9745b0561c8487e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Sun, Dec 31, 2017 at 5:12 PM, Andrew Cooper <span dir=
=3D"ltr">&lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank"=
>andrew.cooper3@citrix.com</a>&gt;</span> wrote:<br><div class=3D"gmail_ext=
ra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <div class=3D"m_5283853962972203132moz-cite-prefix">On 31/12/2017 15:19=
, Bruno Alvisio
      wrote:<br>
    </div>
    </span><blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><span class=3D"">
        <p class=3D"m_5283853962972203132gmail-MsoNormal" style=3D"line-hei=
ght:16pt;margin:0in 0in 0.0001pt;font-family:Calibri"><span style=3D"font-f=
amily:&quot;Helvetica Neue&quot;;color:black">Hi
            all,</span></p>
        <p class=3D"m_5283853962972203132gmail-MsoNormal" style=3D"line-hei=
ght:16pt;margin:0in 0in 0.0001pt;font-family:Calibri"><span style=3D"font-f=
amily:&quot;Helvetica Neue&quot;;color:black"><span>=C2=A0</span></span></p=
>
        <p class=3D"m_5283853962972203132gmail-MsoNormal" style=3D"line-hei=
ght:16pt;margin:0in 0in 0.0001pt;font-family:Calibri"><span style=3D"font-f=
amily:&quot;Helvetica Neue&quot;;color:black">I
            was trying to create
            mini-os PVH instances both x86_32 and x86_64. I have no
            issue with x86_32 but
            when trying to =E2=80=98xl create=E2=80=99 x86_64 type I get th=
e following
            error:<span></span></span></p>
        <p class=3D"m_5283853962972203132gmail-MsoNormal" style=3D"line-hei=
ght:16pt;margin:0in 0in 0.0001pt;font-family:Calibri"><span style=3D"font-f=
amily:&quot;Helvetica Neue&quot;;color:black"><br>
          </span></p></span>
        &lt;snip&gt;<span class=3D""><span style=3D"font-family:Menlo;color=
:black"><span></span></span>
        <p class=3D"m_5283853962972203132gmail-MsoNormal" style=3D"margin:0=
in 0in 0.0001pt;font-family:Calibri"><span style=3D"font-family:Menlo;color=
:black">xc: error: panic:
            xc_dom_hvmloader.c:113: xc_dom_parse_hvm_kernel: ELF image
            is not 32bit:
            Invalid kernel</span></p>
      </span></div>
    </blockquote>
    <br>
    The domain loader only ever accepts elf32 images, because the
    starting state is 32bit flat mode.<br>
    <br>
    This is how XTF deals with the problem:<br>
    <br>
<a class=3D"m_5283853962972203132moz-txt-link-freetext" href=3D"http://xenb=
its.xen.org/gitweb/?p=3Dxtf.git;a=3Dblob;f=3Dbuild/gen.mk;h=3D8d7a6bf89725f=
edc8343d2e4d3c8e2c93c16811f;hb=3DHEAD#l47" target=3D"_blank">http://xenbits=
.xen.org/gitweb/<wbr>?p=3Dxtf.git;a=3Dblob;f=3Dbuild/gen.<wbr>mk;h=3D<wbr>8=
d7a6bf89725fedc8343d2e4d3c8e2<wbr>c93c16811f;hb=3DHEAD#l47</a><br>
    <br>
    There is a lot of template meta-programming in there, but basically
    after doing the final link, do a further objcopy to convert the
    image to elf32-x86-64 (if available), or elf32-i386.=C2=A0 The former i=
s
    only available if you have an x32 toolchain, and allows the binary
    to load properly and disassemble correctly.<br></div></blockquote><div>=
<br></div><div>Thank you. Doing:</div><div><br></div><div>$objcopy &lt;obj_=
file&gt; -O elf32-x86-64 &lt;new_obj_file&gt;</div><div><br></div><div>=C2=
=A0worked perfectly!</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"#0000=
00" bgcolor=3D"#FFFFFF">
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <p class=3D"m_5283853962972203132gmail-MsoNormal" style=3D"line-hei=
ght:16pt;margin:0in 0in 0.0001pt"><span style=3D"color:black"><span><font f=
ace=3D"arial, helvetica, sans-serif">=C2=A0</font></span></span><span style=
=3D"color:black"><font face=3D"arial, helvetica,
              sans-serif">Happy New Year!</font></span></p>
      </div>
    </blockquote>
    <br>
    Happy new year.<span class=3D"HOEnZb"><font color=3D"#888888"><br>
    <br>
    ~Andrew<br>
  </font></span></div>

</blockquote></div><br></div></div>

--001a11429284c9745b0561c8487e--


--===============0701169526856711055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0701169526856711055==--
