Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10DEC43638
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2026 15:47:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1346286.1604832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lj-0003H7-Tw; Fri, 26 Jun 2026 15:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346286.1604832; Fri, 26 Jun 2026 15:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lj-0003DT-9V; Fri, 26 Jun 2026 15:47:03 +0000
Received: by outflank-mailman (input) for mailman id 1346286;
 Fri, 26 Jun 2026 15:47:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lh-0002oK-4T
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lg-00D1eP-HX
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:47:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9eeb-5cb7-0a2a0a5109dd-0a2a4508b62c-6
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:00 +0200
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef4-edec-0a2a45080019-d155a730d911-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:00 +0200
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5aea915df15so438523e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:47:00 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488820; x=1783093620; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doELmlZY6voWxsScgdyib31c6ViG28sXkot44w2GTgw=;
        b=fyNePBOG9uC6F7smYz1/yH3U7wm/jf5DX6o3J58yPiYobeVDJn3pgLyZBNey/ZK+1s
         ReQuDLXLyPvdALb50TyIqWeDuYhkdW4n2eULGcFijXX0yUZbdtzEsB4qfzeBEgSxJETb
         2SIv1Nu/3drAl8CPWl8/pXj3oKClUWNI/Xxev+dKm94LsIZecyAZzgKE1Glqee8fEkbY
         ueOBhmuTGCvRiROqfM72M6pnGV1fe3yb4CxqW/qU3Nqo9JcW7/Wnib5l4dUZs/9QEZ0j
         9Tv9tBI9YK3hivK2LL03CJfRDWQrLKR6q3GRNljJAkQk43nd38tCibP7yK1SouHg76lS
         6a8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488820; x=1783093620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=doELmlZY6voWxsScgdyib31c6ViG28sXkot44w2GTgw=;
        b=sPxDo78bFX0+QKKUNc2nZQZ8gUKtsr7RCARuJSMk2HBk3OyYT2z8BK2RyhDb3J5bhv
         xTymWgC1CGRszK6/GaYMuPti/SAJ74bPEJtexAJwOeNDLYVyAm1zVZwOkNrgr+zj00Wn
         QQ5CkOW3d1BZwlmvO7ijK92EkHafnBWXJ7kk19zCOYBaR4VnHNEHi6hBsqM5wlWqDmTY
         q0338Iy8z0XmQhvaWFAA33jURC3MrZa0xQJ1+bH8jVN5kLbHsErhlILNTBn190+80fFK
         Sm7nShK+MKQvfI/7sXVCOKDm9UvUw8l1ZOMKjsW3y7ZJbNBhe3x7PNEw+PWorXB4zB/J
         hxfQ==
X-Gm-Message-State: AOJu0YyUGbOA6628v6v2C7AplZoiJmDg1uTJwZiM5AqSNAuOrGre/Dd4
	czWc1QTQNYPY7eNWt0V6H0L1lwKelBNGmQql4zQNuShw/FnnuS/mglVXCQzhzA==
X-Gm-Gg: AfdE7clsbC7+jVlv6hNyUDwARBGg5t/ksC4iwAknHwGtWka+DzxLgLtX4T2AjIaSOwc
	ffpPFR9xOCE/D2NOl6DrReunnfc2XROyz9pCOHa9LmKL8/8HSa/WM5vYjFMgXSgndZpROEHB1mq
	pTpnI4ipjDkicCxeEckef/OjN0GicJ8aKStAM8Fv6m3+s13hF8/+2qlEioGOMt7dGJdbF7JcxxV
	tjkhgiRo7JjsBrKH5d1CbpTsjpj6Ozyo2b5jKEaam9S8eWKIrby9epI7nrKOOEqNXsxB+fVgkJR
	aBtv49hCNCeRvGScZHdMNQPxy+599qtSXM8heSPkcaaH80xrMumOH/J0w76PEKpmi9sV2FwXhp8
	xBVlv+Rn9Og4shFnSuL6ap/9lZB3TWN3CvPhOTNj7f1kAnevtniMoSeNyXnjRjBUFe26UGjYdl0
	+M21xQSNbRFormY71DkTAbZCQfxb7ycOB/OECBoeczGeRmNYQten7LaOFyQg==
X-Received: by 2002:a05:6512:8053:b0:5aa:6b0b:1f34 with SMTP id 2adb3069b0e04-5aea1f29155mr1571422e87.8.1782488819683;
        Fri, 26 Jun 2026 08:46:59 -0700 (PDT)
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
Subject: [PATCH v4 15/25] xen/riscv: introduce per-vCPU IMSIC state
Date: Fri, 26 Jun 2026 17:46:24 +0200
Message-ID: <98936eb92e39aae0b56049d6c94cfd468f559397.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1782488820-4253F3FC-A181279A/10/73395122804
X-purgate-type: spam
X-purgate-size: 6151

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
index f7b70a8da09e..7068d6a7fef1 100644
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
+    v->arch.vimsic_state = imsic_state;
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


