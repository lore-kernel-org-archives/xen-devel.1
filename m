From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V4 3/3] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Fri, 9 Nov 2018 16:19:13 +0200
Message-ID: <ad4906fd-37b9-965e-f7b3-45937b8ebedf@bitdefender.com>
References: <1541083542-22464-1-git-send-email-rcojocaru@bitdefender.com>
 <1541083542-22464-4-git-send-email-rcojocaru@bitdefender.com>
 <65ef6cc6-a198-f875-ec11-e3727360f257@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------0D221FDBA557C7469BF2BB1E"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y7e3=nu=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gL7d2-0002Iy-Me
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 14:19:20 +0000
In-Reply-To: <65ef6cc6-a198-f875-ec11-e3727360f257@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------0D221FDBA557C7469BF2BB1E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 11/8/18 8:14 PM, George Dunlap wrote:
> On 11/01/2018 02:45 PM, Razvan Cojocaru wrote:
> ...here and...
> 
>> +
>>  int p2m_set_ioreq_server(struct domain *d,
>>                           unsigned int flags,
>>                           struct hvm_ioreq_server *s)
>> @@ -994,12 +1033,12 @@ int p2m_change_type_one(struct domain *d, unsigned long gfn_l,
>>  }
>>  
>>  /* Modify the p2m type of a range of gfns from ot to nt. */
>> -void p2m_change_type_range(struct domain *d, 
>> -                           unsigned long start, unsigned long end,
>> -                           p2m_type_t ot, p2m_type_t nt)
>> +static void change_type_range(struct p2m_domain *p2m,
>> +                              unsigned long start, unsigned long end,
>> +                              p2m_type_t ot, p2m_type_t nt)
>>  {
>>      unsigned long gfn = start;
>> -    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +    struct domain *d = p2m->domain;
>>      int rc = 0;
>>  
>>      ASSERT(ot != nt);
>> @@ -1052,6 +1091,24 @@ void p2m_change_type_range(struct domain *d,
>>      p2m_unlock(p2m);
>>  }
>>  
>> +void p2m_change_type_range(struct domain *d,
>> +                           unsigned long start, unsigned long end,
>> +                           p2m_type_t ot, p2m_type_t nt)
>> +{
>> +    change_type_range(p2m_get_hostp2m(d), start, end, ot, nt);
>> +
>> +#ifdef CONFIG_HVM
>> +    if ( unlikely(altp2m_active(d)) )
>> +    {
>> +        unsigned int i;
>> +
>> +        for ( i = 0; i < MAX_ALTP2M; i++ )
>> +            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
>> +                change_type_range(d->arch.altp2m_p2m[i], start, end, ot, nt);
>> +    }
>> +#endif
>> +}
>> +
> 
> ...here you grab & release each lock separately, inside the update
> function.  memory_type_changed is probably more or less idempotent, so
> won't matter if two different calls race; but it seems likely that if
> two p2m_change_type_range() calls happen concurrently, the various
> altp2ms will get different results.  Is it worth refactoring both of
> these so that, like change_entry_type_global, you hold the host p2m lock
> while you change the individual altp2m locks?

I have changed the code to do all the modifications under hostp2m lock,
and on changing the resolution on a host with three altp2ms I get a
"Watchdog timer detects that CPU3 is stuck!" hypervisor crash:

(XEN) stdvga.c:178:d1v0 leaving stdvga mode
(XEN) 1 p2m_lock(hostp2m)
(XEN) 1 change_type_range(hostp2m)
(XEN) 1 p2m_lock(altp2m)
(XEN) 1 change_type_range(altp2m)
(XEN) 1 p2m_unlock(altp2m)
(XEN) 1 p2m_lock(altp2m)
(XEN) 1 change_type_range(altp2m)
(XEN) 1 p2m_unlock(altp2m)
(XEN) 1 p2m_lock(altp2m)
(XEN) 1 change_type_range(altp2m)
(XEN) 1 p2m_unlock(altp2m)
(XEN) 1 p2m_unlock(hostp2m)
(XEN) Watchdog timer detects that CPU3 is stuck!
(XEN) ----[ Xen-4.12-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    3
(XEN) RIP:    e008:[<ffff82d080239107>] vcpu_sleep_sync+0x40/0x71
(XEN) RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v0)
(XEN) rax: 0000000000000001   rbx: ffff8308dc1c3000   rcx: ffff8308dc1c3130
(XEN) rdx: 0000000000000000   rsi: 0000000000000292   rdi: ffff830c529f1010
(XEN) rbp: ffff830c52987c88   rsp: ffff830c52987c78   r8:  ffff830ae7a1dfd0
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000001c80
(XEN) r12: ffff82d0802390c7   r13: ffff8308d5222000   r14: ffff82c000225000
(XEN) r15: 00000000000f0000   cr0: 0000000080050033   cr4: 0000000000372660
(XEN) cr3: 0000000856c56000   cr2: 00007f8d36195000
(XEN) fsb: 00007f8d3fffe8c0   gsb: ffff880276c00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d080239107> (vcpu_sleep_sync+0x40/0x71):
(XEN)  01 00 00 00 74 24 f3 90 <8b> 11 48 8b 43 10 8b 80 cc 01 00 00 09
d0 48 98
(XEN) Xen stack trace from rsp=ffff830c52987c78:
(XEN)    0000000000000240 ffff8308dc1c3000 ffff830c52987cb8 ffff82d0802070f1
(XEN)    ffff830c52987cc8 ffff8308d5222000 0000000000000240 0000000000000048
(XEN)    ffff830c52987cc8 ffff82d0802084bd ffff830c52987d38 ffff82d08036861e
(XEN)    8c00000000000001 ffff8308d5222648 ffff830c52987d28 00000000000f0000
(XEN)    00007f8d400a7010 0000000000000048 0000000000856c23 0000000000000000
(XEN)    ffff830c52987e00 ffffffffffffffea deadbeefdeadf00d ffff82d0802eebef
(XEN)    ffff830c52987de8 ffff82d0802ee217 01ff830c00000001 ffff82e011b4e6e0
(XEN)    ffff830c52987d98 0000000000000000 ffff830c52971000 ffff830c52959000
(XEN)    0000000000000001 ffff830c52971000 ffff830c52987d98 0000000000000007
(XEN)    0000000000000240 00000000000f0000 ffff830c52987fff ffff8308d5222000
(XEN)    ffff830c52987dc8 0000000000000002 0000000000000001 00007f8d400af010
(XEN)    deadbeefdeadf00d ffff82d0802eebef ffff830c52987e48 ffff82d0802eec73
(XEN)    ffff82d08037a3c4 0000000280370001 00007f8d400ae010 0000000000000020
(XEN)    00007f8d400a7010 0000000000000048 ffff82d08037a3c4 ffff830c52987ef8
(XEN)    ffff830c52959000 0000000000000029 ffff830c52987ee8 ffff82d080373722
(XEN)    03ff82d08037a3c4 0000000000000001 0000000000000002 00007f8d400af010
(XEN)    deadbeefdeadf00d deadbeefdeadf00d ffff82d08037a3c4 ffff82d08037a3b8
(XEN)    ffff82d08037a3c4 ffff82d08037a3b8 ffff82d08037a3c4 ffff82d08037a3b8
(XEN)    ffff82d08037a3c4 ffff830c52959000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 00007cf3ad6780e7 ffff82d08037a422
(XEN) Xen call trace:
(XEN)    [<ffff82d080239107>] vcpu_sleep_sync+0x40/0x71
(XEN)    [<ffff82d0802070f1>] domain.c#do_domain_pause+0x33/0x4f
(XEN)    [<ffff82d0802084bd>] domain_pause+0x25/0x27
(XEN)    [<ffff82d08036861e>] hap_track_dirty_vram+0x2b3/0x491
(XEN)    [<ffff82d0802ee217>] dm.c#dm_op+0x472/0xd46
(XEN)    [<ffff82d0802eec73>] do_dm_op+0x84/0xba
(XEN)    [<ffff82d080373722>] pv_hypercall+0x1af/0x4cd
(XEN)    [<ffff82d08037a422>] lstar_enter+0x112/0x120
(XEN)
(XEN) CPU1 @ e008:ffff82d0802a853f
(time.c#time_calibration_std_rendezvous+0x62/0x77)
(XEN) CPU2 @ e008:ffff82d0802a853f
(time.c#time_calibration_std_rendezvous+0x62/0x77)
(XEN) CPU0 @ e008:ffff82d0802a8514
(time.c#time_calibration_std_rendezvous+0x37/0x77)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 3:
(XEN) FATAL TRAP: vector = 2 (nmi)
(XEN) [error_code=0000]
(XEN) ****************************************

AFAICT, it just takes longer than the timeout to do the sync. The code
changes have been simple (patch attached), I don't think this is an
actual deadlock but of course I could be wrong (at least printing out
all of the lock / unlock calls in the new code looks like everything is
being properly unlocked at the end).

Any suggestion, as usual, appreciated. :)


Thanks,
Razvan

--------------0D221FDBA557C7469BF2BB1E
Content-Type: text/x-patch;
 name="change_altp2ms_under_hostp2m_lock.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="change_altp2ms_under_hostp2m_lock.patch"

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index fabcd06..e6fa85f 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -657,6 +657,9 @@ bool_t ept_handle_misconfig(uint64_t gpa)
     bool_t spurious;
     int rc;
 
+    if ( altp2m_active(curr->domain) )
+        p2m = p2m_get_altp2m(curr);
+
     p2m_lock(p2m);
 
     spurious = curr->arch.hvm.vmx.ept_spurious_misconfig;
@@ -1440,6 +1443,11 @@ void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
     struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
     struct ept_data *ept;
 
+    p2m->max_mapped_pfn = hostp2m->max_mapped_pfn;
+    p2m->default_access = hostp2m->default_access;
+    p2m->domain = hostp2m->domain;
+
+    p2m->global_logdirty = hostp2m->global_logdirty;
     p2m->ept.ad = hostp2m->ept.ad;
     p2m->min_remapped_gfn = gfn_x(INVALID_GFN);
     p2m->max_remapped_gfn = 0;
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 55df185..3828088 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -29,6 +29,7 @@
 #include <xen/event.h>
 #include <xen/trace.h>
 #include <public/vm_event.h>
+#include <asm/altp2m.h>
 #include <asm/domain.h>
 #include <asm/page.h>
 #include <asm/paging.h>
@@ -464,6 +465,13 @@ int p2m_pt_handle_deferred_changes(uint64_t gpa)
     struct p2m_domain *p2m = p2m_get_hostp2m(current->domain);
     int rc;
 
+    /*
+     * Should altp2m ever be enabled for NPT / shadow use, this code
+     * should be updated to make use of the active altp2m, like
+     * ept_handle_misconfig().
+     */
+    ASSERT(!altp2m_active(current->domain));
+
     p2m_lock(p2m);
     rc = do_recalc(p2m, PFN_DOWN(gpa));
     p2m_unlock(p2m);
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index bc6e543..04c2c65 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -279,7 +279,6 @@ int p2m_init(struct domain *d)
 int p2m_is_logdirty_range(struct p2m_domain *p2m, unsigned long start,
                           unsigned long end)
 {
-    ASSERT(p2m_is_hostp2m(p2m));
     if ( p2m->global_logdirty ||
          rangeset_contains_range(p2m->logdirty_ranges, start, end) )
         return 1;
@@ -288,31 +287,85 @@ int p2m_is_logdirty_range(struct p2m_domain *p2m, unsigned long start,
     return 0;
 }
 
+static void change_entry_type_global(struct p2m_domain *p2m,
+                                     p2m_type_t ot, p2m_type_t nt)
+{
+    p2m->change_entry_type_global(p2m, ot, nt);
+    p2m->global_logdirty = (nt == p2m_ram_logdirty);
+}
+
 void p2m_change_entry_type_global(struct domain *d,
                                   p2m_type_t ot, p2m_type_t nt)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
     ASSERT(ot != nt);
     ASSERT(p2m_is_changeable(ot) && p2m_is_changeable(nt));
 
-    p2m_lock(p2m);
-    p2m->change_entry_type_global(p2m, ot, nt);
-    p2m->global_logdirty = (nt == p2m_ram_logdirty);
-    p2m_unlock(p2m);
+    p2m_lock(hostp2m);
+
+    change_entry_type_global(hostp2m, ot, nt);
+
+#ifdef CONFIG_HVM
+    if ( unlikely(altp2m_active(d)) )
+    {
+        unsigned int i;
+
+        for ( i = 0; i < MAX_ALTP2M; i++ )
+            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+            {
+                struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
+
+                p2m_lock(altp2m);
+                change_entry_type_global(altp2m, ot, nt);
+                p2m_unlock(altp2m);
+            }
+    }
+#endif
+
+    p2m_unlock(hostp2m);
+}
+
+#ifdef CONFIG_HVM
+/* There's already a memory_type_changed() in asm/mtrr.h. */
+static void _memory_type_changed(struct p2m_domain *p2m)
+{
+    if ( p2m->memory_type_changed )
+        p2m->memory_type_changed(p2m);
 }
 
 void p2m_memory_type_changed(struct domain *d)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
 
-    if ( p2m->memory_type_changed )
+    printk("2 p2m_lock(hostp2m)\n");
+    p2m_lock(hostp2m);
+
+    printk("2 memory_type_changed(hostp2m)\n");
+    _memory_type_changed(hostp2m);
+
+    if ( unlikely(altp2m_active(d)) )
     {
-        p2m_lock(p2m);
-        p2m->memory_type_changed(p2m);
-        p2m_unlock(p2m);
+        unsigned int i;
+
+        for ( i = 0; i < MAX_ALTP2M; i++ )
+            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+            {
+                struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
+
+                printk("2 p2m_lock(altp2m)\n");
+                p2m_lock(altp2m);
+                printk("2 memory_type_changed(altp2m)\n");
+                _memory_type_changed(altp2m);
+                printk("2 p2m_unlock(altp2m)\n");
+                p2m_unlock(altp2m);
+            }
     }
+
+    printk("2 p2m_unlock(hostp2m)\n");
+    p2m_unlock(hostp2m);
 }
+#endif
 
 int p2m_set_ioreq_server(struct domain *d,
                          unsigned int flags,
@@ -994,18 +1047,14 @@ int p2m_change_type_one(struct domain *d, unsigned long gfn_l,
 }
 
 /* Modify the p2m type of a range of gfns from ot to nt. */
-void p2m_change_type_range(struct domain *d, 
-                           unsigned long start, unsigned long end,
-                           p2m_type_t ot, p2m_type_t nt)
+static void change_type_range(struct p2m_domain *p2m,
+                              unsigned long start, unsigned long end,
+                              p2m_type_t ot, p2m_type_t nt)
 {
     unsigned long gfn = start;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    struct domain *d = p2m->domain;
     int rc = 0;
 
-    ASSERT(ot != nt);
-    ASSERT(p2m_is_changeable(ot) && p2m_is_changeable(nt));
-
-    p2m_lock(p2m);
     p2m->defer_nested_flush = 1;
 
     if ( unlikely(end > p2m->max_mapped_pfn) )
@@ -1049,7 +1098,47 @@ void p2m_change_type_range(struct domain *d,
     p2m->defer_nested_flush = 0;
     if ( nestedhvm_enabled(d) )
         p2m_flush_nestedp2m(d);
-    p2m_unlock(p2m);
+}
+
+void p2m_change_type_range(struct domain *d,
+                           unsigned long start, unsigned long end,
+                           p2m_type_t ot, p2m_type_t nt)
+{
+    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
+
+    ASSERT(ot != nt);
+    ASSERT(p2m_is_changeable(ot) && p2m_is_changeable(nt));
+
+    printk("1 p2m_lock(hostp2m)\n");
+    p2m_lock(hostp2m);
+
+    printk("1 change_type_range(hostp2m)\n");
+    change_type_range(hostp2m, start, end, ot, nt);
+
+#ifdef CONFIG_HVM
+    if ( unlikely(altp2m_active(d)) )
+    {
+        unsigned int i;
+
+        for ( i = 0; i < MAX_ALTP2M; i++ )
+            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+            {
+                struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
+
+                printk("1 p2m_lock(altp2m)\n");
+                p2m_lock(altp2m);
+
+                printk("1 change_type_range(altp2m)\n");
+                change_type_range(altp2m, start, end, ot, nt);
+
+                printk("1 p2m_unlock(altp2m)\n");
+                p2m_lock(altp2m);
+            }
+    }
+#endif
+
+    printk("1 p2m_unlock(hostp2m)\n");
+    p2m_unlock(hostp2m);
 }
 
 /*
diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
index c7f5710..be5b7a2 100644
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -630,9 +630,6 @@ int p2m_finish_type_change(struct domain *d,
                            gfn_t first_gfn,
                            unsigned long max_nr);
 
-/* Report a change affecting memory types. */
-void p2m_memory_type_changed(struct domain *d);
-
 int p2m_is_logdirty_range(struct p2m_domain *, unsigned long start,
                           unsigned long end);
 
@@ -663,6 +660,9 @@ void p2m_pod_dump_data(struct domain *d);
 
 #ifdef CONFIG_HVM
 
+/* Report a change affecting memory types. */
+void p2m_memory_type_changed(struct domain *d);
+
 /* Called by p2m code when demand-populating a PoD page */
 bool
 p2m_pod_demand_populate(struct p2m_domain *p2m, gfn_t gfn, unsigned int order);

--------------0D221FDBA557C7469BF2BB1E
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------0D221FDBA557C7469BF2BB1E--
