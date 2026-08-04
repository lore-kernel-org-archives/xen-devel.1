Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0D8C55ABF
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382273.1625702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNb-0000xj-0v; Tue, 04 Aug 2026 15:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382273.1625702; Tue, 04 Aug 2026 15:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNa-0000xH-Pk; Tue, 04 Aug 2026 15:48:34 +0000
Received: by outflank-mailman (input) for mailman id 1382273;
 Tue, 04 Aug 2026 15:48:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNZ-0000bs-Bx
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNY-009QNa-Oj
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c8-5cb7-0a2a0a5109dd-0a2a450bdaba-22
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:32 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209d0-b7e8-0a2a450b0019-d155802ee5bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:32 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so24591975e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:32 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785858512; x=1786463312; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JS4Pww1oLiCPhcc0rWFj9bF1S4Vy0n1GnD6OKYVDJuA=;
        b=GxGg0aJjEi0m0SDLi8hUlSnkPYL7fkDsdYH5sUjZYE9DPYOUVk92VETxiGbwsEJzZ4
         N9yjlkiCGRDgM2PBvw0yo67d0v5olYejPsCrVQjyYtvu8nX5SLZKHIkqbH52KDHt8JLf
         ZQvMsLybG00c21voFJrp8UCwgy3zDR7dyo9rOV72Tt0DdAuvOS26mRFcertf8Qj4xcKV
         ao/7e7ktoJSnjcoTSCLOwvXTJDfS/NgTB5GfrFqzS7ZSIbesexKjpJo2pprtAAJXUT0d
         xkUO90/Sqt8PuoYKMajMSHwnyNLaXiYl4VCSiJz12IZdLPfAg93z8fHfeddPg5sWrwmZ
         Ms3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858512; x=1786463312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JS4Pww1oLiCPhcc0rWFj9bF1S4Vy0n1GnD6OKYVDJuA=;
        b=eXXVUQP4ITueUjVnKTuLWh7/HkgS54/mEmKqyK+KYNODb9iMOMvDsB7oSTBUhcopJ4
         /2CG8XanovWRAcpwhdon4//8grM3q1qUsquViMBIEkdXf1S0cQg/mXZMu+VXukjqHTnf
         C/yjkD903RBbDR4Y8tuYkD7yyZsjoYYxwHIeNgqiSc/L8ww0bnok8AhAxx2ujwibAgX0
         9QU5atu3XNsbA5iizkyVm78PvW3hYbV2BMePlcdowXdL4XdXbyAehh2QptnlhMVzrarJ
         N7NbjGgnwWrNTD6ZyCX7JbUgjKib+3YWB6f8a6/Cahuehx+ey8p24bjYZmcL2YM5GZc0
         n+rQ==
X-Gm-Message-State: AOJu0YwDIhOowEV22sQhG8gziZBZ5ioC546q2hXafGGhdWZ0tUFXI910
	cyGKY+Zs+NlYHvGWeto3DrAPesMw27e7lhVbpupCzitvRi2taIBDE4lg+MoDDQ==
X-Gm-Gg: AR+sD10KKuSCcPtxPd0eS455nQJ4Mj3rd+CzQoxv1eRJrzvSlm5TLHkme/+U5iHE5Pq
	0lV89gsNeymYzRM1p/IJMfcKumwUrlsUIRFHOj2/Y93exiffhnHaZ8rMkz6dRMlJkxPqPMMfI8Z
	KndRIjdXMNrGo7WS4XBUmBUsosiC1iF07rATXJDYlJ1eXZRrJ97nfhfjJVLRCLT3j5qjx0nYVhs
	2q6tUFwCS1MyoGbW6jbERGJJD+sudbcDU3LoxjE8jNSROKBOR8fQmHWlkJv9TKNNmsvcVnSbgp7
	7HSfxYcpi0iEmX7HD7U5ib/K/fzVY8ulJ52ACxIuRdhX2+fXArJpnb6k0Gi+aaYzrUqaPU4Rl71
	ceepsywiz1ou6ZBV6vUlA7qCfzbhuNwyKJsujRofLS1f4nY9zA0X62blet1CHHC1LvqaxHiTPcq
	paawXl37CFwXntOIAac117B3ogdnnKpsWl948WrF2EZQp2yU3f5ewF7H0OLBAHTfoQc4J/LC12M
	bb1FtUeqHZByqLOWez97Lps0gM+7yWMLb0RTJmcw72l
X-Received: by 2002:a7b:cd93:0:b0:495:3de8:33a6 with SMTP id 5b1f17b1804b1-4980c65ed1bmr280281485e9.16.1785858512100;
        Tue, 04 Aug 2026 08:48:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 11/20] xen/riscv: introduce per-vCPU IMSIC state
Date: Tue,  4 Aug 2026 17:48:01 +0200
Message-ID: <d78555b8b7b683f72a2668d8d2e2da3f89a4fc06.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785858512-A86CA9EA-71F21E10/10/73395122804
X-purgate-type: spam
X-purgate-size: 6490

Each vCPU interacting with the IMSIC requires state to track the
associated guest interrupt file and its backing context.

Introduce a per-vCPU structure to hold IMSIC-related state, including
the guest interrupt file identifier and the CPU providing the backing
VS-file. Access to the guest file identifier is protected by a lock.

Initialize this structure during vCPU setup and store it in arch_vcpu.
The initial state marks the VS-file as software-backed until it becomes
associated with a physical CPU.

Add helper to retrieve the guest interrupt file identifier:
- vcpu_guest_file_id() is going to be used during update of APLIC's
  target register with the pair of information <guest_file_id, cpu_id>
  (to have MSI delivery mode work properly) when guest is trying to
  access vAPLIC's target register.
It will be used in the follow up patches.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6-7:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - Move v->arch.vimsic_state = imsic_state; after full initialization of
   the struct, so the pointer only becomes globally visible once all
   fields are set up.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v4:
-  s/w vs h/w IMSIC VS-file commentary for struct vimsic_state:
   - fix the vsfile_pcpu h/w condition:
     "vsfile_pcpu >= 0" -> "vsfile_pcpu < NR_CPUS"
     (the old wording conflicted with the s/w "== NR_CPUS" case).
   - reorder both comment blocks to the "s/w ... / h/w ..." form for readability.
 - drop IMPOSSIBLE_GUEST_FILE_ID: the s/w IMSIC VS-file is always available
   and corresponds to guest_file_id == 0, which xvzalloc() already provides,
   so the explicit initializer in vcpu_imsic_init() and the macro itself
   are unneeded.
---
Changes in v3:
 - Drop const from imsic_set_guest_file_id() and vcpu_imsic_deinit() as
   it only works due to vimsic_state being a pointer member.
 - Use XVFREE() in vcpu_imsic_deinit() to make it idempotent.
 - Fix SW-file typo in struct vimsic_state comments; should be VS-file.
 - Drop imsic_set_guest_file_id() here, it will be added later when it
   will be nessary to initialise guest file id as the correspondendt code
   in this patch series was reworked and there is no need to use this
   function in arch_vcpu_create().
 - Introduce IMPOSSIBLE_GUEST_FILE_ID and init with it ->guest_file_id.
---
Changes in v2:
 - Rename imsic_state to vimsic_state.
 - Use 'unsigned int' for vsfile_pcpu.
 - Drop initialzation of ->guest_file_id as it will be by default zero.
 - Add the comment about ->guest_file_id field.
 - Drop __init for vcpu_imsic_init() as it could be used during post-boot
   vCPU creation.
 - Update the commit message.
 - Drop locks around ->guest_file_id() in  vcpu_guest_file_id() and imsic_set_guest_file_id().
---
---
 xen/arch/riscv/imsic.c              | 35 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/riscv/include/asm/imsic.h  | 22 ++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index f7b70a8da09e..5a5758e45dc2 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -16,6 +16,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/macros.h>
+#include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/spinlock.h>
 #include <xen/xvmalloc.h>
@@ -56,6 +57,11 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+unsigned int vcpu_guest_file_id(const struct vcpu *v)
+{
+    return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
+}
+
 void __init imsic_ids_local_delivery(bool enable)
 {
     if ( enable )
@@ -312,6 +318,35 @@ static int imsic_parse_node(const struct dt_device_node *node,
     return 0;
 }
 
+int vcpu_imsic_init(struct vcpu *v)
+{
+    struct vimsic_state *imsic_state;
+
+    /* Allocate IMSIC context */
+    imsic_state = xvzalloc(struct vimsic_state);
+    if ( !imsic_state )
+        return -ENOMEM;
+
+    /* Setup IMSIC context  */
+    rwlock_init(&imsic_state->vsfile_lock);
+
+    /*
+     * xvzalloc() already cleared the context, so guest_file_id == 0, i.e. the
+     * always-available s/w IMSIC VS-file. Only vsfile_pcpu needs an explicit
+     * initializer as its s/w VS-file value is NR_CPUS rather than 0.
+     */
+    imsic_state->vsfile_pcpu = NR_CPUS;
+
+    v->arch.vimsic_state = imsic_state;
+
+    return 0;
+}
+
+void vcpu_imsic_deinit(struct vcpu *v)
+{
+    XVFREE(v->arch.vimsic_state);
+}
+
 /*
  * Initialize the imsic_cfg structure based on the IMSIC DT node.
  *
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index bd43ed08c22c..e035b33ddfdc 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -54,6 +54,8 @@ struct arch_vcpu {
 
     struct vtimer vtimer;
 
+    struct vimsic_state *vimsic_state;
+
     register_t hcounteren;
     register_t hedeleg;
     register_t hideleg;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index c6c59215df20..e2c413487d24 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -11,6 +11,7 @@
 #ifndef ASM_RISCV_IMSIC_H
 #define ASM_RISCV_IMSIC_H
 
+#include <xen/rwlock.h>
 #include <xen/spinlock.h>
 #include <xen/stdbool.h>
 #include <xen/types.h>
@@ -61,7 +62,24 @@ struct imsic_config {
     spinlock_t lock;
 };
 
+struct vimsic_state {
+    /* IMSIC VS-file */
+    rwlock_t vsfile_lock;
+    /*
+     * s/w IMSIC VS-file -> guest_file_id == 0
+     * h/w IMSIC VS-file -> guest_file_id > 0
+     */
+    unsigned int guest_file_id;
+    /*
+     * s/w IMSIC VS-file -> vsfile_pcpu == NR_CPUS
+     * h/w IMSIC VS-file -> vsfile_pcpu < NR_CPUS
+     */
+    unsigned int vsfile_pcpu;
+};
+
 struct dt_device_node;
+struct vcpu;
+
 int imsic_init(const struct dt_device_node *node);
 
 const struct imsic_config *imsic_get_config(void);
@@ -71,4 +89,8 @@ void imsic_irq_disable(unsigned int hwirq);
 
 void imsic_ids_local_delivery(bool enable);
 
+int vcpu_imsic_init(struct vcpu *v);
+void vcpu_imsic_deinit(struct vcpu *v);
+unsigned int vcpu_guest_file_id(const struct vcpu *v);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.55.0


