Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB050F588DF
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 14:25:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286099.1567266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZL-0006Dj-P8; Mon, 20 Apr 2026 14:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286099.1567266; Mon, 20 Apr 2026 14:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZL-0006CB-Gj; Mon, 20 Apr 2026 14:25:47 +0000
Received: by outflank-mailman (input) for mailman id 1286099;
 Mon, 20 Apr 2026 14:25:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpZJ-0005ik-Ko
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:25:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpZJ-00BFc6-0S
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:25:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63765-2eae-0a2a0a5409dd-0a2a450bd768-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:44 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63768-212f-0a2a450b0019-d98c6eac8d8e-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:44 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 201F516F2;
 Mon, 20 Apr 2026 07:25:38 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D29A03F7B4;
 Mon, 20 Apr 2026 07:25:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776695143; bh=DZDq1tuHld+v7+buygc/it5ATvErstw+AN1u/SO6z5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cql5dYQz5MqXn40DAJLyQby//2LqjdikrSawBIJejgCAbGxmXoVzAGseR2UGeHvbm
	 gOtdH0DPaOpL14OXm1RP8KkKqSOHumxoIkkiYgzykkflW4Uzrj5x+AWc/OP7I1HTLB
	 IVlR7QhPN849+MJ1RVjZ+lbPaK7UdkKLaE78rBgo=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 8/8] arm/mpu: Save/restore VTCR_EL2 on vCPU context switch
Date: Mon, 20 Apr 2026 15:25:24 +0100
Message-Id: <20260420142524.1804073-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420142524.1804073-1-luca.fancellu@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776695144-05969F3B-B9F5DBF5/0/0
X-purgate-type: clean
X-purgate-size: 6845

On AArch64 MPU systems, the VTCR register contains the MSA bit that determines
if the guest is using MPU or MMU at EL1, which is required to be
saved/restored on vCPU context switch.

On AArch64 MPU systems the VTCR_EL2 register configuration will be saved
during setup_virt_paging and will be placed in a new member of
'struct arch_vcpu' named vtcr_el2, to be retrieved by context switch.

AArch32 MPU systems and MMU systems don't need to save/restore this
register because they don't have any MSA bit and related functionality,
so for these architecture a stub is provided.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/arm64/mpu/p2m.c                | 15 +++++++++++++++
 xen/arch/arm/domain.c                       |  2 ++
 xen/arch/arm/include/asm/domain.h           |  5 +++++
 xen/arch/arm/include/asm/mmu/domain-build.h |  2 ++
 xen/arch/arm/include/asm/mpu/domain-build.h |  6 ++++++
 xen/arch/arm/include/asm/mpu/p2m.h          | 10 ++++++++++
 xen/arch/arm/mpu/domain-build.c             | 17 +++++++++++++++++
 xen/arch/arm/mpu/p2m.c                      |  4 ++++
 8 files changed, 61 insertions(+)

diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
index a1ec9fcd6195..350cbd7ae94c 100644
--- a/xen/arch/arm/arm64/mpu/p2m.c
+++ b/xen/arch/arm/arm64/mpu/p2m.c
@@ -3,8 +3,12 @@
 #include <xen/bug.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <asm/p2m.h>
 
+/* VTCR_EL2 value to be configured for the boot CPU. */
+register_t __read_mostly vtcr;
+
 void __init setup_virt_paging(void)
 {
     register_t vtcr_el2 = READ_SYSREG(VTCR_EL2);
@@ -58,6 +62,7 @@ void __init setup_virt_paging(void)
     else
         vtcr_el2 &= ~VTCR_VS;
 
+    vtcr = vtcr_el2;
     WRITE_SYSREG(vtcr_el2, VTCR_EL2);
 
     p2m_vmid_allocator_init();
@@ -89,6 +94,16 @@ void __init setup_virt_paging(void)
     panic("Hardware with no PMSAv8-64 support in any translation regime\n");
 }
 
+void p2m_save_vtcr(struct vcpu *p)
+{
+    p->arch.vtcr_el2 = READ_SYSREG(VTCR_EL2);
+}
+
+void p2m_restore_vtcr(struct vcpu *n)
+{
+    WRITE_SYSREG(n->arch.vtcr_el2, VTCR_EL2);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 221b1f8a7f9d..e928301d7cb0 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -538,6 +538,8 @@ int arch_vcpu_create(struct vcpu *v)
     if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
         v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
 
+    arch_set_vtcr_msa(v);
+
     if ( is_mpu_domain(v->domain) )
         allocate_el1_mpu_regions(v);
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 44c304ef8aa9..3ab004518427 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -203,6 +203,11 @@ struct arch_vcpu
     uint32_t cpacr;
 
 #ifdef CONFIG_MPU
+#ifdef CONFIG_ARM_64
+    /* Virtualization Translation Control Register */
+    uint64_t vtcr_el2;
+#endif
+
     /* EL1 MPU memory regions */
     pr_t *mpu_regions;
 #endif
diff --git a/xen/arch/arm/include/asm/mmu/domain-build.h b/xen/arch/arm/include/asm/mmu/domain-build.h
index 3e0d9a6a2a08..0919c0097da9 100644
--- a/xen/arch/arm/include/asm/mmu/domain-build.h
+++ b/xen/arch/arm/include/asm/mmu/domain-build.h
@@ -34,6 +34,8 @@ int arch_set_v8r_el1_msa(struct domain *d,
     return 0;
 }
 
+static inline void arch_set_vtcr_msa(struct vcpu *v) {}
+
 #endif /* __ARM_MMU_DOMAIN_BUILD_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/mpu/domain-build.h b/xen/arch/arm/include/asm/mpu/domain-build.h
index 463cd85b5b7e..8d3a743219ce 100644
--- a/xen/arch/arm/include/asm/mpu/domain-build.h
+++ b/xen/arch/arm/include/asm/mpu/domain-build.h
@@ -15,6 +15,12 @@ int arch_set_v8r_el1_msa(struct domain *d,
                          const struct xen_domctl_createdomain *config,
                          unsigned int flags);
 
+#ifdef CONFIG_ARM_64
+void arch_set_vtcr_msa(struct vcpu *v);
+#else
+static inline void arch_set_vtcr_msa(struct vcpu *v) {}
+#endif
+
 #endif /* __ARM_MPU_DOMAIN_BUILD_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
index d0ec8a77a15a..1628148ba578 100644
--- a/xen/arch/arm/include/asm/mpu/p2m.h
+++ b/xen/arch/arm/include/asm/mpu/p2m.h
@@ -9,6 +9,8 @@
 
 struct p2m_domain;
 
+extern register_t vtcr;
+
 /*
  * The architecture allows at most 255 EL2 MPU memory regions. The size of the
  * MPU structure entry (pr_t) is 32 Bytes on AArch64 (requiring two 4KB pages)
@@ -36,6 +38,14 @@ static inline bool region_is_p2m_valid(pr_t *pr)
     return (pr->p2m_type != p2m_invalid);
 }
 
+#ifdef CONFIG_ARM_64
+void p2m_save_vtcr(struct vcpu *p);
+void p2m_restore_vtcr(struct vcpu *n);
+#else
+static inline void p2m_save_vtcr(struct vcpu *p) {}
+static inline void p2m_restore_vtcr(struct vcpu *n) {}
+#endif
+
 #endif /* __ARM_MPU_P2M_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/domain-build.c b/xen/arch/arm/mpu/domain-build.c
index 1bdd0ffedebb..19e504f7149e 100644
--- a/xen/arch/arm/mpu/domain-build.c
+++ b/xen/arch/arm/mpu/domain-build.c
@@ -8,6 +8,7 @@
 #include <xen/sched.h>
 #include <asm/mpu.h>
 #include <asm/mpu/domain-build.h>
+#include <asm/mpu/p2m.h>
 #include <public/arch-arm.h>
 #include <public/domctl.h>
 
@@ -66,6 +67,22 @@ int arch_set_v8r_el1_msa(struct domain *d,
     return 0;
 }
 
+#ifdef CONFIG_ARM_64
+void arch_set_vtcr_msa(struct vcpu *v)
+{
+    /*
+     * When ID_AA64MMFR0_EL1.MSA_frac is 0b0010 (MM64_MSA_FRAC_VMSA_SUPPORT),
+     * then VTCR_EL2.MSA determines the memory system architecture enabled
+     * at stage 1 of the Secure EL1&0 translation regime.
+     */
+    v->arch.vtcr_el2 = vtcr;
+    if ( is_mpu_domain(v->domain) )
+        v->arch.vtcr_el2 &= ~VTCR_MSA;
+    else
+        v->arch.vtcr_el2 |= VTCR_MSA;
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index 06c92a3ef41b..b41abd8f2d37 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -357,6 +357,8 @@ void p2m_save_state(struct vcpu *p)
 
     p->arch.sctlr = READ_SYSREG(SCTLR_EL1);
 
+    p2m_save_vtcr(p);
+
     if ( p2m_xenmpu_update(p2m, false) )
         panic("Failed to offline P2M MPU memory mapping\n");
 }
@@ -369,6 +371,8 @@ void p2m_restore_state(struct vcpu *n)
     WRITE_SYSREG(n->arch.sctlr, SCTLR_EL1);
     WRITE_SYSREG(n->arch.hcr_el2, HCR_EL2);
 
+    p2m_restore_vtcr(n);
+
     WRITE_SYSREG(p2m->vsctlr, VSCTLR_EL2);
     if ( p2m_xenmpu_update(p2m, true) )
         panic("Failed to online P2M MPU memory mapping\n");
-- 
2.34.1


