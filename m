Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCBAC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 16:03:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25327206DF
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 16:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25327206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEFgy-0006br-Tm; Wed, 10 Apr 2019 16:03:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+PC=SM=citrix.com=prvs=996a3bdca=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hEFgx-0006bm-L0
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 16:03:15 +0000
X-Inumbo-ID: 24f2b3b0-5baa-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 24f2b3b0-5baa-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 16:03:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208,223";a="83244669"
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <28c52232-536f-d007-4072-fbce95b44d8c@citrix.com>
Date: Wed, 10 Apr 2019 17:02:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190409120324.13940-1-aisaila@bitdefender.com>
Content-Type: multipart/mixed; boundary="------------01DC7261213868C67CB052B2"
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/3] x86/mm: Introduce
 altp2m_get_gfn_type_access
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410160258.QohREdz_tXUMqyYLa_akqXGGBAoZ_aHhTUwMiQsVwEM@z>

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

