From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5 3/5] p2m: change write_p2m_entry to
 return an error code
Date: Mon, 25 Feb 2019 17:42:02 +0000
Message-ID: <72001ac1-7c38-3a8a-1e6a-c66da20c6a98@citrix.com>
References: <20190221165041.39394-1-roger.pau@citrix.com>
 <20190221165041.39394-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------941F88A7539BD5153D3D1181"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/MvD=RA=citrix.com=prvs=9522c30d4=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gyKHY-0004fn-5v
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 17:43:12 +0000
In-Reply-To: <20190221165041.39394-4-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

--------------941F88A7539BD5153D3D1181
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 2/21/19 4:50 PM, Roger Pau Monne wrote:
> This is in preparation for also changing p2m_entry_modify to return an
> error code.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
[snip]
> diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
> index 04e9d81cf6..254c5dfd19 100644
> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -184,6 +184,8 @@ p2m_next_level(struct p2m_domain *p2m, void **table,
>      l1_pgentry_t *p2m_entry, new_entry;
>      void *next;
>      unsigned int flags;
> +    int rc;
> +    mfn_t mfn = INVALID_MFN;
>  
>      if ( !(p2m_entry = p2m_find_entry(*table, gfn_remainder, gfn,
>                                        shift, max)) )
> @@ -194,7 +196,7 @@ p2m_next_level(struct p2m_domain *p2m, void **table,
>      /* PoD/paging: Not present doesn't imply empty. */
>      if ( !flags )
>      {
> -        mfn_t mfn = p2m_alloc_ptp(p2m, level);
> +        mfn = p2m_alloc_ptp(p2m, level);
>  
>          if ( mfn_eq(mfn, INVALID_MFN) )
>              return -ENOMEM;
> @@ -202,13 +204,14 @@ p2m_next_level(struct p2m_domain *p2m, void **table,
>          new_entry = l1e_from_mfn(mfn, P2M_BASE_FLAGS | _PAGE_RW);
>  
>          p2m_add_iommu_flags(&new_entry, level, IOMMUF_readable|IOMMUF_writable);
> -        p2m->write_p2m_entry(p2m, gfn, p2m_entry, new_entry, level + 1);
> +        rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, new_entry, level + 1);
> +        if ( rc )
> +            ASSERT_UNREACHABLE();
>      }
>      else if ( flags & _PAGE_PSE )
>      {
>          /* Split superpages pages into smaller ones. */
>          unsigned long pfn = l1e_get_pfn(*p2m_entry);
> -        mfn_t mfn;
>          l1_pgentry_t *l1_entry;
>          unsigned int i;
>  
> @@ -250,18 +253,37 @@ p2m_next_level(struct p2m_domain *p2m, void **table,
>          {
>              new_entry = l1e_from_pfn(pfn | (i << ((level - 1) * PAGETABLE_ORDER)),
>                                       flags);
> -            p2m->write_p2m_entry(p2m, gfn, l1_entry + i, new_entry, level);
> +            rc = p2m->write_p2m_entry(p2m, gfn, l1_entry + i, new_entry, level);
> +            if ( rc )
> +            {
> +                ASSERT_UNREACHABLE();
> +                break;
> +            }
>          }
>  
>          unmap_domain_page(l1_entry);
>  
> -        new_entry = l1e_from_mfn(mfn, P2M_BASE_FLAGS | _PAGE_RW);
> -        p2m_add_iommu_flags(&new_entry, level, IOMMUF_readable|IOMMUF_writable);
> -        p2m->write_p2m_entry(p2m, gfn, p2m_entry, new_entry, level + 1);
> +        if ( !rc )
> +        {
> +            new_entry = l1e_from_mfn(mfn, P2M_BASE_FLAGS | _PAGE_RW);
> +            p2m_add_iommu_flags(&new_entry, level,
> +                                IOMMUF_readable|IOMMUF_writable);
> +            rc = p2m->write_p2m_entry(p2m, gfn, p2m_entry, new_entry,
> +                                      level + 1);
> +            if ( rc )
> +                ASSERT_UNREACHABLE();
> +        }
>      }
>      else
>          ASSERT(flags & _PAGE_PRESENT);
>  
> +    if ( rc )
> +    {
> +        ASSERT(mfn_valid(mfn));
> +        p2m_free_ptp(p2m, mfn_to_page(mfn));
> +        return rc;
> +    }
> +

I think the idiomatic way to deal with this would be to have a label at
the end that everything jumps to something like the attached?  That way
you don't have to spend mental effort making sure that nothing happens
between the error and the clean-up call.

Everything else looks good to me; thanks for doing this.

 -George

--------------941F88A7539BD5153D3D1181
Content-Type: text/x-patch; name="free_ptp.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="free_ptp.diff"

diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 254c5dfd19..1eb22bd06e 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -206,7 +206,10 @@ p2m_next_level(struct p2m_domain *p2m, void **table,=

         p2m_add_iommu_flags(&new_entry, level, IOMMUF_readable|IOMMUF_wr=
itable);
         rc =3D p2m->write_p2m_entry(p2m, gfn, p2m_entry, new_entry, leve=
l + 1);
         if ( rc )
+        {
             ASSERT_UNREACHABLE();
+            goto free_ptp;
+        }
     }
     else if ( flags & _PAGE_PSE )
     {
@@ -257,39 +260,37 @@ p2m_next_level(struct p2m_domain *p2m, void **table=
,
             if ( rc )
             {
                 ASSERT_UNREACHABLE();
-                break;
+                unmap_domain_page(l1_entry);
+                goto free_ptp;
             }
         }
=20
         unmap_domain_page(l1_entry);
=20
-        if ( !rc )
-        {
-            new_entry =3D l1e_from_mfn(mfn, P2M_BASE_FLAGS | _PAGE_RW);
-            p2m_add_iommu_flags(&new_entry, level,
-                                IOMMUF_readable|IOMMUF_writable);
-            rc =3D p2m->write_p2m_entry(p2m, gfn, p2m_entry, new_entry,
-                                      level + 1);
-            if ( rc )
-                ASSERT_UNREACHABLE();
+        new_entry =3D l1e_from_mfn(mfn, P2M_BASE_FLAGS | _PAGE_RW);
+        p2m_add_iommu_flags(&new_entry, level,
+                            IOMMUF_readable|IOMMUF_writable);
+        rc =3D p2m->write_p2m_entry(p2m, gfn, p2m_entry, new_entry,
+                                  level + 1);
+        if ( rc ) {
+            ASSERT_UNREACHABLE();
+            goto free_ptp;
         }
     }
     else
         ASSERT(flags & _PAGE_PRESENT);
=20
-    if ( rc )
-    {
-        ASSERT(mfn_valid(mfn));
-        p2m_free_ptp(p2m, mfn_to_page(mfn));
-        return rc;
-    }
-
     next =3D map_domain_page(l1e_get_mfn(*p2m_entry));
     if ( unmap )
         unmap_domain_page(*table);
     *table =3D next;
=20
     return 0;
+
+ free_ptp:
+    ASSERT(mfn_valid(mfn));
+    p2m_free_ptp(p2m, mfn_to_page(mfn));
+    return rc;
 }
=20
 /*

--------------941F88A7539BD5153D3D1181
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------941F88A7539BD5153D3D1181--
