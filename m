From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Tue, 17 Apr 2018 11:24:58 +0300
Message-ID: <00b52489-51e5-6bc8-ccc2-7b44d2dec107@bitdefender.com>
References: <a592fcb3-c2c6-bd83-01a4-0ac7ba9f3fa5@bitdefender.com>
 <d0ae9d3e-31ee-a03b-dc9d-b86ceb92fe52@citrix.com>
 <b21c7573-7ca0-9ccc-eac7-5ff351fc54ce@bitdefender.com>
 <3bc816d7-2426-470a-36a3-83e2cd5c81ad@bitdefender.com>
 <3076ce00-8655-81fe-6dc1-b891da638ea2@bitdefender.com>
 <efaa504e-bc4f-243d-f558-cab3dc31b472@citrix.com>
 <de3ffdd5-a3ba-d89a-5ebc-6f17006ae75b@bitdefender.com>
 <CAFLBxZbjif+AeMPrc1CkbyjEiSGHJEW3tGNmMqZtCvp+3pOGeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------08B53AE38CF9E9DD1ACBD651"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5zw6=hg=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1f8LvD-0007PJ-K8
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 08:25:03 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id D7F7F310C60A
 for <xen-devel@lists.xenproject.org>; Tue, 17 Apr 2018 12:41:05 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 468337FB58
 for <xen-devel@lists.xenproject.org>; Tue, 17 Apr 2018 11:25:01 +0300 (EEST)
In-Reply-To: <CAFLBxZbjif+AeMPrc1CkbyjEiSGHJEW3tGNmMqZtCvp+3pOGeg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------08B53AE38CF9E9DD1ACBD651
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 04/16/2018 11:21 PM, George Dunlap wrote:
> On Mon, Apr 16, 2018 at 7:46 PM, Razvan Cojocaru
> <rcojocaru@bitdefender.com> wrote:
>> On 04/16/2018 08:47 PM, George Dunlap wrote:
>>> On 04/13/2018 03:44 PM, Razvan Cojocaru wrote:
>>>> On 04/11/2018 11:04 AM, Razvan Cojocaru wrote:
>>>>> Debugging continues.
>>>>
>>>> Finally, the attached patch seems to get the display unstuck in my
>>>> scenario, although for one guest I get:
>>>>
>>>> (XEN) d2v0 Unexpected vmexit: reason 49
>>>> (XEN) domain_crash called from vmx.c:4120
>>>> (XEN) Domain 2 (vcpu#0) crashed on cpu#1:
>>>> (XEN) ----[ Xen-4.11-unstable  x86_64  debug=y   Not tainted ]----
>>>> (XEN) CPU:    1
>>>> (XEN) RIP:    0010:[<fffff96000842354>]
>>>> (XEN) RFLAGS: 0000000000010246   CONTEXT: hvm guest (d2v0)
>>>> (XEN) rax: fffff88003000000   rbx: fffff900c0083db0   rcx: 00000000aa55aa55
>>>> (XEN) rdx: fffffa80041bdc41   rsi: fffff900c00c69a0   rdi: 0000000000000001
>>>> (XEN) rbp: 0000000000000000   rsp: fffff88002ee9ef0   r8:  fffffa80041bdc40
>>>> (XEN) r9:  fffff80001810e80   r10: fffffa800342aa70   r11: fffff88002ee9e80
>>>> (XEN) r12: 0000000000000005   r13: 0000000000000001   r14: fffff900c00c08b0
>>>> (XEN) r15: 0000000000000001   cr0: 0000000080050031   cr4: 00000000000406f8
>>>> (XEN) cr3: 00000000ef771000   cr2: fffff900c00c8000
>>>> (XEN) fsb: 00000000fffde000   gsb: fffff80001810d00   gss: 000007fffffdc000
>>>> (XEN) ds: 002b   es: 002b   fs: 0053   gs: 002b   ss: 0018   cs: 0010
>>>>
>>>> i.e. EXIT_REASON_EPT_MISCONFIG - so not of the woods yet. I am hoping
>>>> somebody more familiar with the code can point to a more elegant
>>>> solution if one exists.
>>>
>>> I think I have an idea what's going on, but it's complicated. :-)
>>>
>>> Basically, the logdirty functionality isn't simple, and needs careful
>>> thought on how to integrate it.  I'll write some more tomorrow, and see
>>> if I can come up with a solution.
>>
>> I think I know why this happens for the one guest - the other guests
>> start at a certain resolution display-wise and stay that way until shutdown.
>>
>> This particular guest starts with a larger screen, then goes to roughly
>> 2/3rds of it, then tries to go back to the initial larger one - at which
>> point the above happens. I assume this corresponds to some pages being
>> removed and/or added. I'll test this theory more tomorrow - if it's
>> correct I should be able to reproduce the crash (with the patch) by
>> simply resetting the screen resolution (increasing it).
> 
> The trick is that p2m_change_type doesn't actually iterate over the
> entire p2m range, individually changing entries as it goes.  Instead
> it misconfigures the entries at the top-level, which causes the kinds
> of faults shown above.  As it gets faults for each entry, it checks
> the current type, the logdirty ranges, and the global logdirty bit to
> determine what the new types should be.
> 
> Your patch makes it so that all the altp2ms now get the
> misconfiguration when the logdirty range is changed; but clearly
> handling the misconfiguration isn't integrated properly with the
> altp2m system yet.  Doing it right may take some thought.

FWIW, the attached patch has solved the misconfig-related domain crash
for me (though I'm very likely missing some subtleties). It all seems to
work as expected when enabling altp2m and switching early to a new view.
However, now I have domUs with a frozen display when I disconnect the
introspection application (that is, after I switch back to the default
view and disable altp2m on the domain).


Thanks,
Razvan

--------------08B53AE38CF9E9DD1ACBD651
Content-Type: text/x-patch;
 name="altp2m_logdirty2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="altp2m_logdirty2.patch"

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 14b5939..4530689 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -17,6 +17,7 @@
 
 #include <xen/domain_page.h>
 #include <xen/sched.h>
+#include <asm/altp2m.h>
 #include <asm/current.h>
 #include <asm/paging.h>
 #include <asm/types.h>
@@ -652,17 +653,38 @@ static int resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
 bool_t ept_handle_misconfig(uint64_t gpa)
 {
     struct vcpu *curr = current;
-    struct p2m_domain *p2m = p2m_get_hostp2m(curr->domain);
+    struct domain *d = curr->domain;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     bool_t spurious;
-    int rc;
-
-    p2m_lock(p2m);
+    int rc = 0;
+    unsigned int i;
 
     spurious = curr->arch.hvm_vmx.ept_spurious_misconfig;
-    rc = resolve_misconfig(p2m, PFN_DOWN(gpa));
-    curr->arch.hvm_vmx.ept_spurious_misconfig = 0;
 
-    p2m_unlock(p2m);
+    if ( altp2m_active(d) )
+    {
+       for ( i = 0; i < MAX_ALTP2M; i++ )
+            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+            {
+                p2m = d->arch.altp2m_p2m[i];
+
+                p2m_lock(p2m);
+
+                rc = resolve_misconfig(p2m, PFN_DOWN(gpa));
+                curr->arch.hvm_vmx.ept_spurious_misconfig = 0;
+
+                p2m_unlock(p2m);
+            }
+    }
+    else
+    {
+        p2m_lock(p2m);
+
+        rc = resolve_misconfig(p2m, PFN_DOWN(gpa));
+        curr->arch.hvm_vmx.ept_spurious_misconfig = 0;
+
+        p2m_unlock(p2m);
+    }
 
     return spurious ? (rc >= 0) : (rc > 0);
 }
@@ -1375,8 +1397,15 @@ void setup_ept_dump(void)
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
+
     p2m->min_remapped_gfn = gfn_x(INVALID_GFN);
     p2m->max_remapped_gfn = 0;
     ept = &p2m->ept;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index c53cab4..00f85e1 100644
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
@@ -964,12 +964,12 @@ int p2m_change_type_one(struct domain *d, unsigned long gfn_l,
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
@@ -1022,6 +1022,23 @@ void p2m_change_type_range(struct domain *d,
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

--------------08B53AE38CF9E9DD1ACBD651
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------08B53AE38CF9E9DD1ACBD651--
