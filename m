Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEB6CA5FCC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437548.1656508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6Q-00043S-HB; Wed, 30 Sep 2026 16:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437548.1656508; Wed, 30 Sep 2026 16:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6Q-00043G-Dr; Wed, 30 Sep 2026 16:24:18 +0000
Received: by outflank-mailman (input) for mailman id 1437548;
 Wed, 30 Sep 2026 16:24:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6O-0003fD-Np
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6O-00AJmP-4i
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd378d-8faa-0a2a0a5109dd-0a2a450394dc-38
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:16 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37af-fae8-0a2a45030019-4a7de18c8da5-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:16 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ffed768deso13012455e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:16 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785455; x=1791390255; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcKMiPoPBXvIwOVBRyQ2jzb4SFPZuO/OOBRln7jvQXw=;
        b=mMB2UTbaJMstzVeHsOiHZuvVtmnvVSBa/SsxD7S7BpaE/7LIW/n7Y3gsIY91BlDyPl
         t8JXJs/hT/fW0KA4WaGeHGP2iWslsar3zGGynau3xnTMdMHuxpWOCQlKde0LdOMZpjUk
         xLNg/nRhnYT18u96SOpnHDE71Fj+/6Bo4otzi5XTmpTvk3KMRiLsYQ2PjytD2hTt/FBv
         1cxoqbdy//rAE+HjIS51J8KIKHdupLXFQs178aRewQZL7nV1pDNotu0ZRR/GuxJMrYli
         XBxXKG6DMJUINPJ7/Rkyq323IzzcjZbDcSBYDT1TOkEWMJus/szQjcfnHjPj79xAAgW0
         TEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785455; x=1791390255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcKMiPoPBXvIwOVBRyQ2jzb4SFPZuO/OOBRln7jvQXw=;
        b=1kSUzopgBqqJ6zsmZ9cONFebi+mUdhhTYDmrEN1i0ehvjWuC2aTaTTAsPN19dhv57G
         WL3O/w0ZDQBoor1S8VWNWi9Qyjr5e8Jpfol4+S94FqIPL13k+MSI93ZZdyccQDxOduAP
         6pz7X+kUXC/77LgFzeIkDXj0UZtcbWPJvU8Q8v2mxePKmdcNtNCsnwaGlD1gZo1nVJea
         5hY0dNITFWd+uHD8lEZSPNfVx5BNTzpV5IYP/iEF+xLaY31ZyVzKu5FCsx1t2BqYE69m
         Ud0IJWitpNWdNHrBdm+oxFCoW2+HAJRgFTrSrrc0GUxywfRKwmHCcXOR5Mrmn35H3Vh8
         RQkw==
X-Gm-Message-State: AFuF++kOc0y8PV8kJCnAgUS4Vy90VwkoA+/5tJPsBtbidRv2wyzoJzb4
	czlF78eLHxdi+4eMQyiysshLijdvLAzHO9ducV1qlViejAuSF4vpsqL+HIhScw==
X-Gm-Gg: AYBFou2b9Y4y8yvdVKtG+gbRGILF/cnxO4f6FGfzYg2hZmsqF9BbzI9FpEwY7OsLZkw
	o4NUHE5JY0IiwxOtgaQN30HBuCXKo0mUZ40ZKajZ7f1HKAClmBfYN2jmQDMngF1rhJYlDuvWBCM
	/OD7Wkzdt9tSQ/edUBTkqXhJFRaAhS+3XGUeuz77LPjev1+cE1SLy0s624q+WMVtM69zaf0mc1i
	aCYbZEOwVFD08B1JUrdXeoXObLu2jAmPQqnbBI1MbLcoRLbqEAStjFLAVBqIUKsBUy/J1Bq8gtZ
	/SGyFbngYB5u42h/3k90pvfpJQux/XZwUlx0pbeQ9hUTKSIFg94ekITuAWQ9tD66YpjrXb6gXCq
	P8VWplrXkHgYYTeSDU2HI2R1BR91a4gFRyvnVj+L1yAKxtFDUco5zQXVudHC1IJ6Q9vG64NpbKe
	rnXH2MpB4KuQME7GcBMXdZKxP6I18GNEERUucnTkTkpTqI/sKDchXouIfecJCm0utTgvcnkT99Q
	SUxmRGvIstBDKBtV8g6NW0KhThCPfF0g3tXX5sm2g==
X-Received: by 2002:a05:600c:1c16:b0:4a0:25c:8ad2 with SMTP id 5b1f17b1804b1-4a01eb04367mr3331635e9.9.1790785454033;
        Wed, 30 Sep 2026 09:24:14 -0700 (PDT)
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
Subject: [PATCH v3 13/39] xen/riscv: introduce vintc_ctxt_switch_{from,to}()
Date: Wed, 30 Sep 2026 18:23:32 +0200
Message-ID: <752ca5c3e7af9e4d2037783d7d213a9bc2360c83.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790785456-6F6C64E9-E1BB166C/10/78276251493
X-purgate-type: spam
X-purgate-size: 3221

Virtual interrupt controller state must be preserved across vCPU context
switches.

Introduce vintc_ctxt_switch_{from,to}() wrappers around new
ctxt_switch_{from,to}() hooks in struct vintc_ops, and call them from the
context switch path, so that this state can be saved/restored without
knowing which vINTC variant a domain uses.

No vINTC variant implements the hooks yet: the vAPLIC implementation is
added separately.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - s/v/{p,n} for vintc_ctxt_switch_{from,to}() arguments and also for
   hook prototypes.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Update the commit message.
 - s/vintc_state_{save,restore}/vintc_ctxt_switch_{to,from}.
 - s/{re}store_state/ctxt_switch_{to,from} for vintc_ops.
 - s/vcpu/v for vintc_ctxt_switch_{to,from}() arguments.
---
---
 xen/arch/riscv/domain.c           |  4 ++++
 xen/arch/riscv/include/asm/intc.h |  9 +++++++++
 xen/arch/riscv/intc.c             | 14 ++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 610026fd81c0..fd21cb1789e6 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -418,6 +418,8 @@ static void ctxt_switch_from(struct vcpu *p)
 
     vtimer_ctxt_switch_from(p);
 
+    vintc_ctxt_switch_from(p);
+
     csr_regs_ctxt_switch_from(p);
 }
 
@@ -433,6 +435,8 @@ static void ctxt_switch_to(struct vcpu *n)
 
     csr_regs_ctxt_switch_to(n);
 
+    vintc_ctxt_switch_to(n);
+
     vtimer_ctxt_switch_to(n);
 
     p2m_ctxt_switch_to(n);
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 1bfba7c6155b..59e12f3d3c6d 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -64,6 +64,12 @@ struct vintc_ops {
 
     /* Deinitialize some vINTC-related stuff for a vCPU */
     void (*vcpu_deinit)(struct vcpu *v);
+
+    /* Save vINTC state of the vCPU being switched out */
+    void (*ctxt_switch_from)(struct vcpu *p);
+
+    /* Restore vINTC state of the vCPU being switched in */
+    void (*ctxt_switch_to)(struct vcpu *n);
 };
 
 struct vintc {
@@ -91,4 +97,7 @@ void domain_vintc_deinit(struct domain *d);
 
 int vintc_reserve_virq(const struct domain *d, unsigned int virq);
 
+void vintc_ctxt_switch_from(struct vcpu *p);
+void vintc_ctxt_switch_to(struct vcpu *n);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 810d126e263d..53ba2b04ab53 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -178,3 +178,17 @@ int __overlay_init vintc_reserve_virq(const struct domain *d,
 
     return test_and_set_bit(virq, d->arch.vintc->used_irqs) ? -EEXIST : 0;
 }
+
+void vintc_ctxt_switch_from(struct vcpu *p)
+{
+    const struct vintc_ops *ops = p->domain->arch.vintc->ops;
+
+    ops->ctxt_switch_from(p);
+}
+
+void vintc_ctxt_switch_to(struct vcpu *n)
+{
+    const struct vintc_ops *ops = n->domain->arch.vintc->ops;
+
+    ops->ctxt_switch_to(n);
+}
-- 
2.55.0


