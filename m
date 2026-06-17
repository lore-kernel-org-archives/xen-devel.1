Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A46CD98E2
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:18:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340097.1601182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHr-00043t-2q; Wed, 17 Jun 2026 11:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340097.1601182; Wed, 17 Jun 2026 11:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHp-00041G-FO; Wed, 17 Jun 2026 11:18:25 +0000
Received: by outflank-mailman (input) for mailman id 1340097;
 Wed, 17 Jun 2026 11:18:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHg-00030o-G5
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHf-008nUF-Sz
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328277-5cb7-0a2a0a5109dd-0a2a4505bd80-0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:15 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328277-aaa8-0a2a45050019-d1558034b1f6-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:15 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso51746545e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:15 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695095; x=1782299895; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5apYusI3YeOAogzQyvyi2oh99FaaceCirHZlTfuxF20=;
        b=a+UyCYNEoEvqx3zxG6nR2UUEZ3INDYjmz3rfbrXj4e4Bi/iRy11S91D4uCq7by1uyS
         Z+rCnZrTct9mOfJj6WY4ygeJ1qBZ7RiqgIZrSUKbYcnL/8q8GPA94dm8+2rlOoH6pSn3
         KTbTd3mrIbO0RDP9LrMtJ2+BzG+TcHkJB7NeKmKQSJ1awol7TWUBu+B0BXQwh0RdT/IM
         MrHTfhPyXhRIa4yCWBs4EstzhKiu4l6OK5H8OgyBH1Z7WO8RtWYjhE5E/XJs5/j7bCe5
         CMqoynzpLEbJEVmLunK0mUk6uYOVAm4iFwb85wTKcdBDB4d71m1FkYXj3eXO17XMiBvX
         APsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695095; x=1782299895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5apYusI3YeOAogzQyvyi2oh99FaaceCirHZlTfuxF20=;
        b=SMt5YRsCfBXZdmj0MkmwaqcOulJZ4C8bLcKeqGi8PNsL4X5w6bSE9RuE3uJ4ljqvix
         JCGZFqeAKw3HmCx4mfDnUc16niB6EwBV8X0btRtcEU6o9LwJ23ZB7ObuyQ6pP5SzXZ5E
         eIDUcqvRee03PmbuSLxIG8+xhnsH+UnTdNt1f8EwSZZMPMynvsQ1Ge+hIr5h6y1FnvtX
         K1O5vgTKpVomPLH7SiH5LsZYU/oXg7Qj0itVfpVUFYEvPirMq+KxIsQxxw3PFp2CMQVT
         oEgz1TBGvGDD4zHib+n7QLqiyZOdEzX3jRMuNvR7HwDRfVdDeLkwiINtOshs79B+vlX4
         Ww3A==
X-Gm-Message-State: AOJu0YxbTEPcW4U12lAL/e/ANG5+oD/eUNfRaxRAlyj38q4xJZYRJRym
	swwSi81JBBvT4TphEZvSbfh4uAjNV/kiHweUwU1y7dFkF/Eq5S2rpCCVQrYNZQ==
X-Gm-Gg: Acq92OE+mFc+z4CNTxVCyd4qhD7j+xycTPcHBMOnt350k0uX1yEoeIZOLs67tUkYqOF
	EeQKipz/vzn5HFi5XhLYkTPsrsKzTMePv0kw+ww9/1yD/kstqhnlu9sp9wZn4mM/qW2eR0UIq+2
	bxyJOC7mIV8RnKSLkyCP6Nk0KjinMQdgIM1pJEPlVm0M9Qj71NJt/UUJKolSUWjLmnRZR8r9/YZ
	XufI9dONJP/7Iximpi2Xj+7tt/0952XDMNKW7bVnUpBj7S7T/Y1hRHRSJ8eyusVh6/HaQ7WTg+C
	Weoq+Ft5L30kGyVnu6AmPIiwsxPwYMVHoQCevrTtpBU0Yvip1tZl/ZgDA3chnhLnzGcQ0ePnu9K
	73svgcGLHiCcR3OU6dKB45DIVw5lItB5fUYBMsRCsrkT1KLzfS7fqjMhAio719sVSnhfwWLeLxm
	zD3lgn7L4M3OOKQpePm5iu12p/oxFfO9/dSajq2cHFRU4Nbuqififln3Ujrw==
X-Received: by 2002:a05:600c:c491:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-492333a5353mr60236275e9.1.1781695094997;
        Wed, 17 Jun 2026 04:18:14 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
Subject: [PATCH v3 13/23] xen/riscv: introduce per-vCPU IMSIC state
Date: Wed, 17 Jun 2026 13:17:41 +0200
Message-ID: <69b84024f185db01d62d6c9ece1b5cee0e20a25b.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781695095-E1D9D443-68CE1B85/10/73395122804
X-purgate-type: spam
X-purgate-size: 5579

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
 xen/arch/riscv/imsic.c              | 34 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/riscv/include/asm/imsic.h  | 22 +++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index f7b70a8da09e..59c7556327da 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -16,12 +16,15 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/macros.h>
+#include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/spinlock.h>
 #include <xen/xvmalloc.h>
 
 #include <asm/imsic.h>
 
+#define IMPOSSIBLE_GUEST_FILE_ID UINT32_MAX
+
 #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
 
 struct imsic_mmios {
@@ -56,6 +59,11 @@ do {                            \
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
@@ -312,6 +320,32 @@ static int imsic_parse_node(const struct dt_device_node *node,
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
+    v->arch.vimsic_state = imsic_state;
+
+    /* Setup IMSIC context  */
+    rwlock_init(&imsic_state->vsfile_lock);
+
+    imsic_state->vsfile_pcpu = NR_CPUS;
+
+    imsic_state->guest_file_id = IMPOSSIBLE_GUEST_FILE_ID;
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
index 8e597e231ee7..bbeac7518a85 100644
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
index c6c59215df20..316fe5423c48 100644
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
+     * (guest_file_id == 0) -> s/w IMSIC VS-file
+     * (guest_file_id > 0) -> h/w IMSIC VS-file
+     */
+    unsigned int guest_file_id;
+    /*
+     * (vsfile_pcpu >= 0) => h/w IMSIC VS-file
+     * (vsfile_pcpu == NR_CPUS) => s/w IMSIC VS-file
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


