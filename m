Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC028606A330
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUMNmq3C
Received: from list by lists.xenproject.org with outflank-mailman.1487714.1689982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWd-0001PK-Vb; Fri, 13 Nov 2026 15:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487714.1689982; Fri, 13 Nov 2026 15:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWd-0001P5-RD; Fri, 13 Nov 2026 15:49:15 +0000
Received: by outflank-mailman (input) for mailman id 1487714;
 Fri, 13 Nov 2026 15:49:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWb-0000uH-UI
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWb-004Sxq-Ar
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:13 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73177-2eae-0a2a0a5409dd-0a2a4505c60e-4
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:13 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73179-4cb1-0a2a45050019-d155dd2dd89e-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:13 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so491904f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:13 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:12 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584953; x=1795189753; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOsUuEGwlDdCj8UCpqI8MjmFmjBNN/WB628Mj8vJrh0=;
        b=EUMNmq3CF74ysdrwH1e+81GZ8u3txMWjc7gOxkRlSHw3Fn2Cq2Y0j5kdRaOlLmKzCN
         sItjLuUH+JnQqgsHR0nem6Oj8KJ54/hTdCNWX93mv96gMwr1kN0e1Bje+p/i97Ftqrr6
         Br79P2c2JLKrtmpYumX08DVtadKM8Y59fQSBvDwzmjaKWV6fPorgcBgSMcLot8DlOAmN
         8bmHbSwPNjC0Ld1vNbcESQj3Mms0d6UWGdWGxwL/TRv7lQiFoYJJngEDSFAjn9Pacfbz
         t4jVhpcLZYhEpkMCM35ZYMZE3DSnD70JlLegPZPs3nWyZu/MCJ+Va6wA/2jfLg250gd5
         sPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584953; x=1795189753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOsUuEGwlDdCj8UCpqI8MjmFmjBNN/WB628Mj8vJrh0=;
        b=IHlFr+xWSLa3YBkqaYcguOFZ9ZRzPea1Hl7r0BzikgJP340RDtEmPOhaIwHws8beIM
         phXVq/F+ieQbvWfFvYo9eshPx/4BTQF3pAfQx7WLoDxW9GKe1HvSKBtdKd7zXwlkBMGC
         96Dn3h9ezoBClFeLuaTe298C+90RKXy0FE7lA8TZU/xyWGntuTBxbBC544dqXdsai3Mf
         VGc54pCLKuOFonA2A2y9iYoa4AwkIaE7QNxjbsWZx8ur7+nuImiUNASh9HF3yAepRy/I
         knn7oy94/Yzf5hSfmiEZY6U/AbUCVqP2mwdezDr6Sh3KZxdahDdGjKxcvlLNfIF9IX3i
         CC5w==
X-Gm-Message-State: APuU4Z9D8bbk5Z7iVt9Dc7Tih83diSvgU/iWZs0/6r7BLxGxl/JcVdRe
	wwxPR93GQQqjFQqBfz2cNZcli0uhv4zwZPco5hhWimr3tUguBaUrkOpyii1xyQ==
X-Gm-Gg: AYBFou3O/2J+Pxe0V2ihUgtRppPzOHzj3zpXVBP2KchXchyfBiUXxzu16SM4H54QWYE
	oit0WPndsFqnvxXnmI4turdu7u6QWAvDsdBAS63zIBrWuI3QteGsiZEqzvK98EXABambYVPfOza
	pHjLWwPENQzCW/s9ZvttO2cR20ngGafPBv2m17CkIhpkplLA2rFxqHFxeyEYuz5DtvLYOqiiwj8
	yIaosNRQdKEiU+jE0Sx0wStECSiGU6GL64lQDDZhX37Ilb6/DfpivLJZqw1MZK/gTO1iz3XvgDC
	sSKD/II6A4luIz3PuUm4IRCyklQ8sq2kjXOr+239pS7zKGlswcE1WWqFtRzkEpVKT70pgaEMisz
	lwtRsImeLCZTdOW2Gce522HFoBDtYpXQwHWehMBoM0fz9xUQA2bqOy9bSswNaB+3EnmCONF84nS
	LYv4jDbDlCBiDIFGv8hg6gw4Vdcnv5x2LjohVHVZTTgdS2IMju41k8CBekJPvY/ahxWWngkUjBE
	dypduK2iEJNZCyzshl4/z0McaVGDXt4IArzVSs21O1yW6wMeYdFXSxVnEERMjxd3DXJuqS62NCB
	cbH6EkqmJE+xswPFrdLWkfu1AJQIT95o+Oh7VHmrvLB97Il259Yp919C7ZzRNvP8ofJz
X-Received: by 2002:a05:6000:4707:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-49c729bb45dmr6349521f8f.40.1794584952600;
        Fri, 13 Nov 2026 07:49:12 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 06/42] xen/riscv: introduce CPU_NONE
Date: Fri, 13 Nov 2026 16:48:27 +0100
Message-ID: <a51aa4f8b8dc9b4b3d70440b546ee802510dda00.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794584953-732B32A1-6F28460C/10/73395122804
X-purgate-type: spam
X-purgate-size: 5944
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce CPU_NONE, a CPU number which doesn't identify any physical
CPU, to be used wherever a pCPU has to be recorded but there may be
none.

NR_CPUS has been used for that so far: hartid_to_cpuid() returns it for
a hart Xen doesn't know, pcpu_info[] uses it for an entry whose
processor_id isn't valid yet, and vsfile_cpu in struct vimsic_state,
which records the pCPU whose h/w guest interrupt file backs the vCPU's
IMSIC VS-file, uses it to mean that no h/w guest interrupt file is
attached. NR_CPUS is however the number of possible CPUs, i.e. an upper
bound, and a comparison against it reads like a range check rather than
like a test for "no pCPU". Use CPU_NONE in all these places instead,
which states that meaning explicitly.

Checks telling valid CPU numbers from invalid ones by comparing them
against NR_CPUS or nr_cpu_ids keep working, as CPU_NONE is made sure at
build time not to be below NR_CPUS.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
CPU_NONE is also used later in this series:
 - "xen/riscv: implement virtual APLIC MMIO emulation" checks vsfile_cpu
   against it to tell whether the target vCPU has a h/w guest interrupt
   file.
 - "xen/riscv: implement vCPU context switching" initialises the new
   arch_vcpu.last_cpu with it.
 - "xen/riscv: introduce IMSIC h/w interrupt file attaching to vcpu",
   "xen/riscv: remap interrupts to new IMSIC VS-file" and
   "xen/riscv: save and clear the old IMSIC VS-file on vCPU migration"
   check vsfile_cpu against it to tell a vCPU without a h/w guest
   interrupt file.
 - "xen/riscv: introduce imsic_migrate_vcpu()" checks vsfile_cpu against
   it to tell whether the vCPU has a h/w guest interrupt file to move.
---
Changes in v4:
 - Switch hartid_to_cpuid() and pcpu_info[] over to CPU_NONE as well,
   and update the commit message accordingly.
 - Add BUILD_BUG_ON(CPU_NONE < NR_CPUS) to smp_processor_id().
---
Changes in v3:
 - New patch.
---
---
 xen/arch/riscv/imsic.c               | 6 +++---
 xen/arch/riscv/include/asm/config.h  | 3 +++
 xen/arch/riscv/include/asm/current.h | 2 ++
 xen/arch/riscv/include/asm/imsic.h   | 2 +-
 xen/arch/riscv/include/asm/smp.h     | 2 +-
 xen/arch/riscv/smp.c                 | 4 ++--
 6 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 44b8640ea39a..8f29c5d2eec1 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -357,9 +357,9 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
     /*
      * xvzalloc() already cleared the context, so guest_file_id == 0, i.e. the
      * always-available s/w IMSIC VS-file. Only vsfile_cpu needs an explicit
-     * initializer as its s/w VS-file value is NR_CPUS rather than 0.
+     * initializer as its s/w VS-file value is CPU_NONE rather than 0.
      */
-    imsic_state->vsfile_cpu = NR_CPUS;
+    imsic_state->vsfile_cpu = CPU_NONE;
 
     v->arch.vimsic_state = imsic_state;
 
@@ -465,7 +465,7 @@ int __init imsic_init(const struct dt_device_node *node)
         }
 
         /*
-         * hartid_to_cpuid() returns NR_CPUS for a hart Xen doesn't know, so
+         * hartid_to_cpuid() returns CPU_NONE for a hart Xen doesn't know, so
          * the range has to be checked before msi[] is indexed at all.
          */
         cpu = hartid_to_cpuid(hartid);
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 8d43ee76da5f..c61406e9dcf8 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -136,6 +136,9 @@
 #define OPT_CONSOLE_STR "dtuart"
 #define INVALID_VCPU_ID MAX_VIRT_CPUS
 
+/* A CPU number which doesn't identify any physical CPU. */
+#define CPU_NONE (~0U)
+
 /* Linkage for RISCV */
 #ifdef __ASSEMBLER__
 #define CODE_FILL /* empty */
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index 06683d7ae060..1f1010e5864f 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -35,6 +35,8 @@ static inline unsigned int smp_processor_id(void)
 {
     unsigned int id = tp->processor_id;
 
+    /* An entry whose processor_id isn't valid yet holds CPU_NONE. */
+    BUILD_BUG_ON(CPU_NONE < NR_CPUS);
     BUG_ON(id >= NR_CPUS);
 
     return id;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 639ee327dc67..11e1e3950f42 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -71,7 +71,7 @@ struct vimsic_state {
      */
     unsigned int guest_file_id;
     /*
-     * s/w IMSIC VS-file -> vsfile_cpu == NR_CPUS
+     * s/w IMSIC VS-file -> vsfile_cpu == CPU_NONE
      * h/w IMSIC VS-file -> vsfile_cpu < NR_CPUS
      */
     unsigned int vsfile_cpu;
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index 625e30b91bb2..3d3d1fa7fbaf 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -28,7 +28,7 @@ static inline unsigned int hartid_to_cpuid(unsigned long hartid)
     }
 
     /* hartid isn't valid for some reason */
-    return NR_CPUS;
+    return CPU_NONE;
 }
 
 static inline void set_cpuid_to_hartid(unsigned long cpuid,
diff --git a/xen/arch/riscv/smp.c b/xen/arch/riscv/smp.c
index d645364ea47d..21f4dc006252 100644
--- a/xen/arch/riscv/smp.c
+++ b/xen/arch/riscv/smp.c
@@ -9,10 +9,10 @@
  * tp points to one of these per cpu.
  *
  * hart_id would be valid (no matter which value) if its
- * processor_id field is valid (less than NR_CPUS).
+ * processor_id field is valid (not CPU_NONE).
  */
 struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
-    .processor_id = NR_CPUS,
+    .processor_id = CPU_NONE,
 }};
 
 void smp_send_event_check_mask(const cpumask_t *mask)
-- 
2.56.1


