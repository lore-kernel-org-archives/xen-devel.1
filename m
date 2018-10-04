From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Thu, 4 Oct 2018 12:17:20 +0300
Message-ID: <d4d46c2c-2333-c668-485f-9b2a3fc96cce@bitdefender.com>
References: <1538497782.49743598@f411.i.mail.ru>
 <c9b27c6b-e6be-2a47-3123-acd27805a1c2@bitdefender.com>
 <1538564214.335166751@f512.i.mail.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------949B270506E4ED4A6B928097"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uicy=mq=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g7zl8-0003Od-4Y
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 09:17:26 +0000
In-Reply-To: <1538564214.335166751@f512.i.mail.ru>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?B?0KHQtdGA0LPQtdC5?= <valor@list.ru>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------949B270506E4ED4A6B928097
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 10/3/18 1:56 PM, Сергей wrote:
>> No yet, we're working on it.
> Could You point me to the branch with Your patches please? I Could not find it in https://xenbits.xen.org/gitweb/?p=xen.git

I've attached the current version of the patch, which needs George's
comments addressed (so we already know it needs more work) - but it does
fix the frozen display issue 99% of the time.

You need to apply "[PATCH V3] x86/altp2m: propagate ept.ad changes to
all active altp2ms" first.


Razvan

--------------949B270506E4ED4A6B928097
Content-Type: text/x-patch;
 name="initial_hack.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="initial_hack.patch"

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 3d228c2..7317e50 100644
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
@@ -1436,6 +1439,11 @@ void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
     struct ept_data *ept;
 
     p2m->ept.ad = hostp2m->ept.ad;
+    p2m->max_mapped_pfn = hostp2m->max_mapped_pfn;
+    p2m->default_access = hostp2m->default_access;
+    p2m->domain = hostp2m->domain;
+    p2m->logdirty_ranges = hostp2m->logdirty_ranges;
+    p2m->global_logdirty = hostp2m->global_logdirty;
     p2m->min_remapped_gfn = gfn_x(INVALID_GFN);
     p2m->max_remapped_gfn = 0;
     ept = &p2m->ept;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index d90c624..2d59295 100644
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
@@ -255,7 +256,6 @@ int p2m_init(struct domain *d)
 int p2m_is_logdirty_range(struct p2m_domain *p2m, unsigned long start,
                           unsigned long end)
 {
-    ASSERT(p2m_is_hostp2m(p2m));
     if ( p2m->global_logdirty ||
          rangeset_contains_range(p2m->logdirty_ranges, start, end) )
         return 1;
@@ -264,11 +264,9 @@ int p2m_is_logdirty_range(struct p2m_domain *p2m, unsigned long start,
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
 
@@ -278,10 +276,25 @@ void p2m_change_entry_type_global(struct domain *d,
     p2m_unlock(p2m);
 }
 
-void p2m_memory_type_changed(struct domain *d)
+void p2m_change_entry_type_global(struct domain *d,
+                                  p2m_type_t ot, p2m_type_t nt)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+#ifdef CONFIG_HVM
+    if ( unlikely(altp2m_active(d)) )
+    {
+        unsigned int i;
 
+        for ( i = 0; i < MAX_ALTP2M; i++ )
+            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+                _p2m_change_entry_type_global(d->arch.altp2m_p2m[i], ot, nt);
+    }
+#endif
+
+    _p2m_change_entry_type_global(p2m_get_hostp2m(d), ot, nt);
+}
+
+void _p2m_memory_type_changed(struct p2m_domain *p2m)
+{
     if ( p2m->memory_type_changed )
     {
         p2m_lock(p2m);
@@ -290,6 +303,22 @@ void p2m_memory_type_changed(struct domain *d)
     }
 }
 
+void p2m_memory_type_changed(struct domain *d)
+{
+#ifdef CONFIG_HVM
+    if ( unlikely(altp2m_active(d)) )
+    {
+        unsigned int i;
+
+        for ( i = 0; i < MAX_ALTP2M; i++ )
+            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+                _p2m_memory_type_changed(d->arch.altp2m_p2m[i]);
+    }
+#endif
+
+    _p2m_memory_type_changed(p2m_get_hostp2m(d));
+}
+
 int p2m_set_ioreq_server(struct domain *d,
                          unsigned int flags,
                          struct hvm_ioreq_server *s)
@@ -967,12 +996,12 @@ int p2m_change_type_one(struct domain *d, unsigned long gfn_l,
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
@@ -1025,6 +1054,25 @@ void p2m_change_type_range(struct domain *d,
     p2m_unlock(p2m);
 }
 
+void p2m_change_type_range(struct domain *d,
+                           unsigned long start, unsigned long end,
+                           p2m_type_t ot, p2m_type_t nt)
+{
+#ifdef CONFIG_HVM
+    if ( unlikely(altp2m_active(d)) )
+    {
+        unsigned int i;
+
+        for ( i = 0; i < MAX_ALTP2M; i++ )
+            if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
+                _p2m_change_type_range(d->arch.altp2m_p2m[i], start, end, ot,
+                                       nt);
+    }
+#endif
+
+    _p2m_change_type_range(p2m_get_hostp2m(d), start, end, ot, nt);
+}
+
 /*
  * Finish p2m type change for gfns which are marked as need_recalc in a range.
  * Returns: 0/1 for success, negative for failure

--------------949B270506E4ED4A6B928097
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------949B270506E4ED4A6B928097--
