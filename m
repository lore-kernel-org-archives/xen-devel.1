Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF334E7E0DF
	for <xen-devel@archiver.kernel.org>; Mon,  9 Feb 2026 16:53:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1225796.1532463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVJ-0001jY-UO; Mon, 09 Feb 2026 16:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225796.1532463; Mon, 09 Feb 2026 16:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVJ-0001fl-A7; Mon, 09 Feb 2026 16:52:53 +0000
Received: by outflank-mailman (input) for mailman id 1225796;
 Mon, 09 Feb 2026 16:52:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVH-0007Zo-8z
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:51 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4f42146-05d7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:52:50 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b8eafb515aeso553657466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:50 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:49 -0800 (PST)
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
X-Inumbo-ID: c4f42146-05d7-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655970; x=1771260770; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi3FnDG07OCkFyCy7UaZFSaTKT/2LCRxd2Xxk35QB18=;
        b=ejBeEvtEc4jh0Bds66dLiLpiJdqRE5/x7IGihF/HJGV8iUywTmgk++56bVHX/gQfGH
         fLwscUFTN4+MzQsIUaRJJ4Uai8LRtmscglmEDe3jS7YniVW79DCaQkH5Ps//HYMwDTWG
         Anw1+V/5M/tZFdVdJJ+gUatuGzdlyqneDeyOCLAf2O/YhqaVvZ+Vjhpmab5PoNUDlJqA
         RR74AWzyZnngFeSU4A/zfGkrM0EFrVwxizYuuMy994Qa2gAIt4+DQeccNDNJ/+tdOivv
         FWawK7+BV3OgszfDjGlLqlwQr9kJgTEGZH9jJF+wkPkaLNOOLcTvI1D4wKWYwQgo7jNZ
         8HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655970; x=1771260770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hi3FnDG07OCkFyCy7UaZFSaTKT/2LCRxd2Xxk35QB18=;
        b=felipY+3AixRu/7wL+Wl4KLt6XpO5X1A+Hdv+pB4p02cnaOZb+0Salzbafom0GWzLh
         nSKn1AEFa8KJHtmNBDDLldGK8GSqEtpV4KPIhZxv+gLOGci/HJ+oXmjd8Rbh7i9w+cq8
         Pwd12kQBMYHNPczriRnvz/q3pFlOgb+as/964ehKDTV+H7pmk7O26+rOMYozkQwfM+9h
         BpLGBYWcHmn7z8biHGDiczktBhpmd9cLyfu32eIUCl8xWE2rlSPG8l5s+ecWUmRFAh7d
         LhE/Wgyz6EQELmH/JwQzaJrSIXO7y51TPerqK7s7vH+qukNjBcBdikJXroptutX2v2qx
         A+FA==
X-Gm-Message-State: AOJu0YzcLxbqd7PUqjvGmPZ7Duxs1g1iCod0zd4k0cbavy56ycugUDqR
	2R63bvk87pIfgY2T2YzAWtu+611ciUxVA1MSwDzxZ7HbfWm/nMbDoCbeQHOvueWK
X-Gm-Gg: AZuq6aKDTbertHkX+IKbd9Yy6cVLVfzMLJkjMUgOD43EGKiMA+N9+XDoMY9Zw4bjKDa
	UfcH0/7wFKE6/eRPGLsCIMwzPSizttvUuma4d4cabiY3te+JRZU2j4/0cOcW1hfWiQ7tqGcpbb0
	Zpq9aBMEE0ETIl2VkWVLbfNu3Fob5JulPHX8Y3SaeoomHxLr1w0DyPQ1zviFffK8F4QQufpZM0M
	Rs3KkQPfsucqUjlwB+v5M/hteHIQI9gqU+DddNtLbN+8v+nUHFoUmYBrR7+4WdzKeiCj5TTf+M+
	Ie4V1qJNuqHmSchXs4AsNABOEnjOv9nNSQRFi+VriykKXHQ4IH4U9Ou9+8V5pQaBtZ/Hhxr9oWG
	cs6xHuQydLUubsIJutZoHwUd6VWMstoxlQ+uDzanJMv1KSaItu4LpnkKD41hpRlQT1d96p3sYpn
	Ivx4HSz+OzzMZ3XRKFvR9UgUOWdC68KHDx4hYrd0DeKptVyq7RARSH0A==
X-Received: by 2002:a17:907:9451:b0:b83:1327:920d with SMTP id a640c23a62f3a-b8eded474b9mr601057966b.0.1770655969502;
        Mon, 09 Feb 2026 08:52:49 -0800 (PST)
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
Subject: [PATCH v3 11/16] xen/riscv: implement SBI legacy SET_TIMER support for guests
Date: Mon,  9 Feb 2026 17:52:24 +0100
Message-ID: <0bc0547fe8ba97f66c9847cfc334d62add25504d.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add handling of the SBI_EXT_0_1_SET_TIMER function ID to the legacy
extension ecall handler. The handler now programs the vCPU’s virtual
timer via vtimer_set_timer() and returns SBI_SUCCESS.

This enables guests using the legacy SBI timer interface to schedule
timer events correctly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
 xen/arch/riscv/vsbi/legacy-extension.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/vsbi/legacy-extension.c b/xen/arch/riscv/vsbi/legacy-extension.c
index 2e8df191c295..090c23440cea 100644
--- a/xen/arch/riscv/vsbi/legacy-extension.c
+++ b/xen/arch/riscv/vsbi/legacy-extension.c
@@ -7,6 +7,7 @@
 
 #include <asm/processor.h>
 #include <asm/vsbi.h>
+#include <asm/vtimer.h>
 
 static void vsbi_print_char(char c)
 {
@@ -44,6 +45,11 @@ static int vsbi_legacy_ecall_handler(unsigned long eid, unsigned long fid,
         ret = SBI_ERR_NOT_SUPPORTED;
         break;
 
+    case SBI_EXT_0_1_SET_TIMER:
+        vtimer_set_timer(&current->arch.vtimer, regs->a0);
+        regs->a0 = SBI_SUCCESS;
+        break;
+
     default:
         /*
          * TODO: domain_crash() is acceptable here while things are still under
-- 
2.52.0


