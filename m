From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH] gic-vgic: skip irqs locking in
 gic_restore_pending_irqs()
Date: Fri, 21 Dec 2018 18:31:30 +0000
Message-ID: <CAF3u54DJvdvMGGCio2_dPoRXkZpV3XjzeN+2GHJr+_QsAzAzrw@mail.gmail.com>
References: <1545416195-23917-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0522753432514096180=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1+vS=O6=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gaPaL-0006gy-MA
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 18:31:45 +0000
Received: by mail-ua1-x944.google.com with SMTP id e16so2007914uam.12
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 10:31:44 -0800 (PST)
In-Reply-To: <1545416195-23917-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

--===============0522753432514096180==
Content-Type: multipart/alternative; boundary="0000000000007dbe64057d8c75f2"

--0000000000007dbe64057d8c75f2
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

Please address my comments from the previous version.

Cheers,


On Fri, 21 Dec 2018, 18:18 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

> From: Andrii Anisov <andrii_anisov@epam.com>
>
> This function is called under IRQs disabled already, so drop additional
> flags save and restore.
>
> Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
>
> ---
>
> This is a half of an RFC patch [1] which relies on the already
> existing code.
>
> [1]
> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03293.html
>
> ---
>  xen/arch/arm/gic-vgic.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> index 48922f5..34179c0 100644
> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -279,11 +279,10 @@ static void gic_restore_pending_irqs(struct vcpu *v)
>      int lr = 0;
>      struct pending_irq *p, *t, *p_r;
>      struct list_head *inflight_r;
> -    unsigned long flags;
>      unsigned int nr_lrs = gic_get_nr_lrs();
>      int lrs = nr_lrs;
>
> -    spin_lock_irqsave(&v->arch.vgic.lock, flags);
> +    spin_lock(&v->arch.vgic.lock);
>
>      if ( list_empty(&v->arch.vgic.lr_pending) )
>          goto out;
> @@ -327,7 +326,7 @@ found:
>      }
>
>  out:
> -    spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
> +    spin_unlock(&v->arch.vgic.lock);
>  }
>
>  void gic_clear_pending_irqs(struct vcpu *v)
> --
> 2.7.4
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000007dbe64057d8c75f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Sorry for the formatting.<br><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Please address my comments from the previous version=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=
=3D"auto"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, 21 De=
c 2018, 18:18 Andrii Anisov, &lt;<a href=3D"mailto:andrii.anisov@gmail.com"=
>andrii.anisov@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">From: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.com" targ=
et=3D"_blank">andrii_anisov@epam.com</a>&gt;<br>
<br>
This function is called under IRQs disabled already, so drop additional<br>
flags save and restore.<br>
<br>
Signed-off-by: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.com" =
target=3D"_blank">andrii_anisov@epam.com</a>&gt;<br>
<br>
---<br>
<br>
This is a half of an RFC patch [1] which relies on the already<br>
existing code.<br>
<br>
[1] <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2018-11=
/msg03293.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproje=
ct.org/archives/html/xen-devel/2018-11/msg03293.html</a><br>
<br>
---<br>
=C2=A0xen/arch/arm/gic-vgic.c | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c<br>
index 48922f5..34179c0 100644<br>
--- a/xen/arch/arm/gic-vgic.c<br>
+++ b/xen/arch/arm/gic-vgic.c<br>
@@ -279,11 +279,10 @@ static void gic_restore_pending_irqs(struct vcpu *v)<=
br>
=C2=A0 =C2=A0 =C2=A0int lr =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0struct pending_irq *p, *t, *p_r;<br>
=C2=A0 =C2=A0 =C2=A0struct list_head *inflight_r;<br>
-=C2=A0 =C2=A0 unsigned long flags;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int nr_lrs =3D gic_get_nr_lrs();<br>
=C2=A0 =C2=A0 =C2=A0int lrs =3D nr_lrs;<br>
<br>
-=C2=A0 =C2=A0 spin_lock_irqsave(&amp;v-&gt;arch.vgic.lock, flags);<br>
+=C2=A0 =C2=A0 spin_lock(&amp;v-&gt;arch.vgic.lock);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( list_empty(&amp;v-&gt;arch.vgic.lr_pending) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
@@ -327,7 +326,7 @@ found:<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0out:<br>
-=C2=A0 =C2=A0 spin_unlock_irqrestore(&amp;v-&gt;arch.vgic.lock, flags);<br=
>
+=C2=A0 =C2=A0 spin_unlock(&amp;v-&gt;arch.vgic.lock);<br>
=C2=A0}<br>
<br>
=C2=A0void gic_clear_pending_irqs(struct vcpu *v)<br>
-- <br>
2.7.4<br>
<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div></div></div>

--0000000000007dbe64057d8c75f2--


--===============0522753432514096180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0522753432514096180==--
