From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V6 4/4] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Fri, 16 Nov 2018 17:59:15 +0000
Message-ID: <c6e1ee08-0b71-f8f8-5862-94a8d01ac1e1@citrix.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-5-git-send-email-rcojocaru@bitdefender.com>
 <3603CF64-3679-43F6-A389-E88DAA0BF503@citrix.com>
 <482be5fb-0406-c203-2664-070a77e329e9@bitdefender.com>
 <5BEE972D02000078001FCB0D@prv1-mh.provo.novell.com>
 <62c1f237-9d1d-06f3-49f8-e48be8d38b3f@citrix.com>
 <6ef4e095-cbd3-3d37-7759-0d3faa720e84@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------8AC5DA987FE242954DEB42EE"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sqSd=N3=citrix.com=prvs=851e78e2c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gNiP8-0006GC-7y
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 17:59:42 +0000
In-Reply-To: <6ef4e095-cbd3-3d37-7759-0d3faa720e84@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--------------8AC5DA987FE242954DEB42EE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 11/16/18 2:10 PM, Razvan Cojocaru wrote:
> On 11/16/18 2:03 PM, George Dunlap wrote:
>> The code is definitely complicated enough, though, that I may have
>> missed something, which is why I asked Razvan if there was a reason he
>> changed it.
>>
>> For the purposes of this patch, I propose having p2m_altp2m_init_ept()
>> set max_mapped_pfn to 0 (if that works), and leaving "get rid of
>> max_remapped_pfn" for a future clean-up series.
> 
> I've retraced my previous analysis and re-ran some tests, and I now
> remember (sorry it took a while) why the p2m->max_mapped_pfn =
> hostp2m->max_mapped_pfn was both necessary and not accidental.
> 
> Let's say we set it to 0 in p2m_altp2m_init_ept(). Then,
> hap_track_dirty_vram() calls p2m_change_type_range(), which calls the
> newly added change_type_range().
> 
> Change_type_range() looks like this:
> 
> static void change_type_range(struct p2m_domain *p2m,
>                               unsigned long start, unsigned long end,
>                               p2m_type_t ot, p2m_type_t nt)
> {
>     unsigned long gfn = start;
>     struct domain *d = p2m->domain;
>     int rc = 0;
> 
>     p2m->defer_nested_flush = 1;
> 
>     if ( unlikely(end > p2m->max_mapped_pfn) )
>     {
>         if ( !gfn )
>         {
>             p2m->change_entry_type_global(p2m, ot, nt);
>             gfn = end;
>         }
>         end = p2m->max_mapped_pfn + 1;
>     }
>     if ( gfn < end )
>         rc = p2m->change_entry_type_range(p2m, ot, nt, gfn, end - 1);
>     if ( rc )
>     {
>         printk(XENLOG_G_ERR "Error %d changing Dom%d GFNs [%lx,%lx] from
> %d to %d\n",
>                rc, d->domain_id, start, end - 1, ot, nt);
>         domain_crash(d);
>     }
> 
>     switch ( nt )
>     {
>     case p2m_ram_rw:
>         if ( ot == p2m_ram_logdirty )
>             rc = rangeset_remove_range(p2m->logdirty_ranges, start, end
> - 1);
>         break;
>     case p2m_ram_logdirty:
>         if ( ot == p2m_ram_rw )
>             rc = rangeset_add_range(p2m->logdirty_ranges, start, end - 1);
>         break;
>     default:
>         break;
>     }
>     if ( rc )
>     {
>         printk(XENLOG_G_ERR "Error %d manipulating Dom%d's log-dirty
> ranges\n",
>                rc, d->domain_id);
>         domain_crash(d);
>     }
> 
>     p2m->defer_nested_flush = 0;
>     if ( nestedhvm_enabled(d) )
>         p2m_flush_nestedp2m(d);
> }
> 
> If we set p2m->max_mapped_pfn to 0, we're guaranteed to run into the if
> ( unlikely(end > p2m->max_mapped_pfn) ) body, where end =
> p2m->max_mapped_pfn + 1; will make end 1.
> 
> Then, we will crash the hypervisor in rangeset_add_range(), where
> there's an ASSERT() stating that start <= end.

Ah, right, this was the original crash that you ran into several months
ago, which flagged up the whole logdirty range synchronization issue.

But that's partly a logic hole in change_entry_type_range(), which
assumes that start < p2m->max_mapped_pfn.  It would be better to fix
that than to work around it by changing the meaning of max_mapped_pfn.

On the other hand, we want the logdirty rangesets to actually match the
host's rangesets; using altp2m->max_mapped_pfn for this is clearly
wrong. The easiest fix would be just to explicitly use the host's
max_mapped_pfn when calculating the clipping.  A more complete fix would
involve calculating two different ranges -- a "rangeset" range and a
"invalidate" range, the second of which would be clipped on altp2ms by
{min,max}_remapped_gfn.

Something like the attached (compile-tested only).  I'm partial to
having both patches applied, but I'd be open to arguments that we should
only use the first.

 -George

--------------8AC5DA987FE242954DEB42EE
Content-Type: text/x-patch;
	name="0001-p2m-Always-use-hostp2m-when-clipping-rangesets.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-p2m-Always-use-hostp2m-when-clipping-rangesets.patch"

=46rom d92bd123f92d66aef394735a6d836fd104f01867 Mon Sep 17 00:00:00 2001
From: George Dunlap <george.dunlap@citrix.com>
Date: Fri, 16 Nov 2018 17:17:48 +0000
Subject: [PATCH 1/2] p2m: Always use hostp2m when clipping rangesets

The logdirty rangesets of the altp2ms need to be kept in sync with the
hostp2m.  This means when iterating through the altp2ms, we need to
use the host p2m to clip the rangeset, not the indiviual altp2m's
value.

This change also:

- Documents that the end is non-inclusive

- Calculates an "inclusive" value for the end once, rather than
  open-coding the modification, and (worse) back-modifying updates so
  that the calculation ends up correct

- Clarifies the logic deciding whether to call
  change_entry_type_global() or change_entry_type_range()

- Handles the case where start >=3D hostp2m->max_mapped_pfn

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
RFC: Wasn't sure what the best thing was to do if start >=3D
host_max_pfn.  We silently clip the logdirty rangeset to
max_mapped_pfn, and the chosen behavior seems consistent with that.
But it seems like such a request would almost certainly be a bug
somewhere that people might like to find out about.
---
 xen/arch/x86/mm/p2m.c | 46 +++++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index c401806562..6d764d1e22 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1037,32 +1037,44 @@ int p2m_change_type_one(struct domain *d, unsigne=
d long gfn_l,
     return rc;
 }
=20
-/* Modify the p2m type of a range of gfns from ot to nt. */
+/* Modify the p2m type of [start, end) from ot to nt. */
 static void change_type_range(struct p2m_domain *p2m,
                               unsigned long start, unsigned long end,
                               p2m_type_t ot, p2m_type_t nt)
 {
-    unsigned long gfn =3D start;
+    unsigned long rangeset_start, rangeset_end;
     struct domain *d =3D p2m->domain;
+    unsigned long host_max_pfn =3D p2m_get_hostp2m(d)->max_mapped_pfn;
     int rc =3D 0;
-
+   =20
+    rangeset_start =3D start;
+    rangeset_end   =3D end - 1;
+   =20
+    /* Always clip the rangeset down to the host p2m */
+    if ( unlikely(rangeset_end > host_max_pfn) )
+        rangeset_end =3D host_max_pfn;
+       =20
+    /* If the requested range is out of scope, return doing nothing */
+    if ( rangeset_start > rangeset_end )
+        return;
+           =20
     p2m->defer_nested_flush =3D 1;
=20
-    if ( unlikely(end > p2m->max_mapped_pfn) )
-    {
-        if ( !gfn )
-        {
-            p2m->change_entry_type_global(p2m, ot, nt);
-            gfn =3D end;
-        }
-        end =3D p2m->max_mapped_pfn + 1;
-    }
-    if ( gfn < end )
-        rc =3D p2m->change_entry_type_range(p2m, ot, nt, gfn, end - 1);
+    /*=20
+     * If all valid gfns are in the invalidation range, just do a
+     * global type change.  Otherwise, invalidate only the range we
+     * need.
+     */
+    if ( !rangeset_start && rangeset_end >=3D p2m->max_mapped_pfn)
+        p2m->change_entry_type_global(p2m, ot, nt);
+    else
+        rc =3D p2m->change_entry_type_range(p2m, ot, nt,
+                                          rangeset_start, rangeset_end);=

+   =20
     if ( rc )
     {
         printk(XENLOG_G_ERR "Error %d changing Dom%d GFNs [%lx,%lx] from=
 %d to %d\n",
-               rc, d->domain_id, start, end - 1, ot, nt);
+               rc, d->domain_id, rangeset_start, rangeset_end, ot, nt);
         domain_crash(d);
     }
=20
@@ -1070,11 +1082,11 @@ static void change_type_range(struct p2m_domain *=
p2m,
     {
     case p2m_ram_rw:
         if ( ot =3D=3D p2m_ram_logdirty )
-            rc =3D rangeset_remove_range(p2m->logdirty_ranges, start, en=
d - 1);
+            rc =3D rangeset_remove_range(p2m->logdirty_ranges, rangeset_=
start, rangeset_end);
         break;
     case p2m_ram_logdirty:
         if ( ot =3D=3D p2m_ram_rw )
-            rc =3D rangeset_add_range(p2m->logdirty_ranges, start, end -=
 1);
+            rc =3D rangeset_add_range(p2m->logdirty_ranges, rangeset_sta=
rt, rangeset_end);
         break;
     default:
         break;
--=20
2.19.1


--------------8AC5DA987FE242954DEB42EE
Content-Type: text/x-patch;
	name="0002-p2m-change_range_type-Only-invalidate-remapped-gfns.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename*0="0002-p2m-change_range_type-Only-invalidate-remapped-gfns.pat";
	filename*1="ch"

=46rom c2c6e0b9c27650607a5d15aca0d598ae7251678e Mon Sep 17 00:00:00 2001
From: George Dunlap <george.dunlap@citrix.com>
Date: Fri, 16 Nov 2018 16:28:25 +0000
Subject: [PATCH 2/2] p2m: change_range_type: Only invalidate remapped gfn=
s

change_range_type() invalidates gfn ranges to lazily change the type
of a range of gfns, and also modifies the logdirty rangesets of that
p2m. At the moment, it clips both down by the hostp2m.

While this will result in correct behavior, it's not entirely efficient,
since invalidated entries outside that range will, on fault, simply be
modified back to "empty" before faulting normally again.

Separate out the calculation of the two ranges.  Keep using the
hostp2m's max_mapped_pfn to clip the logdirty ranges, but use
{max,min}_remapped_gfn to further clip the invalidation range for
alternate p2ms.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 xen/arch/x86/mm/p2m.c | 59 ++++++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 6d764d1e22..5a68e7fd78 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1043,41 +1043,64 @@ static void change_type_range(struct p2m_domain *=
p2m,
                               p2m_type_t ot, p2m_type_t nt)
 {
     unsigned long rangeset_start, rangeset_end;
+    unsigned long invalidate_start, invalidate_end;
     struct domain *d =3D p2m->domain;
     unsigned long host_max_pfn =3D p2m_get_hostp2m(d)->max_mapped_pfn;
+    unsigned long min_pfn =3D 0, max_pfn =3D p2m->max_mapped_pfn;
     int rc =3D 0;
    =20
-    rangeset_start =3D start;
-    rangeset_end   =3D end - 1;
+    /*=20
+     * If we have an altp2m, the logdirty rangeset range needs to
+     * match that of the hostp2m, but for efficiency, we want to clip
+     * down the the invalidation range according to the mapped values
+     * in the altp2m.  Keep track of and clip the ranges separately.
+     */
+    rangeset_start =3D invalidate_start =3D start;
+    rangeset_end   =3D invalidate_end   =3D end - 1;
    =20
-    /* Always clip the rangeset down to the host p2m */
+    /* Clip down to the host p2m */
     if ( unlikely(rangeset_end > host_max_pfn) )
-        rangeset_end =3D host_max_pfn;
+        rangeset_end =3D invalidate_end =3D host_max_pfn;
        =20
     /* If the requested range is out of scope, return doing nothing */
     if ( rangeset_start > rangeset_end )
         return;
            =20
+    if ( p2m_is_altp2m(p2m) )
+    {
+        max_pfn =3D p2m->max_remapped_gfn;
+        min_pfn =3D p2m->min_remapped_gfn;
+        invalidate_end =3D min(invalidate_end, max_pfn);
+        invalidate_start =3D max(invalidate_start, min_pfn);
+    }
+       =20
     p2m->defer_nested_flush =3D 1;
=20
     /*=20
-     * If all valid gfns are in the invalidation range, just do a
-     * global type change.  Otherwise, invalidate only the range we
-     * need.
+     * If the p2m is empty, or the range is outside the currently
+     * mapped range, no need to do the invalidation; just update the
+     * rangeset.
      */
-    if ( !rangeset_start && rangeset_end >=3D p2m->max_mapped_pfn)
-        p2m->change_entry_type_global(p2m, ot, nt);
-    else
-        rc =3D p2m->change_entry_type_range(p2m, ot, nt,
-                                          rangeset_start, rangeset_end);=

-   =20
-    if ( rc )
+    if ( invalidate_start < invalidate_end )
     {
-        printk(XENLOG_G_ERR "Error %d changing Dom%d GFNs [%lx,%lx] from=
 %d to %d\n",
-               rc, d->domain_id, rangeset_start, rangeset_end, ot, nt);
-        domain_crash(d);
+        /*=20
+         * If all valid gfns are in the invalidation range, just do a
+         * global type change.  Otherwise, invalidate only the range
+         * we need.
+         */
+        if ( invalidate_start <=3D min_pfn && invalidate_end >=3D max_pf=
n)
+            p2m->change_entry_type_global(p2m, ot, nt);
+        else
+            rc =3D p2m->change_entry_type_range(p2m, ot, nt,
+                                              invalidate_start, invalida=
te_end);
+        if ( rc )
+        {
+            printk(XENLOG_G_ERR "Error %d changing Dom%d GFNs [%lx,%lx] =
from %d to %d\n",
+                   rc, d->domain_id, invalidate_start, invalidate_end, o=
t, nt);
+            domain_crash(d);
+        }
     }
-
+   =20
     switch ( nt )
     {
     case p2m_ram_rw:
--=20
2.19.1


--------------8AC5DA987FE242954DEB42EE
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------8AC5DA987FE242954DEB42EE--
