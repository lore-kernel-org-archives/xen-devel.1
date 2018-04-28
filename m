From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [cubieboard2] Bringing up dom0
Date: Sat, 28 Apr 2018 18:27:22 +0100
Message-ID: <7c64b5a9-d11e-414b-52df-4db92d992526@citrix.com>
References: <CAHP4M8XeGY0S-HyLprND0R26hQsNd9k4-upM7MFDrodx0vomqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8060232861660228695=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=plwu=hr=citrix.com=prvs=649490be4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fCTd8-0006rB-CD
 for xen-devel@lists.xenproject.org; Sat, 28 Apr 2018 17:27:26 +0000
In-Reply-To: <CAHP4M8XeGY0S-HyLprND0R26hQsNd9k4-upM7MFDrodx0vomqA@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ajay Garg <ajaygargnsit@gmail.com>, xen-devel@lists.xenproject.org, Xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============8060232861660228695==
Content-Type: multipart/alternative;
	boundary="------------55117BE11E59AE312EF2F1A4"
Content-Language: en-GB

--------------55117BE11E59AE312EF2F1A4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 28/04/18 18:12, Ajay Garg wrote:
> Hi All.
>
> We have brought up the cubieboard2 from almost scratch, following are
> the steps done :
>
> <snip>
>
> == getting xen ready ==
>
> i)
> Compiled xen on cubieboard itself, via :
>
>    * git clone git://xenbits.xen.org/xen.git
> <http://xenbits.xen.org/xen.git>
>    * cd xen
> .  * ./configure --libdir=/usr/lib
>    * make debball CONFIG_EARLY_PRINTK=sun7i -j4
>    * sudo dpkg -i dist/xen-upstream-4.11-unstable.deb
>    * sudo reboot
>
> ii)
> Upon reboot, "sudo xl list" gives following :
>
> ##################################################################
> debian@debian-armhf:~$ sudo  xl list
> [sudo] password for debian:
> xencall: error: Could not obtain handle on privileged command
> interface: No such file or directory
> libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle:
> No such file or directory
> cannot init xl context
> ##################################################################

This means that /dev/xen/privcmd (or the legacy /proc/xen/privcmd)
device isn't available.

First check that you have actually booted Xen with Linux as dom0.  You
don't show any logs in this final section, and simply installing the
debball and rebooting won't typically cause Xen to be the head of the
boot list.

Beyond that, double check your Linux kernel configuration options when
it comes to Xen support.

~Andrew

--------------55117BE11E59AE312EF2F1A4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 28/04/18 18:12, Ajay Garg wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHP4M8XeGY0S-HyLprND0R26hQsNd9k4-upM7MFDrodx0vomqA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div>Hi All.<br>
          <br>
          We have brought up the cubieboard2 from almost scratch,
          following are the steps done :<br>
          <br>
          &lt;snip&gt;</div>
        <div><br>
          == getting xen ready ==<br>
          <br>
        </div>
        <div>i)<br>
        </div>
        <div>Compiled xen on cubieboard itself, via :<br>
          <br>
             * git clone git://<a href="http://xenbits.xen.org/xen.git"
            moz-do-not-send="true">xenbits.xen.org/xen.git</a><br>
             * cd xen<br>
          .  * ./configure --libdir=/usr/lib<br>
             * make debball CONFIG_EARLY_PRINTK=sun7i -j4<br>
        </div>
        <div>   * sudo dpkg -i dist/xen-upstream-4.11-unstable.deb<br>
        </div>
        <div>   * sudo reboot<br>
          <br>
        </div>
        <div>ii)<br>
        </div>
        <div>Upon reboot, "sudo xl list" gives following :<br>
          <br>
##################################################################<br>
          debian@debian-armhf:~$ sudo  xl list<br>
          [sudo] password for debian:<br>
          xencall: error: Could not obtain handle on privileged command
          interface: No such file or directory<br>
          libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc
          handle: No such file or directory<br>
          cannot init xl context<br>
##################################################################<br>
        </div>
      </div>
    </blockquote>
    <br>
    This means that /dev/xen/privcmd (or the legacy /proc/xen/privcmd)
    device isn't available.<br>
    <br>
    First check that you have actually booted Xen with Linux as dom0. 
    You don't show any logs in this final section, and simply installing
    the debball and rebooting won't typically cause Xen to be the head
    of the boot list.<br>
    <br>
    Beyond that, double check your Linux kernel configuration options
    when it comes to Xen support.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------55117BE11E59AE312EF2F1A4--


--===============8060232861660228695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8060232861660228695==--
