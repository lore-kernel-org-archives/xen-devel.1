From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2] x86/altp2m: cleanup p2m_altp2m_lazy_copy
Date: Mon, 27 May 2019 16:55:03 +0100
Message-ID: <46d12d38-cc34-0a2a-7d08-42b9256d5b05@citrix.com>
References: <20190412200813.25447-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------4BB61A2C767782DAA2300E52"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E92+=T3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hVHxs-0000ig-Mz
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 15:55:08 +0000
In-Reply-To: <20190412200813.25447-1-tamas@tklengyel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--------------4BB61A2C767782DAA2300E52
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 4/12/19 9:08 PM, Tamas K Lengyel wrote:
> The p2m_altp2m_lazy_copy is responsible for lazily populating an altp2m view
> when the guest traps out due to no EPT entry being present in the active view.
> Currently the function took several inputs that it didn't use and also
> locked/unlocked gfns when it didn't need to.

Wow, the code you're cleaning up was really all over the place.  Thanks
for this.

The code in your patch looks correct; but while you've gotten rid of the
redundant host p2m lookup, there's still a redundant altp2m lookup.  Is
there any reason not to take it to its logical conclusion, like the
attached patch?

NB this is compile-tested only; definitely double-check it for logic errors.

 -George

--------------4BB61A2C767782DAA2300E52
Content-Type: text/x-patch;
	name="0001-x86-altp2m-cleanup-p2m_altp2m_lazy_copy.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-x86-altp2m-cleanup-p2m_altp2m_lazy_copy.patch"

=46rom 41c89a229c8cfbf2f747a56482b8cc805158af81 Mon Sep 17 00:00:00 2001
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 12 Apr 2019 14:08:13 -0600
Subject: [PATCH] x86/altp2m: cleanup p2m_altp2m_lazy_copy

The p2m_altp2m_lazy_copy is responsible for lazily populating an
altp2m view when the guest traps out due to no EPT entry being present
in the active view.  Currently, in addition to taking a number of
unused argements, the whole calling convention has a number of
redundant p2m lookups: the function reads the hostp2m, even though the
caller has just read the same hostp2m entry; and then the caller
re-reads the altp2m entry that the function has just read (and possibly s=
et).

Rework this function to make it a bit more rational.  Specifically:

- Pass the current hostp2m entry values we have just read for it to
  use to populate the altp2m entry if it finds the entry empty.

- If the altp2m entry is not empty, pass out the values we've read so
  the caller doesn't need to re-walk the tables

- Either way, return with the gfn 'locked', to make clean-up handling
  more consistent.

Rename the function to better reflect this functionality.

While we're here, change bool_t to bool, and return true/false rather
than 1/0.

It's a bit grating to do both the p2m_lock() and the get_gfn(),
knowing that they boil down to the same thing at the moment; but we
have to maintain the fiction until such time as we decide to get rid
of it entirely.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>
---
 xen/arch/x86/hvm/hvm.c    | 19 +++++---
 xen/arch/x86/mm/p2m.c     | 95 +++++++++++++++++++++------------------
 xen/include/asm-x86/p2m.h |  5 ++-
 3 files changed, 67 insertions(+), 52 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ed1ff9c87f..2f4e7bd30e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1691,6 +1691,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned=
 long gla,
     int sharing_enomem =3D 0;
     vm_event_request_t *req_ptr =3D NULL;
     bool_t ap2m_active, sync =3D 0;
+    unsigned int page_order;
=20
     /* On Nested Virtualization, walk the guest page table.
      * If this succeeds, all is fine.
@@ -1757,19 +1758,23 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsign=
ed long gla,
     hostp2m =3D p2m_get_hostp2m(currd);
     mfn =3D get_gfn_type_access(hostp2m, gfn, &p2mt, &p2ma,
                               P2M_ALLOC | (npfec.write_access ? P2M_UNSH=
ARE : 0),
-                              NULL);
+                              &page_order);
=20
     if ( ap2m_active )
     {
-        if ( p2m_altp2m_lazy_copy(curr, gpa, gla, npfec, &p2m) )
+        p2m =3D p2m_get_altp2m(curr);
+
+        /*=20
+         * Get the altp2m entry if present; or if not, propagate from
+         * the host p2m.  NB that this returns with gfn locked in the
+         * altp2m.
+         */
+        if ( p2m_altp2m_get_or_propagate(p2m, gfn, &mfn, &p2mt, &p2ma, p=
age_order) )
         {
-            /* entry was lazily copied from host -- retry */
-            __put_gfn(hostp2m, gfn);
+            /* Entry was copied from host -- retry fault */
             rc =3D 1;
-            goto out;
+            goto out_put_gfn;
         }
-
-        mfn =3D get_gfn_type_access(p2m, gfn, &p2mt, &p2ma, 0, NULL);
     }
     else
         p2m =3D hostp2m;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 278e1c114e..385146ca63 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2397,65 +2397,74 @@ bool_t p2m_switch_vcpu_altp2m_by_id(struct vcpu *=
v, unsigned int idx)
 }
=20
 /*
- * If the fault is for a not present entry:
- *     if the entry in the host p2m has a valid mfn, copy it and retry
- *     else indicate that outer handler should handle fault
+ * Read info about the gfn in an altp2m, locking the gfn.
  *
- * If the fault is for a present entry:
- *     indicate that outer handler should handle fault
+ * If the entry is valid, pass the results back to the caller.
+ *
+ * If the entry was invalid, and the host's entry is also invalid,
+ * return to the caller without any changes.
+ *
+ * If the entry is invalid, and the host entry was valid, propagate
+ * the host's entry to the altp2m (retaining page order), and indicate
+ * that the caller should re-try the faulting instruction.
  */
-
-bool_t p2m_altp2m_lazy_copy(struct vcpu *v, paddr_t gpa,
-                            unsigned long gla, struct npfec npfec,
-                            struct p2m_domain **ap2m)
+bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long =
gfn_l,
+                                 mfn_t *mfn, p2m_type_t *p2mt,
+                                 p2m_access_t *p2ma, unsigned int page_o=
rder)
 {
-    struct p2m_domain *hp2m =3D p2m_get_hostp2m(v->domain);
-    p2m_type_t p2mt;
-    p2m_access_t p2ma;
-    unsigned int page_order;
-    gfn_t gfn =3D _gfn(paddr_to_pfn(gpa));
+    p2m_type_t ap2mt;
+    p2m_access_t ap2ma;
     unsigned long mask;
-    mfn_t mfn;
-    int rv;
-
-    *ap2m =3D p2m_get_altp2m(v);
-
-    mfn =3D get_gfn_type_access(*ap2m, gfn_x(gfn), &p2mt, &p2ma,
-                              0, &page_order);
-    __put_gfn(*ap2m, gfn_x(gfn));
-
-    if ( !mfn_eq(mfn, INVALID_MFN) )
-        return 0;
+    gfn_t gfn;
+    mfn_t amfn;
+    int rc;
=20
-    mfn =3D get_gfn_type_access(hp2m, gfn_x(gfn), &p2mt, &p2ma,
-                              P2M_ALLOC, &page_order);
-    __put_gfn(hp2m, gfn_x(gfn));
+    /*
+     * NB we must get the full lock on the altp2m here, in addition to
+     * the lock on the individual gfn, since we may change a range of
+     * gfns below.
+     */
+    p2m_lock(ap2m);
+   =20
+    amfn =3D get_gfn_type_access(ap2m, gfn_l, &ap2mt, &ap2ma, 0, NULL);
=20
-    if ( mfn_eq(mfn, INVALID_MFN) )
-        return 0;
+    if ( !mfn_eq(amfn, INVALID_MFN) )
+    {
+        p2m_unlock(ap2m);
+        *mfn  =3D amfn;
+        *p2mt =3D ap2mt;
+        *p2ma =3D ap2ma;
+        return false;
+    }
=20
-    p2m_lock(*ap2m);
+    /* Host entry is also invalid; don't bother setting the altp2m entry=
=2E */
+    if ( mfn_eq(*mfn, INVALID_MFN) )
+    {
+        p2m_unlock(ap2m);
+        return false;
+    }
=20
     /*
      * If this is a superpage mapping, round down both frame numbers
-     * to the start of the superpage.
+     * to the start of the superpage.  NB that we repupose `amfn`
+     * here.
      */
     mask =3D ~((1UL << page_order) - 1);
-    mfn =3D _mfn(mfn_x(mfn) & mask);
-    gfn =3D _gfn(gfn_x(gfn) & mask);
+    amfn =3D _mfn(mfn_x(*mfn) & mask);
+    gfn =3D _gfn(gfn_l & mask);
=20
-    rv =3D p2m_set_entry(*ap2m, gfn, mfn, page_order, p2mt, p2ma);
-    p2m_unlock(*ap2m);
+    rc =3D p2m_set_entry(ap2m, gfn, amfn, page_order, *p2mt, *p2ma);
+    p2m_unlock(ap2m);
=20
-    if ( rv )
+    if ( rc )
     {
-        gdprintk(XENLOG_ERR,
-	    "failed to set entry for %#"PRIx64" -> %#"PRIx64" p2m %#"PRIx64"\n"=
,
-	    gfn_x(gfn), mfn_x(mfn), (unsigned long)*ap2m);
-        domain_crash(hp2m->domain);
+        gprintk(XENLOG_ERR,
+        "failed to set entry for %#"PRIx64" -> %#"PRIx64" altp2m %#"PRIx=
16". rc: %"PRIi32"\n",
+        gfn_l, mfn_x(amfn), vcpu_altp2m(current).p2midx, rc);
+        domain_crash(ap2m->domain);
     }
-
-    return 1;
+   =20
+    return true;
 }
=20
 enum altp2m_reset_type {
diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
index 719513f4ba..905fad7c8d 100644
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -879,8 +879,9 @@ void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
 void p2m_flush_altp2m(struct domain *d);
=20
 /* Alternate p2m paging */
-bool_t p2m_altp2m_lazy_copy(struct vcpu *v, paddr_t gpa,
-    unsigned long gla, struct npfec npfec, struct p2m_domain **ap2m);
+bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long =
gfn_l,
+                                 mfn_t *mfn, p2m_type_t *p2mt,
+                                 p2m_access_t *p2ma, unsigned int page_o=
rder);
=20
 /* Make a specific alternate p2m valid */
 int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx);
--=20
2.20.1


--------------4BB61A2C767782DAA2300E52
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------4BB61A2C767782DAA2300E52--
