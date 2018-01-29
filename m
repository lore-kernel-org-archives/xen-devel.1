From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/hvm: fix domain crash when CR3 has the
 noflush bit set
Date: Mon, 29 Jan 2018 14:44:00 +0200
Message-ID: <0b5a0704-b411-74d7-d08f-cda124d8e736@bitdefender.com>
References: <1516959576-5617-1-git-send-email-rcojocaru@bitdefender.com>
 <5A6B109802000078001A2AA9@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------7CDCAB05D4A60038DCE8F901"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A6B109802000078001A2AA9@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: andrew.cooper3@citrix.com, bitweasil@cryptohaze.com, tamas@tklengyel.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------7CDCAB05D4A60038DCE8F901
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 01/26/2018 12:27 PM, Jan Beulich wrote:
>>>> On 26.01.18 at 10:39, <rcojocaru@bitdefender.com> wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -2324,6 +2324,9 @@ int hvm_set_cr3(unsigned long value, bool_t may_defer)
>>          }
>>      }
>>  
>> +    if ( hvm_pcid_enabled(v) ) /* Clear the noflush bit. */
>> +        value &= ((1ull << 63) - 1);
> 
> This needs a proper X86_CR3_* constant defined.
> 
> Did you investigate what it would take to actually _act_ upon the
> bit being set (besides clearing it for the value to be stored to be
> sane)? Afaict it would require handing a boolean through
> paging_update_cr3() -> ... -> {svm,vmx}_update_guest_cr() to
> allow suppressing the hvm_asid_flush_vcpu() etc there.

I'm now propagating the bool to {svm,vmx}_update_guest_cr() in a
quick-test patch (attached), however my Windows 10 KPTI-enabled guest is
now BSODing with "IRQL NOT LESS OR EQUAL" soon after I attach to it with
xen-access.

Clearly I'm touching code I'm not familiar with, so if this is something
worth pursuing any suggestions are appreciated. Otherwise, I can stick
to the original plan and just clear the noflush bit with no other
processing until things become clearer with the new code.


Thanks,
Razvan

--------------7CDCAB05D4A60038DCE8F901
Content-Type: text/x-patch;
 name="noflush.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="noflush.patch"

diff --git a/tools/tests/xen-access/xen-access.c b/tools/tests/xen-access/xen-access.c
index 9d960e2..6b72907 100644
--- a/tools/tests/xen-access/xen-access.c
+++ b/tools/tests/xen-access/xen-access.c
@@ -629,8 +629,8 @@ int main(int argc, char *argv[])
     if ( write_ctrlreg_cr4 )
     {
         /* Mask the CR4.PGE bit so no events will be generated for global TLB flushes. */
-        rc = xc_monitor_write_ctrlreg(xch, domain_id, VM_EVENT_X86_CR4, 1, 1,
-                                      X86_CR4_PGE, 1);
+        rc = xc_monitor_write_ctrlreg(xch, domain_id, VM_EVENT_X86_CR3, 1, 1, 0, 1);
+                                      // X86_CR4_PGE, 1);
         if ( rc < 0 )
         {
             ERROR("Error %d setting write control register trapping with vm_event\n", rc);
diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 6047464..d0b9906 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -287,9 +287,9 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
         return -EINVAL;
     }
 
-    hvm_update_guest_cr(v, 0);
-    hvm_update_guest_cr(v, 3);
-    hvm_update_guest_cr(v, 4);
+    hvm_update_guest_cr(v, 0, true);
+    hvm_update_guest_cr(v, 3, true);
+    hvm_update_guest_cr(v, 4, true);
     hvm_update_guest_efer(v);
 
     if ( hvm_paging_enabled(v) && !paging_mode_hap(v->domain) )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c4287a3..9105240 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2184,7 +2184,7 @@ static void hvm_update_cr(struct vcpu *v, unsigned int cr, unsigned long value)
 {
     v->arch.hvm_vcpu.guest_cr[cr] = value;
     nestedhvm_set_cr(v, cr, value);
-    hvm_update_guest_cr(v, cr);
+    hvm_update_guest_cr(v, cr, true);
 }
 
 int hvm_set_cr0(unsigned long value, bool_t may_defer)
@@ -2310,6 +2310,7 @@ int hvm_set_cr3(unsigned long value, bool_t may_defer)
     struct vcpu *v = current;
     struct page_info *page;
     unsigned long old = v->arch.hvm_vcpu.guest_cr[3];
+    bool flush = !!(value & X86_CR3_NOFLUSH);
 
     if ( may_defer && unlikely(v->domain->arch.monitor.write_ctrlreg_enabled &
                                monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3)) )
@@ -2326,6 +2327,9 @@ int hvm_set_cr3(unsigned long value, bool_t may_defer)
         }
     }
 
+    if ( hvm_pcid_enabled(v) ) /* Clear the noflush bit. */
+        value &= X86_CR3_NOFLUSH_DISABLE_MASK;
+
     if ( hvm_paging_enabled(v) && !paging_mode_hap(v->domain) &&
          (value != v->arch.hvm_vcpu.guest_cr[3]) )
     {
@@ -2343,7 +2347,7 @@ int hvm_set_cr3(unsigned long value, bool_t may_defer)
     }
 
     v->arch.hvm_vcpu.guest_cr[3] = value;
-    paging_update_cr3(v);
+    paging_update_cr3(v, flush);
     return X86EMUL_OKAY;
 
  bad_cr3:
@@ -3072,7 +3076,7 @@ void hvm_task_switch(
     hvm_set_segment_register(v, x86_seg_tr, &tr);
 
     v->arch.hvm_vcpu.guest_cr[0] |= X86_CR0_TS;
-    hvm_update_guest_cr(v, 0);
+    hvm_update_guest_cr(v, 0, true);
 
     if ( (taskswitch_reason == TSW_iret ||
           taskswitch_reason == TSW_jmp) && otd_writable )
@@ -3908,16 +3912,16 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
     memset(&v->arch.debugreg, 0, sizeof(v->arch.debugreg));
 
     v->arch.hvm_vcpu.guest_cr[0] = X86_CR0_ET;
-    hvm_update_guest_cr(v, 0);
+    hvm_update_guest_cr(v, 0, true);
 
     v->arch.hvm_vcpu.guest_cr[2] = 0;
-    hvm_update_guest_cr(v, 2);
+    hvm_update_guest_cr(v, 2, true);
 
     v->arch.hvm_vcpu.guest_cr[3] = 0;
-    hvm_update_guest_cr(v, 3);
+    hvm_update_guest_cr(v, 3, true);
 
     v->arch.hvm_vcpu.guest_cr[4] = 0;
-    hvm_update_guest_cr(v, 4);
+    hvm_update_guest_cr(v, 4, true);
 
     v->arch.hvm_vcpu.guest_efer = 0;
     hvm_update_guest_efer(v);
@@ -4044,7 +4048,7 @@ static int hvmop_flush_tlb_all(void)
 
     /* Flush paging-mode soft state (e.g., va->gfn cache; PAE PDPE cache). */
     for_each_vcpu ( d, v )
-        paging_update_cr3(v);
+        paging_update_cr3(v, true);
 
     /* Flush all dirty TLBs. */
     flush_tlb_mask(d->dirty_cpumask);
@@ -4206,7 +4210,7 @@ static int hvmop_set_param(
         domain_pause(d);
         d->arch.hvm_domain.params[a.index] = a.value;
         for_each_vcpu ( d, v )
-            paging_update_cr3(v);
+            paging_update_cr3(v, true);
         domain_unpause(d);
 
         domctl_lock_release();
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index 131b852..4a24841 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -36,6 +36,9 @@ bool hvm_monitor_cr(unsigned int index, unsigned long value, unsigned long old)
     struct arch_domain *ad = &curr->domain->arch;
     unsigned int ctrlreg_bitmask = monitor_ctrlreg_bitmask(index);
 
+    if ( index == 3 && hvm_pcid_enabled(curr) ) /* Clear the noflush bit. */
+        value &= X86_CR3_NOFLUSH_DISABLE_MASK;
+
     if ( (ad->monitor.write_ctrlreg_enabled & ctrlreg_bitmask) &&
          (!(ad->monitor.write_ctrlreg_onchangeonly & ctrlreg_bitmask) ||
           value != old) &&
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index b6f6449..140b8d0 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -305,7 +305,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* CR2 */
     v->arch.hvm_vcpu.guest_cr[2] = n1vmcb->_cr2;
-    hvm_update_guest_cr(v, 2);
+    hvm_update_guest_cr(v, 2, true);
 
     /* CR3 */
     /* Nested paging mode */
@@ -576,7 +576,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* CR2 */
     v->arch.hvm_vcpu.guest_cr[2] = ns_vmcb->_cr2;
-    hvm_update_guest_cr(v, 2);
+    hvm_update_guest_cr(v, 2, true);
 
     /* Nested paging mode */
     if (nestedhvm_paging_mode_hap(v)) {
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index dcbd550..c3a4687 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -315,9 +315,9 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
     v->arch.hvm_vcpu.guest_cr[2] = c->cr2;
     v->arch.hvm_vcpu.guest_cr[3] = c->cr3;
     v->arch.hvm_vcpu.guest_cr[4] = c->cr4;
-    svm_update_guest_cr(v, 0);
-    svm_update_guest_cr(v, 2);
-    svm_update_guest_cr(v, 4);
+    svm_update_guest_cr(v, 0, true);
+    svm_update_guest_cr(v, 2, true);
+    svm_update_guest_cr(v, 4, true);
 
     /* Load sysenter MSRs into both VMCB save area and VCPU fields. */
     vmcb->sysenter_cs = v->arch.hvm_svm.guest_sysenter_cs = c->sysenter_cs;
@@ -533,7 +533,7 @@ static int svm_guest_x86_mode(struct vcpu *v)
     return likely(vmcb->cs.db) ? 4 : 2;
 }
 
-void svm_update_guest_cr(struct vcpu *v, unsigned int cr)
+void svm_update_guest_cr(struct vcpu *v, unsigned int cr, bool flush)
 {
     struct vmcb_struct *vmcb = v->arch.hvm_svm.vmcb;
     uint64_t value;
@@ -563,13 +563,19 @@ void svm_update_guest_cr(struct vcpu *v, unsigned int cr)
     case 3:
         vmcb_set_cr3(vmcb, v->arch.hvm_vcpu.hw_cr[3]);
         if ( !nestedhvm_enabled(v->domain) )
-            hvm_asid_flush_vcpu(v);
+        {
+            if ( flush )
+                hvm_asid_flush_vcpu(v);
+        }
         else if ( nestedhvm_vmswitch_in_progress(v) )
             ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
         else
-            hvm_asid_flush_vcpu_asid(
-                nestedhvm_vcpu_in_guestmode(v)
-                ? &vcpu_nestedhvm(v).nv_n2asid : &v->arch.hvm_vcpu.n1asid);
+        {
+            if ( flush )
+                hvm_asid_flush_vcpu_asid(
+                    nestedhvm_vcpu_in_guestmode(v)
+                    ? &vcpu_nestedhvm(v).nv_n2asid : &v->arch.hvm_vcpu.n1asid);
+        }
         break;
     case 4:
         value = HVM_CR4_HOST_MASK;
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 0e6cba5..68f42ed 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -170,10 +170,10 @@ static int construct_vmcb(struct vcpu *v)
     vmcb->tr.limit = 0xff;
 
     v->arch.hvm_vcpu.guest_cr[0] = X86_CR0_PE | X86_CR0_ET;
-    hvm_update_guest_cr(v, 0);
+    hvm_update_guest_cr(v, 0, true);
 
     v->arch.hvm_vcpu.guest_cr[4] = 0;
-    hvm_update_guest_cr(v, 4);
+    hvm_update_guest_cr(v, 4, true);
 
     paging_update_paging_modes(v);
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index e7818ca..ab7580b 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1226,10 +1226,10 @@ static int construct_vmcs(struct vcpu *v)
     vmx_update_exception_bitmap(v);
 
     v->arch.hvm_vcpu.guest_cr[0] = X86_CR0_PE | X86_CR0_ET;
-    hvm_update_guest_cr(v, 0);
+    hvm_update_guest_cr(v, 0, true);
 
     v->arch.hvm_vcpu.guest_cr[4] = 0;
-    hvm_update_guest_cr(v, 4);
+    hvm_update_guest_cr(v, 4, true);
 
     if ( cpu_has_vmx_tpr_shadow )
     {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1546c2a..b76337b 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -70,7 +70,7 @@ static void vmx_ctxt_switch_to(struct vcpu *v);
 static int  vmx_alloc_vlapic_mapping(struct domain *d);
 static void vmx_free_vlapic_mapping(struct domain *d);
 static void vmx_install_vlapic_mapping(struct vcpu *v);
-static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr);
+static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr, bool flush);
 static void vmx_update_guest_efer(struct vcpu *v);
 static void vmx_wbinvd_intercept(void);
 static void vmx_fpu_dirty_intercept(void);
@@ -840,9 +840,9 @@ static int vmx_vmcs_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 
     v->arch.hvm_vcpu.guest_cr[2] = c->cr2;
     v->arch.hvm_vcpu.guest_cr[4] = c->cr4;
-    vmx_update_guest_cr(v, 0);
-    vmx_update_guest_cr(v, 2);
-    vmx_update_guest_cr(v, 4);
+    vmx_update_guest_cr(v, 0, true);
+    vmx_update_guest_cr(v, 2, true);
+    vmx_update_guest_cr(v, 4, true);
 
     v->arch.hvm_vcpu.guest_efer = c->msr_efer;
     vmx_update_guest_efer(v);
@@ -1552,7 +1552,7 @@ void vmx_update_debug_state(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr)
+static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr, bool flush)
 {
     vmx_vmcs_enter(v);
 
@@ -1704,7 +1704,9 @@ static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr)
         }
 
         __vmwrite(GUEST_CR3, v->arch.hvm_vcpu.hw_cr[3]);
-        hvm_asid_flush_vcpu(v);
+
+        if ( flush )
+            hvm_asid_flush_vcpu(v);
         break;
 
     default:
@@ -2672,7 +2674,7 @@ static int vmx_cr_access(unsigned long exit_qualification)
          */
         hvm_monitor_crX(CR0, value, old);
         curr->arch.hvm_vcpu.guest_cr[0] = value;
-        vmx_update_guest_cr(curr, 0);
+        vmx_update_guest_cr(curr, 0, true);
         HVMTRACE_0D(CLTS);
         break;
     }
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c732734..7e44e7e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -526,7 +526,7 @@ void update_cr3(struct vcpu *v)
 
     if ( paging_mode_enabled(v->domain) )
     {
-        paging_update_cr3(v);
+        paging_update_cr3(v, true);
         return;
     }
 
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 003c2d8..b09fc84 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -669,10 +669,10 @@ static bool_t hap_invlpg(struct vcpu *v, unsigned long va)
     return 1;
 }
 
-static void hap_update_cr3(struct vcpu *v, int do_locking)
+static void hap_update_cr3(struct vcpu *v, int do_locking, bool flush)
 {
     v->arch.hvm_vcpu.hw_cr[3] = v->arch.hvm_vcpu.guest_cr[3];
-    hvm_update_guest_cr(v, 3);
+    hvm_update_guest_cr(v, 3, flush);
 }
 
 const struct paging_mode *
@@ -708,7 +708,7 @@ static void hap_update_paging_modes(struct vcpu *v)
     }
 
     /* CR3 is effectively updated by a mode change. Flush ASIDs, etc. */
-    hap_update_cr3(v, 0);
+    hap_update_cr3(v, 0, true);
 
     paging_unlock(d);
     put_gfn(d, cr3_gfn);
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index c240953..b1e77f0 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -3030,7 +3030,7 @@ static void sh_update_paging_modes(struct vcpu *v)
     }
 #endif /* OOS */
 
-    v->arch.paging.mode->update_cr3(v, 0);
+    v->arch.paging.mode->update_cr3(v, 0, true);
 }
 
 void shadow_update_paging_modes(struct vcpu *v)
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index a6372e3..d69dce5 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3173,7 +3173,7 @@ static int sh_page_fault(struct vcpu *v,
          * In any case, in the PAE case, the ASSERT is not true; it can
          * happen because of actions the guest is taking. */
 #if GUEST_PAGING_LEVELS == 3
-        v->arch.paging.mode->update_cr3(v, 0);
+        v->arch.paging.mode->update_cr3(v, 0, true);
 #else
         ASSERT(d->is_shutting_down);
 #endif
@@ -3992,7 +3992,7 @@ sh_set_toplevel_shadow(struct vcpu *v,
 
 
 static void
-sh_update_cr3(struct vcpu *v, int do_locking)
+sh_update_cr3(struct vcpu *v, int do_locking, bool flush)
 /* Updates vcpu->arch.cr3 after the guest has changed CR3.
  * Paravirtual guests should set v->arch.guest_table (and guest_table_user,
  * if appropriate).
@@ -4234,7 +4234,7 @@ sh_update_cr3(struct vcpu *v, int do_locking)
         v->arch.hvm_vcpu.hw_cr[3] =
             pagetable_get_paddr(v->arch.shadow_table[0]);
 #endif
-        hvm_update_guest_cr(v, 3);
+        hvm_update_guest_cr(v, 3, flush);
     }
 
     /* Fix up the linear pagetable mappings */
diff --git a/xen/arch/x86/mm/shadow/none.c b/xen/arch/x86/mm/shadow/none.c
index 9e6ad23..643e5c7 100644
--- a/xen/arch/x86/mm/shadow/none.c
+++ b/xen/arch/x86/mm/shadow/none.c
@@ -50,7 +50,7 @@ static unsigned long _gva_to_gfn(struct vcpu *v, struct p2m_domain *p2m,
     return gfn_x(INVALID_GFN);
 }
 
-static void _update_cr3(struct vcpu *v, int do_locking)
+static void _update_cr3(struct vcpu *v, int do_locking, bool flush)
 {
     ASSERT_UNREACHABLE();
 }
diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
index f229e69..b6d2b43 100644
--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -194,7 +194,7 @@ int arch_monitor_domctl_event(struct domain *d,
             struct vcpu *v;
             /* Latches new CR3 mask through CR0 code. */
             for_each_vcpu ( d, v )
-                hvm_update_guest_cr(v, 0);
+                hvm_update_guest_cr(v, 0, true);
         }
 
         domain_unpause(d);
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index 7275c65..e6e8813 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -34,6 +34,9 @@ extern bool_t opt_hvm_fep;
 #define opt_hvm_fep 0
 #endif
 
+#define X86_CR3_NOFLUSH (1ull << 63)
+#define X86_CR3_NOFLUSH_DISABLE_MASK (X86_CR3_NOFLUSH - 1)
+
 /* Interrupt acknowledgement sources. */
 enum hvm_intsrc {
     hvm_intsrc_none,
@@ -132,7 +135,7 @@ struct hvm_function_table {
     /*
      * Called to inform HVM layer that a guest CRn or EFER has changed.
      */
-    void (*update_guest_cr)(struct vcpu *v, unsigned int cr);
+    void (*update_guest_cr)(struct vcpu *v, unsigned int cr, bool flush);
     void (*update_guest_efer)(struct vcpu *v);
 
     void (*cpuid_policy_changed)(struct vcpu *v);
@@ -324,9 +327,10 @@ hvm_update_host_cr3(struct vcpu *v)
         hvm_funcs.update_host_cr3(v);
 }
 
-static inline void hvm_update_guest_cr(struct vcpu *v, unsigned int cr)
+static inline void hvm_update_guest_cr(struct vcpu *v, unsigned int cr,
+                                       bool flush)
 {
-    hvm_funcs.update_guest_cr(v, cr);
+    hvm_funcs.update_guest_cr(v, cr, flush);
 }
 
 static inline void hvm_update_guest_efer(struct vcpu *v)
diff --git a/xen/include/asm-x86/hvm/svm/svm.h b/xen/include/asm-x86/hvm/svm/svm.h
index 462cb89..ee30d70 100644
--- a/xen/include/asm-x86/hvm/svm/svm.h
+++ b/xen/include/asm-x86/hvm/svm/svm.h
@@ -51,7 +51,7 @@ static inline void svm_invlpga(unsigned long vaddr, uint32_t asid)
 
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
-void svm_update_guest_cr(struct vcpu *, unsigned int cr);
+void svm_update_guest_cr(struct vcpu *, unsigned int cr, bool flush);
 
 extern u32 svm_feature_flags;
 
diff --git a/xen/include/asm-x86/paging.h b/xen/include/asm-x86/paging.h
index 5607ab4..6e40e76 100644
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -122,7 +122,8 @@ struct paging_mode {
                                             unsigned long cr3,
                                             paddr_t ga, uint32_t *pfec,
                                             unsigned int *page_order);
-    void          (*update_cr3            )(struct vcpu *v, int do_locking);
+    void          (*update_cr3            )(struct vcpu *v, int do_locking,
+                                            bool flush);
     void          (*update_paging_modes   )(struct vcpu *v);
     void          (*write_p2m_entry       )(struct domain *d, unsigned long gfn,
                                             l1_pgentry_t *p, l1_pgentry_t new,
@@ -276,9 +277,9 @@ static inline unsigned long paging_ga_to_gfn_cr3(struct vcpu *v,
 /* Update all the things that are derived from the guest's CR3.
  * Called when the guest changes CR3; the caller can then use v->arch.cr3
  * as the value to load into the host CR3 to schedule this vcpu */
-static inline void paging_update_cr3(struct vcpu *v)
+static inline void paging_update_cr3(struct vcpu *v, bool flush)
 {
-    paging_get_hostmode(v)->update_cr3(v, 1);
+    paging_get_hostmode(v)->update_cr3(v, 1, flush);
 }
 
 /* Update all the things that are derived from the guest's CR0/CR3/CR4.

--------------7CDCAB05D4A60038DCE8F901
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------7CDCAB05D4A60038DCE8F901--
