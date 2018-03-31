From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] x86/xen: Delay get_cpu_cap until stack
 canary is established
Date: Sat, 31 Mar 2018 17:38:08 +0000
Message-ID: <CAKf6xps0HJecKM0gYSK+3BGhKknYp9Ydxr3S0oWBThtXeytegw@mail.gmail.com>
References: <20180319165804.10636-1-jandryuk@gmail.com>
 <c3075b0c-a60b-0809-e34b-223701a53b84@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1111327495290155208=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eied=gv=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1f2KSM-0002Ht-6F
 for xen-devel@lists.xenproject.org; Sat, 31 Mar 2018 17:38:22 +0000
Received: by mail-lf0-x22f.google.com with SMTP id t132-v6so16011877lfe.2
 for <xen-devel@lists.xenproject.org>; Sat, 31 Mar 2018 10:38:19 -0700 (PDT)
In-Reply-To: <c3075b0c-a60b-0809-e34b-223701a53b84@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

--===============1111327495290155208==
Content-Type: multipart/alternative; boundary="00000000000083b53e0568b8d20c"

--00000000000083b53e0568b8d20c
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 21, 2018, 5:12 PM Boris Ostrovsky <boris.ostrovsky@oracle.com>
wrote:

> On 03/19/2018 12:58 PM, Jason Andryuk wrote:
> > Commit 2cc42bac1c79 ("x86-64/Xen: eliminate W+X mappings") introduced a
> > call to get_cpu_cap, which is fstack-protected.  This is works on x86-64
> > as commit 4f277295e54c ("x86/xen: init %gs very early to avoid page
> > faults with stack protector") ensures the stack protector is configured,
> > but it it did not cover x86-32.
> >
> > Delay calling get_cpu_cap until after xen_setup_gdt has initialized the
> > stack canary.  Without this, a 32bit PV machine crashes early
> > in boot.
> > (XEN) Domain 0 (vcpu#0) crashed on cpu#0:
> > (XEN) ----[ Xen-4.6.6-xc  x86_64  debug=n  Tainted:    C ]----
> > (XEN) CPU:    0
> > (XEN) RIP:    e019:[<00000000c10362f8>]
> >
> > And the PV kernel IP corresponds to init_scattered_cpuid_features
> >    0xc10362f8 <+24>:    mov    %gs:0x14,%eax
> >
> > Fixes 2cc42bac1c79 ("x86-64/Xen: eliminate W+X mappings")
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >
>
>
> Applied to for-linus-4.17
>

Thanks. If it's not too late, can this be cc: stable? If not, I'll submit
the request after it is in Linus's tree.

-Jason

>

--00000000000083b53e0568b8d20c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, =
Mar 21, 2018, 5:12 PM Boris Ostrovsky &lt;<a href=3D"mailto:boris.ostrovsky=
@oracle.com">boris.ostrovsky@oracle.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On 03/19/2018 12:58 PM, Jason Andryuk wrote:<br>
&gt; Commit 2cc42bac1c79 (&quot;x86-64/Xen: eliminate W+X mappings&quot;) i=
ntroduced a<br>
&gt; call to get_cpu_cap, which is fstack-protected.=C2=A0 This is works on=
 x86-64<br>
&gt; as commit 4f277295e54c (&quot;x86/xen: init %gs very early to avoid pa=
ge<br>
&gt; faults with stack protector&quot;) ensures the stack protector is conf=
igured,<br>
&gt; but it it did not cover x86-32.<br>
&gt;<br>
&gt; Delay calling get_cpu_cap until after xen_setup_gdt has initialized th=
e<br>
&gt; stack canary.=C2=A0 Without this, a 32bit PV machine crashes early<br>
&gt; in boot.<br>
&gt; (XEN) Domain 0 (vcpu#0) crashed on cpu#0:<br>
&gt; (XEN) ----[ Xen-4.6.6-xc=C2=A0 x86_64=C2=A0 debug=3Dn=C2=A0 Tainted:=
=C2=A0 =C2=A0 C ]----<br>
&gt; (XEN) CPU:=C2=A0 =C2=A0 0<br>
&gt; (XEN) RIP:=C2=A0 =C2=A0 e019:[&lt;00000000c10362f8&gt;]<br>
&gt;<br>
&gt; And the PV kernel IP corresponds to init_scattered_cpuid_features<br>
&gt;=C2=A0 =C2=A0 0xc10362f8 &lt;+24&gt;:=C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %gs=
:0x14,%eax<br>
&gt;<br>
&gt; Fixes 2cc42bac1c79 (&quot;x86-64/Xen: eliminate W+X mappings&quot;)<br=
>
&gt;<br>
&gt; Signed-off-by: Jason Andryuk &lt;<a href=3D"mailto:jandryuk@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">jandryuk@gmail.com</a>&gt;<br>
&gt;<br>
<br>
<br>
Applied to for-linus-4.17<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Thanks. If it&#39;s not too late, can this be cc: =
stable? If not, I&#39;ll submit the request after it is in Linus&#39;s tree=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">-Jason</div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000083b53e0568b8d20c--


--===============1111327495290155208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1111327495290155208==--
