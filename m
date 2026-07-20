Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3690C4452D
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:01:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366966.1616847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQ5-0007nV-ED; Mon, 20 Jul 2026 16:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366966.1616847; Mon, 20 Jul 2026 16:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQ4-0007lj-UT; Mon, 20 Jul 2026 16:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1366966;
 Mon, 20 Jul 2026 16:00:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqQ2-0007Kc-Vu
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqQ2-00AdIU-Cr
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4615-5cb7-0a2a0a5109dd-0a2a4501a09c-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:38 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4626-5984-0a2a45010019-d155dd2db476-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:38 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-476d8e647e9so9386703f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:38 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563238; x=1785168038; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nt+NrnSnYUFOVhjqk40/HqYFF4+MZAvheFHPqYsSxEw=;
        b=C8fFM7xShaB+BSJ4rhxBsU2SqDL3TYZPmvZ0zXikqJBbIfSg6WbN1LBROKz+rR+wHt
         gv/UFLFj04bt0nKqotCWUR6+y+PW2bAK6GYYi3JXHWmOoW9bkbFZIwQXriA2ZXaYUIiV
         dpTU4IzEOfAfEqTdIAisgBQmcgKK6pwOR0y4IOeeKabT4lXHCxUt0/Fh0yrQQ5a/rxIT
         z2otW3FY4IvAVnCaYo+vP5PGZhcECuV1H4crY5uGrX5eQHHo1VXhfuXxYz4wNUNJZ1AH
         0ipqT6zjVC6xS5snEaWFHkag47krYapFTrf9yytDe/FAhODWSVY2YCJBPs6FMZiJjwsZ
         NNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563238; x=1785168038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nt+NrnSnYUFOVhjqk40/HqYFF4+MZAvheFHPqYsSxEw=;
        b=BV/arIAYhSMHppjYSJUsvvBGyqZ+wPuJb4cnXp7EsUHfK7727/dl72UsKnTw6hNKxc
         cJ4gN0wPWZDqcLFbZHLrJ/PuEYZ1hP7JyJ96U4qKziYn0tWkCcSnHWSPu5JF+Ys30tP+
         vzLJwhlpC8nE2wlVGcA7S27kcmmVreJ/ExPDvNcNUXrnBNgviWL1T/k+7jtbXxS8SC6b
         eYObiK7HMH5yaVPZIGFTKILmdsceJhQC+MT3MgbamY6GF407yAREYAizPkj+yst1FCq8
         2NfeL7eJIUYr7jkko733ijccVzl1VX+DExo9sqP9CTZ9SlaLtz0bEKn1/u/anSblM0zi
         S2bg==
X-Gm-Message-State: AOJu0YxqECQbWLPZqmyOt4H3gYenCGU/MYU7bbrFGcuNFOK8W7XuGWdT
	USnx059qD/44FpG3zeRHKsr3S1mA+vn9hdqtANCyKiyg9xkWoqjg9DpTvhQ1PA==
X-Gm-Gg: AR+sD10s9Gy977LDzuAErgg1gxs/SdUTbKyUZPagRTNTzHTbF+XnhB35xVHYo+v3hwx
	jvENxQCUfcurrnDcGSof9feiETWlZUJvEhutWlUGbHbWCL21j8PsvB8N89jE2EDbZjwv00PEL6v
	JoEe0Qd12/gASTQ8vW4j/rIJ8ECxmKHtCm0Ak1NV1p9JFIAr3p6GN+UItUN8syOZkPpCnqZRiKl
	dKgo0JoZxqlG2UoNYlSlRmL+Xn/+hqvXuDpv0jvYd9HlP4uC7lZZZG2MOklqNCQORWO5nWKB1ds
	ZcvzknjpSZ3rsy4UXJqIhlVuX2C8aIk56ru8S2afG9gobc1AmWGSXOW2U6OeMVB4jZHlV6pjjB3
	om0rmHV7amqEob0dP9/3oea3UURP7avvd1xUF/s0Q4Hvr0npTqo9Y41YP6ApCo7yPRkLOsM5nWV
	oUv9Nn6WHbZ06lRq+JjJGBNVdrxOXXGazJ9EQKKv/nqDBK5gd4CvYXioGWgQ==
X-Received: by 2002:a05:6000:26c5:b0:47f:73d3:bfc6 with SMTP id ffacd0b85a97d-47f73d3c168mr8281995f8f.46.1784563237647;
        Mon, 20 Jul 2026 09:00:37 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 13/23] xen/riscv: introduce per-vCPU IMSIC state
Date: Mon, 20 Jul 2026 17:59:54 +0200
Message-ID: <6bbe9231eed3b1c1e233828e6658940eb0bec749.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1784563238-1F063757-5D133E5A/10/73395122804
X-purgate-type: spam
X-purgate-size: 6433

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
2.54.0


