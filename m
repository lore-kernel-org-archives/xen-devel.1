From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH 07/13] xen/arm: Simplify alternative patching
Date: Fri, 25 May 2018 22:34:09 +0100
Message-ID: <CAF3u54CY5hLSZCS-hYnzUN_-vt5GF99ydmT9P4JMqW3Y=2Z_oA@mail.gmail.com>
References: <20180522174254.27551-1-julien.grall@arm.com>
 <20180522174254.27551-8-julien.grall@arm.com>
 <alpine.DEB.2.10.1805251350150.12008@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2982167283099723301=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=etrs=im=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fMKLw-000314-BD
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 21:34:24 +0000
Received: by mail-ot0-x243.google.com with SMTP id l22-v6so7587431otj.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 May 2018 14:34:22 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1805251350150.12008@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2982167283099723301==
Content-Type: multipart/alternative; boundary="000000000000f79247056d0e874a"

--000000000000f79247056d0e874a
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 May 2018, 22:54 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> You might want to CC Konrad next time on this patch
>

May I ask why? This code falls under Arm maintainership.

Cheers,


> On Tue, 22 May 2018, Julien Grall wrote:
> > This is part of XSA-263.
> >
> > Signed-off-by: Julien Grall <julien.grall@arm.com>
> >
> > ---
> >     I am aware of the missing commit message here. I wanted to send the
> >     series on the ML to get some feedback first.
> > ---
> >  xen/arch/arm/alternative.c | 35 +++++++++++++----------------------
> >  1 file changed, 13 insertions(+), 22 deletions(-)
> >
> > diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> > index 9ffdc475d6..bd62183def 100644
> > --- a/xen/arch/arm/alternative.c
> > +++ b/xen/arch/arm/alternative.c
> > @@ -97,12 +97,16 @@ static u32 get_alt_insn(const struct alt_instr *alt,
> >  /*
> >   * The region patched should be read-write to allow __apply_alternatives
> >   * to replacing the instructions when necessary.
> > + *
> > + * @update_offset: Offset between the region patched and the writable
> > + * region for the update. 0 if the patched region is writable.
> >   */
> > -static int __apply_alternatives(const struct alt_region *region)
> > +static int __apply_alternatives(const struct alt_region *region,
> > +                                paddr_t update_offset)
> >  {
> >      const struct alt_instr *alt;
> > -    const u32 *replptr;
> > -    u32 *origptr;
> > +    const u32 *replptr, *origptr;
> > +    u32 *updptr;
> >
> >      printk(XENLOG_INFO "alternatives: Patching with alt table %p ->
> %p\n",
> >             region->begin, region->end);
> > @@ -118,6 +122,7 @@ static int __apply_alternatives(const struct
> alt_region *region)
> >          BUG_ON(alt->alt_len != alt->orig_len);
> >
> >          origptr = ALT_ORIG_PTR(alt);
> > +        updptr = (void *)origptr + update_offset;
> >          replptr = ALT_REPL_PTR(alt);
> >
> >          nr_inst = alt->alt_len / sizeof(insn);
> > @@ -125,7 +130,7 @@ static int __apply_alternatives(const struct
> alt_region *region)
> >          for ( i = 0; i < nr_inst; i++ )
> >          {
> >              insn = get_alt_insn(alt, origptr + i, replptr + i);
> > -            *(origptr + i) = cpu_to_le32(insn);
> > +            *(updptr + i) = cpu_to_le32(insn);
> >          }
> >
> >          /* Ensure the new instructions reached the memory and nuke */
> > @@ -162,9 +167,6 @@ static int __apply_alternatives_multi_stop(void
> *unused)
> >          paddr_t xen_size = _end - _start;
> >          unsigned int xen_order = get_order_from_bytes(xen_size);
> >          void *xenmap;
> > -        struct virtual_region patch_region = {
> > -            .list = LIST_HEAD_INIT(patch_region.list),
> > -        };
> >
> >          BUG_ON(patched);
> >
> > @@ -178,30 +180,19 @@ static int __apply_alternatives_multi_stop(void
> *unused)
> >          BUG_ON(!xenmap);
> >
> >          /*
> > -         * If we generate a new branch instruction, the target will be
> > -         * calculated in this re-mapped Xen region. So we have to
> register
> > -         * this re-mapped Xen region as a virtual region temporarily.
> > -         */
> > -        patch_region.start = xenmap;
> > -        patch_region.end = xenmap + xen_size;
> > -        register_virtual_region(&patch_region);
> > -
> > -        /*
> >           * Find the virtual address of the alternative region in the new
> >           * mapping.
> >           * alt_instr contains relative offset, so the function
> >           * __apply_alternatives will patch in the re-mapped version of
> >           * Xen.
> >           */
> > -        region.begin = (void *)__alt_instructions - (void *)_start +
> xenmap;
> > -        region.end = (void *)__alt_instructions_end - (void *)_start +
> xenmap;
> > +        region.begin = __alt_instructions;
> > +        region.end = __alt_instructions_end;
> >
> > -        ret = __apply_alternatives(&region);
> > +        ret = __apply_alternatives(&region, xenmap - (void *)_start);
> >          /* The patching is not expected to fail during boot. */
> >          BUG_ON(ret != 0);
> >
> > -        unregister_virtual_region(&patch_region);
> > -
> >          vunmap(xenmap);
> >
> >          /* Barriers provided by the cache flushing */
> > @@ -235,7 +226,7 @@ int apply_alternatives(const struct alt_instr
> *start, const struct alt_instr *en
> >          .end = end,
> >      };
> >
> > -    return __apply_alternatives(&region);
> > +    return __apply_alternatives(&region, 0);
> >  }
> >
> >  /*
> > --
> > 2.11.0
> >
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000f79247056d0e874a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, 25 May 2018, 22=
:54 Stefano Stabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstab=
ellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Yo=
u might want to CC Konrad next time on this patch<br></blockquote></div><di=
v><br></div><div>May I ask why? This code falls under Arm maintainership.</=
div><div><br></div><div>Cheers,</div><div><br></div><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
On Tue, 22 May 2018, Julien Grall wrote:<br>
&gt; This is part of XSA-263.<br>
&gt; <br>
&gt; Signed-off-by: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com=
" target=3D"_blank">julien.grall@arm.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0I am aware of the missing commit message here. I wa=
nted to send the<br>
&gt;=C2=A0 =C2=A0 =C2=A0series on the ML to get some feedback first.<br>
&gt; ---<br>
&gt;=C2=A0 xen/arch/arm/alternative.c | 35 +++++++++++++-------------------=
---<br>
&gt;=C2=A0 1 file changed, 13 insertions(+), 22 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c<b=
r>
&gt; index 9ffdc475d6..bd62183def 100644<br>
&gt; --- a/xen/arch/arm/alternative.c<br>
&gt; +++ b/xen/arch/arm/alternative.c<br>
&gt; @@ -97,12 +97,16 @@ static u32 get_alt_insn(const struct alt_instr *al=
t,<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* The region patched should be read-write to allow __apply=
_alternatives<br>
&gt;=C2=A0 =C2=A0* to replacing the instructions when necessary.<br>
&gt; + *<br>
&gt; + * @update_offset: Offset between the region patched and the writable=
<br>
&gt; + * region for the update. 0 if the patched region is writable.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -static int __apply_alternatives(const struct alt_region *region)<br>
&gt; +static int __apply_alternatives(const struct alt_region *region,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 paddr_t update_offset)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const struct alt_instr *alt;<br>
&gt; -=C2=A0 =C2=A0 const u32 *replptr;<br>
&gt; -=C2=A0 =C2=A0 u32 *origptr;<br>
&gt; +=C2=A0 =C2=A0 const u32 *replptr, *origptr;<br>
&gt; +=C2=A0 =C2=A0 u32 *updptr;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 printk(XENLOG_INFO &quot;alternatives: Patching wi=
th alt table %p -&gt; %p\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0region-&gt;begin, regio=
n-&gt;end);<br>
&gt; @@ -118,6 +122,7 @@ static int __apply_alternatives(const struct alt_r=
egion *region)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUG_ON(alt-&gt;alt_len !=3D alt-&gt;=
orig_len);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 origptr =3D ALT_ORIG_PTR(alt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 updptr =3D (void *)origptr + update_offse=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replptr =3D ALT_REPL_PTR(alt);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nr_inst =3D alt-&gt;alt_len / sizeof=
(insn);<br>
&gt; @@ -125,7 +130,7 @@ static int __apply_alternatives(const struct alt_r=
egion *region)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for ( i =3D 0; i &lt; nr_inst; i++ )=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn =3D get_alt_insn(=
alt, origptr + i, replptr + i);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(origptr + i) =3D cpu_to_l=
e32(insn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(updptr + i) =3D cpu_to_le=
32(insn);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ensure the new instructions reach=
ed the memory and nuke */<br>
&gt; @@ -162,9 +167,6 @@ static int __apply_alternatives_multi_stop(void *u=
nused)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 paddr_t xen_size =3D _end - _start;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int xen_order =3D get_order=
_from_bytes(xen_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *xenmap;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtual_region patch_region =3D {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .list =3D LIST_HEAD_INIT(pa=
tch_region.list),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUG_ON(patched);<br>
&gt;=C2=A0 <br>
&gt; @@ -178,30 +180,19 @@ static int __apply_alternatives_multi_stop(void =
*unused)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUG_ON(!xenmap);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If we generate a new branch instr=
uction, the target will be<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* calculated in this re-mapped Xen =
region. So we have to register<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this re-mapped Xen region as a vi=
rtual region temporarily.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_region.start =3D xenmap;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_region.end =3D xenmap + xen_size;<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 register_virtual_region(&amp;patch_region=
);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Find the virtual address of =
the alternative region in the new<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* mapping.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* alt_instr contains relative =
offset, so the function<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* __apply_alternatives will pa=
tch in the re-mapped version of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Xen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 region.begin =3D (void *)__alt_instructio=
ns - (void *)_start + xenmap;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 region.end =3D (void *)__alt_instructions=
_end - (void *)_start + xenmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 region.begin =3D __alt_instructions;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 region.end =3D __alt_instructions_end;<br=
>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D __apply_alternatives(&amp;region)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D __apply_alternatives(&amp;region,=
 xenmap - (void *)_start);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The patching is not expected to f=
ail during boot. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUG_ON(ret !=3D 0);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 unregister_virtual_region(&amp;patch_regi=
on);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vunmap(xenmap);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Barriers provided by the cache fl=
ushing */<br>
&gt; @@ -235,7 +226,7 @@ int apply_alternatives(const struct alt_instr *sta=
rt, const struct alt_instr *en<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =3D end,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 return __apply_alternatives(&amp;region);<br>
&gt; +=C2=A0 =C2=A0 return __apply_alternatives(&amp;region, 0);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt; -- <br>
&gt; 2.11.0<br>
&gt; <br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--000000000000f79247056d0e874a--


--===============2982167283099723301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2982167283099723301==--
