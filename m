From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V2] x86/p2m: fixed p2m_change_type_range()
 start / end check
Date: Mon, 23 Apr 2018 14:56:54 +0300
Message-ID: <5d727c43-99b4-5c4b-0827-859be67f4692@bitdefender.com>
References: <1524057157-17585-1-git-send-email-rcojocaru@bitdefender.com>
 <856c6212-2fbb-953b-c8a2-5405f7c9607f@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------3A28A8AC4C3C447C1D4AFEA4"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <856c6212-2fbb-953b-c8a2-5405f7c9607f@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org
Cc: george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------3A28A8AC4C3C447C1D4AFEA4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 04/23/2018 02:47 PM, George Dunlap wrote:
> On 04/18/2018 02:12 PM, Razvan Cojocaru wrote:
>> p2m_change_type_range() handles end > max_mapped_pfn, but not
>> start > max_mapped_pfn. Check the latter just after grabbing the
>> lock and bail if true.
>>
>> Signed-off-by: Razvan Cojocaru <rcojocaru@bitdefender.com>
>> Suggested-by: George Dunlap <george.dunlap@citrix.com>
> 
> Sorry, I meant to reply to this earlier but I haven't been able to make
> the time.
> 
> On reflection, I think this is the wrong approach actually.  First, my
> assertion was incorrect: the p2m_altp2m_propagate_change() is gated on
> p2m->max_remapped_gfn, not max_mapped_gfn (nb the 're').  So setting
> max_mapped_gfn shouldn't cause 'unnecessary' propagations.
> 
> Secondly, we do actually need to keep the logdirty ranges of all the
> p2ms in sync, even if they're past the max_remapped_gfn.  Otherwise we
> could have the following situation:
> * altp2m created, max_remapped_gfn 0x1000
> * screen resized, logdirty range [0x2000-0x3000]; change dropped
> * guest accesses 0x4000, max_remapped_gfn set to 0x4000
> * change_p2m_type happens, and the 0x2000-0x3000 range is not marked
> logrdirty #
> 
> So while it would be an improvement to make the assertion more explicit,
> I don't (anymore) think it would actually be an improvement to discard
> changes that are above max_mapped_gfn.  (And thus your original patch,
> which copied max_mapped_gfn into the altp2ms, was probably closer to the
> right approach).
> 
> Sorry for the confusion -- we obviously need a bit more thought about
> how altp2m and logdirty interact.

Thanks for the reply! Fair enough.

FWIW, the attached patch works well for me, resizes and all (but it
could very well be just luck).


Thanks,
Razvan

--------------3A28A8AC4C3C447C1D4AFEA4
Content-Type: text/x-patch;
 name="altp2m_logdirty4.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="altp2m_logdirty4.patch"

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 14b5939..b1df904 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -17,6 +17,7 @@
 
 #include <xen/domain_page.h>
 #include <xen/sched.h>
+#include <asm/altp2m.h>
 #include <asm/current.h>
 #include <asm/paging.h>
 #include <asm/types.h>
@@ -656,6 +657,9 @@ bool_t ept_handle_misconfig(uint64_t gpa)
     bool_t spurious;
     int rc;
 
+    if ( altp2m_active(curr->domain) )
+        p2m = p2m_get_altp2m(curr);
+
     p2m_lock(p2m);
 
     spurious = curr->arch.hvm_vmx.ept_spurious_misconfig;
@@ -1209,32 +1213,60 @@ static void ept_tlb_flush(struct p2m_domain *p2m)
 
 static void ept_enable_pml(struct p2m_domain *p2m)
 {
+    unsigned int i;
+    struct domain *d = p2m->domain;
+
     /* Domain must have been paused */
-    ASSERT(atomic_read(&p2m->domain->pause_count));
+    ASSERT(atomic_read(&d->pause_count));
 
     /*
      * No need to return whether vmx_domain_enable_pml has succeeded, as
      * ept_p2m_type_to_flags will do the check, and write protection will be
      * used if PML is not enabled.
      */
-    if ( vmx_domain_enable_pml(p2m->domain) )
+    if ( vmx_domain_enable_pml(d) )
         return;
 
     /* Enable EPT A/D bit for PML */
     p2m->ept.ad = 1;
-    vmx_domain_update_eptp(p2m->domain);
+
+    if ( altp2m_active(d) )
+        for ( i = 0; i < MAX_ALTP2M; i++ )
+        {
+            if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
+                continue;
+
+            p2m = d->arch.altp2m_p2m[i];
+	    p2m->ept.ad = 1;
+        }
+
+    vmx_domain_update_eptp(d);
 }
 
 static void ept_disable_pml(struct p2m_domain *p2m)
 {
+    unsigned int i;
+    struct domain *d = p2m->domain;
+
     /* Domain must have been paused */
-    ASSERT(atomic_read(&p2m->domain->pause_count));
+    ASSERT(atomic_read(&d->pause_count));
 
-    vmx_domain_disable_pml(p2m->domain);
+    vmx_domain_disable_pml(d);
 
     /* Disable EPT A/D bit */
     p2m->ept.ad = 0;
-    vmx_domain_update_eptp(p2m->domain);
+
+    if ( altp2m_active(d) )
+        for ( i = 0; i < MAX_ALTP2M; i++ )
+        {
+            if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
+                continue;
+
+            p2m = d->arch.altp2m_p2m[i];
+	    p2m->ept.ad = 0;
+        }
+
+    vmx_domain_update_eptp(d);
 }
 
 static void ept_flush_pml_buffers(struct p2m_domain *p2m)
@@ -1375,8 +1407,16 @@ void setup_ept_dump(void)
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
 {
     struct p2m_domain *p2m = d->arch.altp2m_p2m[i];
+    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
     struct ept_data *ept;
 
+    p2m->max_mapped_pfn = hostp2m->max_mapped_pfn;
+    p2m->default_access = hostp2m->default_access;
+    p2m->domain = hostp2m->domain;
+    p2m->logdirty_ranges = hostp2m->logdirty_ranges;
+    p2m->global_logdirty = hostp2m->global_logdirty;
+    p2m->ept.ad = hostp2m->ept.ad;
+
     p2m->min_remapped_gfn = gfn_x(INVALID_GFN);
     p2m->max_remapped_gfn = 0;
     ept = &p2m->ept;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index c53cab4..c8f4d8f 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -28,6 +28,7 @@
 #include <xen/vm_event.h>
 #include <xen/event.h>
 #include <public/vm_event.h>
+#include <asm/altp2m.h>
 #include <asm/domain.h>
 #include <asm/page.h>
 #include <asm/paging.h>
@@ -248,7 +249,6 @@ int p2m_init(struct domain *d)
 int p2m_is_logdirty_range(struct p2m_domain *p2m, unsigned long start,
                           unsigned long end)
 {
-    ASSERT(p2m_is_hostp2m(p2m));
     if ( p2m->global_logdirty ||
          rangeset_contains_range(p2m->logdirty_ranges, start, end) )
         return 1;
@@ -257,11 +257,9 @@ int p2m_is_logdirty_range(struct p2m_domain *p2m, unsigned long start,
     return 0;
 }
 
-void p2m_change_entry_type_global(struct domain *d,
-                                  p2m_type_t ot, p2m_type_t nt)
+static void _p2m_change_entry_type_global(struct p2m_domain *p2m,
+                                          p2m_type_t ot, p2m_type_t nt)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
     ASSERT(ot != nt);
     ASSERT(p2m_is_changeable(ot) && p2m_is_changeable(nt));
 
@@ -271,6 +269,22 @@ void p2m_change_entry_type_global(struct domain *d,
     p2m_unlock(p2m);
 }
 
+void p2m_change_entry_type_global(struct domain *d,
+                                  p2m_type_t ot, p2m_type_t nt)
+{
+    unsigned int i;
+
+    if ( !altp2m_active(d) )
+    {
+        _p2m_change_entry_type_global(p2m_get_hostp2m(d), ot, nt);
+        return;
+    }
+
+    for ( i = 0; i < MAX_ALTP2M; i++ )
+        if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+            _p2m_change_entry_type_global(d->arch.altp2m_p2m[i], ot, nt);
+}
+
 void p2m_memory_type_changed(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
@@ -964,12 +978,12 @@ int p2m_change_type_one(struct domain *d, unsigned long gfn_l,
 }
 
 /* Modify the p2m type of a range of gfns from ot to nt. */
-void p2m_change_type_range(struct domain *d, 
-                           unsigned long start, unsigned long end,
-                           p2m_type_t ot, p2m_type_t nt)
+static void _p2m_change_type_range(struct p2m_domain *p2m,
+                                   unsigned long start, unsigned long end,
+                                   p2m_type_t ot, p2m_type_t nt)
 {
+    struct domain *d = p2m->domain;
     unsigned long gfn = start;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc = 0;
 
     ASSERT(ot != nt);
@@ -1022,6 +1036,23 @@ void p2m_change_type_range(struct domain *d,
     p2m_unlock(p2m);
 }
 
+void p2m_change_type_range(struct domain *d,
+                           unsigned long start, unsigned long end,
+                           p2m_type_t ot, p2m_type_t nt)
+{
+    unsigned int i;
+
+    if ( !altp2m_active(d) )
+    {
+        _p2m_change_type_range(p2m_get_hostp2m(d), start, end, ot, nt);
+        return;
+    }
+
+    for ( i = 0; i < MAX_ALTP2M; i++ )
+        if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+            _p2m_change_type_range(d->arch.altp2m_p2m[i], start, end, ot, nt);
+}
+
 /*
  * Finish p2m type change for gfns which are marked as need_recalc in a range.
  * Returns: 0/1 for success, negative for failure

--------------3A28A8AC4C3C447C1D4AFEA4
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------3A28A8AC4C3C447C1D4AFEA4--
