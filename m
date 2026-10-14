Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924A3CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 11:07:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448757.1664787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGwoo-0001RH-3r; Wed, 14 Oct 2026 11:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448757.1664787; Wed, 14 Oct 2026 11:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGwoo-0001RA-1B; Wed, 14 Oct 2026 11:06:46 +0000
Received: by outflank-mailman (input) for mailman id 1448757;
 Wed, 14 Oct 2026 11:06:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1xGwon-0001Pz-Ga
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:06:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGwom-005B2j-5u
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:06:44 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6acf6238-bab6-0a2a0a5309dd-0a2a45099116-28
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:06:44 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6acf6243-be1a-0a2a45090019-a0658309d5ac-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:06:43 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id D34A583C97CD;
 Wed, 14 Oct 2026 07:06:09 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH] x86/emulator: Add Linear Address Space Separation (LASS) support
Date: Wed, 14 Oct 2026 11:59:49 +0100
Message-ID: <3e42ad91a038fe21b09f2bb7b6b8a47e1c8d6718.1791973459.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791976003-3ACDF034-2C26A34C/0/0
X-purgate-type: clean
X-purgate-size: 7286

Linear Address Space Separation (LASS) is an architectural security feature
that is intended to prevent cross userspace/kernelspace memory boundary access
with the CPU hardware support. Unlike the related mode-based paging protections
such as the Supervisor Mode Access Prevention (SMAP) and the Supervisor Mode
Execution Prevention (SMEP), LASS provides the efficient mechanism to guard
against the cross memory boundary accesses without traversing the paging
structures. This provides a more efficient guarding mechanism against the class
of malicious software attacks that relies on paging-based timing information,
see (1) for more information. Enlighten the x86 instruction emulator to comply
with the hardware Intel's CPU support for the LASS.

The LASS violation check logic is adapted from the reviewed logic in the Linux
KVM mailing list (2) for the LASS violation checks.

[1] https://cdrdv2-public.intel.com/774990/architecture-instruction-set-extensions-programming-reference.pdf
[2] https://lwn.net/ml/linux-kernel/20230913124227.12574-16-binbin.wu@linux.intel.com/
---
Testing:
 - With A virtual machine setup with installing the fedora rawhide/f45 development
   branch which is based on the Linux kernel 7.1, I verified the following test cases
   1- Using the Xen Server, I enabled the lass cpu fetaure. Running the command
      grep 'lass' /proc/cpuinfo
      is successfully reporting and verifying lass is supported by the guest kernel.

   2- On the setup guest, I wrote the following code to verify the kernelspace linear
      address access from userspace is prevented with #GP. Disabling lass from the guest
      and commenting the FEP is rather reporting #PF.

      int main(void){
          char usrspace_buf[16] = {0};
          char* usrspace = usrspace_buf;
          char* kernspace = (char*) 0xffff800000000000;

          asm volatile (
              ".byte 0x0f, 0x0b, 0x78, 0x65, 0x6e\n\t"
              "rep movsb"
              : "+S" (usrspace), "+D" (kernspace)
              : "c" (16)
              : "memory"
          );

          return 0;
      }


   3- On the setup guest, I wrote the following kernel module to verify the userspace linear
      address access from the kernelspace is prevented with #GP. Disabling lass from the guest
      is rather reprting #PF. Executing the code with commentted Forced Emulation Prefix
      (FEP) and the lass feature enabled is reporting #GP.

      #include <linux/module.h>
      #include <linux/slab.h>

      MODULE_LICENSE("GPL");
      MODULE_DESCRIPTION("Testing Module for Intel's LASS Xen Trap");

      static int __init my_module_init(void){
          char* usrspace = (char*) 0x00007ffffffffd00;
          char* kernspace = kzalloc(16, GFP_KERNEL);

          if (!kernspace) {
              pr_err("Memory allocation failed\n");
              return -ENOMEM;
          }

          asm volatile (
          ".byte 0x0f, 0x0b, 0x78, 0x65, 0x6e\n\t"
          "rep movsb"
          : "+S" (usrspace), "+D" (kernspace)
          : "c" (16)
          : "memory"
          );

          return 0;
      }

      static void __exit my_module_exit(void){
          pr_info("my module ");
      }

      module_init(my_module_init);
      module_exit(my_module_exit);

   4- On the setup guest, I wrote the following code to verify the implicit system (spervisor)
      address access from userspace is not prevented with #GP.

      #include <stdio.h>

      #define XEN_FEP ".byte 0x0f, 0x0b, 0x78, 0x65, 0x6e\n\t"

      int main() {
          asm volatile (XEN_FEP "mov %[sel], %%fs" :: [sel] "r" (15*8+3));
          return 0;
      }

    5- CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2946430503
---
 xen/arch/x86/hvm/hvm.c | 73 ++++++++++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ef9c7cd057..3477d62d43 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2557,6 +2557,40 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
     return X86EMUL_OKAY;
 }
 
+static bool is_lass_violation(struct vcpu *v, unsigned long addr,
+                              unsigned long size,
+                              enum hvm_access_type access_type,
+                              bool is_implicit_supervisor_access)
+{
+    const bool is_supervisor_address = !!(addr & (1ULL << 63));
+
+    if ( !(v->arch.hvm.guest_cr[4] & X86_CR4_LASS) || !hvm_long_mode_active(v) )
+        return false;
+
+    if ( !is_implicit_supervisor_access && hvm_get_cpl(v) == 3 )
+        return is_supervisor_address;
+
+    /*
+     * In the subsequent logic, we are emulating a verified supervisor
+     * access LASS check.
+     */
+
+    if ( access_type != hvm_access_insn_fetch )
+    {
+        if ( !(v->arch.hvm.guest_cr[4] & X86_CR4_SMAP) )
+            return false;
+
+        if ( !is_implicit_supervisor_access &&
+             guest_cpu_user_regs()->eflags & X86_EFLAGS_AC )
+            return false;
+    }
+
+    if ( size && !((addr + size - 1) & (1ULL << 63)) )
+        return true;
+
+    return !is_supervisor_address;
+}
+
 bool hvm_vcpu_virtual_to_linear(
     struct vcpu *v,
     enum x86_segment seg,
@@ -2602,26 +2636,31 @@ bool hvm_vcpu_virtual_to_linear(
         if ( max(offset, last_byte) >> 16 )
             goto out;
     }
-    else if ( hvm_long_mode_active(v) &&
-              (is_x86_system_segment(seg) || active_cs->l) )
+    else if ( hvm_long_mode_active(v) )
     {
-        /*
-         * User segments are always treated as present.  System segment may
-         * not be, and also incur limit checks.
-         */
-        if ( is_x86_system_segment(seg) &&
-             (!reg->p || (offset + bytes - !!bytes) > reg->limit) )
-            goto out;
+        if ( (is_x86_system_segment(seg) || active_cs->l) )
+        {
+            /*
+             * User segments are always treated as present.  System segment may
+             * not be, and also incur limit checks.
+             */
+             if ( is_x86_system_segment(seg) &&
+                  (!reg->p || (offset + bytes - !!bytes) > reg->limit) )
+                 goto out;
 
-        /*
-         * LONG MODE: FS, GS and system segments: add segment base. All
-         * addresses must be canonical.
-         */
-        if ( seg >= x86_seg_fs )
-            addr += reg->base;
+            /*
+             * LONG MODE: FS, GS and system segments: add segment base. All
+             * addresses must be canonical.
+             */
+            if ( seg >= x86_seg_fs )
+                addr += reg->base;
+
+            last_byte = addr + bytes - !!bytes;
+            if ( !is_canonical_address((long)addr < 0 ? addr : last_byte) )
+                goto out;
+        }
 
-        last_byte = addr + bytes - !!bytes;
-        if ( !is_canonical_address((long)addr < 0 ? addr : last_byte) )
+        if ( is_lass_violation(v, addr, bytes, access_type, is_x86_system_segment(seg)) )
             goto out;
     }
     else
-- 
2.53.0


