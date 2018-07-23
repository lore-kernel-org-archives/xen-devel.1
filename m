From: Ihor Matushchak <ihor.matushchak@foobox.net>
Subject: Re: [PATCH v1] earlyprintk configuration for rk3399
 boards
Date: Mon, 23 Jul 2018 19:37:05 +0300
Message-ID: <CAFq70MFV58hqdHRLobpL6uZ5fZGX=c2xRyxK5pEP4E_wCoRpaQ@mail.gmail.com>
References: <cover.1530737070.git.ihor.matushchak@foobox.net>
 <74c207f1-b2aa-9c7f-4004-02f9f721f6d6@arm.com>
 <CAFq70MEKa4GSaWprALmjaDyqOJeHUsAkSF-d869X4irhsjLOSQ@mail.gmail.com>
 <223c2116-0788-fb95-f3d1-7da0c3568515@arm.com>
 <CAFq70MG5aKTHYGjEom4HUzJKshkVPd6PScv2JV7H-ygmiZu=Lg@mail.gmail.com>
 <d6883cd0-1138-5df2-34ee-cf9a2774cfcb@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8923545917178424177=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4iug=kh=foobox.net=ihor.matushchak@srs-us1.protection.inumbo.net>)
 id 1fhdpe-0005BU-KR
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 16:37:10 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id C847BF7517
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jul 2018 12:37:07 -0400 (EDT)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id C0315F7516
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jul 2018 12:37:07 -0400 (EDT)
Received: from mail-ed1-f43.google.com (unknown [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 1E8DBF7514
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jul 2018 12:37:07 -0400 (EDT)
Received: by mail-ed1-f43.google.com with SMTP id o8-v6so1493955edt.13
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jul 2018 09:37:07 -0700 (PDT)
In-Reply-To: <d6883cd0-1138-5df2-34ee-cf9a2774cfcb@arm.com>
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

--===============8923545917178424177==
Content-Type: multipart/alternative; boundary="00000000000086e5990571ad4139"

--00000000000086e5990571ad4139
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Julien,

Got it, thanks.

*BR,*
*Ihor Matushchak*

2018-07-23 17:59 GMT+03:00 Julien Grall <julien.grall@arm.com>:

>
>
> On 23/07/18 15:47, Ihor Matushchak wrote:
>
>> Hi Julien,
>>
>
> Hi Ihor,
>
>
>> Sure, I would be glad to do that.
>>
>> I suppose it should be placed somewhere on wiki.xenproject.org <
>> http://wiki.xenproject.org>?
>>
>
> We usually create a new platform under https://wiki.xenproject.org/wi
> ki/Xen_ARM_with_Virtualization_Extensions
>
> We can then add a link on the main page to the documentation of the rk339=
9.
>
> Cheers,
>
> /
>> /
>> /BR,/
>> /Ihor Matushchak/
>>
>> 2018-07-23 17:33 GMT+03:00 Julien Grall <julien.grall@arm.com <mailto:
>> julien.grall@arm.com>>:
>>
>>     On 06/07/18 12:04, =D0=86=D0=B3=D0=BE=D1=80 =D0=9C=D0=B0=D1=82=D1=83=
=D1=89=D0=B0=D0=BA wrote:
>>
>>         Hello Julien,
>>
>>
>>     Hi Ihor,
>>
>>     Sorry for the late reply.
>>
>>
>>         I suppose there is no such documentation, at least I didn't find
>>         any.
>>         Bringing up XEN 4.10.0 on RK3399 is my pet-project.
>>         My current target board is Ibox3399
>>         <https://www.aliexpress.com/item/RK3399-Development-Board-Ib
>> ox3399-2GB-DDR3-16GB-EMMC-Six-Core-A72-A53-Mali-T860-GPU-
>> Android6/32816273232.html
>>         <https://www.aliexpress.com/item/RK3399-Development-Board-Ib
>> ox3399-2GB-DDR3-16GB-EMMC-Six-Core-A72-A53-Mali-T860-GPU-
>> Android6/32816273232.html>>
>>
>>         At the moment I got dom0 running on this board and some test
>>         guest domain (both 4.4 kernels).
>>         Actually no changes made to XEN (except earlyprintk) at the
>>         moment, Xen works from the box.
>>
>>
>>     Glad to see Xen booting out of box on RK3399 :).
>>
>>     The alias is only for convience. It would be possible to do the same
>>     with 8250,0xff1a0000,2.
>>
>>     So instead of that patch, I would suggest to write down a
>>     documentation for booting Xen on the board and early debugging.
>>
>>     What do you think?
>>
>>     Cheers,
>>
>>
>>         /BR,/
>>         /Ihor Matushchak/
>>
>>         2018-07-06 13:36 GMT+03:00 Julien Grall <julien.grall@arm.com
>>         <mailto:julien.grall@arm.com> <mailto:julien.grall@arm.com
>>         <mailto:julien.grall@arm.com>>>:
>>
>>              Hello,
>>
>>              On 04/07/18 21:55, ihor.matushchak@foobox.net
>>         <mailto:ihor.matushchak@foobox.net>
>>              <mailto:ihor.matushchak@foobox.net
>>         <mailto:ihor.matushchak@foobox.net>> wrote:
>>
>>                  From: Ihor Matushchak <ihor.matushchak@foobox.net
>>         <mailto:ihor.matushchak@foobox.net>
>>                  <mailto:ihor.matushchak@foobox.net
>>         <mailto:ihor.matushchak@foobox.net>>>
>>
>>                  This patch enables earlyprintk for Rockchip rk3399
>>         based SoC.
>>
>>              Is there any missing pieces in Xen to boot on Rockchip? I
>>         would also
>>              quite like to see some documentation how to boot Xen on
>>         that platform.
>>
>>              Cheers,
>>
>>
>>
>>                  Ihor Matushchak (1):
>>                      xen:arm:earlyprintk configuration for rk3399 boards
>>
>>                     docs/misc/arm/early-printk.txt | 1 +
>>                     xen/arch/arm/Rules.mk          | 1 +
>>                     2 files changed, 2 insertions(+)
>>
>>
>>              --     Julien Grall
>>
>>
>>
>>     --     Julien Grall
>>
>>
>>
> --
> Julien Grall
>

--00000000000086e5990571ad4139
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Julien,<div><br></div><div>Got it, thanks.</div><div><br><=
/div><div><i>BR,</i></div><div><i>Ihor Matushchak</i></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-07-23 17:59 GMT+03:00 =
Julien Grall <span dir=3D"ltr">&lt;<a href=3D"mailto:julien.grall@arm.com" =
target=3D"_blank">julien.grall@arm.com</a>&gt;</span>:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
<br>
On 23/07/18 15:47, Ihor Matushchak wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Julien,<br>
</blockquote>
<br>
Hi Ihor,<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
<br>
Sure, I would be glad to do that.<br>
<br></span>
I suppose it should be placed somewhere on <a href=3D"http://wiki.xenprojec=
t.org" rel=3D"noreferrer" target=3D"_blank">wiki.xenproject.org</a> &lt;<a =
href=3D"http://wiki.xenproject.org" rel=3D"noreferrer" target=3D"_blank">ht=
tp://wiki.xenproject.org</a>&gt;?<br>
</blockquote>
<br>
We usually create a new platform under <a href=3D"https://wiki.xenproject.o=
rg/wiki/Xen_ARM_with_Virtualization_Extensions" rel=3D"noreferrer" target=
=3D"_blank">https://wiki.xenproject.org/wi<wbr>ki/Xen_ARM_with_Virtualizati=
on<wbr>_Extensions</a><br>
<br>
We can then add a link on the main page to the documentation of the rk3399.=
<br>
<br>
Cheers,<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
/<br>
/<br>
/BR,/<br>
/Ihor Matushchak/<br>
<br>
2018-07-23 17:33 GMT+03:00 Julien Grall &lt;<a href=3D"mailto:julien.grall@=
arm.com" target=3D"_blank">julien.grall@arm.com</a> &lt;mailto:<a href=3D"m=
ailto:julien.grall@arm.com" target=3D"_blank">julien.grall@arm.com</a>&gt;&=
gt;<wbr>:<span class=3D""><br>
<br>
=C2=A0 =C2=A0 On 06/07/18 12:04, =D0=86=D0=B3=D0=BE=D1=80 =D0=9C=D0=B0=D1=
=82=D1=83=D1=89=D0=B0=D0=BA wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hello Julien,<br>
<br>
<br>
=C2=A0 =C2=A0 Hi Ihor,<br>
<br>
=C2=A0 =C2=A0 Sorry for the late reply.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 I suppose there is no such documentation, at le=
ast I didn&#39;t find<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 any.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Bringing up XEN 4.10.0 on RK3399 is my pet-proj=
ect.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 My current target board is Ibox3399<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://www.aliexpress.com/item/=
RK3399-Development-Board-Ibox3399-2GB-DDR3-16GB-EMMC-Six-Core-A72-A53-Mali-=
T860-GPU-Android6/32816273232.html" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.aliexpress.com/it<wbr>em/RK3399-Development-Board-Ib<wbr>ox3399-2=
GB-DDR3-16GB-EMMC-Six-<wbr>Core-A72-A53-Mali-T860-GPU-<wbr>Android6/3281627=
3232.html</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://www.aliexpress.com/item/=
RK3399-Development-Board-Ibox3399-2GB-DDR3-16GB-EMMC-Six-Core-A72-A53-Mali-=
T860-GPU-Android6/32816273232.html" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.aliexpress.com/it<wbr>em/RK3399-Development-Board-Ib<wbr>ox3399-2=
GB-DDR3-16GB-EMMC-Six-<wbr>Core-A72-A53-Mali-T860-GPU-<wbr>Android6/3281627=
3232.html</a>&gt;&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 At the moment I got dom0 running on this board =
and some test<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 guest domain (both 4.4 kernels).<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Actually no changes made to XEN (except earlypr=
intk) at the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 moment, Xen works from the box.<br>
<br>
<br>
=C2=A0 =C2=A0 Glad to see Xen booting out of box on RK3399 :).<br>
<br>
=C2=A0 =C2=A0 The alias is only for convience. It would be possible to do t=
he same<br>
=C2=A0 =C2=A0 with 8250,0xff1a0000,2.<br>
<br>
=C2=A0 =C2=A0 So instead of that patch, I would suggest to write down a<br>
=C2=A0 =C2=A0 documentation for booting Xen on the board and early debuggin=
g.<br>
<br>
=C2=A0 =C2=A0 What do you think?<br>
<br>
=C2=A0 =C2=A0 Cheers,<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /BR,/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /Ihor Matushchak/<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2018-07-06 13:36 GMT+03:00 Julien Grall &lt;<a =
href=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.grall@arm.com=
</a><br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:julien.grall@arm.c=
om" target=3D"_blank">julien.grall@arm.com</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:julien.grall@arm.com" target=3D"_blank">julien.grall@arm.com</a><span =
class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:julien.grall@arm.c=
om" target=3D"_blank">julien.grall@arm.com</a>&gt;&gt;<wbr>&gt;:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Hello,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 On 04/07/18 21:55, <a href=
=3D"mailto:ihor.matushchak@foobox.net" target=3D"_blank">ihor.matushchak@fo=
obox.net</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:ihor.matushchak@fo=
obox.net" target=3D"_blank">ihor.matushchak@foobox<wbr>.net</a>&gt;<br></sp=
an>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailt=
o:ihor.matushchak@foobox.net" target=3D"_blank">ihor.matushchak@foobox<wbr>=
.net</a><span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:ihor.matushchak@fo=
obox.net" target=3D"_blank">ihor.matushchak@foobox<wbr>.net</a>&gt;&gt; wro=
te:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 From: Ihor Ma=
tushchak &lt;<a href=3D"mailto:ihor.matushchak@foobox.net" target=3D"_blank=
">ihor.matushchak@foobox.net</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:ihor.matushchak@fo=
obox.net" target=3D"_blank">ihor.matushchak@foobox<wbr>.net</a>&gt;<br></sp=
an>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a=
 href=3D"mailto:ihor.matushchak@foobox.net" target=3D"_blank">ihor.matushch=
ak@foobox<wbr>.net</a><span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:ihor.matushchak@fo=
obox.net" target=3D"_blank">ihor.matushchak@foobox<wbr>.net</a>&gt;&gt;&gt;=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 This patch en=
ables earlyprintk for Rockchip rk3399<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 based SoC.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Is there any missing pieces=
 in Xen to boot on Rockchip? I<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 would also<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 quite like to see some docu=
mentation how to boot Xen on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 that platform.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Cheers,<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ihor Matushch=
ak (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
=C2=A0xen:arm:earlyprintk configuration for rk3399 boards<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
docs/misc/arm/early-printk.txt | 1 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
xen/arch/arm/Rules.mk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
2 files changed, 2 insertions(+)<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 --=C2=A0 =C2=A0 =C2=A0Julie=
n Grall<br>
<br>
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

--00000000000086e5990571ad4139--


--===============8923545917178424177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8923545917178424177==--
