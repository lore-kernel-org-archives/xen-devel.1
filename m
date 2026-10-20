Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E908C606A31D
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 13:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KsZV4Zhf
Received: from list by lists.xenproject.org with outflank-mailman.1455912.1669547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJALe-0004tS-FJ; Tue, 20 Oct 2026 13:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455912.1669547; Tue, 20 Oct 2026 13:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJALe-0004tL-Ar; Tue, 20 Oct 2026 13:57:50 +0000
Received: by outflank-mailman (input) for mailman id 1455912;
 Tue, 20 Oct 2026 13:57:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1xJALd-0004ry-C0
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 13:57:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJALc-002pIB-LS
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:57:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6ad77350-bab6-0a2a0a5309dd-0a2a45049fc2-22
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:57:48 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6ad7735c-b57f-0a2a45040019-d155dd30adfe-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:57:48 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so1432350f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 06:57:48 -0700 (PDT)
Received: from notebook.. ([88.230.43.46]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d8185d2sm6631984f8f.28.2026.10.20.06.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 06:57:47 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504668; x=1793109468; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLwEmqG5++2i0BaWFfhfUbwyKohnUHt/d5JgE82jxXk=;
        b=KsZV4Zhfm7GLoFpGzdCuwh6J/5UTTB2l4gACLgibOkjglyvkJ2+gw2+MDcBNBSgy+H
         JUQc+twy1efJh8goXBxx0Bvx4ktpe4GofMaHSlxKO96h9zXGYjDVcyUysALAvxIC7FHm
         xukL4eWc8zHJl78uW4dRJwOKrI7jrkKmqDF3E+WHIGxUKPTZvyV+8/VaXRave+D6bWty
         l14dnrBtyaXfwCbe1tHWDDpuoWzKduhBlEf3BlOoHAavgo90ry7ztkaXtUfj+6Us+PGz
         xK5s30/56EXO6fedptQNKTR1zSD5+UDQgju8JRt/T/yjqt8kZjRv+NpbyTTLBBMi6BKs
         K3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504668; x=1793109468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLwEmqG5++2i0BaWFfhfUbwyKohnUHt/d5JgE82jxXk=;
        b=QZ3jGtmpu02d0ZTzSRTCm8iM+xawaPO+Y0bAtcB4yKWl/xiqsXEGlZRKbFX6ZvJriZ
         LDk35jF3EI8nReWjz5fIQ7EeV2FxUj5RE9pu8cJEQ0uCfxIujuGhqdSIjeM6yZ9NSnI9
         Uyhkg+8uIVrVw2ti1VCXYzUs0Gs5G337JWEp13cFU63ptRzSrKcXf2sYGzKGSII2GNcV
         wyTk3Z6D3bTkeIhmfmPSOnFiBauOKTQn31SxEDZSbOp/bJ/xmsF6JW3IB9mfmafJGq/P
         O27tCRUJTbdXQGHUjoS522MdbinIumUg2KyG/jgDe913S/5GnDZllKQNXRtYrbdPzPiw
         LymA==
X-Gm-Message-State: AFq9FYJSbtdYXV+WLpyhFU/mzWqWM/P+RxPzIRKDQbzNrUr7+nT3sQ1a
	Ryixn1kBaGxWBRi8eqYSjqLclOc7BIVXFr+wP0ntqX4NSDhnK24RmSejkpw5sQ==
X-Gm-Gg: AYBFou2XE7TMLW0/Q2auV5m/PnrDZjHOvjkYxdX3rTBCrkX8hpwnO4IrGjwmRe7nkgD
	2hasyA8OC70/5GLguYUHc2ll+dyxsYENPBZ11+QASa6aukcS6KfXH4/seYcs6xgmAjKQ5p5nHkm
	fWrPFjVenqsExVoCVTuWamCRl1ldprfF3+p6lNpYcOvhKF7iLmTGqohadlIAee6HyyAdCLu/+9p
	O6DLbkypCNV7RbsiagrRlhyJiNUegFy7xbE4DWegqZGCaxkJyArT2+lmczz2kIpb/+ZhLtdh/im
	duCwhYmf6VnIJ0N4NiPZ4Xu5jHQykskM23tB4L6wxKSbo+IMGIGoRKYsltoraga6/YfY739r3ih
	7w4lp0IU7BVC2SI7KEhNqNMNRIAEwocf2UxaTIWEuNN2KKxJ3X0+hAl3ahYx79nNdW2eI47QsU8
	K1oLmEEQ/eA53rCcTmLbvgoWUZsBCI3j9jI6f1nlBoCc+BcOzAbdqWo2t99o9ppwobD9K1
X-Received: by 2002:a05:6000:1050:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-48e07fa82f3mr15741818f8f.43.1792504667708;
        Tue, 20 Oct 2026 06:57:47 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH] x86/desc: build boot GDT descriptors with a macro
Date: Tue, 20 Oct 2026 16:57:22 +0300
Message-Id: <20261020135722.45714-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1792504668-585C7B50-B89637DF/0/0
X-purgate-type: clean
X-purgate-size: 5396
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The raw 64-bit constants in boot_gdt[] and boot_compat_gdt[] hide what
each descriptor actually is.  Replace them with a GDTE() macro, modelled
on Linux's GDT_ENTRY_INIT(), plus named GDTE_FLAGS_* constants and a
GDTE_FLAT() helper for flat segments.

No functional change.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/arch/x86/desc.c | 61 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/desc.c b/xen/arch/x86/desc.c
index 9f63928154..647affb6a3 100644
--- a/xen/arch/x86/desc.c
+++ b/xen/arch/x86/desc.c
@@ -27,32 +27,67 @@
 
 #define SEL2GDT(sel) (((sel) >> 3) - FIRST_RESERVED_GDT_ENTRY)
 
+/*
+ * Expands to a brace-enclosed initializer for seg_desc_t; only use it
+ * inside an initializer list.
+ *
+ * flags: bit layout matches its position in the descriptor's high dword
+ *   bits 0-3   : type
+ *   bit  4     : s     (0 = system, 1 = code/data)
+ *   bits 5-6   : dpl
+ *   bit  7     : p     (present)
+ *   bit  12    : avl
+ *   bit  13    : l     (64-bit code segment)
+ *   bit  14    : d/b
+ *   bit  15    : g     (granularity: 0 = byte, 1 = 4KiB)
+ */
+#define GDTE(flags, base, limit)                                        \
+    { (((uint64_t)(limit) & 0x0ffffULL)            |                    \
+       (((uint64_t)(base)  & 0x0ffffffULL)  << 16) |                    \
+       (((uint64_t)(flags) & 0x0ffULL)      << 40) |                    \
+       (((uint64_t)(limit) & 0xf0000ULL)    << 32) |                    \
+       (((uint64_t)(flags) & 0xf000ULL)     << 40) |                    \
+       (((uint64_t)(base)  & 0xff000000ULL) << 32)) }
+
+/* Common flag combinations (same values Linux uses for equivalent segments) */
+#define GDTE_FLAGS_RING0_CS64   0xa09b   /* P DPL0 S code  RX A, L, G */
+#define GDTE_FLAGS_RING0_DS32   0xc093   /* P DPL0 S data  RW A,    G */
+#define GDTE_FLAGS_RING1_CS32   0xc0bb   /* P DPL1 S code  RX A,    G */
+#define GDTE_FLAGS_RING1_DS32   0xc0b3   /* P DPL1 S data  RW A,    G */
+#define GDTE_FLAGS_RING3_CS32   0xc0fb   /* P DPL3 S code  RX A,    G */
+#define GDTE_FLAGS_RING3_DS32   0xc0f3   /* P DPL3 S data  RW A,    G */
+#define GDTE_FLAGS_RING3_CS64   0xa0fb   /* P DPL3 S code  RX A, L, G */
+#define GDTE_FLAGS_PERCPU       0x0091   /* P DPL0 S data  RO A       */
+
+/* Xen maps every flat segment across all of memory. */
+#define GDTE_FLAT(flags) GDTE(flags, 0, 0xfffff)
+
 __section(".data.page_aligned") __aligned(PAGE_SIZE)
 seg_desc_t boot_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
 {
     /* 0xe008 - Ring 0 code, 64bit mode */
-    [SEL2GDT(__HYPERVISOR_CS)] =      { 0x00af9b000000ffff },
+    [SEL2GDT(__HYPERVISOR_CS)] =      GDTE_FLAT(GDTE_FLAGS_RING0_CS64),
 
     /* 0xe010 - Ring 0 data */
-    [SEL2GDT(__HYPERVISOR_DS32)] =    { 0x00cf93000000ffff },
+    [SEL2GDT(__HYPERVISOR_DS32)] =    GDTE_FLAT(GDTE_FLAGS_RING0_DS32),
 
     /* 0xe018 - reserved */
 
     /* 0xe023 - Ring 3 code, compatibility */
-    [SEL2GDT(FLAT_RING3_CS32)] =      { 0x00cffb000000ffff },
+    [SEL2GDT(FLAT_RING3_CS32)] =      GDTE_FLAT(GDTE_FLAGS_RING3_CS32),
 
     /* 0xe02b - Ring 3 data */
-    [SEL2GDT(FLAT_RING3_DS32)] =      { 0x00cff3000000ffff },
+    [SEL2GDT(FLAT_RING3_DS32)] =      GDTE_FLAT(GDTE_FLAGS_RING3_DS32),
 
     /* 0xe033 - Ring 3 code, 64-bit mode */
-    [SEL2GDT(FLAT_RING3_CS64)] =      { 0x00affb000000ffff },
+    [SEL2GDT(FLAT_RING3_CS64)] =      GDTE_FLAT(GDTE_FLAGS_RING3_CS64),
 
     /* 0xe038 - reserved */
     /* 0xe040 - TSS */
     /* 0xe050 - LDT */
 
     /* 0xe060 - per-CPU entry (limit == cpu) */
-    [SEL2GDT(PER_CPU_SELECTOR)] =     { 0x0000910000000000 },
+    [SEL2GDT(PER_CPU_SELECTOR)] =     GDTE(GDTE_FLAGS_PERCPU, 0, 0),
 };
 
 #ifdef CONFIG_PV32
@@ -60,29 +95,29 @@ __section(".data.page_aligned") __aligned(PAGE_SIZE)
 seg_desc_t boot_compat_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
 {
     /* 0xe008 - Ring 0 code, 64bit mode */
-    [SEL2GDT(__HYPERVISOR_CS)] =      { 0x00af9b000000ffff },
+    [SEL2GDT(__HYPERVISOR_CS)] =      GDTE_FLAT(GDTE_FLAGS_RING0_CS64),
 
     /* 0xe010 - Ring 0 data */
-    [SEL2GDT(__HYPERVISOR_DS32)] =    { 0x00cf93000000ffff },
+    [SEL2GDT(__HYPERVISOR_DS32)] =    GDTE_FLAT(GDTE_FLAGS_RING0_DS32),
 
     /* 0xe019 - Ring 1 code, compatibility */
-    [SEL2GDT(FLAT_COMPAT_RING1_CS)] = { 0x00cfbb000000ffff },
+    [SEL2GDT(FLAT_COMPAT_RING1_CS)] = GDTE_FLAT(GDTE_FLAGS_RING1_CS32),
 
     /* 0xe021 - Ring 1 data */
-    [SEL2GDT(FLAT_COMPAT_RING1_DS)] = { 0x00cfb3000000ffff },
+    [SEL2GDT(FLAT_COMPAT_RING1_DS)] = GDTE_FLAT(GDTE_FLAGS_RING1_DS32),
 
     /* 0xe02b - Ring 3 code, compatibility */
-    [SEL2GDT(FLAT_COMPAT_RING3_CS)] = { 0x00cffb000000ffff },
+    [SEL2GDT(FLAT_COMPAT_RING3_CS)] = GDTE_FLAT(GDTE_FLAGS_RING3_CS32),
 
     /* 0xe033 - Ring 3 data */
-    [SEL2GDT(FLAT_COMPAT_RING3_DS)] = { 0x00cff3000000ffff },
+    [SEL2GDT(FLAT_COMPAT_RING3_DS)] = GDTE_FLAT(GDTE_FLAGS_RING3_DS32),
 
     /* 0xe038 - reserved */
     /* 0xe040 - TSS */
     /* 0xe050 - LDT */
 
     /* 0xe060 - per-CPU entry (limit == cpu) */
-    [SEL2GDT(PER_CPU_SELECTOR)] =     { 0x0000910000000000 },
+    [SEL2GDT(PER_CPU_SELECTOR)] =     GDTE(GDTE_FLAGS_PERCPU, 0, 0),
 };
 #endif
 
-- 
2.34.1


