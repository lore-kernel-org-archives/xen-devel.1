From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] gic-vgic: fix assert condition
Date: Fri, 25 Jan 2019 09:11:06 +0200
Message-ID: <CAC1Wxdi2Azrn3X+Hp9HmpX1zr5WmVCQpfXMD19AUDveUs-3p-A@mail.gmail.com>
References: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
 <CAF3u54DxzP=z7P1YE9XK4mMpgQqQxUTi2CT3nmUfucXn1RdO8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4441803811637676181=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qSih=QB=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gmve3-0006Sy-UG
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 07:11:19 +0000
Received: by mail-oi1-x234.google.com with SMTP id t204so6981092oie.7
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jan 2019 23:11:18 -0800 (PST)
In-Reply-To: <CAF3u54DxzP=z7P1YE9XK4mMpgQqQxUTi2CT3nmUfucXn1RdO8Q@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============4441803811637676181==
Content-Type: multipart/alternative; boundary="0000000000008532e105804308d7"

--0000000000008532e105804308d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Julien,



=D1=87=D1=82, 24 =D1=81=D1=96=D1=87. 2019, 21:27 Julien Grall =D0=BA=D0=BE=
=D1=80=D0=B8=D1=81=D1=82=D1=83=D0=B2=D0=B0=D1=87 julien.grall@gmail.com =D0=
=BF=D0=B8=D1=88=D0=B5:

> (sorry for the formatting)
>
> On Thu, 24 Jan 2019, 18:35 Andrii Anisov, <andrii.anisov@gmail.com> wrote=
:
>
>> From: Andrii Anisov <andrii_anisov@epam.com>
>>
>
> Empty commit message should only happen when the title provide enough
> information.
>
> In that case, you should explain how you hit the assert so the reviewers
> can understand the change.
>

It was an extremely rare an totally unusual use-case, which nobody else
needs.
I did reboot a guest domain with a device passthroughed to it.


>
> Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
>> ---
>>  xen/arch/arm/gic-vgic.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
>> index 48922f5..684f2d1 100644
>> --- a/xen/arch/arm/gic-vgic.c
>> +++ b/xen/arch/arm/gic-vgic.c
>> @@ -443,7 +443,7 @@ int vgic_connect_hw_irq(struct domain *d, storuct
>> vcpu *v, unsigned int virq,
>>      int ret =3D 0;
>>
>>      /* "desc" is optional when we disconnect an IRQ. */
>> -    ASSERT(connect && desc);
>> +    ASSERT(connect || desc);
>
>
> This looks wrong to me. Now you allow desc to be NULL when connecting an
> IRQ.
>
Yes, sure, the original check is much better: it doesn't allow
disconnecting at all.

This does not even match the comment above.
>
Being upset I mistakingly set another wrong condition. Stefan instead
suggested the right one.

Sent from my Android.

>

--0000000000008532e105804308d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Dear Julien,<br><br><div data-smartmail=3D"gmail_signatur=
e" dir=3D"auto"><br></div><br><div class=3D"gmail_quote" dir=3D"auto"><div =
dir=3D"ltr">=D1=87=D1=82, 24 =D1=81=D1=96=D1=87. 2019, 21:27 Julien Grall =
=D0=BA=D0=BE=D1=80=D0=B8=D1=81=D1=82=D1=83=D0=B2=D0=B0=D1=87 <a href=3D"mai=
lto:julien.grall@gmail.com" target=3D"_blank" rel=3D"noreferrer">julien.gra=
ll@gmail.com</a> =D0=BF=D0=B8=D1=88=D0=B5:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span>(sorry for the formatting)</span><div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Thu, 24 Jan 2019, 18:35 Andrii Anisov, &lt;<a h=
ref=3D"mailto:andrii.anisov@gmail.com" rel=3D"noreferrer noreferrer" target=
=3D"_blank">andrii.anisov@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">From: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epa=
m.com" rel=3D"noreferrer noreferrer" target=3D"_blank">andrii_anisov@epam.c=
om</a>&gt;<br></blockquote></div></div><div><br></div><div>Empty commit mes=
sage should only happen when the title provide enough information.</div><di=
v><br></div><div>In that case, you should explain how you hit the assert so=
 the reviewers can understand the change.</div></blockquote></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">It was an extremely rare an totally u=
nusual use-case, which nobody else needs.</div><div dir=3D"auto">I did rebo=
ot a guest domain with a device passthroughed to it.</div><div dir=3D"auto"=
><br></div><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div><br></div><div><br></div><div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
Signed-off-by: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.com" =
rel=3D"noreferrer noreferrer" target=3D"_blank">andrii_anisov@epam.com</a>&=
gt;<br>
---<br>
=C2=A0xen/arch/arm/gic-vgic.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c<br>
index 48922f5..684f2d1 100644<br>
--- a/xen/arch/arm/gic-vgic.c<br>
+++ b/xen/arch/arm/gic-vgic.c<br>
@@ -443,7 +443,7 @@ int vgic_connect_hw_irq(struct domain *d, storuct vcpu =
*v, unsigned int virq,<br>
=C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* &quot;desc&quot; is optional when we disconnect an I=
RQ. */<br>
-=C2=A0 =C2=A0 ASSERT(connect &amp;&amp; desc);<br>
+=C2=A0 =C2=A0 ASSERT(connect || desc);</blockquote></div></div><div><br></=
div><div>This looks wrong to me. Now you allow desc to be NULL when connect=
ing an IRQ.</div></blockquote></div><div dir=3D"auto">Yes, sure, the origin=
al check is much better: it doesn&#39;t allow disconnecting at all.</div><d=
iv dir=3D"auto"><br></div><div class=3D"gmail_quote" dir=3D"auto"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div> This does not even match the comment above.</di=
v></blockquote></div><div dir=3D"auto">Being upset I mistakingly set anothe=
r wrong condition. Stefan instead suggested the right one.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">S=
ent from my Android.</span><br></div><div class=3D"gmail_quote" dir=3D"auto=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
</blockquote></div></div>

--0000000000008532e105804308d7--


--===============4441803811637676181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4441803811637676181==--
