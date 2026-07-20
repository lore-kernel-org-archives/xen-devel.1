Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C54C44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:02:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367155.1617015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS3-0000zb-Lc; Mon, 20 Jul 2026 16:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367155.1617015; Mon, 20 Jul 2026 16:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS3-0000zC-6v; Mon, 20 Jul 2026 16:02:43 +0000
Received: by outflank-mailman (input) for mailman id 1367155;
 Mon, 20 Jul 2026 16:02:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqS1-0000kw-Oq
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqS1-007AIH-5a
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e469c-e002-0a2a0a5209dd-0a2a45088416-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:41 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46a0-f659-0a2a45080019-d1558035cdfa-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:40 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493f75f7172so81121025e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:40 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563360; x=1785168160; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miSKL88+kUWtagnECjWW87hhOI66lG3SpdHDGFK+jbM=;
        b=lIqJ/8Ybs8d6UmfwzDIK/3e7/qmw5/L4Ogz6wEs/Yt4kNsrcDdmx+8rME8oeGe4gdW
         gzsjI+/oRGqNOBUElWCjc3Nn2zNHjj6ajV9eM1DiCrg6PyNUyPOvyPAAwO2tGR+kikku
         7zKxLD0gno+31knOOwM/7JPRXx8vINLtNwWWYGxTc9N9c6xKvy0gc0Ck8jqHst++cZF/
         cGnCd/6UBMvUpH87VZq8Ha9KohE3w4zJPZj5qJhTaahpSrxpHTCw3CixsVeROEL2OIJ6
         uK5nrQe/FrCyXCHg4yJ8ty1cU5bi10B4ImUEOjZegJWs7zydemGMsqaIHCQWtD7IlaNs
         GI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563360; x=1785168160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=miSKL88+kUWtagnECjWW87hhOI66lG3SpdHDGFK+jbM=;
        b=eN9QXtW5vcJKHnAYqZBCMmSsPdUakg1x3Ev+IBgnC1JL1WFPAqFu81ZVMDpKaaVAq+
         t0mERkULE7spFPHlUJNy0NYtVo8DOCT5QXMhl+38WeLydqrwdPglhTRF7/4e7V23n0Fr
         7j9hajCJ1/++ES4Rugz8+hmxI6zJMzD4Nu51ZKyyG2vg4K75Raxk7CQQNFrjP9koa1Ee
         TBYquBz78jFoVrUkqY67KjxBiWZsDPZ2+ONn+BMXrwhjJs+GA6L59ifh4Smbcz7jvY6C
         5N9Lr50/tim2ngjtKion0gik/wE2IqT+BP1wjOkns/DvR8TzhqF46nakwOb+WHEeGd/N
         Sgdw==
X-Gm-Message-State: AOJu0YyO3xwy4EAnTUd08N6YvfZC2i9Yo0SGIrpnQT7eRSFVeb410HCT
	pIcjdlfWv5v/PqH9MDs1bKUMnd5epDZV0L5XSph7T+qQCOv7VNPondLVh01SeA==
X-Gm-Gg: AfdE7clqUoP3u2KlU5xJ9lAdgEJeov86/pUBDNPRhDlt6V/5+CqXTvLJulBYN5DpNzZ
	GFRUFjmR9QU4bY6WIdi4bZGrdeeG8C+yW0oOIl41QoMMciYq/dt3g7XyXUFMpnng+NnylzwnwzQ
	w7KTsCMYY0a5vCDo337OVz5WA7vmHffnztQeduN83mN7l+Jd/b0tp/lrSAFMX4FRRvuvzgK7xxf
	jLblx6e/awTUHEZ5dsFPUIH6QIlRy7lfqGBQ24AkP0ajiqQcZyr/WG7J5hlDD2smiXIWvIf7qst
	5HDK0BdBT/koXPQru+9dRfFPplDfK0Zc1QZyRs5EJ1VffYZim5Sr2Yk14oXIxsFROuz0fRskMEt
	FaNy2ykp5zJf4EuIOVF5b/AyYvk3xoQKa5M2RXisyx91V8YgvI12of5iFvczXbtl3oQpKTcIEld
	0E6JE2kGTmUnxdZ+HA/mSAEej+J1OZNbKMQhqu2WOnL7gecVjcsEat0Hsf3A==
X-Received: by 2002:a05:600c:c84:b0:495:4811:d71c with SMTP id 5b1f17b1804b1-4954a3ed4bamr159226335e9.13.1784563360028;
        Mon, 20 Jul 2026 09:02:40 -0700 (PDT)
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
Subject: [PATCH v1 08/17] xen/riscv: add IMSIC state save/restore
Date: Mon, 20 Jul 2026 18:02:06 +0200
Message-ID: <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1784563360-CED4087B-9894E3C5/10/73395122804
X-purgate-type: spam
X-purgate-size: 2864

IMSIC state is currently needed only to track which physical CPU owns a
vCPU's IMSIC interrupt file. This is required because the physical CPU
ID is part of the physical address used to map the IMSIC file.

Add imsic_state_save() to record the current pCPU for a vCPU. When the
vCPU is migrated to a different pCPU, the mapping will need to be updated.

When imsic_state_restore() is called, VGEIN is already assigned to the
vCPU and the guest interrupt file is already mapped, and, as only h/w
interrupt files are used for now, nothing specific needs to be done.
Action is only required when the vCPU is moved to a different pCPU, which
requires recalculating VGEIN and the mapping for the new guest interrupt
file. That will be handled separately by vcpu_move_irqs(), which is
introduced in a follow-up patch; until then this case is guarded by a
BUG_ON(), which is fine.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/imsic.c             | 23 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 2a792e756c4e..406bc68cbcd1 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -20,6 +20,7 @@
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/macros.h>
+#include <xen/rwlock.h>
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/spinlock.h>
@@ -418,6 +419,28 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
     return res;
 }
 
+void imsic_state_save(struct vcpu *v)
+{
+    struct vimsic_state *imsic_state = v->arch.vimsic_state;
+    unsigned long flags;
+
+    /*
+     * SW interrupt file always has ->vsfile_pcpu = NR_CPUS so nothing specific
+     * should be done in this case.
+     */
+    if ( !vcpu_guest_file_id(v) )
+        return;
+
+    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
+    imsic_state->vsfile_pcpu = cpuid_to_hartid(v->processor);
+    write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
+}
+
+void imsic_state_restore(struct vcpu *v)
+{
+    /* Nothing to do */
+}
+
 int vcpu_imsic_init(struct vcpu *v)
 {
     struct vimsic_state *imsic_state;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 8e3797690f99..cfb968204a08 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -110,4 +110,7 @@ int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 
 int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
 
+void imsic_state_save(struct vcpu *v);
+void imsic_state_restore(struct vcpu *v);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.54.0


