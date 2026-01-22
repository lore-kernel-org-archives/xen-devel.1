Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058D6D3EE98
	for <xen-devel@archiver.kernel.org>; Thu, 22 Jan 2026 17:00:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1211577.1523095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viy2X-0004kG-IM; Thu, 22 Jan 2026 17:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211577.1523095; Thu, 22 Jan 2026 17:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viy2X-0004k9-FO; Thu, 22 Jan 2026 17:00:13 +0000
Received: by outflank-mailman (input) for mailman id 1211577;
 Thu, 22 Jan 2026 17:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqn-0007Ij-52
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:48:05 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bd9100b-f7b2-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:47:59 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b8842e5a2a1so115010166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:59 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:57 -0800 (PST)
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
X-Inumbo-ID: 1bd9100b-f7b2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100478; x=1769705278; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZA8ihisriROMO2vLm1yqQjETNpKnWgnKN9uanVzkRc=;
        b=aJ88qnAjcU9/TFsl0BVagsFiu/yKfXwVrWIV5Cc8TNUlkJPICwLSgHHKSk12fupVz4
         zz1N5BKosEX3p01vjZaBvf7bJVWp0NZqEE75SOk7o5/otBl1XNlrME4nw5Ji+f8nSvH5
         UJsuYGkdDVwnBVhLL0RQZO1uVNLhShwGapLZiqf5c4+2DThwnUVmxF+YSev1zvBXGkQy
         wQcDyGrhReFQ15WOxEeREYvS6IqrDWcd0rn0tZTPulnIX3wn5mE8kpiwis/b+gLb0E/S
         SzMjA2xNI3yabvvvREQEj5U/24S6mQKEsWHmZ3+pZGVr7efag8pGMPFVXOxaisSYL+qo
         nczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100478; x=1769705278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KZA8ihisriROMO2vLm1yqQjETNpKnWgnKN9uanVzkRc=;
        b=o0zQcqXvTt51qEL82S5Mh3EOn8x5/KuP6bx4qJptw/c2GnW31r2FAdjYsOJNJEY9ka
         cDghZfRsFdFT5TW4XolCO+Kg+41DdZb8H6nL56M057drRs9VB/Et7qcDfuczGTn//tcJ
         d2UDCQilJL/AOckZHAFPeOtDiSrYXyCKaOSflCL40nWsvv5CFr8ALu269QbSYNRduVrN
         fW/vwyjGneLdRNac5aN4Wo2g9woHr2uQl5IdZM8/Vpd77EOy85b1gH6++6Nt6H+tp5S/
         1S/ydyc8k7A93T0ylm2sBvonbqhRot6jV8KSQL+kHkOxqpjdC2LOe+0HPAdPzquGj/KN
         7pSA==
X-Gm-Message-State: AOJu0YwjnBUABx5VZLu883FougsdWlGcKnpidxEBARb9BpgGBXa6hZ3g
	4ifUVZfG0rNUhSCgyprX8NE8lf5VU93pROg4UqGvnoEAcvulsIKDB69BMLcbDg==
X-Gm-Gg: AZuq6aLNYu9ixBVRsPuspUkIASzQyM1dObG7HDVMrc7gofsq3Oe2Hde1ROmCz2uQUwm
	+9+RUaxLReUHYnv4FJa7AuabIJ+gBRJY6I4bpOgcJNgult6HK86QKzQFu0gAaXtlS0hEA8EZCf4
	Dl0fcH7Pn8fTy7xNr6Lu18l4mxlxfygqmVb1Ii/6LCi0AMZPSPcnZqiojM/lZPcap6biF+SLndF
	vaOlSiBLT5KsfR79N87HEmLQVgVqDztPJQRpHRl8i1ivsK7XYtvCObPiCXEA7Zx5PtsCSzU5gPY
	Ma76zj4uO8M4z2Np7X3EvH0HLANfACyC45pfpXvfnSIDFpuZRyloYvGbRI0ZL64Of3K7EVeeqnZ
	shMQMGvgZSK0aCPbyp+xi4bF8jV/ypQuGNoKRfda4r1eyUaKT6RK0zH8wToKeIPffiPewniatd2
	/8ga/N9N1diE24l5viwneK0k9bhWwAThA1C7X4M+/sMisAHmXqsLozNg==
X-Received: by 2002:a17:907:84e:b0:b73:667e:bb29 with SMTP id a640c23a62f3a-b8792d3be61mr1668682466b.8.1769100478306;
        Thu, 22 Jan 2026 08:47:58 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v2 16/16] xen/riscv: implement sync_vcpu_execstate()
Date: Thu, 22 Jan 2026 17:47:31 +0100
Message-ID: <eb254f5a49d01712f9b3745e420dd37a4a9ba0bc.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scheduler may call this function to force synchronization of given
vCPU's state. Although RISC-V does not support lazy context switching,
a full memory barrier is still required to order observation of the
saved context correctly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
 xen/arch/riscv/domain.c | 18 ++++++++++++++++++
 xen/arch/riscv/stubs.c  |  5 -----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 1458902aff82..48ba7584acaa 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -259,3 +259,21 @@ void sync_local_execstate(void)
 {
     /* Nothing to do -- no lazy switching */
 }
+
+void sync_vcpu_execstate(struct vcpu *v)
+{
+    /*
+     * We don't support lazy switching.
+     *
+     * However the context may have been saved from a remote pCPU so we
+     * need a barrier to ensure it is observed before continuing.
+     *
+     * Per vcpu_context_saved(), the context can be observed when
+     * v->is_running is false (the caller should check it before calling
+     * this function).
+     *
+     * Note this is a full barrier to also prevent update of the context
+     * to happen before it was observed.
+     */
+    smp_mb();
+}
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index c912d46f1e42..26434166acc6 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -91,11 +91,6 @@ void continue_running(struct vcpu *same)
     BUG_ON("unimplemented");
 }
 
-void sync_vcpu_execstate(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 void startup_cpu_idle_loop(void)
 {
     BUG_ON("unimplemented");
-- 
2.52.0


