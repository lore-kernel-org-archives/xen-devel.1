Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88A1CD37A7
	for <xen-devel@archiver.kernel.org>; Fri,  8 May 2026 14:43:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1303742.1577048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQh-0006MP-3i; Fri, 08 May 2026 14:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303742.1577048; Fri, 08 May 2026 14:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQg-0006Ll-T3; Fri, 08 May 2026 14:43:50 +0000
Received: by outflank-mailman (input) for mailman id 1303742;
 Fri, 08 May 2026 14:43:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQf-00062y-Ev
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQd-00EphB-A5
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:48 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a1-e002-0a2a0a5209dd-0a2a4507ac04-2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:48 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a4-229c-0a2a45070019-d155da30a8f9-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:48 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-bc1f0830f44so590070366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:48 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251428; x=1778856228; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLvC2PpGNSOer61k2601CFg3UXOxaIWR6wu0w95lWf4=;
        b=gzaj2O2vERQO97xv+7fVNMNjcwRpORuevEuZ72MihGsf3xfVTiN1SdmEDbkRD/xTyp
         fhspq0WdODITpe0Q9NJLbZFZKD+4EtxlWdzwuNjeJ23mPL1rg/iBebrsJCBz5qDYZwC4
         lHlpnkGrqX2K3jS3uogKvuJMhwRiMIR+amLFK2ELPDQTbzc1bDoSGuOoiRB7lSr7sXa9
         r+8nsMCPGmULIW3QulQX0tKKWUAa86p1mL9PRAhK+7W2/AkTAk7WJz2KayC0jo+z6m7L
         348ackhr+AV2rxSSlu7AyvqzvnR7pj/vS5JCnosm6MAXIQuFk9VM73O+quXuztVvVTFo
         /Z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251428; x=1778856228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fLvC2PpGNSOer61k2601CFg3UXOxaIWR6wu0w95lWf4=;
        b=Z+mdSQ2CCvD2cxu+i9ZOUI2gEZjg4UnLvEQJpjT/yrW0oC20f1RoP3rKi6i/gHYrKO
         3kiVVC7rTyBtiCM8jWPcD3T0bXerau56KmbAW7iLLjtF+nS015XBbXxxnQK+i5AasZJy
         4a73A/6ZTH8az18DlKDFYPc2Aj9tZBTwoYYtS+8lojGjyU2soWRWz3uiQD/W31mOtX4O
         WYUIdU2cXgOKN7tQ3jOHyovdR/Ixu5I96ODZ9r6lOtCm+yi/urPrr6vonr1yppYCV5SH
         YfPWZpajAl744Ficy8/z5B03i9Kvx611Snw3J/ch/EWgC3Me1zZ3jXX+mYT3KtRnXMAb
         nwEA==
X-Gm-Message-State: AOJu0YxZx0XbqEiT0+/nYyC3zqhvBlOsrJO8nv3tq8qlzjxZ9HAvyqnF
	f47C/IZedpTbqfsBVdJlDwlMfVLHajzsTOqHW3Qh4MxBgca2GOegii7og+DkCg==
X-Gm-Gg: AeBDiet3fSrE45GdzgchRU55uRbIcJx+MkjhBzINJ3ZsPURcE698fTtwzOq+r2POMFk
	k+A6Eg/xt+TOpJ+VNMoIwspB1yWEywPqhZl3HSL2PrrfY6JRyNLsuiMWSVoA0ex5CPpO0Nn6npk
	nN/NAUIuSVquSl4NBUp564DpGTpzQNQ6GAgLOhFlp6qJRoauqhuXGYFDROMTjtMmRFdqrM7gF5O
	G6q0DtBDisM5pdxySFTuYs2RyftzKd/RNG6qMvEE7MiVrfDHlxwMAzp7BCNStP6a3yn/B75p9dB
	JfTrKSb+n/ztYcJRFrBO/S7oByoILiTSW3auVHHfSXXC2c6e6Axd2vCoaT4HIgYrlMM4th5i3Hg
	27dpSHxUGPTg8Q7XeaA4uogVieBin1k83ac62UjaHuMI6QiEPwge+a2iA+qbjcJ4dyQH3Vrmj9+
	lfd6mD41IzZ5rFM5L7vExF8Fic7JBB5Lk7Ry6WhPdPPE9ApStrNMz19qirgh7zx/pNLTtLlm+D5
	5bU
X-Received: by 2002:a17:906:fd87:b0:bc1:b5ef:7541 with SMTP id a640c23a62f3a-bc85cdada2bmr371439566b.22.1778251427956;
        Fri, 08 May 2026 07:43:47 -0700 (PDT)
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
Subject: [PATCH v2 07/26] xen/riscv: implement make_timer_node()
Date: Fri,  8 May 2026 16:43:09 +0200
Message-ID: <24f4c2ba7ab00c31b66108f63e6752a3bed2e0f1.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778251428-28479C48-51C34B81/10/73395122804
X-purgate-type: spam
X-purgate-size: 1561

Generally, in DT for RISC-V there is a document which describes a timer
node (riscv,timer.yaml or sifive,clint.yaml), but the Linux timer driver
is declared with TIMER_OF_DECLARE(riscv_timer, "riscv", ...).
It matches the CPU node (compatible "riscv"), not the timer node itself.
It then calls of_find_compatible_node(NULL, NULL, "riscv,timer") only to
read the optional riscv,timer-cannot-wake-cpu property.

Since Xen does not care about that property for now, make_timer_node() is
implemented to return 0, as no timer node needs to be created for RISC-V
guests.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
 - Update the commit message.
---
---
 xen/arch/riscv/domain-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 3063328d96e4..02b293239142 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -3,6 +3,7 @@
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/fdt-kernel.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 
@@ -156,3 +157,10 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
 
     return fdt_end_node(fdt);
 }
+
+int __init make_timer_node(const struct kernel_info *kinfo)
+{
+    /* There is no need for timer node for RISC-V. */
+
+    return 0;
+}
-- 
2.54.0


