From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Problem creating x86_64 PVH mini-os domain
Date: Sun, 31 Dec 2017 17:12:52 +0000
Message-ID: <ec95e89a-a4ef-6701-d7c2-e16d8fcb74e1@citrix.com>
References: <CADNMjEBvi8P9OxeVfYH8nev+kwsGne=wjSeUQ0T=meUi20kTsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3741017634737786973=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rj2g=d3=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1eVhAY-00009v-7w
 for xen-devel@lists.xenproject.org; Sun, 31 Dec 2017 17:13:06 +0000
In-Reply-To: <CADNMjEBvi8P9OxeVfYH8nev+kwsGne=wjSeUQ0T=meUi20kTsw@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bruno Alvisio <bruno.alvisio@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============3741017634737786973==
Content-Type: multipart/alternative;
 boundary="------------E87E4FDDC3CC527647B16CFE"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------E87E4FDDC3CC527647B16CFE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 31/12/2017 15:19, Bruno Alvisio wrote:
>
> Hi all,
>
>  
>
> I was trying to create mini-os PVH instances both x86_32 and x86_64. I
> have no issue with x86_32 but when trying to ‘xl create’ x86_64 type I
> get the following error:
>
>
> <snip>
>
> xc: error: panic: xc_dom_hvmloader.c:113: xc_dom_parse_hvm_kernel: ELF
> image is not 32bit: Invalid kernel
>

The domain loader only ever accepts elf32 images, because the starting
state is 32bit flat mode.

This is how XTF deals with the problem:

http://xenbits.xen.org/gitweb/?p=xtf.git;a=blob;f=build/gen.mk;h=8d7a6bf89725fedc8343d2e4d3c8e2c93c16811f;hb=HEAD#l47

There is a lot of template meta-programming in there, but basically
after doing the final link, do a further objcopy to convert the image to
elf32-x86-64 (if available), or elf32-i386.  The former is only
available if you have an x32 toolchain, and allows the binary to load
properly and disassemble correctly.

>  Happy New Year!
>

Happy new year.

~Andrew

--------------E87E4FDDC3CC527647B16CFE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 31/12/2017 15:19, Bruno Alvisio
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADNMjEBvi8P9OxeVfYH8nev+kwsGne=wjSeUQ0T=meUi20kTsw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <p class="gmail-MsoNormal" style="line-height:16pt;margin:0in
          0in 0.0001pt;font-family:Calibri"><span
            style="font-family:&quot;Helvetica Neue&quot;;color:black">Hi
            all,</span></p>
        <p class="gmail-MsoNormal" style="line-height:16pt;margin:0in
          0in 0.0001pt;font-family:Calibri"><span
            style="font-family:&quot;Helvetica Neue&quot;;color:black"><span> </span></span></p>
        <p class="gmail-MsoNormal" style="line-height:16pt;margin:0in
          0in 0.0001pt;font-family:Calibri"><span
            style="font-family:&quot;Helvetica Neue&quot;;color:black">I
            was trying to create
            mini-os PVH instances both x86_32 and x86_64. I have no
            issue with x86_32 but
            when trying to ‘xl create’ x86_64 type I get the following
            error:<span></span></span></p>
        <p class="gmail-MsoNormal" style="line-height:16pt;margin:0in
          0in 0.0001pt;font-family:Calibri"><span
            style="font-family:&quot;Helvetica Neue&quot;;color:black"><br>
          </span></p>
        &lt;snip&gt;<span style="font-family:Menlo;color:black"><span></span></span>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><span
            style="font-family:Menlo;color:black">xc: error: panic:
            xc_dom_hvmloader.c:113: xc_dom_parse_hvm_kernel: ELF image
            is not 32bit:
            Invalid kernel</span></p>
      </div>
    </blockquote>
    <br>
    The domain loader only ever accepts elf32 images, because the
    starting state is 32bit flat mode.<br>
    <br>
    This is how XTF deals with the problem:<br>
    <br>
<a class="moz-txt-link-freetext" href="http://xenbits.xen.org/gitweb/?p=xtf.git;a=blob;f=build/gen.mk;h=8d7a6bf89725fedc8343d2e4d3c8e2c93c16811f;hb=HEAD#l47">http://xenbits.xen.org/gitweb/?p=xtf.git;a=blob;f=build/gen.mk;h=8d7a6bf89725fedc8343d2e4d3c8e2c93c16811f;hb=HEAD#l47</a><br>
    <br>
    There is a lot of template meta-programming in there, but basically
    after doing the final link, do a further objcopy to convert the
    image to elf32-x86-64 (if available), or elf32-i386.  The former is
    only available if you have an x32 toolchain, and allows the binary
    to load properly and disassemble correctly.<br>
    <br>
    <blockquote type="cite"
cite="mid:CADNMjEBvi8P9OxeVfYH8nev+kwsGne=wjSeUQ0T=meUi20kTsw@mail.gmail.com">
      <div dir="ltr">
        <p class="gmail-MsoNormal" style="line-height:16pt;margin:0in
          0in 0.0001pt"><span style="color:black"><span><font
                face="arial, helvetica, sans-serif"> </font></span></span><span
            style="color:black"><font face="arial, helvetica,
              sans-serif">Happy New Year!</font></span></p>
      </div>
    </blockquote>
    <br>
    Happy new year.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------E87E4FDDC3CC527647B16CFE--


--===============3741017634737786973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3741017634737786973==--
