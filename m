From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Emulation and active (valid) interrupts
Date: Wed, 8 Aug 2018 17:26:51 +0300
Message-ID: <d189b20b-f2d3-629f-6a62-54a6491f2778@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------DCE50A5568C6B4F6B5D5942F"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------DCE50A5568C6B4F6B5D5942F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

I'm seeing rare occasions where this backtrace occurs at a point in
__vmx_inject_exception() where there's already a valid interrupt set up
in VM_ENTRY_INTR_INFO (that is, once the value is __vmread(), intr_info
& INTR_INFO_VALID_MASK is non-zero):

Xen call trace:
   [<ffff82d0801fe9c7>] vmx.c#__vmx_inject_exception+0x47/0xd9
   [<ffff82d080201c6a>] vmx.c#vmx_inject_trap+0x1e1/0x29f
   [<ffff82d0801d6b8a>] hvm_inject_trap+0xb0/0xb5
   [<ffff82d0801d6be7>] hvm_inject_page_fault+0x2a/0x2c
   [<ffff82d0801d6cc6>] hvm.c#__hvm_copy+0xdd/0x37f
   [<ffff82d0801d88fa>] hvm_copy_from_guest_virt+0x14/0x16
   [<ffff82d0801d28e3>] emulate.c#__hvmemul_read+0x12f/0x19f
   [<ffff82d0801d2a2c>] emulate.c#hvmemul_read+0x28/0x2a
   [<ffff82d0801a931c>] x86_emulate.c#read_ulong+0x13/0x15
   [<ffff82d0801ab412>] x86_emulate+0x16b1/0x11405
   [<ffff82d0801d180a>] emulate.c#_hvm_emulate_one+0x188/0x2bc
   [<ffff82d0801d1a34>] hvm_emulate_one+0x10/0x12
   [<ffff82d0801d2d39>] hvm_mem_access_emulate_one+0x7a/0xdd
   [<ffff82d0801dbe50>] hvm_do_resume+0x246/0x3d3
   [<ffff82d0801fbddb>] vmx_do_resume+0x102/0x119
   [<ffff82d080170ba3>] context_switch+0xf52/0xfad
   [<ffff82d08013182c>] schedule.c#schedule+0x753/0x792
   [<ffff82d080134f05>] softirq.c#__do_softirq+0x85/0x90
   [<ffff82d080134f5a>] do_softirq+0x13/0x15
   [<ffff82d08016b5f2>] domain.c#idle_loop+0x61/0x6e

(this is a Xen 4.7.5 trace, but it applies to staging as well).

This was the initial culprit:

[<ffff82d08031b55d>] vmx.c#__vmx_inject_exception+0xa1/0xda
[<ffff82d08031eb5c>] vmx_inject_extint+0x94/0x9f
[<ffff82d080315a0a>] vmx_intr_assist+0x4ee/0x5ad
[<ffff82d0803258ff>] vmx_asm_vmexit_handler+0xff/0x270

and I thought I'd fixed it by treating the emulation in a similar manner
to the single-step case: have vmx_intr_assist() block interrupts for the
duration of the emulation (please see the attached patch for staging).
However, a bit more rarely this time, we still end up overwriting an
interrupt via the above code path.

Obviously this works only if nothing has been written in
VM_ENTRY_INTR_INFO _before_ we block (return) in vmx_intr_assist().

My questions are:

1. Is it possible to already have a valid interrupt written in
VM_ENTRY_INTR_INFO at EXIT_REASON_EPT_VIOLATION-time in
vmx_vmexit_handler()?

2. Is it possible that something else in that path writes into
VM_ENTRY_INTR_INFO (which the vmx_intr_assist() logic can't possibly
prevent)? For example, in my Xen 4.7.5 sources, there's a
pt_restore_timer(v); call in hvm_do_resume() before the vm_event
emulation code.


Thanks,
Razvan

--------------DCE50A5568C6B4F6B5D5942F
Content-Type: text/x-patch;
 name="emulate_intr_block.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="emulate_intr_block.patch"

diff --git a/xen/arch/x86/hvm/vm_event.c b/xen/arch/x86/hvm/vm_event.c
index 28d08a6..8e7c737 100644
--- a/xen/arch/x86/hvm/vm_event.c
+++ b/xen/arch/x86/hvm/vm_event.c
@@ -124,6 +124,8 @@ void hvm_vm_event_do_resume(struct vcpu *v)
 
         w->do_write.msr = 0;
     }
+
+    v->arch.vm_event->intr_block = false;
 }
 
 /*
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index eb9b288..97cecbf 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -22,6 +22,7 @@
 #include <xen/errno.h>
 #include <xen/trace.h>
 #include <xen/event.h>
+#include <xen/vm_event.h>
 #include <asm/apicdef.h>
 #include <asm/current.h>
 #include <asm/cpufeature.h>
@@ -37,6 +38,7 @@
 #include <asm/hvm/nestedhvm.h>
 #include <public/hvm/ioreq.h>
 #include <asm/hvm/trace.h>
+#include <asm/vm_event.h>
 
 /*
  * A few notes on virtual NMI and INTR delivery, and interactions with
@@ -231,6 +233,11 @@ void vmx_intr_assist(void)
     enum hvm_intblk intblk;
     int pt_vector;
 
+    if ( unlikely(v->arch.vm_event) &&
+         vm_event_check_ring(v->domain->vm_event_monitor) &&
+         v->arch.vm_event->intr_block )
+        return;
+
     /* Block event injection when single step with MTF. */
     if ( unlikely(v->arch.hvm_vcpu.single_step) )
     {
diff --git a/xen/common/monitor.c b/xen/common/monitor.c
index c606683..4263929 100644
--- a/xen/common/monitor.c
+++ b/xen/common/monitor.c
@@ -113,6 +113,12 @@ int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req)
     if ( sync )
     {
         req->flags |= VM_EVENT_FLAG_VCPU_PAUSED;
+        /*
+         * It only makes sense to block interrupts for the duration of
+         * processing blocking vm_events, since that is the only case where
+         * emulating the current instruction really applies.
+         */
+        v->arch.vm_event->intr_block = true;
         vm_event_vcpu_pause(v);
         rc = 1;
     }
diff --git a/xen/include/asm-x86/vm_event.h b/xen/include/asm-x86/vm_event.h
index 39e73c8..2b36614 100644
--- a/xen/include/asm-x86/vm_event.h
+++ b/xen/include/asm-x86/vm_event.h
@@ -34,6 +34,12 @@ struct arch_vm_event {
     struct monitor_write_data write_data;
     struct vm_event_regs_x86 gprs;
     bool set_gprs;
+    /*
+     * Block interrupts until this vm_event is done handling (after the
+     * fashion of single-step). Meant for the cases where the vm_event
+     * reply asks for emulation of the current instruction.
+     */
+    bool intr_block;
 };
 
 int vm_event_init_domain(struct domain *d);

--------------DCE50A5568C6B4F6B5D5942F
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------DCE50A5568C6B4F6B5D5942F--
