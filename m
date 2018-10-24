From: Eric Duncan <eduncan911@gmail.com>
Subject: Re: [Xen-users] Intel Z270 support
Date: Wed, 24 Oct 2018 09:25:09 -0400
Message-ID: <CACaqnaSSq8=j1wF_+_O1Zc2vW_ebN6ACRdbB5KLdcOcPAZnO1Q__36639.2638454728$1540388184$gmane$org@mail.gmail.com>
References: <CANkmNDfWfZt_17ewcHX0=EkvpymqVGLSDyd6uyObr7rOHc9tig@mail.gmail.com>
Reply-To: eduncan911@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7037555469178532543=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=u2dc=ne=gmail.com=eduncan911@srs-us1.protection.inumbo.net>)
 id 1gFJAX-0007tK-IF
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 13:25:53 +0000
In-Reply-To: <CANkmNDfWfZt_17ewcHX0=EkvpymqVGLSDyd6uyObr7rOHc9tig@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Aaron Gray <aaronngray.lists@gmail.com>
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============7037555469178532543==
Content-Type: multipart/alternative; boundary="000000000000dd5e890578f96cd5"

--000000000000dd5e890578f96cd5
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 18, 2018 at 2:03 PM Aaron Gray wrote:

> I have two ASUS PRIME Z270-A machines based on Intel Z270 chipset and am
> wondering about when support will be available for them and what I can do
> to speed this up.
>
> But I have not done anything to do with kernel work since years ago when I
> read a lot of the main parts of the Linux 2.4 Kernel. Also I did code to
> get into and out of protected mode before this.
>
> Heres the datasheets that cover the chipset :-
>
>
> https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-1.html
>
> https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-2.html
>
> Regards,
>
> Aaron
>

It's your Linux kernel that needs to support your hardware, not Xen itself.

I personally run Xen with an Arch Linux dom0 specifically for this purpose
of getting the latest hardware support across my devices.  For example, I
am on kernel 4.18.10 at this moment.  The AUR also keeps a fairly recent
version of Xen, currently 4.11.

-E

--000000000000dd5e890578f96cd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Oc=
t 18, 2018 at 2:03 PM Aaron Gray wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>I have two ASU=
S PRIME Z270-A machines based on Intel Z270 chipset and am wondering about =
when support will be available for them and what I can do to speed this up.=
</div><div><br></div><div>But I have not done anything to do with kernel wo=
rk since years ago when I read a lot of the main parts of the Linux 2.4 Ker=
nel. Also I did code to get into and out of protected mode before this.</di=
v><div><br></div><div>Heres the datasheets that cover the chipset :-</div><=
div><br></div><div><a href=3D"https://www.intel.com/content/www/us/en/chips=
ets/200-series-chipset-pch-datasheet-vol-1.html" target=3D"_blank">https://=
www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-v=
ol-1.html</a></div><div><a href=3D"https://www.intel.com/content/www/us/en/=
chipsets/200-series-chipset-pch-datasheet-vol-2.html" target=3D"_blank">htt=
ps://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datash=
eet-vol-2.html</a></div><div><br></div><div>Regards,</div><div><br></div><d=
iv>Aaron</div></div></div></div></blockquote><div><br></div><div>It&#39;s y=
our Linux kernel that needs to support your hardware, not Xen itself.</div>=
<div><br></div><div>I personally run Xen with an Arch Linux dom0 specifical=
ly for this purpose of getting the latest hardware support across my device=
s.=C2=A0 For example, I am on kernel 4.18.10 at this moment.=C2=A0 The AUR =
also keeps a fairly recent version of Xen, currently 4.11.</div><div><br></=
div><div>-E</div></div></div>

--000000000000dd5e890578f96cd5--


--===============7037555469178532543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7037555469178532543==--
