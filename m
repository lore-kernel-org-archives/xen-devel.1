From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 v2 4/8] xen/arm: Add support for
 read-only foreign mappings
Date: Thu, 20 Dec 2018 15:35:34 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812201530110.15901@sstabellini-ThinkPad-X260>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-5-julien.grall@arm.com>
 <alpine.DEB.2.10.1812201458400.15901@sstabellini-ThinkPad-X260>
 <CAF3u54BSPADuU=7qLwVSSQ5y83pzqTBVr4u8EJJNgMoSTa74+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-905662458-1545348935=:15901"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NfYO=O5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ga7qr-0000hs-FT
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 23:35:37 +0000
In-Reply-To: <CAF3u54BSPADuU=7qLwVSSQ5y83pzqTBVr4u8EJJNgMoSTa74+w@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-905662458-1545348935=:15901
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 20 Dec 2018, Julien Grall wrote:
> (Sorry for the formatting)
> 
> On Thu, 20 Dec 2018 at 23:08, Stefano Stabellini <sstabellini@kernel.org> wrote:
>       On Thu, 20 Dec 2018, Julien Grall wrote:
>       > Current, foreign mappings can only be read-write. A follow-up patch will
>       > extend foreign mapping for Xen backend memory (via XEN_DOMID), some of
>       > that memory should only be read accessible for the mapping domain.
>       >
>       > Introduce a new p2m_type to cater read-only foreign mappings. For now,
>       > the decision between the two foreign mapping type is based on the type
>       > of the guest page mapped.
>       >
>       > Signed-off-by: Julien Grall <julien.grall@arm.com>
>       > Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
>       >
>       > ---
>       >
>       >     Changes in v2:
>       >         - Add Andrii's reviewed-by
>       > ---
>       >  xen/arch/arm/mm.c         |  2 +-
>       >  xen/arch/arm/p2m.c        |  1 +
>       >  xen/include/asm-arm/p2m.h | 42 +++++++++++++++++++++++++++++++++++++++---
>       >  3 files changed, 41 insertions(+), 4 deletions(-)
>       >
>       > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>       > index 7193d83b44..58f7e54640 100644
>       > --- a/xen/arch/arm/mm.c
>       > +++ b/xen/arch/arm/mm.c
>       > @@ -1267,7 +1267,7 @@ int xenmem_add_to_physmap_one(
>       >          }
>       > 
>       >          mfn = page_to_mfn(page);
>       > -        t = p2m_map_foreign_rw;
>       > +        t = (p2mt == p2m_ram_rw) ? p2m_map_foreign_rw : p2m_map_foreign_ro;
> 
>       I know there is a p2m_is_ram check close by, but I think it would still
>       be better to do:
> 
>         if (p2mt == p2m_ram_rw)
>           t = p2m_map_foreign_rw;
>         else if (p2mt == p2m_ram_ro)
>           t = p2m_map_foreign_ro;
>         else
>           error
> 
>       to avoid cases where p2mt is something completely different
>       (p2m_mmio_direct_dev for instance) and t gets set to p2m_map_foreign_ro
>       by mistake.
> 
> 
> The case you suggest is impossible. You can only be here if you manage to get a reference on the page (e.g p2m_foreign or
> p2m_ram).
> The check above remove the foreign types. But if you ever get here there are not much harm done as it would be read-only.
> 
> The extras 5 lines of code are just not worth it.

I realize the case is impossible today, it was for clarity and for
future proof-ness. You can reduce line code count by combining it with
the p2m_is_ram check above:

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 49d7a76..01ae2cc 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1259,7 +1259,9 @@ int xenmem_add_to_physmap_one(
             return -EINVAL;
         }
 
-        if ( !p2m_is_ram(p2mt) )
+        if ( p2m_is_ram(p2mt) )
+            t = (p2mt == p2m_ram_rw) ? p2m_map_foreign_rw : p2m_map_foreign_ro;
+        else
         {
             put_page(page);
             put_pg_owner(od);
@@ -1267,7 +1269,6 @@ int xenmem_add_to_physmap_one(
         }
 
         mfn = page_to_mfn(page);
-        t = (p2mt == p2m_ram_rw) ? p2m_map_foreign_rw : p2m_map_foreign_ro;
 
         put_pg_owner(od);
         break;
--8323329-905662458-1545348935=:15901
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-905662458-1545348935=:15901--
