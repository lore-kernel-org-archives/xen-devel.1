From: Ihor Matushchak <ihor.matushchak@foobox.net>
Subject: Re: [PATCH v1] earlyprintk configuration for rk3399
 boards
Date: Mon, 23 Jul 2018 17:47:58 +0300
Message-ID: <CAFq70MG5aKTHYGjEom4HUzJKshkVPd6PScv2JV7H-ygmiZu=Lg@mail.gmail.com>
References: <cover.1530737070.git.ihor.matushchak@foobox.net>
 <74c207f1-b2aa-9c7f-4004-02f9f721f6d6@arm.com>
 <CAFq70MEKa4GSaWprALmjaDyqOJeHUsAkSF-d869X4irhsjLOSQ@mail.gmail.com>
 <223c2116-0788-fb95-f3d1-7da0c3568515@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4088687767672960112=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4iug=kh=foobox.net=ihor.matushchak@srs-us1.protection.inumbo.net>)
 id 1fhc82-00040I-Sh
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 14:48:03 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 73E4DF5C8B
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jul 2018 10:48:00 -0400 (EDT)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 5E897F5C8A
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jul 2018 10:48:00 -0400 (EDT)
Received: from mail-ed1-f49.google.com (unknown [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id B50B9F5C85
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jul 2018 10:47:59 -0400 (EDT)
Received: by mail-ed1-f49.google.com with SMTP id f23-v6so1197000edr.11
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jul 2018 07:47:59 -0700 (PDT)
In-Reply-To: <223c2116-0788-fb95-f3d1-7da0c3568515@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?B?0IbQs9C+0YAg0JzQsNGC0YPRidCw0Lo=?= <i.matushchak@foobox.net>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============4088687767672960112==
Content-Type: multipart/alternative; boundary="00000000000044d3000571abbb6d"

--00000000000044d3000571abbb6d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Sure, I would be glad to do that.

I suppose it should be placed somewhere on wiki.xenproject.org?

*BR,*
*Ihor Matushchak*

2018-07-23 17:33 GMT+03:00 Julien Grall <julien.grall@arm.com>:

> On 06/07/18 12:04, =D0=86=D0=B3=D0=BE=D1=80 =D0=9C=D0=B0=D1=82=D1=83=D1=
=89=D0=B0=D0=BA wrote:
>
>> Hello Julien,
>>
>
> Hi Ihor,
>
> Sorry for the late reply.
>
>
>> I suppose there is no such documentation, at least I didn't find any.
>> Bringing up XEN 4.10.0 on RK3399 is my pet-project.
>> My current target board is Ibox3399 <https://www.aliexpress.com/it
>> em/RK3399-Development-Board-Ibox3399-2GB-DDR3-16GB-EMMC-Six-
>> Core-A72-A53-Mali-T860-GPU-Android6/32816273232.html>
>>
>> At the moment I got dom0 running on this board and some test guest domai=
n
>> (both 4.4 kernels).
>> Actually no changes made to XEN (except earlyprintk) at the moment, Xen
>> works from the box.
>>
>
> Glad to see Xen booting out of box on RK3399 :).
>
> The alias is only for convience. It would be possible to do the same with
> 8250,0xff1a0000,2.
>
> So instead of that patch, I would suggest to write down a documentation
> for booting Xen on the board and early debugging.
>
> What do you think?
>
> Cheers,
>
>
>> /BR,/
>> /Ihor Matushchak/
>>
>> 2018-07-06 13:36 GMT+03:00 Julien Grall <julien.grall@arm.com <mailto:
>> julien.grall@arm.com>>:
>>
>>     Hello,
>>
>>     On 04/07/18 21:55, ihor.matushchak@foobox.net
>>     <mailto:ihor.matushchak@foobox.net> wrote:
>>
>>         From: Ihor Matushchak <ihor.matushchak@foobox.net
>>         <mailto:ihor.matushchak@foobox.net>>
>>
>>         This patch enables earlyprintk for Rockchip rk3399 based SoC.
>>
>>     Is there any missing pieces in Xen to boot on Rockchip? I would also
>>     quite like to see some documentation how to boot Xen on that platfor=
m.
>>
>>     Cheers,
>>
>>
>>
>>         Ihor Matushchak (1):
>>             xen:arm:earlyprintk configuration for rk3399 boards
>>
>>            docs/misc/arm/early-printk.txt | 1 +
>>            xen/arch/arm/Rules.mk          | 1 +
>>            2 files changed, 2 insertions(+)
>>
>>
>>     --     Julien Grall
>>
>>
>>
> --
> Julien Grall
>

--00000000000044d3000571abbb6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien,</div><div><br></div><div>Sure, I would be =
glad to do that.</div><div><br></div><div>I suppose it should be placed som=
ewhere on <a href=3D"http://wiki.xenproject.org">wiki.xenproject.org</a>?</=
div><div><i><br></i></div><div><i>BR,</i></div><div><i>Ihor Matushchak</i><=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-0=
7-23 17:33 GMT+03:00 Julien Grall <span dir=3D"ltr">&lt;<a href=3D"mailto:j=
ulien.grall@arm.com" target=3D"_blank">julien.grall@arm.com</a>&gt;</span>:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On 06/07/18 12:04, =D0=86=D0=B3=D0=BE=D1=
=80 =D0=9C=D0=B0=D1=82=D1=83=D1=89=D0=B0=D0=BA wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hello Julien,<br>
</blockquote>
<br>
Hi Ihor,<br>
<br>
Sorry for the late reply.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
<br>
I suppose there is no such documentation, at least I didn&#39;t find any.<b=
r>
Bringing up XEN 4.10.0 on RK3399 is my pet-project.<br></span>
My current target board is Ibox3399 &lt;<a href=3D"https://www.aliexpress.c=
om/item/RK3399-Development-Board-Ibox3399-2GB-DDR3-16GB-EMMC-Six-Core-A72-A=
53-Mali-T860-GPU-Android6/32816273232.html" rel=3D"noreferrer" target=3D"_b=
lank">https://www.aliexpress.com/it<wbr>em/RK3399-Development-Board-Ib<wbr>=
ox3399-2GB-DDR3-16GB-EMMC-Six-<wbr>Core-A72-A53-Mali-T860-GPU-<wbr>Android6=
/32816273232.html</a>&gt;<span class=3D""><br>
<br>
At the moment I got dom0 running on this board and some test guest domain (=
both 4.4 kernels).<br>
Actually no changes made to XEN (except earlyprintk) at the moment, Xen wor=
ks from the box.<br>
</span></blockquote>
<br>
Glad to see Xen booting out of box on RK3399 :).<br>
<br>
The alias is only for convience. It would be possible to do the same with 8=
250,0xff1a0000,2.<br>
<br>
So instead of that patch, I would suggest to write down a documentation for=
 booting Xen on the board and early debugging.<br>
<br>
What do you think?<br>
<br>
Cheers,<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
/BR,/<br>
/Ihor Matushchak/<br>
<br>
2018-07-06 13:36 GMT+03:00 Julien Grall &lt;<a href=3D"mailto:julien.grall@=
arm.com" target=3D"_blank">julien.grall@arm.com</a> &lt;mailto:<a href=3D"m=
ailto:julien.grall@arm.com" target=3D"_blank">julien.grall@arm.com</a>&gt;&=
gt;<wbr>:<span class=3D""><br>
<br>
=C2=A0 =C2=A0 Hello,<br>
<br>
=C2=A0 =C2=A0 On 04/07/18 21:55, <a href=3D"mailto:ihor.matushchak@foobox.n=
et" target=3D"_blank">ihor.matushchak@foobox.net</a><br></span><span class=
=3D"">
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:ihor.matushchak@foobox.net" targ=
et=3D"_blank">ihor.matushchak@foobox<wbr>.net</a>&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 From: Ihor Matushchak &lt;<a href=3D"mailto:iho=
r.matushchak@foobox.net" target=3D"_blank">ihor.matushchak@foobox.net</a><b=
r></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:ihor.matushchak@fo=
obox.net" target=3D"_blank">ihor.matushchak@foobox<wbr>.net</a>&gt;&gt;<spa=
n class=3D""><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 This patch enables earlyprintk for Rockchip rk3=
399 based SoC.<br>
<br>
=C2=A0 =C2=A0 Is there any missing pieces in Xen to boot on Rockchip? I wou=
ld also<br>
=C2=A0 =C2=A0 quite like to see some documentation how to boot Xen on that =
platform.<br>
<br>
=C2=A0 =C2=A0 Cheers,<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ihor Matushchak (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0xen:arm:earlyprintk configur=
ation for rk3399 boards<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 docs/misc/arm/early-printk.txt | 1=
 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 xen/arch/arm/Rules.mk=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 2 files changed, 2 insertions(+)<b=
r>
<br>
<br>
=C2=A0 =C2=A0 --=C2=A0 =C2=A0 =C2=A0Julien Grall<br>
<br>
<br>
</span></blockquote><span class=3D"HOEnZb"><font color=3D"#888888">
<br>
-- <br>
Julien Grall<br>
</font></span></blockquote></div><br></div>

--00000000000044d3000571abbb6d--


--===============4088687767672960112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4088687767672960112==--
