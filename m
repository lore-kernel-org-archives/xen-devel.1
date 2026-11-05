Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA057606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lkTb9C1p
Received: from list by lists.xenproject.org with outflank-mailman.1474464.1681578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOvc5-0005JC-UF; Thu, 05 Nov 2026 11:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474464.1681578; Thu, 05 Nov 2026 11:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOvc5-0005J3-Qq; Thu, 05 Nov 2026 11:26:37 +0000
Received: by outflank-mailman (input) for mailman id 1474464;
 Thu, 05 Nov 2026 11:26:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1xOvc4-0005Ix-6Z
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 11:26:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOvc3-009SPE-JX
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 12:26:35 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6aec67de-e002-0a2a0a5209dd-0a2a4509b5f2-44
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 12:26:35 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6aec67eb-be1a-0a2a45090019-d155802fc82a-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 12:26:35 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so12482495e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 03:26:35 -0800 (PST)
Received: from andrew-B650M-DS3H.. ([102.213.49.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed551dc5sm9722047f8f.34.2026.11.05.03.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 03:26:33 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793877995; x=1794482795; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK7OLAJ1khRdk8yKYKE5ualoF0lovT9J904AH+BduH0=;
        b=lkTb9C1pGFODjRWqo7BS02yIpWsIqQ145PRQ0c4+npr7oNb/41Z/Mii9KvnbJTM3QG
         NPpsxjmzJcmbkpxe/OeMmtocUaJ4V7FPOfGQm+LvO5+b0AyEn4W/UMpTOVwFX0faDlHP
         u+2O8Yp4ltxm+k0+BssfyTNmMoGIeqbF8xM9BbheMWfJWnuPflkAftYRLUudisWPwizO
         eUAguqDCd5XjQKqJqzrsfRKaAvyGe2BOlVcdUx49w6TVOKzPGdCGrXz9q6xF2TQY7DNj
         THjxRgMzSgNTFqVPFs+OhocgTpysnt+oRW8qXRkfuuzCKEjfMAXwbYHqyTVCvKjFP5om
         dyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877995; x=1794482795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK7OLAJ1khRdk8yKYKE5ualoF0lovT9J904AH+BduH0=;
        b=wb2ry7M105V9CeHJSUfokWitanBiZF5jXuKyOVZiXTDQZ4wT5pp489QeBhrIPRcFdY
         vsU75z5JKaWNsk0Hab7B7EnMHtL6vKS64ubqQ1sq6lEzGJ9XjAyghGy/PXaEO7Rh/XJf
         WXeOcAbQgoVO4ltM0NmWuOR5/X1LZlIDUMfpfIEbjKeoV/Xv8G3uZ6IyxtlWIg6agNKH
         X35szASS9SL1PvSfsPr3LV7GgT/Els2ZPdTgC4GkR8z39R6C+maOOyajgbjcAI7veTBf
         bNf+P3N0ZdPU5RdkMWiRG4UR/saja3VtiDnBs7xnS+e/YgIyhj8s9gvxtBHXVRaXDEHK
         NKLg==
X-Gm-Message-State: APuU4Z8Isae0IhCgfVRXHNQ1s8JUL2tPhCAyd2kfyWZ88nmG7dXgRVqU
	da+xYVwT0MG+CWmUfxEaaz8lxC+IfE5R+1gcxy6UylD4NzMO3WiDyTu5to3/rMp+8DY=
X-Gm-Gg: AYBFou1HVoScORXQ/Q+6r1JJjsMFm0j95IG3DHvnFF/2iPf6QLcPEu4iRDPsDoFOrz4
	mLhXBwTIDJVnk7eKKZmEXeDo2zu9pi8h86Gz9VPY3eEaNNS65NTmFCGE8xFpUm2AW6G8TWJo03M
	sldlDmoWn9QFkcwBpQilnoeT5t4HoKTLWPRLIrQZDqH7To4zj7IUVowXhLohPGwtQ8wCNecbs6Q
	D0xtG97jiaoTVwA0n7ZovWDoo3A+2P6LVP4Kf6OJ8lq44zPP8J1WVjWzvhUu+m8ero5OYmQCjI1
	BpYrw2VPj92egBcsyaqP1ptrjXFC1vJ96fMjhjCR2fjJsirnPLrmwP6qBYex2x/7iSxX2mUp7su
	6FPT8NiQGvZ6Ye2kRwEEz5TVliiKPVr1jNS27K6GIxK+LHjE+rcBafNw2US7WggHS8Q7nLNs44F
	NPe2BPmgnxcu44mfVxs+FUXekMbR0011SGxhSQNf7s7o4keW6fuyBIeTK/eLefBZpSCfuhBuhWy
	Y9gsExcOdy8A+zRQKFym6GluToWcxjyFF9SEGLYipsR3jcLQYS8ymOdXb0KmIRcCPLPnCJya+my
	cAZ+bfTM5y9dsjxAmWKNJqxX2n04yEaT3KMErSvRL/X5LQs=
X-Received: by 2002:a05:600c:6992:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4ac18992c01mr411045945e9.30.1793877994381;
        Thu, 05 Nov 2026 03:26:34 -0800 (PST)
From: Andrew Mbugua <andrewprecious388@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jenswi@kernel.org>,
	Andrew Mbugua <andrewprecious388@gmail.com>
Subject: [PATCH] xen/arch/arm: Correcting comment typos across xen/arch/arm
Date: Thu,  5 Nov 2026 14:26:27 +0300
Message-ID: <20261105112627.235207-1-andrewprecious388@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793877995-BDAC0034-0603ED40/0/0
X-purgate-type: clean
X-purgate-size: 15453
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

No functional change.

I have been making typo corrections across a variety of files

Scanning Xen using codespell for typo matches I have found:
1. Xen native project sources: 3303 typos
2. Qemu Tree - 4908 typos

Reasons for corrections:
1. Keeping the codebase clean,concise for future documentation generation
2. Just because typos seem minor doesnt mean that corrections should be ignored,
while correcting these errors may not be pedantic I think its essential in
keeping things claan and more readable.

The followup comments on this patch will also guide me
as to whether further changes across other files will be needed.


Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
---
diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index 23a9d0ba66..bce63b07b1 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -131,7 +131,7 @@ void sve_context_free(struct vcpu *v)
     sve_vl_bits = sve_decode_vl(v->domain->arch.sve_vl);
 
     /*
-     * Currenly points to the end of Z0-Z31 memory which is not the start of
+     * Currently points to the end of Z0-Z31 memory which is not the start of
      * the buffer. To be kept in sync with the sve_context_init().
      */
     v->arch.vfp.sve_zreg_ctx_end -=
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 34b5a85f9f..4c34f616e9 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1047,7 +1047,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
  * logically restart work from this point.
  *
  * PROGRESS() markers must not be in the middle of loops. The loop
- * variable isn't preserved accross a continuation.
+ * variable isn't preserved across a continuation.
  *
  * To avoid redundant work, there should be a marker before each
  * function which may return -ERESTART.
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
index 391df8b945..e776d94c91 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -32,7 +32,7 @@ static struct domain __read_mostly *scmi_dom;
 
 /*
  * Check if provided SMC Function Identifier matches the one known by the SCMI
- * layer, as read from DT prop 'arm,smc-id' during initialiation.
+ * layer, as read from DT prop 'arm,smc-id' during initialization.
  */
 static bool scmi_is_valid_smc_id(uint32_t fid)
 {
diff --git a/xen/arch/arm/include/asm/arm64/efibind.h b/xen/arch/arm/include/asm/arm64/efibind.h
index 7ab00e4f55..18f5615acf 100644
--- a/xen/arch/arm/include/asm/arm64/efibind.h
+++ b/xen/arch/arm/include/asm/arm64/efibind.h
@@ -142,8 +142,8 @@ typedef uint64_t   UINTN;
 // RUNTIME_CODE - pragma macro for declaring runtime code
 //
 
-#ifndef EFIAPI                  // Forces EFI calling conventions reguardless of compiler options
-        #define EFIAPI          // Substitute expresion to force C calling convention
+#ifndef EFIAPI                  // Forces EFI calling conventions regardless of compiler options
+        #define EFIAPI          // Substitute expression to force C calling convention
 #endif
 
 #define BOOTSERVICE
@@ -163,7 +163,7 @@ typedef uint64_t   UINTN;
 
 
 //
-// When build similiar to FW, then link everything together as
+// When build is similar to FW, then link everything together as
 // one big module.
 //
 
diff --git a/xen/arch/arm/include/asm/asm_defns.h b/xen/arch/arm/include/asm/asm_defns.h
index 47efdf5234..ab6eecc8d0 100644
--- a/xen/arch/arm/include/asm/asm_defns.h
+++ b/xen/arch/arm/include/asm/asm_defns.h
@@ -15,7 +15,7 @@
 #elif defined(CONFIG_ARM_64)
 # define __OP32 "w"
 /*
- * Clang < 8.0 doesn't support register alllocation using the syntax rN.
+ * Clang < 8.0 doesn't support register allocation using the syntax rN.
  * See https://reviews.llvm.org/rL328829.
  */
 # define ASM_REG(index) asm("x" # index)
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 3f62b38dc0..7e559253d7 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -347,7 +347,7 @@
 #define CONTEXTIDR      p15,0,c13,c0,1  /* Context ID Register */
 #define TPIDRURW        p15,0,c13,c0,2  /* Software Thread ID, User, R/W */
 #define TPIDRURO        p15,0,c13,c0,3  /* Software Thread ID, User, R/O */
-#define TPIDRPRW        p15,0,c13,c0,4  /* Software Thread ID, Priveleged */
+#define TPIDRPRW        p15,0,c13,c0,4  /* Software Thread ID, Privileged */
 #define HTPIDR          p15,4,c13,c0,2  /* HYp Software Thread Id Register */
 
 /* CP15 CR14:  */
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 9af05da6aa..7ceae49774 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -151,7 +151,7 @@
 /*
  * The minimum GICC_BPR is required to be in the range 0-3. We set
  * GICC_BPR to 0 but we must expect that it might be 3. This means we
- * can rely on premption between the following ranges:
+ * can rely on preemption between the following ranges:
  * 0xf0..0xff
  * 0xe0..0xdf
  * 0xc0..0xcf
@@ -162,7 +162,7 @@
  *
  * Priorities within a range will not preempt each other.
  *
- * A GIC must support a mimimum of 16 priority levels.
+ * A GIC must support a minimum of 16 priority levels.
  */
 #define GIC_PRI_LOWEST     0xf0U
 #define GIC_PRI_IRQ        0xa0U
diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 8e062c9e37..43c178652b 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -36,7 +36,7 @@ typedef struct __packed {
      */
     unsigned long ai:3;         /* Attribute Index */
     unsigned long ns:1;         /* Not-Secure */
-    unsigned long up:1;         /* Unpriviledged access */
+    unsigned long up:1;         /* Unprivileged access */
     unsigned long ro:1;         /* Read-Only */
     unsigned long sh:2;         /* Shareability */
     unsigned long af:1;         /* Access Flag */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 2eb8465aa9..9a87e71049 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -194,7 +194,7 @@ bool flags_has_rwx(unsigned int flags);
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
 extern void remove_early_mappings(void);
-/* Prepare the memory subystem to bring-up the given secondary CPU */
+/* Prepare the memory subsystem to bring-up the given secondary CPU */
 extern int prepare_secondary_mm(int cpu);
 /* Map a frame table */
 void init_frametable(paddr_t ram_start);
@@ -271,7 +271,7 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
 
 /*
  * We define non-underscored wrappers for above conversion functions.
- * These are overriden in various source files while underscored version
+ * These are overridden in various source files while underscored version
  * remain intact.
  */
 #define virt_to_mfn(va)     __virt_to_mfn(va)
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index 7f4d59137d..7cebc60298 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -57,7 +57,7 @@ static inline void *maddr_to_virt(paddr_t ma)
 /**
  * Find the virtual address corresponding to a machine address
  *
- * The directmap covers all conventional memory accesible by the
+ * The directmap covers all conventional memory accessible by the
  * hypervisor. This means it's subject to PDX compression.
  *
  * Note there's an extra offset applied (directmap_base_pdx) on top of the
diff --git a/xen/arch/arm/include/asm/tee/optee_msg.h b/xen/arch/arm/include/asm/tee/optee_msg.h
index 09820ff863..0ccdf03fc4 100644
--- a/xen/arch/arm/include/asm/tee/optee_msg.h
+++ b/xen/arch/arm/include/asm/tee/optee_msg.h
@@ -292,7 +292,7 @@ struct optee_msg_arg {
  * [in] param[0].u.tmem.size		size (of first fragment)
  * [in] param[0].u.tmem.shm_ref		holds shared memory reference
  *
- * OPTEE_MSG_CMD_UNREGISTER_SHM unregisteres a previously registered shared
+ * OPTEE_MSG_CMD_UNREGISTER_SHM unregisters a previously registered shared
  * memory reference. The information is passed as:
  * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
  * [in] param[0].u.rmem.shm_ref		holds shared memory reference
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index 26c53aaf3c..85e10aeece 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -358,7 +358,7 @@ extern void vgic_check_inflight_irqs_pending(struct vcpu *v,
 /* Maximum number of IRQs supported by vGIC */
 #define VGIC_MAX_IRQS 992U
 
-/* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
+/* Default number of vGIC SPIs. 32 are subtracted to cover local IRQs. */
 #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
 
 static inline unsigned int vgic_def_nr_spis(void)
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 70d7c9fed9..53d28935af 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1105,7 +1105,7 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
          * It is necessary to flush the TLB before writing the new entry
          * to keep coherency when the previous entry was valid.
          *
-         * Although, it could be defered when only the permissions are
+         * Although, it could be deferred when only the permissions are
          * changed (e.g in case of memaccess).
          */
         if ( lpae_is_valid(orig_pte) )
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index 621b47dbf5..81fe121517 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -160,7 +160,7 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
          * Outer Non-cacheable, must have a resultant shareability attribute
          * of Outer Shareable, otherwise shareability is UNPREDICTABLE.
          *
-         * On ARMv8 sharability is ignored and explicitly treated as Outer
+         * On ARMv8 shareability is ignored and explicitly treated as Outer
          * Shareable for Normal Inner Non_cacheable, Outer Non-cacheable.
          */
         e.pt.sh = LPAE_SH_OUTER;
@@ -171,7 +171,7 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
          * Shareability is ignored for non-Normal memory, Outer is as
          * good as anything.
          *
-         * On ARMv8 sharability is ignored and explicitly treated as Outer
+         * On ARMv8 shareability is ignored and explicitly treated as Outer
          * Shareable for any device memory type.
          */
         e.pt.sh = LPAE_SH_OUTER;
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 967cb4b77d..79947b124b 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -53,7 +53,7 @@ void call_psci_cpu_off(void)
     {
         struct arm_smccc_res res;
 
-        /* If successfull the PSCI cpu_off call doesn't return */
+        /* If successful the PSCI cpu_off call doesn't return */
         res = arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF);
         panic("PSCI cpu off failed for CPU%d err=%d\n", smp_processor_id(),
               PSCI_RET(res));
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 1fe33f2645..886c96414a 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -21,7 +21,7 @@
  * Unsupported FF-A interfaces:
  * o FFA_MSG_POLL and FFA_MSG_SEND - deprecated in FF-A-1.1-REL0
  * o FFA_MEM_RETRIEVE_* - Used when sharing memory from an SP to a VM
- * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring ownership
+ * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when transferring ownership
  *   or access of a memory region
  * o FFA_MSG_SEND2 and FFA_MSG_WAIT - Used for indirect messaging
  *
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index ed28820502..3b9bcb1b4f 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -269,7 +269,7 @@ static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t start_index,
      * Workaround for Linux FF-A Driver not accepting to have its own
      * entry in the list before FF-A v1.2 was supported.
      * This workaround is generally acceptable for other implementations
-     * as the specification was not completely clear on wether or not
+     * as the specification was not completely clear on whether or not
      * the requester endpoint information should be included or not
      */
     if ( ACCESS_ONCE(curr_ctx->guest_vers) >= FFA_VERSION_1_2 )
diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index 3d61caaeba..09ae0ca07d 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -482,7 +482,7 @@ static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size_t blen,
 
     /*
      * We're doing a rough check to see that no information is lost when
-     * tranfering the values into a struct ffa_mem_transaction_int below.
+     * transferring the values into a struct ffa_mem_transaction_int below.
      * The fields in struct ffa_mem_transaction_int are wide enough to hold
      * any valid value so being out of range means that something is wrong.
      */
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 62666a84db..6b5d290e8a 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -359,7 +359,7 @@ read_as_zero:
 
 read_impl_defined:
     printk(XENLOG_G_DEBUG
-           "%pv: vGICD: RAZ on implemention defined register offset %#08x\n",
+           "%pv: vGICD: RAZ on implementation defined register offset %#08x\n",
            v, gicd_reg);
     *r = 0;
     return 1;
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index bc738614bb..79d056e21a 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1561,7 +1561,7 @@ void vgic_v3_its_free_domain(struct domain *d)
 {
     struct virt_its *pos, *temp;
 
-    /* Cope with unitialized vITS */
+    /* Cope with uninitialized vITS */
     if ( list_head_is_null(&d->arch.vgic.vits_list) )
         return;
 
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 78d5bdf56f..99cf7c6dae 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -71,7 +71,7 @@ static bool fill_revision(struct cpu_user_regs *regs, uint32_t major,
 static bool fill_function_call_count(struct cpu_user_regs *regs, uint32_t cnt)
 {
     /*
-     * Function call count is retuned as any other return value in register r0
+     * Function call count is returned as any other return value in register r0
      * (ARM DEN 0028B page 17)
      */
     set_user_reg(regs, 0, cnt);
diff --git a/xen/arch/arm/vuart.h b/xen/arch/arm/vuart.h
index e90d84c6ed..1a10f5ad7e 100644
--- a/xen/arch/arm/vuart.h
+++ b/xen/arch/arm/vuart.h
@@ -32,7 +32,7 @@ void domain_vuart_free(struct domain *d);
 static inline int domain_vuart_init(struct domain *d)
 {
     /*
-     * The vUART is unconditionally inialized for the hw domain. So we
+     * The vUART is unconditionally initialized for the hw domain. So we
      * can't return an error.
      */
     return 0;

