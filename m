From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH] gic:vgic: avoid excessive conversions
Date: Mon, 19 Nov 2018 13:54:43 +0000
Message-ID: <CAF3u54Agc7Yw5KRfaiLdP7pb06_Pj-RcajD+VUFsQJCwMyb7TA@mail.gmail.com>
References: <1542386727-30311-1-git-send-email-andrii.anisov@gmail.com>
 <fb41738a-282e-a633-ff60-ac3fca664cee@arm.com>
 <81077db3-73a0-6037-cb20-a5dd1510c95e@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5633925595444749573=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mub4=n6=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gOk0w-0007cz-MH
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 13:54:58 +0000
Received: by mail-ua1-x92d.google.com with SMTP id d2so6654969ual.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Nov 2018 05:54:57 -0800 (PST)
In-Reply-To: <81077db3-73a0-6037-cb20-a5dd1510c95e@gmail.com>
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

--===============5633925595444749573==
Content-Type: multipart/alternative; boundary="000000000000bb9d08057b04dc4f"

--000000000000bb9d08057b04dc4f
Content-Type: text/plain; charset="UTF-8"

Sorry for the formatting.

On Mon, 19 Nov 2018, 12:04 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

> Hello Julien,
>
>
> On 16.11.18 19:27, Julien Grall wrote:
> >>           if ( !list_empty(&p->inflight) &&
> >>                !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) )
> >> -            gic_raise_guest_irq(v, p->irq, p->lpi_priority);
> >> +            gic_raise_guest_irq(v, p);
> >
> > The interface is not behaving the same way now. I understand that
> > nobody is using the 3 parameters but that's actually a bug with the ITS.
> >
> > Because the LPI will not be set with expected priority.
> But it is not the issue of the interface, you know. Keeping in mind that
> both an inflight and an lr_pending queues are sorted by p->priority, the
> field p->lpi_priority looks odd anyway.
>

You didn't get my point. You removed a parameter without explaining why it
is fine. In that context, the caller for LPI is using lpi_priority.

With your change, it is becoming issue with the interface because it may
not pass the correct things.

So this not a cleanup and there must be a reason why lpi_priority was
passed instead of priority.


> >> -extern void gic_raise_guest_irq(struct vcpu *v, unsigned int irq,
> >> -        unsigned int priority);
> >> -extern void gic_raise_inflight_irq(struct vcpu *v, unsigned int
> >> virtual_irq);
> >> +extern void gic_raise_guest_irq(struct vcpu *v, struct pending_irq *p);
> >> +extern void gic_raise_inflight_irq(struct vcpu *v, struct
> >> pending_irq *n);
> >
> > That code is not going to compile with the new vGIC as pending_irq
> > only exists for the current vGIC.
>
> Yep, I did miss that.
>
> I guess wrapping it with `#ifndef CONFIG_NEW_VGIC` must be enough here.
> Those two functions are not used by, nor defined by new-vgic.


>
> --
> Sincerely,
> Andrii Anisov.
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000bb9d08057b04dc4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>Sorry for the formatting.</span><br><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr">On Mon, 19 Nov 2018, 12:04 Andrii Anisov, &lt;<a href=3D"mai=
lto:andrii.anisov@gmail.com">andrii.anisov@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Hello Julien,<br>
<br>
<br>
On 16.11.18 19:27, Julien Grall wrote:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !list_=
empty(&amp;p-&gt;inflight) &amp;&amp;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 !test_bit(GIC_IRQ_GUEST_VISIBLE, &amp;p-&gt;status) )<br=
>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 gic_raise_guest_irq(v, p-&gt;irq, p-&gt;lpi_priority);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 gic_raise_guest_irq(v, p);<br>
&gt;<br>
&gt; The interface is not behaving the same way now. I understand that <br>
&gt; nobody is using the 3 parameters but that&#39;s actually a bug with th=
e ITS.<br>
&gt;<br>
&gt; Because the LPI will not be set with expected priority.<br>
But it is not the issue of the interface, you know. Keeping in mind that <b=
r>
both an inflight and an lr_pending queues are sorted by p-&gt;priority, the=
 <br>
field p-&gt;lpi_priority looks odd anyway.<br></blockquote></div><div><br><=
/div><div>You didn&#39;t get my point. You removed a parameter without expl=
aining why it is fine. In that context, the caller for LPI is using lpi_pri=
ority.</div><div><br></div><div>With your change, it is becoming issue with=
 the interface because it may not pass the correct things.</div><div><br></=
div><div>So this not a cleanup and there must be a reason why lpi_priority =
was passed instead of priority.</div><div><br></div><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
&gt;&gt; -extern void gic_raise_guest_irq(struct vcpu *v, unsigned int irq,=
<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int priority)=
;<br>
&gt;&gt; -extern void gic_raise_inflight_irq(struct vcpu *v, unsigned int <=
br>
&gt;&gt; virtual_irq);<br>
&gt;&gt; +extern void gic_raise_guest_irq(struct vcpu *v, struct pending_ir=
q *p);<br>
&gt;&gt; +extern void gic_raise_inflight_irq(struct vcpu *v, struct <br>
&gt;&gt; pending_irq *n);<br>
&gt;<br>
&gt; That code is not going to compile with the new vGIC as pending_irq <br=
>
&gt; only exists for the current vGIC.<br>
<br>
Yep, I did miss that.<br>
<br>
I guess wrapping it with `#ifndef CONFIG_NEW_VGIC` must be enough here. <br=
>
Those two functions are not used by, nor defined by new-vgic.</blockquote><=
/div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
-- <br>
Sincerely,<br>
Andrii Anisov.<br>
<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--000000000000bb9d08057b04dc4f--


--===============5633925595444749573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5633925595444749573==--
