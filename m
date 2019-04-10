From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 1/3] x86/mm: Introduce
 altp2m_get_gfn_type_access
Date: Wed, 10 Apr 2019 17:02:58 +0100
Message-ID: <28c52232-536f-d007-4072-fbce95b44d8c@citrix.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------01DC7261213868C67CB052B2"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+PC=SM=citrix.com=prvs=996a3bdca=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hEFgx-0006bm-L0
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 16:03:15 +0000
In-Reply-To: <20190409120324.13940-1-aisaila@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--------------01DC7261213868C67CB052B2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 4/9/19 1:03 PM, Alexandru Stefan ISAILA wrote:
> This patch moves common code from p2m_set_altp2m_mem_access() and
> p2m_change_altp2m_gfn() into one function
> 
> Signed-off-by: Alexandru Isaila <aisaila@bitdefender.com>

This patch contains a lot of behavioral changes which aren't mentioned
or explained.  For instance...

> ---
> Changes since V2:
> 	- Change var name from found_in_hostp2m to copied_from_hostp2m
> 	- Move the type check from altp2m_get_gfn_type_access() to the
> 	callers.
> ---
>  xen/arch/x86/mm/mem_access.c | 32 ++++++++++++----------------
>  xen/arch/x86/mm/p2m.c        | 41 ++++++++++++++----------------------
>  xen/include/asm-x86/p2m.h    | 19 +++++++++++++++++
>  3 files changed, 49 insertions(+), 43 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
> index 56c06a4fc6..bf67ddb15a 100644
> --- a/xen/arch/x86/mm/mem_access.c
> +++ b/xen/arch/x86/mm/mem_access.c
> @@ -265,31 +265,27 @@ int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain *hp2m,
>      unsigned int page_order;
>      unsigned long gfn_l = gfn_x(gfn);
>      int rc;
> +    bool copied_from_hostp2m;
>  
> -    mfn = ap2m->get_entry(ap2m, gfn, &t, &old_a, 0, NULL, NULL);
> +    mfn = altp2m_get_gfn_type_access(ap2m, gfn, &t, &old_a, &page_order, &copied_from_hostp2m);
>  
> -    /* Check host p2m if no valid entry in alternate */
>      if ( !mfn_valid(mfn) )
> +        return -ESRCH;
> +
> +    /* If this is a superpage, copy that first */
> +    if ( page_order != PAGE_ORDER_4K && copied_from_hostp2m )
>      {
> +        unsigned long mask = ~((1UL << page_order) - 1);
> +        gfn_t gfn2 = _gfn(gfn_l & mask);
> +        mfn_t mfn2 = _mfn(mfn_x(mfn) & mask);
>  
> -        mfn = __get_gfn_type_access(hp2m, gfn_l, &t, &old_a,
> -                                    P2M_ALLOC | P2M_UNSHARE, &page_order, 0);
> +        /* Note: currently it is not safe to remap to a shared entry */
> +        if ( t != p2m_ram_rw )
> +            return -ESRCH;
>  
> -        rc = -ESRCH;
> -        if ( !mfn_valid(mfn) || t != p2m_ram_rw )
> +        rc = ap2m->set_entry(ap2m, gfn2, mfn2, page_order, t, old_a, 1);
> +        if ( rc )
>              return rc;
> -
> -        /* If this is a superpage, copy that first */
> -        if ( page_order != PAGE_ORDER_4K )
> -        {
> -            unsigned long mask = ~((1UL << page_order) - 1);
> -            gfn_t gfn2 = _gfn(gfn_l & mask);
> -            mfn_t mfn2 = _mfn(mfn_x(mfn) & mask);
> -
> -            rc = ap2m->set_entry(ap2m, gfn2, mfn2, page_order, t, old_a, 1);
> -            if ( rc )
> -                return rc;
> -        }
>      }
>  
>      /*
> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index b9bbb8f485..d38d7c29ca 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2626,6 +2626,7 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
>      mfn_t mfn;
>      unsigned int page_order;
>      int rc = -EINVAL;
> +    bool copied_from_hostp2m;
>  
>      if ( idx >= MAX_ALTP2M || d->arch.altp2m_eptp[idx] == mfn_x(INVALID_MFN) )
>          return rc;
> @@ -2636,7 +2637,7 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
>      p2m_lock(hp2m);
>      p2m_lock(ap2m);
>  
> -    mfn = ap2m->get_entry(ap2m, old_gfn, &t, &a, 0, NULL, NULL);
> +    mfn = altp2m_get_gfn_type_access(ap2m, old_gfn, &t, &a, &page_order, &copied_from_hostp2m);

Before, if new_gfn was INVALID_GFN, then the host p2m wasn't read at
all.  Now, the hostp2m will have __get_gfn_type_access() called with
P2M_ALLOC | P2M_UNSHARE.  Is that change intentional, and if so, why?

>  
>      if ( gfn_eq(new_gfn, INVALID_GFN) )
>      {
> @@ -2646,37 +2647,27 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
>          goto out;
>      }
>  
> -    /* Check host p2m if no valid entry in alternate */
> -    if ( !mfn_valid(mfn) )
> -    {
> -        mfn = __get_gfn_type_access(hp2m, gfn_x(old_gfn), &t, &a,
> -                                    P2M_ALLOC, &page_order, 0);
> +    if ( !mfn_valid(mfn) || (t != p2m_ram_rw && copied_from_hostp2m) )
> +         goto out;
>  
> -        if ( !mfn_valid(mfn) || t != p2m_ram_rw )
> -            goto out;
> -
> -        /* If this is a superpage, copy that first */
> -        if ( page_order != PAGE_ORDER_4K )
> -        {
> -            gfn_t gfn;
> -            unsigned long mask;
> +    /* If this is a superpage, copy that first */
> +    if ( page_order != PAGE_ORDER_4K && copied_from_hostp2m )
> +    {
> +        gfn_t gfn;
> +        unsigned long mask;
>  
> -            mask = ~((1UL << page_order) - 1);
> -            gfn = _gfn(gfn_x(old_gfn) & mask);
> -            mfn = _mfn(mfn_x(mfn) & mask);
> +        mask = ~((1UL << page_order) - 1);
> +        gfn = _gfn(gfn_x(old_gfn) & mask);
> +        mfn = _mfn(mfn_x(mfn) & mask);
>  
> -            if ( ap2m->set_entry(ap2m, gfn, mfn, page_order, t, a, 1) )
> -                goto out;
> -        }
> +        if ( ap2m->set_entry(ap2m, gfn, mfn, page_order, t, a, 1) )
> +            goto out;
>      }
>  
> -    mfn = ap2m->get_entry(ap2m, new_gfn, &t, &a, 0, NULL, NULL);
> -
> -    if ( !mfn_valid(mfn) )
> -        mfn = hp2m->get_entry(hp2m, new_gfn, &t, &a, 0, NULL, NULL);
> +    mfn = altp2m_get_gfn_type_access(ap2m, new_gfn, &t, &a, &page_order, &copied_from_hostp2m);

Similiarly here: Before this patch, hp2m->get_entry() is called
directly; after this patch, we go through __get_gfn_type_access(), which
adds some extra code, and will also unshare / allocate.  Is that
intentional, and if so, why?

>  
>      /* Note: currently it is not safe to remap to a shared entry */
> -    if ( !mfn_valid(mfn) || (t != p2m_ram_rw) )
> +    if ( !mfn_valid(mfn) || (t != p2m_ram_rw && copied_from_hostp2m) )
>          goto out;
>  
>      if ( !ap2m->set_entry(ap2m, old_gfn, mfn, PAGE_ORDER_4K, t, a,
> diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
> index 2801a8ccca..6de1546d76 100644
> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -448,6 +448,25 @@ static inline mfn_t __nonnull(3) get_gfn_type(
>      return get_gfn_type_access(p2m_get_hostp2m(d), gfn, t, &a, q, NULL);
>  }
>  
> +static inline mfn_t altp2m_get_gfn_type_access(
> +    struct p2m_domain *ap2m, gfn_t gfn, p2m_type_t *t, p2m_access_t *a,
> +    unsigned int *page_order, bool *copied_from_hostp2m)
> +{
> +    mfn_t mfn = ap2m->get_entry(ap2m, gfn, t, a, 0, NULL, NULL);
> +
> +    *copied_from_hostp2m = false;
> +
> +    /* Check host p2m if no valid entry in alternate */
> +    if ( !mfn_valid(mfn) )
> +    {
> +        mfn = __get_gfn_type_access(p2m_get_hostp2m(ap2m->domain), gfn_x(gfn), t, a,
> +                                    P2M_ALLOC | P2M_UNSHARE, page_order, false);
> +        *copied_from_hostp2m = mfn_valid(mfn);
> +    }
> +
> +    return mfn;
> +}

Given that the main goal here seems to be to clean up the interface, I'm
not clear why you don't have this function do both the "host
see-through" and the prepopulation.  Would something like the attached
work (not even compile tested)?

(To be clear, this is just meant to be a sketch so you can see what I'm
talking about; if you were to use it you'd need to fix it up
appropriately, including considering whether "seethrough" is an
appropriate name for the function.)

 -George

--------------01DC7261213868C67CB052B2
Content-Type: text/x-patch;
	name="0001-altp2m-Add-a-function-to-automatically-handle-copyin.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename*0="0001-altp2m-Add-a-function-to-automatically-handle-copyin.pa";
	filename*1="tch"

=46rom 45c141269c81c46836bd065bf0da15cad2881011 Mon Sep 17 00:00:00 2001
From: George Dunlap <george.dunlap@citrix.com>
Date: Wed, 10 Apr 2019 16:43:30 +0100
Subject: [PATCH] altp2m: Add a function to automatically handle copying /=

 prepopulating from hostpm

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 xen/arch/x86/mm/mem_access.c | 65 +++++++++++++++++++++++++-----------
 xen/arch/x86/mm/p2m.c        | 38 ++++-----------------
 2 files changed, 52 insertions(+), 51 deletions(-)

diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index a144bb0ce4..253ec94d1b 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -255,43 +255,70 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned lon=
g gla,
     return (p2ma !=3D p2m_access_n2rwx);
 }
=20
-int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain *hp2m,=

-                              struct p2m_domain *ap2m, p2m_access_t a,
-                              gfn_t gfn)
+static int get_altp2m_entry(struct p2m_domain *ap2m,
+                            gfn_t gfn, mfn_t *mfn, p2m_type_t *t,
+                            p2m_access_t *a, bool prepopulate)
 {
-    mfn_t mfn;
-    p2m_type_t t;
-    p2m_access_t old_a;
-    unsigned int page_order;
-    unsigned long gfn_l =3D gfn_x(gfn);
-    int rc;
-
-    mfn =3D ap2m->get_entry(ap2m, gfn, &t, &old_a, 0, NULL, NULL);
+    *mfn =3D ap2m->get_entry(ap2m, gfn, t, a, 0, NULL, NULL);
=20
     /* Check host p2m if no valid entry in alternate */
-    if ( !mfn_valid(mfn) )
+    if ( !mfn_valid(*mfn) )
     {
+        struct p2m_domain *hp2m =3D p2m_get_hostp2m(ap2m->domain);
+        unsigned int page_order;
+        int rc;
=20
-        mfn =3D __get_gfn_type_access(hp2m, gfn_l, &t, &old_a,
-                                    P2M_ALLOC | P2M_UNSHARE, &page_order=
, 0);
+        *mfn =3D __get_gfn_type_access(hp2m, gfn, t, old_a,
+                                     P2M_ALLOC | P2M_UNSHARE, &page_orde=
r, 0);
=20
         rc =3D -ESRCH;
-        if ( !mfn_valid(mfn) || t !=3D p2m_ram_rw )
+        if ( !mfn_valid(*mfn) || *t !=3D p2m_ram_rw )
             return rc;
=20
         /* If this is a superpage, copy that first */
-        if ( page_order !=3D PAGE_ORDER_4K )
+        if ( prepopulate && page_order !=3D PAGE_ORDER_4K )
         {
             unsigned long mask =3D ~((1UL << page_order) - 1);
-            gfn_t gfn2 =3D _gfn(gfn_l & mask);
-            mfn_t mfn2 =3D _mfn(mfn_x(mfn) & mask);
+            gfn_t gfn_aligned =3D _gfn(gfn & mask);
+            mfn_t mfn_aligned =3D _mfn(mfn_x(mfn) & mask);
=20
-            rc =3D ap2m->set_entry(ap2m, gfn2, mfn2, page_order, t, old_=
a, 1);
+            rc =3D ap2m->set_entry(ap2m, gfn_aligned, mfn_aligned, page_=
order, t, old_a, 1);
             if ( rc )
                 return rc;
         }
     }
=20
+    return 0;
+}
+
+int altp2m_get_entry_seethrough(struct p2m_domain *ap2m,
+                                        gfn_t gfn, mfn_t *mfn, p2m_type_=
t *t,
+                                        p2m_access_t *a)
+{
+    return get_altp2m_entry(ap2m, gfn, mfn, t, a, false);
+}
+
+int altp2m_get_entry_prepopulate(struct p2m_domain *ap2m,
+                                        gfn_t gfn, mfn_t *mfn, p2m_type_=
t *t,
+                                        p2m_access_t *a)
+{
+    return get_altp2m_entry(ap2m, gfn, mfn, t, a, true);
+}
+
+int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain *hp2m,=

+                              struct p2m_domain *ap2m, p2m_access_t a,
+                              gfn_t gfn)
+{
+    mfn_t mfn;
+    p2m_type_t t;
+    p2m_access_t old_a;
+    unsigned long gfn_l =3D gfn_x(gfn);
+    int rc;
+
+    rc =3D alt2m_get_entry_prepopulate(ap2m, gfn, &mfn, &t, &old_a);
+    if ( rc )
+        return rc;
+
     /*
      * Inherit the old suppress #VE bit value if it is already set, or s=
et it
      * to 1 otherwise
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index b9bbb8f485..d9f7135be5 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2636,47 +2636,21 @@ int p2m_change_altp2m_gfn(struct domain *d, unsig=
ned int idx,
     p2m_lock(hp2m);
     p2m_lock(ap2m);
=20
-    mfn =3D ap2m->get_entry(ap2m, old_gfn, &t, &a, 0, NULL, NULL);
-
     if ( gfn_eq(new_gfn, INVALID_GFN) )
     {
+        mfn =3D ap2m->get_entry(ap2m, old_gfn, &t, &a, 0, NULL, NULL);
         if ( mfn_valid(mfn) )
             p2m_remove_page(ap2m, gfn_x(old_gfn), mfn_x(mfn), PAGE_ORDER=
_4K);
         rc =3D 0;
         goto out;
     }
=20
-    /* Check host p2m if no valid entry in alternate */
-    if ( !mfn_valid(mfn) )
-    {
-        mfn =3D __get_gfn_type_access(hp2m, gfn_x(old_gfn), &t, &a,
-                                    P2M_ALLOC, &page_order, 0);
-
-        if ( !mfn_valid(mfn) || t !=3D p2m_ram_rw )
-            goto out;
-
-        /* If this is a superpage, copy that first */
-        if ( page_order !=3D PAGE_ORDER_4K )
-        {
-            gfn_t gfn;
-            unsigned long mask;
-
-            mask =3D ~((1UL << page_order) - 1);
-            gfn =3D _gfn(gfn_x(old_gfn) & mask);
-            mfn =3D _mfn(mfn_x(mfn) & mask);
-
-            if ( ap2m->set_entry(ap2m, gfn, mfn, page_order, t, a, 1) )
-                goto out;
-        }
-    }
-
-    mfn =3D ap2m->get_entry(ap2m, new_gfn, &t, &a, 0, NULL, NULL);
-
-    if ( !mfn_valid(mfn) )
-        mfn =3D hp2m->get_entry(hp2m, new_gfn, &t, &a, 0, NULL, NULL);
+    rc =3D altp2m_get_entry_prepopulate(ap2m, old_gfn, &mfn, &t, &a);
+    if ( rc )
+        goto out;
=20
-    /* Note: currently it is not safe to remap to a shared entry */
-    if ( !mfn_valid(mfn) || (t !=3D p2m_ram_rw) )
+    rc =3D altp2m_get_entry_seethrough(ap2m, new_gfn, &mfn, &t, &a);
+    if ( rc )
         goto out;
=20
     if ( !ap2m->set_entry(ap2m, old_gfn, mfn, PAGE_ORDER_4K, t, a,
--=20
2.20.1


--------------01DC7261213868C67CB052B2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------01DC7261213868C67CB052B2--
