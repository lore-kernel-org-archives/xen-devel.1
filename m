From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH for-4.12] gic-vgic: fix assert condition
Date: Thu, 24 Jan 2019 19:27:43 +0000
Message-ID: <CAF3u54DxzP=z7P1YE9XK4mMpgQqQxUTi2CT3nmUfucXn1RdO8Q@mail.gmail.com>
References: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2791710247981733806=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aej+=QA=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gmkfO-0001gw-Bo
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 19:27:58 +0000
Received: by mail-ua1-x941.google.com with SMTP id v24so2393445uap.13
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jan 2019 11:27:56 -0800 (PST)
In-Reply-To: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2791710247981733806==
Content-Type: multipart/alternative; boundary="00000000000011b89205803935df"

--00000000000011b89205803935df
Content-Type: text/plain; charset="UTF-8"

(sorry for the formatting)

On Thu, 24 Jan 2019, 18:35 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

> From: Andrii Anisov <andrii_anisov@epam.com>
>

Empty commit message should only happen when the title provide enough
information.

In that case, you should explain how you hit the assert so the reviewers
can understand the change.


Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
> ---
>  xen/arch/arm/gic-vgic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> index 48922f5..684f2d1 100644
> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -443,7 +443,7 @@ int vgic_connect_hw_irq(struct domain *d, storuct vcpu
> *v, unsigned int virq,
>      int ret = 0;
>
>      /* "desc" is optional when we disconnect an IRQ. */
> -    ASSERT(connect && desc);
> +    ASSERT(connect || desc);


This looks wrong to me. Now you allow desc to be NULL when connecting an
IRQ. This does not even match the comment above.

Without a meaningful commit message, this hard to understand the reasoning
behind the modification.

Cheers,

--00000000000011b89205803935df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>(sorry for the formatting)</span><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Thu, 24 Jan 2019, 18:35 Andrii Anisov, &lt;<a href=3D"m=
ailto:andrii.anisov@gmail.com">andrii.anisov@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">From: Andrii Anisov &lt;<a href=3D"mailt=
o:andrii_anisov@epam.com" target=3D"_blank">andrii_anisov@epam.com</a>&gt;<=
br></blockquote></div></div><div><br></div><div>Empty commit message should=
 only happen when the title provide enough information.</div><div><br></div=
><div>In that case, you should explain how you hit the assert so the review=
ers can understand the change.</div><div><br></div><div><br></div><div><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.com" =
target=3D"_blank">andrii_anisov@epam.com</a>&gt;<br>
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
ing an IRQ. This does not even match the comment above.</div><div><br></div=
><div>Without a meaningful commit message, this hard to understand the reas=
oning behind the modification.</div><div><br></div><div>Cheers,</div>

--00000000000011b89205803935df--


--===============2791710247981733806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2791710247981733806==--
