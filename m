From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Fri, 13 Apr 2018 17:44:27 +0300
Message-ID: <3076ce00-8655-81fe-6dc1-b891da638ea2@bitdefender.com>
References: <a592fcb3-c2c6-bd83-01a4-0ac7ba9f3fa5@bitdefender.com>
 <d0ae9d3e-31ee-a03b-dc9d-b86ceb92fe52@citrix.com>
 <b21c7573-7ca0-9ccc-eac7-5ff351fc54ce@bitdefender.com>
 <3bc816d7-2426-470a-36a3-83e2cd5c81ad@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------94B2296EB0BE825258A1FE9B"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=thko=hc=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1f6zwH-0004WB-Iv
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 14:44:33 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id B492F3086286
 for <xen-devel@lists.xenproject.org>; Fri, 13 Apr 2018 19:00:33 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id ED1607FC41
 for <xen-devel@lists.xenproject.org>; Fri, 13 Apr 2018 17:44:29 +0300 (EEST)
In-Reply-To: <3bc816d7-2426-470a-36a3-83e2cd5c81ad@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------94B2296EB0BE825258A1FE9B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 04/11/2018 11:04 AM, Razvan Cojocaru wrote:
> Debugging continues.

Finally, the attached patch seems to get the display unstuck in my
scenario, although for one guest I get:

(XEN) d2v0 Unexpected vmexit: reason 49
(XEN) domain_crash called from vmx.c:4120
(XEN) Domain 2 (vcpu#0) crashed on cpu#1:
(XEN) ----[ Xen-4.11-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    0010:[<fffff96000842354>]
(XEN) RFLAGS: 0000000000010246   CONTEXT: hvm guest (d2v0)
(XEN) rax: fffff88003000000   rbx: fffff900c0083db0   rcx: 00000000aa55aa55
(XEN) rdx: fffffa80041bdc41   rsi: fffff900c00c69a0   rdi: 0000000000000001
(XEN) rbp: 0000000000000000   rsp: fffff88002ee9ef0   r8:  fffffa80041bdc40
(XEN) r9:  fffff80001810e80   r10: fffffa800342aa70   r11: fffff88002ee9e80
(XEN) r12: 0000000000000005   r13: 0000000000000001   r14: fffff900c00c08b0
(XEN) r15: 0000000000000001   cr0: 0000000080050031   cr4: 00000000000406f8
(XEN) cr3: 00000000ef771000   cr2: fffff900c00c8000
(XEN) fsb: 00000000fffde000   gsb: fffff80001810d00   gss: 000007fffffdc000
(XEN) ds: 002b   es: 002b   fs: 0053   gs: 002b   ss: 0018   cs: 0010

i.e. EXIT_REASON_EPT_MISCONFIG - so not of the woods yet. I am hoping
somebody more familiar with the code can point to a more elegant
solution if one exists.


Thanks,
Razvan

--------------94B2296EB0BE825258A1FE9B
Content-Type: text/x-patch;
 name="altp2m_vga.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="altp2m_vga.patch"

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 14b5939..3be02ca 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1375,8 +1375,15 @@ void setup_ept_dump(void)
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

--------------94B2296EB0BE825258A1FE9B
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------94B2296EB0BE825258A1FE9B--
