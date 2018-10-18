From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Intel Z270 support
Date: Thu, 18 Oct 2018 23:42:18 +0100
Message-ID: <f5a989eb-2f4b-cb04-9126-0ad2fbf49e21@citrix.com>
References: <CANkmNDfWfZt_17ewcHX0=EkvpymqVGLSDyd6uyObr7rOHc9tig@mail.gmail.com>
 <375d8065-e141-4cd7-e051-e0f698d76e96@citrix.com>
 <CANkmNDfjr+2xJ9XOv=ktVnSYiquHeT6PSmBDLW1agOTyp-17KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5043580122365052672=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=adce=m6=citrix.com=prvs=822574e18=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gDGzn-0001pZ-56
 for xen-devel@lists.xenproject.org; Thu, 18 Oct 2018 22:42:23 +0000
In-Reply-To: <CANkmNDfjr+2xJ9XOv=ktVnSYiquHeT6PSmBDLW1agOTyp-17KQ@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Aaron Gray <aaronngray.lists@gmail.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5043580122365052672==
Content-Type: multipart/alternative;
	boundary="------------BB5F77A30A24B23F80892B4D"
Content-Language: en-GB

--------------BB5F77A30A24B23F80892B4D
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 18/10/2018 19:45, Aaron Gray wrote:
> On Thu, 18 Oct 2018 at 19:11, Andrew Cooper <andrew.cooper3@citrix.com
> <mailto:andrew.cooper3@citrix.com>> wrote:
>
>     On 18/10/2018 18:57, Aaron Gray wrote:
>     > I have two ASUS PRIME Z270-A machines based on Intel Z270
>     chipset and
>     > am wondering about when support will be available for them and
>     what I
>     > can do to speed this up.
>     >
>     > But I have not done anything to do with kernel work since years ago
>     > when I read a lot of the main parts of the Linux 2.4 Kernel. Also I
>     > did code to get into and out of protected mode before this.
>     >
>     > Heres the datasheets that cover the chipset :-
>     >
>     >
>     https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-1.html
>     >
>     https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-2.html
>     >
>
>     Xen doesn't have a list of individual support chips/systems, because
>     kernels don't really work like that.  We work feature by feature, or
>     device by device.
>
>     You appear to have a Broadwell-era system.  Any recent Linux distro
>     should work for you, including the provided Xen package.
>
>
> I tried installing Xen 4.9 provided with Fedora 28 but it did not
> work. Can I get support with this please ?

What didn't work.  What went wrong?

What logs do you have from the attempt?

We're not mind readers.  Noone here can divine the cause of your failure
from nothing.

~Andrew

--------------BB5F77A30A24B23F80892B4D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 18/10/2018 19:45, Aaron Gray wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANkmNDfjr+2xJ9XOv=ktVnSYiquHeT6PSmBDLW1agOTyp-17KQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr">On Thu, 18 Oct 2018 at 19:11, Andrew Cooper
            &lt;<a href="mailto:andrew.cooper3@citrix.com"
              moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">On
            18/10/2018 18:57, Aaron Gray wrote:<br>
            &gt; I have two ASUS PRIME Z270-A machines based on Intel
            Z270 chipset and<br>
            &gt; am wondering about when support will be available for
            them and what I<br>
            &gt; can do to speed this up.<br>
            &gt;<br>
            &gt; But I have not done anything to do with kernel work
            since years ago<br>
            &gt; when I read a lot of the main parts of the Linux 2.4
            Kernel. Also I<br>
            &gt; did code to get into and out of protected mode before
            this.<br>
            &gt;<br>
            &gt; Heres the datasheets that cover the chipset :-<br>
            &gt;<br>
            &gt; <a
href="https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-1.html"
              target="_blank" rel="noreferrer" moz-do-not-send="true">https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-1.html</a><br>
            &gt; <a
href="https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-2.html"
              target="_blank" rel="noreferrer" moz-do-not-send="true">https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-2.html</a><br>
            &gt;<br>
            <br>
            Xen doesn't have a list of individual support chips/systems,
            because<br>
            kernels don't really work like that.  We work feature by
            feature, or<br>
            device by device.<br>
            <br>
            You appear to have a Broadwell-era system.  Any recent Linux
            distro<br>
            should work for you, including the provided Xen package.</blockquote>
          <div><br>
          </div>
          <div>I tried installing Xen 4.9 provided with Fedora 28 but it
            did not work. Can I get support with this please ?</div>
        </div>
      </div>
    </blockquote>
    <br>
    What didn't work.  What went wrong?<br>
    <br>
    What logs do you have from the attempt?<br>
    <br>
    We're not mind readers.  Noone here can divine the cause of your
    failure from nothing.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------BB5F77A30A24B23F80892B4D--


--===============5043580122365052672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5043580122365052672==--
