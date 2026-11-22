Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3435B606A32A
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LIhYJXO8
Received: from list by lists.xenproject.org with outflank-mailman.1499536.1696305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HN-00057T-RC; Sun, 22 Nov 2026 09:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499536.1696305; Sun, 22 Nov 2026 09:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HN-00057M-Nt; Sun, 22 Nov 2026 09:54:37 +0000
Received: by outflank-mailman (input) for mailman id 1499536;
 Sun, 22 Nov 2026 09:54:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1xV4HL-0004mg-VM
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 09:54:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xV4HL-00ExLX-4z
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 10:54:35 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbc6-bab6-0a2a0a5309dd-0a2a4505c3ae-6
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:35 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbda-4cb1-0a2a45050019-d155dd2dc49f-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:35 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4a7b8abe209so1735413f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 01:54:35 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849e598sm218409605e9.8.2026.11.22.01.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 01:54:34 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341274; x=1795946074; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLiorzuc0P93TyP+5tAC8yc+LVzrxd1znALUxbig4V0=;
        b=LIhYJXO8YkYcw0DWuVNlGXNqORzSvZWiovfe0sNnrWFxxFm/8jN2i+QZekToOgHyQJ
         ZCq0RE+fW4f5Dk7CVVEHqhrC45VmAkR6CKCZ8fGXmZVvObvMKrJAlmuuoLXri6GAycFT
         pIYWjOwGam3AIdV1jNcl8cUqHJKaqvTp6A25AkN+qW/nbszBKP0ikIu3VHKOR6VU7qzF
         sGzaMWiJ+rCSRj9c08N7aPCMHBOlAENM816k0itHNLaV09tK1KPN+9gZtAMMid36J43/
         ugiYmfRYnu5e1RIvd5XpIh7G+/S+Ex3aaSA2NPZRyA1qdHni5O4tFnOD0finTs6687QH
         2ySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341274; x=1795946074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RLiorzuc0P93TyP+5tAC8yc+LVzrxd1znALUxbig4V0=;
        b=OanK3suIei0T3aC70tBFCU0yKLM3WtnHSOnnY8K/nZjBU7m9oNdMWZDY6wNMwLOiVj
         gxb0gtDNYHMozoIqzp9moVmF526nSHKmogjhgAnx4G96Oj8zGOnBv8X6CXKZ97QBU5De
         pK8XeiVROWlZdU4gLMAwLJrmH43qCOAChKGxVGOKHfNr3lbr7tgfX85xRgmmhZJnS2UE
         lub2QTfbJtjXbHT0OQlyiz/U/zNjJDA1Dx7U20VPzU5ifqrXGs7qVfFQQ9Tw9xhfsRYZ
         QKtlFs8f1qBFn3bOo+eeywQxeUK0z011C/NTuzoCJeuG3Y2NKuDzc/6uyHz1qPWHBHEA
         Kzlw==
X-Gm-Message-State: APuU4Z+63HArqqGJ/rvcVo9gVHC9yu5/lkXboieHR6nKJeqcYlfGe/7g
	3bxgADsthVhBcXBtYB3uBAUaYbd3r/5j5Yj6ot44BXhTHgOkjPq2oGfgxEImn31S/g4=
X-Gm-Gg: AZFdTZc1jMtq5ejhwhQrxkc6Yk7/CHd5RwfEm/9U3uf3TFVgn8su/dZBGmtraKJ2jtU
	gUcKUanZungixXjwdpk3Hpdt///EFy8oG1moDstZfZ0R98x0oqR+Ol7kVu5ay2Op0PBxHJpUh0m
	X67nFLkpwQM5fRrEi8iwoFmdFrSgTDx2lkhzYmO1Z7qxjG6NnN+4Za7HokG3lQpfVvOLFTy4t09
	KUP6oyb89yAdxZUmGQ/KVYNSMWMxLOpZJwuKaqV0Mq23uUfFqwqyIqZ3aeCRdSooDKmv9QS2QE1
	4SCTdvfHcXkk9Klu1ojgMiYtVUH4dkCflL/R3ngJV2x1eb+wSjEiodTJd+e1Rz+hXqSvcaf96kU
	SASXUffPljvpieSA21/jReWwpPzW/QYSlr8WaLB0HxVsJV1xcymRSiX1JE8gCNCSHauw5DFqm33
	nloGfg32e2KXf5J+jr9sAHoUe1jLmLrNUZgk/Gxb136mDcSrPDIRC+7NuNx8CGFU4g6iJCWnt7b
	uS7WC55bLCkCrRtQT2IJWTB6GT2i3BZerzlDDJtndASx9G1L6BmShnsnbTN2/Zc97X950pavC0S
	DW2Z5YKx8p9NfQ8eKQ3quGu39EWV+efbki4Ujv+kaH+zWrWSMdSexlOIQSFs73Wwn/UUnVPTB/J
	YTPqVVRy4SJPknUKUAOQ9Gh2j
X-Received: by 2002:a05:600c:a11:b0:4bb:69f2:87f7 with SMTP id 5b1f17b1804b1-4bb88812c92mr185131325e9.18.1795341274467;
        Sun, 22 Nov 2026 01:54:34 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [XEN][PATCH v5 2/8] xen/arm: skip the stage-1 TLBI after IPA flush with FEAT_nTLBPA
Date: Sun, 22 Nov 2026 14:54:16 +0500
Message-ID: <784add5436718a89c30d1ce78d5ae5f644d986f6.1795336377.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795336377.git.haseebashraf091@gmail.com>
References: <cover.1795336377.git.haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1795341275-251182A1-32F69E8B/0/0
X-purgate-type: clean
X-purgate-size: 5238
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Without FEAT_nTLBPA, intermediate caching of translation table walks
might include non-coherent physical translation caches. These caches
can hold previously valid entries indexed by the physical address of a
table entry or, for stage-1 walks, by its intermediate physical address.
An IPA-based stage-2 invalidation does not remove the stage-1 entries,
so it must be followed by a stage-1 invalidation.

FEAT_nTLBPA (ID_AA64MMFR1_EL1.nTLBPA) says that the implementation has
no such caches. Detect it as a CPU capability and skip the follow-up
stage-1 invalidation in flush_guest_tlb_range_ipa() when it is present.
The broadcast TLBI completion sequence remains explicit.

The local flush used when a pCPU switches between vCPUs of a domain
stays unconditional. It drops the prior vCPU's stage-1 translations;
FEAT_nTLBPA does not change that requirement.

Suggested-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
Changes in v5:
- Skip only the stage-1 invalidation that follows IPA invalidation.
- Keep the local vCPU-switch flush unconditional.
- Base the description on the ID register field.

 xen/arch/arm/cpufeature.c                 | 12 ++++++++++++
 xen/arch/arm/include/asm/arm64/flushtlb.h |  7 +++++--
 xen/arch/arm/include/asm/cpufeature.h     |  6 ++++--
 xen/arch/arm/include/asm/processor.h      |  2 ++
 xen/arch/arm/mmu/p2m.c                    |  2 ++
 5 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 8d8cd19a96..0a87186a7e 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -18,6 +18,11 @@ DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
 struct cpuinfo_arm __read_mostly domain_cpuinfo;
 
 #ifdef CONFIG_ARM_64
+static bool has_ntlbpa(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.mm64.ntlbpa == MM64_NTLBPA_SUPPORT_IMP;
+}
+
 static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
 {
     return system_cpuinfo.isa64.sb;
@@ -25,6 +30,13 @@ static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
 #endif
 
 static const struct arm_cpu_capabilities arm_features[] = {
+#ifdef CONFIG_ARM_64
+    {
+        .desc = "Intermediate caching of translation table walks (nTLBPA)",
+        .capability = ARM_HAS_NTLBPA,
+        .matches = has_ntlbpa,
+    },
+#endif
 #ifdef CONFIG_ARM_64
     {
         .desc = "Speculation barrier instruction (SB)",
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index b3bce7baf2..ff2ce2bae2 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -188,8 +188,11 @@ static inline void flush_guest_tlb_range_ipa(paddr_t ipa, unsigned long size)
      * with stage-1 and the old stage-2 translation. Linux does the same (see
      * __kvm_tlb_flush_vmid_ipa()).
      */
-    dsb(ish);
-    tlbi_vmalle1is();
+    if ( !cpus_have_const_cap(ARM_HAS_NTLBPA) )
+    {
+        dsb(ish);
+        tlbi_vmalle1is();
+    }
 
     tlbi_complete_broadcast();
 }
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index c554686415..97e371724f 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -76,8 +76,9 @@
 #define ARM_WORKAROUND_BHB_SMCC_3 15
 #define ARM_HAS_SB 16
 #define ARM64_WORKAROUND_1508412 17
+#define ARM_HAS_NTLBPA 18
 
-#define ARM_NCAPS           18
+#define ARM_NCAPS           19
 
 #ifndef __ASSEMBLER__
 
@@ -288,7 +289,8 @@ struct cpuinfo_arm {
             unsigned long ets:4;
             unsigned long __res2:4;
             unsigned long afp:4;
-            unsigned long __res3:12;
+            unsigned long ntlbpa:4;
+            unsigned long __res3:8;
             unsigned long ecbhb:4;
 
             /* MMFR2 */
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 8ee8f88fb4..49774b65eb 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -487,6 +487,8 @@
 #ifdef CONFIG_ARM_64
 #define MM64_VMID_8_BITS_SUPPORT    0x0
 #define MM64_VMID_16_BITS_SUPPORT   0x2
+#define MM64_NTLBPA_SUPPORT_NI      0x0
+#define MM64_NTLBPA_SUPPORT_IMP     0x1
 #endif
 
 #define MM64_MSA_PMSA_SUPPORT       0xf
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index b93ead6c46..3b1b9b394c 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -236,6 +236,8 @@ void p2m_restore_state(struct vcpu *n)
      * All vCPUs of the domain share the same p2m and the same effective
      * stage-2 translation regime. The stage-1 translations of the vCPU that
      * ran last on this pCPU must not be used by this one.
+     * This remains necessary with FEAT_nTLBPA, which only removes the
+     * stage-1 invalidation following an IPA-based stage-2 invalidation.
      */
     if ( *last_vcpu_ran != INVALID_VCPU_ID && *last_vcpu_ran != n->vcpu_id )
         flush_guest_tlb_s1_local();

