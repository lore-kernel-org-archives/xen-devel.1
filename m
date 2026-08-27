Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720DCC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:20:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400823.1636450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtI-0005fF-Ae; Thu, 27 Aug 2026 15:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400823.1636450; Thu, 27 Aug 2026 15:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtI-0005ep-1D; Thu, 27 Aug 2026 15:19:44 +0000
Received: by outflank-mailman (input) for mailman id 1400823;
 Thu, 27 Aug 2026 15:19:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbtG-0005LW-JI
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbtF-00C6ki-Vi
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905584-2eae-0a2a0a5409dd-0a2a4506d496-8
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:41 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90558d-195a-0a2a45060019-d155802dddce-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:41 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-499ac87c92bso20688155e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:41 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843981; x=1788448781; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZD3gU2yZzrDhjPBJtPeKT6B+BREExRn7A4TAumGyiM=;
        b=mwQagBHRFzWDLIqCxzK9x1b2qb1zAkRX6/hU2hxPcaQPy9gHfW3gVLjV45ITp10aQJ
         /TJ2mphdxA5id6ELmya9G8k1uRRyq2tqnoHZh4HjcwP8O2wGFaT31ryaKSW5IQfliNtn
         kzCLGu1LXrc4gORNRNIug1kl9AV0LsUh4kKVDSUttNFs1IntdZODlI4TfcealRwm19f9
         g6PgxykaliGiQt1MBAeTyYLBvesk7IA2eVdjEYa6nkfy19VEniWThBAVGpt9QmjMgvUA
         +nhh7Ik2jEW6lJAFie38pNIfEMo/NtUe9QAKeTRGV75YNAwmKSaXC7JkFNQA6vOMEAbz
         o3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843981; x=1788448781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nZD3gU2yZzrDhjPBJtPeKT6B+BREExRn7A4TAumGyiM=;
        b=qOdDk1KD+lJmQMwu4UtkXJ+QlMFKN/qcUPl4g2yNmtnY5mStxgIC7C41wt9a+lEG/w
         muaHZAmyj7+gpA8DK0488rUzXiSIsbmFe2cykq60LenO3JpxE9KvLxteC1FGflGR6lHe
         smkE4ncnYUQYyrE07dmiHPn+6LMwi3/ara038MhLu4F1djn1304Eh9G4wbVoK1ebB3z2
         pEUfrmJSdhyzBtN8Y4xbDUWLF3ZP416WWCAdyxJzCVyBpw45DPf0LtP1P/9mzutyWRwo
         ZftKc2YhAnMfIPBoN0FLlfKpGkbi6Pd/OESmavF4+3xpWLZKgWqouFa/T26ay0YctztX
         s3HA==
X-Gm-Message-State: AFuF++ny+StXoL/a3KFf7rjbrKteYaORtMpQK4qLXJsN5LQsiJ2fuA5D
	W0METcRLyZin9WcVPFyB7JnGGwnjmHc7kvBm3C0h2XWEoTM9Epwqkid/iAtkFA==
X-Gm-Gg: AR+sD12tssgsK/MOpUUFG98/TTPjqPIXANMo630tb1p7MLVOH+SKqvxZc0vDOBYaWOD
	9XoVwIS0oGzQI8jRIf/j/YJP9O6c29Ea50LyIUgvqnxZB151AMwxeSiWZSI9GR/IUZsELLrEKPG
	ZKF0Ury9PSpnjAgTrQZ+9ICmwCm9o87gF1Z82Ml5jXXyk37k3mQI7AVy2thniVd4KXmXC0gMOe4
	r1AjhEwF167S7hh7JDWaNT1oaDJAd0rn7wcirCfGBGWOMADAmKTJB+lwEJLqpwnc3z8/tI0HP8S
	Ful7eBMYkJaLlOYVaK+PnynnQ4+dDKE3RChBfsHFKDjiYnU6q48LOJEXuUDwqIfAJxotaW7lekn
	0VD/2pOLP4wl9CkoTuPB5HlJG1ZkbIq/aoZPaQ5RephR6blWbVPZ4H0pAo3PzzhM4Nj1Fa+oy9W
	M1ePZv33hZYMFrkZVZxkCVo8ivMvPvkDC+x6cf0y2ehWgnUrcOf+IegYxk3EBv8OsnFT22UHM4S
	/2X3GFZ2+q8A/Y9BOw7iZxYbvcZDUhIiTk7xtvkRa2R
X-Received: by 2002:a05:600c:6287:b0:499:db27:7b1 with SMTP id 5b1f17b1804b1-499dc8311b7mr198446165e9.15.1787843980654;
        Thu, 27 Aug 2026 08:19:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
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
Subject: [PATCH v8 11/20] xen/riscv: introduce per-vCPU IMSIC state
Date: Thu, 27 Aug 2026 17:19:04 +0200
Message-ID: <86fd78c21e77834c0fb51f0c4e8c410360ea3d64.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1787843981-FE47377B-FD561B1A/10/73395122804
X-purgate-type: spam
X-purgate-size: 6596

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
Change in v8:
 - Rename imsic_state->vsfile_pcpu to ->*_cpu to reflect better its
   sentinel NR_CPUS.
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
index f7b70a8da09e..a916def07380 100644
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
+     * always-available s/w IMSIC VS-file. Only vsfile_cpu needs an explicit
+     * initializer as its s/w VS-file value is NR_CPUS rather than 0.
+     */
+    imsic_state->vsfile_cpu = NR_CPUS;
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
index c6c59215df20..5ee954bbf3ef 100644
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
+     * s/w IMSIC VS-file -> vsfile_cpu == NR_CPUS
+     * h/w IMSIC VS-file -> vsfile_cpu < NR_CPUS
+     */
+    unsigned int vsfile_cpu;
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


