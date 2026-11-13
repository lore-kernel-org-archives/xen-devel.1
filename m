Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0193606A327
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeBXO2Px
Received: from list by lists.xenproject.org with outflank-mailman.1487727.1690040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWn-000382-Lh; Fri, 13 Nov 2026 15:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487727.1690040; Fri, 13 Nov 2026 15:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWn-00036i-5h; Fri, 13 Nov 2026 15:49:25 +0000
Received: by outflank-mailman (input) for mailman id 1487727;
 Fri, 13 Nov 2026 15:49:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWk-0002bF-JN
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWj-00Gq2H-Vz
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:21 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7317c-8faa-0a2a0a5109dd-0a2a4504de74-16
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:21 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73181-b57f-0a2a45040019-d155dd31c489-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:21 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4919a880834so536086f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:21 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:20 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584961; x=1795189761; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVINCDg++Jh2R3JWBgFgpLjzUZaMs+jcIXoTjpcMqkA=;
        b=JeBXO2PxKE+k/VWVjri9VBn5Zi55hHZ2NBYHNsj4O10Uh3IbOtvaegsYzwDiYVRp6U
         fEckSjLLwJLX+Ui8/3FMzBGSsgYPtPgK8Uwp9WcyvRu9kzmTmO7OmYpuVJEK5nHiOd6b
         PoYGLJ1yWZFuRsed5TkvBlKod5GKG0w3xZ4wifxmNRz6dZC8QYq8McvQFISgwaBglkqP
         Zz7m90s7eoC8neKDjmlbo+Yo8xq8T8++y3/Nuc0h0FvCiaNITUdI+dJrK5/cyWqm7w0F
         ML9vPygf49QKVlnBjtXJAMj1XWZGX+g5uNcN1RyLnPZxXAWd1Teh2b+O/9aO5YcYBvZ6
         GV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584961; x=1795189761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVINCDg++Jh2R3JWBgFgpLjzUZaMs+jcIXoTjpcMqkA=;
        b=hVX1gcm3qoGc3r1UO0e1Z0ngUB1j7MTfsKV2jJSRSS10hHHF7xSA855JMn24SI/oTq
         P9z4Au+nTXjTrXWMkt1QDAh8krYwyK40w8WsKGKFrSVkPtovS6vHM/BveaIMhME9u9S0
         gXAZ9hQ9SQNNCffdGlG1sdmxVD+StaSbTYJ7IKmlU05RRa6U/X+W2xWD5Xb+TiQfchjg
         xcFpb9M+DAw7Ciqz9/z+1qf5jMI3tjf6GXwxsy9OQsA1mk+huDCMwPDmKgrvIoFqFbm3
         lGmqq0EmT4F1iOYYg2Hbwbo/95W/lQR1jBuNKVAXdD4TvpkaYSRSHDdT78oUt3mzz2GF
         H+Hw==
X-Gm-Message-State: APuU4Z9GuoT3epo/SHtNLv48inQ8NZvGJcN8f7TnuKsBB9cM0G0BQ/9N
	JV84c/IbkMz7Y9Xn+wYh5DZJkxvmgu/fp8ZWUWXDulz5NpbItdSEQl+zY3wdHA==
X-Gm-Gg: AYBFou0SqoxCgttr2bDA/eNKc6MsT/BUoc7mcQCHhs9OruTMojwobcg02M5H7SXtCaR
	bQ9rOfhtYfp77jHz7tbxmf81ymXQBdvKscse0Gc4d2twnXkjSA1BMpCBTsyv6EM5rR7N8+LSqp0
	E7FUnZuteqo1w/rDrTSDvpP5HWLPx9st0CuePh8f5DyeB8bkwYNlPJVeZapy4h9n8nzm6PQGfLI
	UHeiSUaUB+Vff8gv4DjPRx6o57pfWrQGVEX8Z+BeGw2OEb5zXJImY8+3MANIQZZHtsrfbT5Jgny
	plAEkzWzD2zwzkwhgVkODxJmEb/NvrlW4tR+yktMdkYYPl+HVi8LIpcFHsfJr/a+0BCxm0g9egD
	T6hlrfAT+dz2lsTNTdf0mAiRJyRcqTYxnXSqludAwun8tzfFT0xskWPE5ZsaBg71UiFeP6xbKS8
	I07Z/cKm41feAwr7dKP9w5CKrDqCUsBxKgHGmpgJcuWI1syaNu0hbR41QkcITN19z3ZiZDb7pKf
	rWtV527VZ3NvMrKbg4pYYRK+ph9Eln7FD3rkjwyjXrlJB2+vjoXTtc5oACfN5HhLGySvMFsch0h
	zc36ATDgf5EMDL8Zoe6ylyJp0P/vYWapZPoiM+kjzONyep8IV571YjRlMXoJpa/NHrznliGIIov
	1/I3oGlAAZNCaA0I=
X-Received: by 2002:a05:6000:46c4:b0:494:bf39:21a5 with SMTP id ffacd0b85a97d-49c70ed910dmr4235928f8f.10.1794584961270;
        Fri, 13 Nov 2026 07:49:21 -0800 (PST)
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
Subject: [PATCH v4 13/42] xen/riscv: introduce vintc_ctxt_switch_{from,to}()
Date: Fri, 13 Nov 2026 16:48:34 +0100
Message-ID: <a1a206fea72465d4287b37cf537928558137626f.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794584961-C0EDEB50-119CCDF7/10/78276251493
X-purgate-type: spam
X-purgate-size: 3340
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v4:
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
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
index 089d968ace27..a65de57e486f 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -412,6 +412,8 @@ static void ctxt_switch_from(struct vcpu *p)
 
     vtimer_ctxt_switch_from(p);
 
+    vintc_ctxt_switch_from(p);
+
     csrs_ctxt_switch_from(p);
 }
 
@@ -427,6 +429,8 @@ static void ctxt_switch_to(struct vcpu *n)
 
     csrs_ctxt_switch_to(n);
 
+    vintc_ctxt_switch_to(n);
+
     vtimer_ctxt_switch_to(n);
 
     p2m_ctxt_switch_to(n);
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 7a31c6a298a0..58196927aab2 100644
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
@@ -94,4 +100,7 @@ void domain_vintc_deinit(struct domain *d);
 
 int vintc_reserve_virq(const struct domain *d, unsigned int virq);
 
+void vintc_ctxt_switch_from(struct vcpu *p);
+void vintc_ctxt_switch_to(struct vcpu *n);
+
 #endif /* RISCV_INTC_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index cdbc039d0258..70dfe6cd6f34 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -190,3 +190,17 @@ int __overlay_init vintc_reserve_virq(const struct domain *d,
 
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
2.56.1


