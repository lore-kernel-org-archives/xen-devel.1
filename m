Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EC9C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400944.1636664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbva-0001b9-HZ; Thu, 27 Aug 2026 15:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400944.1636664; Thu, 27 Aug 2026 15:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbva-0001Zu-8B; Thu, 27 Aug 2026 15:22:06 +0000
Received: by outflank-mailman (input) for mailman id 1400944;
 Thu, 27 Aug 2026 15:22:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvY-0001HL-Qy
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvY-00FiCE-79
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:04 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90560c-bab6-0a2a0a5309dd-0a2a450c9cc8-38
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:04 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90561c-f479-0a2a450c0019-d1558036a425-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:04 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49b0eab380eso10265215e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:04 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844123; x=1788448923; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/cMuzGiRGtxRlpn3+ui4ui24plARkRR3MSniQJflTQ=;
        b=H7Vl3QnoRDAuDIz1nyu5Z9k7CKYFKxZcxeBVF6SUnSz87n9Lm5qiF5SI8Hyr/ikLDp
         4pPKkdWpfkZg77PyT3JTE8G8jknG6ntwh2Q0s/ss2hrBWD26Z+1Tk95iP2Af93um/CZe
         8Mw+ulxgsSQAnYE9rZRS0kUAfGWVkfwQRmEMih83auHURs+qsmbLF1/Tm+cUtOxV8dIQ
         c4HKRJuHylknOPfQxx5MuIj64YkwjTD6OMnbxwkrWoXSRpayj4YD5itz8DgUKg9NHR2/
         IlW0G9s0o04FBlHmCipBpnyroYqVkNtzgotfbP7QiXwOkaP1/4Ky06RO8/BoBLKHOSST
         w2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844123; x=1788448923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1/cMuzGiRGtxRlpn3+ui4ui24plARkRR3MSniQJflTQ=;
        b=EwDb4umKqjZtQHjdMv3GpJdnM4S0Na3Fn3RKz8lsMLbX/8wPn4JcKYtekSz+G9UqOs
         XKlcordXVYH1WsByEhNpNfHU153ks1Aemi3YWjSxGJv4GlvE8Hm2DftJBv1E4a4yo+wc
         DsEp//k163vTo8lxx9ErlkIbPlMSUpac32ZoWpRCPUxpOlvGxpeBCKMOiJAHG/Jzrr03
         YRr3Tx6onHTQ+BHpnZqJsY/pthHr33IxtE97/KZrFLxuoO6xl578dvxv0jArzNoRtVG0
         FRAamxV2wqCNruuHvWszt0HcaFtXJGvX0yyd2vwF4cwnwVdN457EOw7DfQ316U0Rj4N8
         +MVA==
X-Gm-Message-State: AFuF++kvuudqkyVm9uXCytsZSfvekOH8zeDe47IhSTViB0doNmcgrI1X
	VI84nF75Ivh6RdK5hKKsSb0vfFidnn3OYxhC5/3+gNY3p9WT8e7X9OAadDwK+Q==
X-Gm-Gg: AR+sD136TzbLQSvCv6PevKYnZCaYmKOOu9dwWsbCF5t0+1Asgm7KqXf61p4XUZAQR06
	LiwOdMyigu8P+zK6PcIq28gOA42zedDGxohFbg6cduiN502OJTVcR7UJajCEOa2YsURMwjvp/0/
	4QtfxcLT4Aykw2DgqOuD0VjC6XCp94V4a5PVfGCfnXI8IAEV/49OOgXi6m1tEKmowm86CChSr/c
	Gd8yVFkgcrf/QMvaxlySKn0S6qzLE8dpX1mbSD2ZsnUr1A8UNJ2OChcLm7A/+m9IUCuEZV0jBFl
	g3OR6AXMSA94jiKo5QahHRK362uaUotIQlfZdPai/5C8MgPmhYu1IDbXW5vwA018W0WHQRDixPA
	99hzksOEtxucN+f6KY6D5F/1mMsaM7w1Nu7cNwIF5y1FM1Vo/Wty0FikwPZ448t1ywgL0TuMPsb
	5fGluccqAcWnLts5ubDdCC/1HFIXxq29stHcEnq+vhhlxbsEKWUE+daww2DOuwupPNcZ/T4TDhs
	DVMzbG9YhLW4EPE2pCgQ/cWvijGaoY6
X-Received: by 2002:a05:600c:3e8e:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49b0dfd7d2cmr103580565e9.7.1787844123551;
        Thu, 27 Aug 2026 08:22:03 -0700 (PDT)
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
Subject: [PATCH v2 14/39] xen/riscv: introduce vintc_ctxt_switch_{from,to}()
Date: Thu, 27 Aug 2026 17:20:58 +0200
Message-ID: <678236568970b18a1924a76588c4c50f9bf0c659.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1787844124-026DEA5B-2FCEC2F6/10/73395122804
X-purgate-type: spam
X-purgate-size: 2995

Virtual interrupt controller state must be preserved across vCPU context
switches.

Introduce vintc_ctxt_switch_{from,to}() wrappers around new
ctxt_switch_{from,to}() hooks in struct vintc_ops, and call them from the
context switch path, so that this state can be saved/restored without
knowing which vINTC variant a domain uses.

No vINTC variant implements the hooks yet: the vAPLIC implementation is
added separately.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index 4afdfb4d09ab..2dfe4c2e72ce 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -437,6 +437,8 @@ static void ctxt_switch_from(struct vcpu *p)
 
     vtimer_ctxt_switch_from(p);
 
+    vintc_ctxt_switch_from(p);
+
     save_csr_regs(p);
 }
 
@@ -462,6 +464,8 @@ static void ctxt_switch_to(struct vcpu *n)
 
     vtimer_ctxt_switch_to(n);
 
+    vintc_ctxt_switch_to(n);
+
     restore_csr_regs(n);
 
     p2m_ctxt_switch_to(n);
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 1bfba7c6155b..62e1410156c7 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -64,6 +64,12 @@ struct vintc_ops {
 
     /* Deinitialize some vINTC-related stuff for a vCPU */
     void (*vcpu_deinit)(struct vcpu *v);
+
+    /* Save vINTC state of the vCPU being switched out */
+    void (*ctxt_switch_from)(struct vcpu *v);
+
+    /* Restore vINTC state of the vCPU being switched in */
+    void (*ctxt_switch_to)(struct vcpu *v);
 };
 
 struct vintc {
@@ -91,4 +97,7 @@ void domain_vintc_deinit(struct domain *d);
 
 int vintc_reserve_virq(const struct domain *d, unsigned int virq);
 
+void vintc_ctxt_switch_from(struct vcpu *v);
+void vintc_ctxt_switch_to(struct vcpu *v);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index bca83b4f4fa3..9fff501b9c25 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -178,3 +178,17 @@ int __overlay_init vintc_reserve_virq(const struct domain *d,
 
     return test_and_set_bit(virq, d->arch.vintc->used_irqs) ? -EEXIST : 0;
 }
+
+void vintc_ctxt_switch_from(struct vcpu *v)
+{
+    const struct vintc_ops *ops = v->domain->arch.vintc->ops;
+
+    ops->ctxt_switch_from(v);
+}
+
+void vintc_ctxt_switch_to(struct vcpu *v)
+{
+    const struct vintc_ops *ops = v->domain->arch.vintc->ops;
+
+    ops->ctxt_switch_to(v);
+}
-- 
2.55.0


