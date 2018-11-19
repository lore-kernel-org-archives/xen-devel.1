From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V6 4/4] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Mon, 19 Nov 2018 15:58:52 +0000
Message-ID: <43323e2f-e1c1-5fc7-c1b5-8a3b58819718@citrix.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-5-git-send-email-rcojocaru@bitdefender.com>
 <3603CF64-3679-43F6-A389-E88DAA0BF503@citrix.com>
 <482be5fb-0406-c203-2664-070a77e329e9@bitdefender.com>
 <5BEE972D02000078001FCB0D@prv1-mh.provo.novell.com>
 <62c1f237-9d1d-06f3-49f8-e48be8d38b3f@citrix.com>
 <6ef4e095-cbd3-3d37-7759-0d3faa720e84@bitdefender.com>
 <c6e1ee08-0b71-f8f8-5862-94a8d01ac1e1@citrix.com>
 <e33cad9e-f138-48b0-d12c-5178eea9b6e2@bitdefender.com>
 <70f50b49-9b7a-13d9-442c-62df33105552@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------87940B2DED7D31D6237C500C"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v//2=n6=citrix.com=prvs=8541ae097=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gOlxi-0002SQ-Td
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 15:59:46 +0000
In-Reply-To: <70f50b49-9b7a-13d9-442c-62df33105552@bitdefender.com>
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

--------------87940B2DED7D31D6237C500C
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 11/17/18 6:58 PM, Razvan Cojocaru wrote:
> On 11/16/18 9:50 PM, Razvan Cojocaru wrote:
>> On 11/16/18 7:59 PM, George Dunlap wrote:
>>> On the other hand, we want the logdirty rangesets to actually match the
>>> host's rangesets; using altp2m->max_mapped_pfn for this is clearly
>>> wrong. The easiest fix would be just to explicitly use the host's
>>> max_mapped_pfn when calculating the clipping.  A more complete fix would
>>> involve calculating two different ranges -- a "rangeset" range and a
>>> "invalidate" range, the second of which would be clipped on altp2ms by
>>> {min,max}_remapped_gfn.
>>>
>>> Something like the attached (compile-tested only).  I'm partial to
>>> having both patches applied, but I'd be open to arguments that we should
>>> only use the first.
>>
>> Thanks! I haven't yet been able to think in depth about the logic, but I
>> did manage to apply them. Just applying the first one allows me to set
>> p2m->max_mapped_pfn = 0; without the ASSERT() crashing the hypervisor,
>> and everything appears to work well.
>>
>> With both patches applies, the display remains frozen (things appear to
>> behave - externally - in the same way as before the series).
> 
> Right, I know why the second patch keeps the display frozen. It's
> because for altp2ms (where it matters most), the patch basically does
> invalidate_start = max(invalidate_start, p2m->min_remapped_gfn) and
> invalidate_end = min(invalidate_end, p2m->max_remapped_gfn).
> 
> However, as previously requested, I've now made p2m->max_remapped_gfn
> begin life as 0 for altp2ms, and p2m->min_remapped_gfn is initialized to
> INVALID_GFN, which is decimal 18446744073709551615. So we get
> invalidate_end: 0, invalidate_start: 18446744073709551615,
> invalidate_end < invalidate_start, resulting in nothing being done for
> altp2ms, which is functionally back to square one.

But this doesn't explain why my reasoning was wrong; and it's always
dangerous to use a system whose behavior you don't really understand,
even if it seems to work.

It turns out I'd made a mistake in saying that altp2m->max_mapped_pfn ==
alt2m->max_remapped_gfn.  The first is the highest gfn present in the
altp2m, either copied from the hostp2m or changed; the second is the
highest value changed (via p2m_altp2m_change_gfn()).

What about using the attached patch instead?

 -George

--------------87940B2DED7D31D6237C500C
Content-Type: text/x-patch;
	name="0002-p2m-change_range_type-Only-invalidate-mapped-gfns.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0002-p2m-change_range_type-Only-invalidate-mapped-gfns.patch"

=46rom f4c72ecb95cfa5d597b8e28e99e681cfeaa32199 Mon Sep 17 00:00:00 2001
From: George Dunlap <george.dunlap@citrix.com>
Date: Fri, 16 Nov 2018 16:28:25 +0000
Subject: [PATCH 2/2] p2m: change_range_type: Only invalidate mapped gfns

change_range_type() invalidates gfn ranges to lazily change the type
of a range of gfns, and also modifies the logdirty rangesets of that
p2m. At the moment, it clips both down by the hostp2m.

While this will result in correct behavior, it's not entirely efficient,
since invalidated entries outside that range will, on fault, simply be
modified back to "empty" before faulting normally again.

Separate out the calculation of the two ranges.  Keep using the
hostp2m's max_mapped_pfn to clip the logdirty ranges, but use the
current p2m's max_mapped_pfn to further clip the invalidation range
for alternate p2ms.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 xen/arch/x86/mm/p2m.c | 61 +++++++++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 6d764d1e22..b97e138452 100644
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
+    unsigned long max_pfn =3D p2m->max_mapped_pfn;
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
+        invalidate_end =3D min(invalidate_end, max_pfn);
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
-    {
-        printk(XENLOG_G_ERR "Error %d changing Dom%d GFNs [%lx,%lx] from=
 %d to %d\n",
-               rc, d->domain_id, rangeset_start, rangeset_end, ot, nt);
-        domain_crash(d);
+    if ( invalidate_start < invalidate_end )
+    {
+        /*=20
+         * If all valid gfns are in the invalidation range, just do a
+         * global type change.  Otherwise, invalidate only the range
+         * we need. =20
+         *
+         * NB that invalidate_end can't logically be >max_pfn at this
+         * point.  If this changes, the =3D=3D will need to be changed t=
o
+         * >=3D.
+         */
+        ASSERT(invalidate_end <=3D max_pfn);
+        if ( !invalidate_start && invalidate_end =3D=3D max_pfn)
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


--------------87940B2DED7D31D6237C500C
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------87940B2DED7D31D6237C500C--
