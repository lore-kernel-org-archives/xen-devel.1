Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A107BC43602
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 15:59:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355558.1610450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglij-00057i-Qh; Mon, 06 Jul 2026 15:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355558.1610450; Mon, 06 Jul 2026 15:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglii-000505-L4; Mon, 06 Jul 2026 15:58:56 +0000
Received: by outflank-mailman (input) for mailman id 1355558;
 Mon, 06 Jul 2026 15:58:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wglid-0003ox-7s
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglic-009yrN-KZ
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0b6-e002-0a2a0a5209dd-0a2a450a8e8e-8
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:50 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0ba-e40e-0a2a450a0019-d1558031b063-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:50 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493b1710405so19852425e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:50 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353530; x=1783958330; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1yyxCfvyoBfYw/uEmsf9oSi+vYcj07VTIqsiRnbV5I=;
        b=rgFyynczNwyTgnpBfT7DX5sHfPvN9aUX4tdcvdGI/QLwgB9nCR+Bn5grd89Owcf0Gk
         PaqOJTYmjMebSoAyX1pDNhi8PNf3WWIpNt4oeMpKFyJJR4XVhYwwFWfx9V0maGdnCYNB
         MINewd3oehJH9eH+qtqiSKr99JtLgpaS0znMsOiVbP01m1QekaOhugTCUJxVw+oC4kT5
         qAb8jFygqN4JsgG0bgS5EFEtanV/Uyfodw/g5XBaWzkV1NcjnRyntVcihqwmDaENC64v
         2O2LeFA3i48TimXzGpF36HY2q3PJ8mK8N6Gr+VjNWgTCER7yN7cjCc8XJg74jUwCW9gc
         ZoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353530; x=1783958330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U1yyxCfvyoBfYw/uEmsf9oSi+vYcj07VTIqsiRnbV5I=;
        b=HMm17Iw3gR8oByf5GT53A2KYur/3+eE6JJaCjOrx0L+KDk27Ub1+DXK4dW5VYOUk+g
         G4oMR7O35m2MludRDC5tV1/FM/xtHLHZ+cl+ngk8/Oe6+oK220fmX+nbKR4ECo5wCV9k
         7o4dLCWsn05l2y5CSCubpeOofiLp652LFP8qEHV9ZgZ6hP9xJThwKLYuW9JQx086NLKQ
         LW+XfRwTzPiT1cWoG4OvTty6EY52QnU4YejG91dK50mcL73p0enrXbZ/eGj1TsjK53o+
         UUairC1z7/bolxDDqWkCGG+ERTEYKilPoKbKIe4G7IR03zrJzPpRo+1UYljYW6vRnA6u
         3haQ==
X-Gm-Message-State: AOJu0YyS5wuKh/G3CpndESH3gwdsTrcbVIxlEU8O7XmlP1BGfPFWrrVz
	bYfRyknEuhAGMJBE5qI9jXHun6R315FBTlsyDkpK6ZUErwb/lS2Cowge0PMxQg==
X-Gm-Gg: AfdE7cmtdxTBlrtJrdnBmw+Fz7gHgcJF7q4p2+9lypGl5n07GZZL7qUKAhT2e8y/x+D
	M1QRWRHXTEzjajbkA3XWHW8lMzhkOLXu06yDj4VwFJmhXR/jUg6l7rWQ3alSJ9MGITgvmp6Y49f
	w6aWzYj55j9N/g7LMFD+eELDH+LKIS+4sNykEd2b7YdkJkAMyflPvlzSSnLDwEt2e0ZYqVHRbI9
	jzjM9NKwKbovxUF8oAa+GzmQqX2Q0Ra2bFl9JngcZa8dLlmMxMFrPb+xBOFMBkpz7p5wQygKItR
	adBHH3r6qZJRB+M1uOTJAZkm8s4DgHpFEZ/4n6cS0CZqBaoWWacQoE+Z4lAhomKdCwt4/2QmYff
	AQuANyC2j23Cx8y2dBTVuLmlkEJWyo2w8kd5doHHVZGwhB5vzWHe2PCUf6AlV4MYH4809qBM4Fq
	ITgBbpbfJRo6ihjlsa4oJ9L8eUh60hnuLsSICm4V8sZPuDoCtoHk34Ig75lQ==
X-Received: by 2002:a05:600c:4e04:b0:493:c389:d434 with SMTP id 5b1f17b1804b1-493df07398bmr13932665e9.15.1783353529794;
        Mon, 06 Jul 2026 08:58:49 -0700 (PDT)
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
Subject: [PATCH v5 24/26] xen/riscv: provide init_vuart()
Date: Mon,  6 Jul 2026 17:58:05 +0200
Message-ID: <0754278839160c0bdb922254d66f56b0e25206a9.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1783353530-CFD33DDE-9F180D37/10/73395122804
X-purgate-type: spam
X-purgate-size: 1391

For debug purpose is enough to have only print messages from guest what is
now implemented in vsbi_legacy_ecall_handler().

For full guesst console support it will better to have something similar to
[1], thereby there is nothing specific should be done, at least, for now
and init_vuart() is provided to make dom0less code buildable.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop/

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3-v5:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
---
 xen/arch/riscv/dom0less-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index a1fa51b996a7..d1a51b92936a 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -8,6 +8,14 @@
 
 #include <asm/p2m.h>
 
+int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
+                      const struct dt_device_node *node)
+{
+    /* Nothing to do at the moment */
+
+    return 0;
+}
+
 int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
                              const int node_next, const void *pfdt)
 {
-- 
2.54.0


