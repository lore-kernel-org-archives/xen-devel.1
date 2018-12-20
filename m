From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH for-4.12 v2 4/8] xen/arm: Add support for
 read-only foreign mappings
Date: Thu, 20 Dec 2018 23:26:26 +0000
Message-ID: <CAF3u54BSPADuU=7qLwVSSQ5y83pzqTBVr4u8EJJNgMoSTa74+w@mail.gmail.com>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-5-julien.grall@arm.com>
 <alpine.DEB.2.10.1812201458400.15901@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8253926706790322186=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QA/e=O5=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ga7iB-00088a-E8
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 23:26:39 +0000
Received: by mail-vk1-xa42.google.com with SMTP id 197so778417vkf.4
 for <xen-devel@lists.xenproject.org>; Thu, 20 Dec 2018 15:26:38 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1812201458400.15901@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

--===============8253926706790322186==
Content-Type: multipart/alternative; boundary="00000000000048fdb8057d7c7608"

--00000000000048fdb8057d7c7608
Content-Type: text/plain; charset="UTF-8"

(Sorry for the formatting)

On Thu, 20 Dec 2018 at 23:08, Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Thu, 20 Dec 2018, Julien Grall wrote:
> > Current, foreign mappings can only be read-write. A follow-up patch will
> > extend foreign mapping for Xen backend memory (via XEN_DOMID), some of
> > that memory should only be read accessible for the mapping domain.
> >
> > Introduce a new p2m_type to cater read-only foreign mappings. For now,
> > the decision between the two foreign mapping type is based on the type
> > of the guest page mapped.
> >
> > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
> >
> > ---
> >
> >     Changes in v2:
> >         - Add Andrii's reviewed-by
> > ---
> >  xen/arch/arm/mm.c         |  2 +-
> >  xen/arch/arm/p2m.c        |  1 +
> >  xen/include/asm-arm/p2m.h | 42
> +++++++++++++++++++++++++++++++++++++++---
> >  3 files changed, 41 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > index 7193d83b44..58f7e54640 100644
> > --- a/xen/arch/arm/mm.c
> > +++ b/xen/arch/arm/mm.c
> > @@ -1267,7 +1267,7 @@ int xenmem_add_to_physmap_one(
> >          }
> >
> >          mfn = page_to_mfn(page);
> > -        t = p2m_map_foreign_rw;
> > +        t = (p2mt == p2m_ram_rw) ? p2m_map_foreign_rw :
> p2m_map_foreign_ro;
>
> I know there is a p2m_is_ram check close by, but I think it would still
> be better to do:
>
>   if (p2mt == p2m_ram_rw)
>     t = p2m_map_foreign_rw;
>   else if (p2mt == p2m_ram_ro)
>     t = p2m_map_foreign_ro;
>   else
>     error
>
> to avoid cases where p2mt is something completely different
> (p2m_mmio_direct_dev for instance) and t gets set to p2m_map_foreign_ro
> by mistake.


The case you suggest is impossible. You can only be here if you manage to
get a reference on the page (e.g p2m_foreign or p2m_ram).
The check above remove the foreign types. But if you ever get here there
are not much harm done as it would be read-only.

The extras 5 lines of code are just not worth it.


>
> >          rcu_unlock_domain(od);
> >          break;
> > diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> > index e0b84a9db5..dea04ef66f 100644
> > --- a/xen/arch/arm/p2m.c
> > +++ b/xen/arch/arm/p2m.c
> > @@ -477,6 +477,7 @@ static void p2m_set_permission(lpae_t *e, p2m_type_t
> t, p2m_access_t a)
> >          break;
> >
> >      case p2m_iommu_map_ro:
> > +    case p2m_map_foreign_ro:
> >      case p2m_grant_map_ro:
> >      case p2m_invalid:
> >          e->p2m.xn = 1;
> > diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
> > index a1aef7b793..6f2728e2bb 100644
> > --- a/xen/include/asm-arm/p2m.h
> > +++ b/xen/include/asm-arm/p2m.h
> > @@ -116,6 +116,7 @@ typedef enum {
> >      p2m_mmio_direct_nc, /* Read/write mapping of genuine MMIO area
> non-cacheable */
> >      p2m_mmio_direct_c,  /* Read/write mapping of genuine MMIO area
> cacheable */
> >      p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
> > +    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
> >      p2m_grant_map_rw,   /* Read/write grant mapping */
> >      p2m_grant_map_ro,   /* Read-only grant mapping */
> >      /* The types below are only used to decide the page attribute in
> the P2M */
> > @@ -135,12 +136,16 @@ typedef enum {
> >  #define P2M_GRANT_TYPES (p2m_to_mask(p2m_grant_map_rw) |  \
> >                           p2m_to_mask(p2m_grant_map_ro))
> >
> > +/* Foreign mappings types */
> > +#define P2M_FOREIGN_TYPES (p2m_to_mask(p2m_map_foreign_rw) | \
> > +                           p2m_to_mask(p2m_map_foreign_ro))
> > +
> >  /* Useful predicates */
> >  #define p2m_is_ram(_t) (p2m_to_mask(_t) & P2M_RAM_TYPES)
> > -#define p2m_is_foreign(_t) (p2m_to_mask(_t) &
> p2m_to_mask(p2m_map_foreign_rw))
> > +#define p2m_is_foreign(_t) (p2m_to_mask(_t) & P2M_FOREIGN_TYPES)
> >  #define p2m_is_any_ram(_t) (p2m_to_mask(_t) &                   \
> >                              (P2M_RAM_TYPES | P2M_GRANT_TYPES |  \
> > -                             p2m_to_mask(p2m_map_foreign_rw)))
> > +                             P2M_FOREIGN_TYPES))
> >
> >  /* All common type definitions should live ahead of this inclusion. */
> >  #ifdef _XEN_P2M_COMMON_H
> > @@ -295,7 +300,38 @@ struct page_info *p2m_get_page_from_gfn(struct
> domain *d, gfn_t gfn,
> >  static inline struct page_info *get_page_from_gfn(
> >      struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
> >  {
> > -    return p2m_get_page_from_gfn(d, _gfn(gfn), t);
> > +    mfn_t mfn;
> > +    p2m_type_t _t;
> > +    struct page_info *page;
> > +
> > +    /*
> > +     * Special case for DOMID_XEN as it is the only domain so far that
> is
> > +     * not auto-translated.
> > +     */
> > +    if ( unlikely(d != dom_xen) )
>
> Why unlikely?


I got the wrong way around. It should have been likely.


>
> > +        return p2m_get_page_from_gfn(d, _gfn(gfn), t);
> > +
> > +    if ( !t )
> > +        t = &_t;
> > +
> > +    *t = p2m_invalid;
> > +
> > +    /*
> > +     * DOMID_XEN see 1-1 RAM. The p2m_type is based on the type of the
>                     ^sees
>
> > +     * page.
> > +     */
> > +    mfn = _mfn(gfn);
> > +    page = mfn_to_page(mfn);
> > +
> > +    if ( !mfn_valid(mfn) || !get_page(page, d) )
> > +        return NULL;
> > +
> > +    if ( page->u.inuse.type_info & PGT_writable_page )
> > +        *t = p2m_ram_rw;
> > +    else
> > +        *t = p2m_ram_ro;
> > +
> > +    return page;
> >  }
> >
> >  int get_page_type(struct page_info *page, unsigned long type);
> > --
> > 2.11.0
> >
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--00000000000048fdb8057d7c7608
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">(Sorry for the formatting)</div></div><div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 20 Dec 2018 at 23:08, Stefan=
o Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kern=
el.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 20 De=
c 2018, Julien Grall wrote:<br>
&gt; Current, foreign mappings can only be read-write. A follow-up patch wi=
ll<br>
&gt; extend foreign mapping for Xen backend memory (via XEN_DOMID), some of=
<br>
&gt; that memory should only be read accessible for the mapping domain.<br>
&gt; <br>
&gt; Introduce a new p2m_type to cater read-only foreign mappings. For now,=
<br>
&gt; the decision between the two foreign mapping type is based on the type=
<br>
&gt; of the guest page mapped.<br>
&gt; <br>
&gt; Signed-off-by: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com=
" target=3D"_blank">julien.grall@arm.com</a>&gt;<br>
&gt; Reviewed-by: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.co=
m" target=3D"_blank">andrii_anisov@epam.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Changes in v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Add Andrii&#39;s reviewed-by<br>
&gt; ---<br>
&gt;=C2=A0 xen/arch/arm/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
&gt;=C2=A0 xen/arch/arm/p2m.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 xen/include/asm-arm/p2m.h | 42 +++++++++++++++++++++++++++++++++=
++++++---<br>
&gt;=C2=A0 3 files changed, 41 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c<br>
&gt; index 7193d83b44..58f7e54640 100644<br>
&gt; --- a/xen/arch/arm/mm.c<br>
&gt; +++ b/xen/arch/arm/mm.c<br>
&gt; @@ -1267,7 +1267,7 @@ int xenmem_add_to_physmap_one(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mfn =3D page_to_mfn(page);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D p2m_map_foreign_rw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D (p2mt =3D=3D p2m_ram_rw) ? p2m_map_=
foreign_rw : p2m_map_foreign_ro;<br>
<br>
I know there is a p2m_is_ram check close by, but I think it would still<br>
be better to do:<br>
<br>
=C2=A0 if (p2mt =3D=3D p2m_ram_rw)<br>
=C2=A0 =C2=A0 t =3D p2m_map_foreign_rw;<br>
=C2=A0 else if (p2mt =3D=3D p2m_ram_ro)<br>
=C2=A0 =C2=A0 t =3D p2m_map_foreign_ro;<br>
=C2=A0 else<br>
=C2=A0 =C2=A0 error<br>
<br>
to avoid cases where p2mt is something completely different<br>
(p2m_mmio_direct_dev for instance) and t gets set to p2m_map_foreign_ro<br>
by mistake.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">The c=
ase you suggest is impossible. You can only be here if you manage to get a =
reference on the page (e.g p2m_foreign or p2m_ram).</div><div dir=3D"auto">=
The check above remove the foreign types. But if you ever get here there ar=
e not much harm done as it would be read-only.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">The extras 5 lines of code are just not worth it.</d=
iv><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_unlock_domain(od);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c<br>
&gt; index e0b84a9db5..dea04ef66f 100644<br>
&gt; --- a/xen/arch/arm/p2m.c<br>
&gt; +++ b/xen/arch/arm/p2m.c<br>
&gt; @@ -477,6 +477,7 @@ static void p2m_set_permission(lpae_t *e, p2m_type=
_t t, p2m_access_t a)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case p2m_iommu_map_ro:<br>
&gt; +=C2=A0 =C2=A0 case p2m_map_foreign_ro:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case p2m_grant_map_ro:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case p2m_invalid:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e-&gt;p2m.xn =3D 1;<br>
&gt; diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h<br>
&gt; index a1aef7b793..6f2728e2bb 100644<br>
&gt; --- a/xen/include/asm-arm/p2m.h<br>
&gt; +++ b/xen/include/asm-arm/p2m.h<br>
&gt; @@ -116,6 +116,7 @@ typedef enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 p2m_mmio_direct_nc, /* Read/write mapping of genui=
ne MMIO area non-cacheable */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 p2m_mmio_direct_c,=C2=A0 /* Read/write mapping of =
genuine MMIO area cacheable */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 p2m_map_foreign_rw, /* Read/write RAM pages from f=
oreign domain */<br>
&gt; +=C2=A0 =C2=A0 p2m_map_foreign_ro, /* Read-only RAM pages from foreign=
 domain */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 p2m_grant_map_rw,=C2=A0 =C2=A0/* Read/write grant =
mapping */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 p2m_grant_map_ro,=C2=A0 =C2=A0/* Read-only grant m=
apping */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* The types below are only used to decide the pag=
e attribute in the P2M */<br>
&gt; @@ -135,12 +136,16 @@ typedef enum {<br>
&gt;=C2=A0 #define P2M_GRANT_TYPES (p2m_to_mask(p2m_grant_map_rw) |=C2=A0 \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_to_mask(p2m_grant_map_ro))<br>
&gt;=C2=A0 <br>
&gt; +/* Foreign mappings types */<br>
&gt; +#define P2M_FOREIGN_TYPES (p2m_to_mask(p2m_map_foreign_rw) | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_to_mask(p2m_map_foreign_ro))<br>
&gt; +<br>
&gt;=C2=A0 /* Useful predicates */<br>
&gt;=C2=A0 #define p2m_is_ram(_t) (p2m_to_mask(_t) &amp; P2M_RAM_TYPES)<br>
&gt; -#define p2m_is_foreign(_t) (p2m_to_mask(_t) &amp; p2m_to_mask(p2m_map=
_foreign_rw))<br>
&gt; +#define p2m_is_foreign(_t) (p2m_to_mask(_t) &amp; P2M_FOREIGN_TYPES)<=
br>
&gt;=C2=A0 #define p2m_is_any_ram(_t) (p2m_to_mask(_t) &amp;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (P2M_RAM_TYPES | P2M_GRANT_TYPES |=C2=A0=
 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_to_mask(p2m_map_foreign_rw)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0P2M_FOREIGN_TYPES))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* All common type definitions should live ahead of this inclusi=
on. */<br>
&gt;=C2=A0 #ifdef _XEN_P2M_COMMON_H<br>
&gt; @@ -295,7 +300,38 @@ struct page_info *p2m_get_page_from_gfn(struct do=
main *d, gfn_t gfn,<br>
&gt;=C2=A0 static inline struct page_info *get_page_from_gfn(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct domain *d, unsigned long gfn, p2m_type_t *t=
, p2m_query_t q)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 return p2m_get_page_from_gfn(d, _gfn(gfn), t);<br>
&gt; +=C2=A0 =C2=A0 mfn_t mfn;<br>
&gt; +=C2=A0 =C2=A0 p2m_type_t _t;<br>
&gt; +=C2=A0 =C2=A0 struct page_info *page;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Special case for DOMID_XEN as it is the only do=
main so far that is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* not auto-translated.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if ( unlikely(d !=3D dom_xen) )<br>
<br>
Why unlikely?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I g=
ot the wrong way around. It should have been likely.</div><div dir=3D"auto"=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return p2m_get_page_from_gfn(d, _gfn(gfn)=
, t);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ( !t )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D &amp;_t;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 *t =3D p2m_invalid;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* DOMID_XEN see 1-1 RAM. The p2m_type is based on=
 the type of the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^sees=
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* page.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 mfn =3D _mfn(gfn);<br>
&gt; +=C2=A0 =C2=A0 page =3D mfn_to_page(mfn);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ( !mfn_valid(mfn) || !get_page(page, d) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ( page-&gt;u.inuse.type_info &amp; PGT_writable_page=
 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *t =3D p2m_ram_rw;<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *t =3D p2m_ram_ro;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return page;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int get_page_type(struct page_info *page, unsigned long type);<b=
r>
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
/xen-devel</a></blockquote></div></div>

--00000000000048fdb8057d7c7608--


--===============8253926706790322186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8253926706790322186==--
