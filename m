Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A14AC61DD3
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:20:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400842.1636509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtU-0007ir-Km; Thu, 27 Aug 2026 15:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400842.1636509; Thu, 27 Aug 2026 15:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtT-0007gH-I3; Thu, 27 Aug 2026 15:19:55 +0000
Received: by outflank-mailman (input) for mailman id 1400842;
 Thu, 27 Aug 2026 15:19:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbtQ-0007E1-K9
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbtP-00BpK6-TS
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905597-8faa-0a2a0a5109dd-0a2a45079888-2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:51 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905597-b4ea-0a2a45070019-d155802dec33-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:51 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49b0d8bc2aaso14137115e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:51 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843991; x=1788448791; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nihbvDgoGb4TJo/cKdORKPVLnJZwrALFzlqr8YYLpAU=;
        b=kpLH7V/zEvPVRYHuCJ3pt4cOvyEd0ZtYlgOrkh/b3nma2u4bgpZ7aXcf0nGbHQDRrq
         IusfvNj4LF946bPRC2zjdAh1NSGL+uCGCHrr/v74qxoAQjDxwQnJYYoBjn5T7dFmsbxd
         xM15Se5msf+kRnzrnx6HM3BZj8wPSLZtJSuKMCpnHfqwRvn4239UddrtDWXV/YNBvrCP
         2f9Uq4PO8Z1FdDhRp1vrcjNSjMm+MmxSPQ8eTOs0vjUfwDnHX1kTRR9s77eELTaLRJIc
         dQinJ/DXu61RFFdY+GrHz8c0QwEa7z3CLOp06u5JWsdr4zlfpEq8F4RQHfyuin6Ox8NC
         B2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843991; x=1788448791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nihbvDgoGb4TJo/cKdORKPVLnJZwrALFzlqr8YYLpAU=;
        b=rNtzF2rjPMAkXwOTGS1v0zI0gEbV4F7itTXII5WTDjUzzjuy148RJ4g9bJNO40NHRr
         H77rI8AGKuYQrkhz6Ip+emSdN36pejSDjZB6jW4lgPSO7Ha33eYTrc2I03ln4Ju1Wk1k
         CIZdaWBpm+5gJu0p+rcawmhVdeFIzujEdbMWSZpXjh6ccDqQFkeuHPYOg0FlY5+MWhRY
         0BCEMwLXXagVf+1FPMADSUIDe0N6LIvQBTimvSLrit7HUFh5N53ugtSXDEAsKAHY2VqA
         HQBc8UqdjN4b2V0gQ5yQUerGTZlfsDe1CKm7Y7bf9vg3zMZ2bz5Ggl4VaYaIkJ1KNPqs
         JxBg==
X-Gm-Message-State: AFuF++ncJIwUM4MnSCrnZsetu6EC2OYGlESBx06xlKkJbFYAbDs09P5x
	eXrENuViwi96zocvBPxE/1lF1bj5mrNLBBAEQfGBeAO2o8mPe9bHGYeibjeLIQ==
X-Gm-Gg: AR+sD13MP1wPc4o2+mHQidPhon2jf7IqUfRyndEXpupMXkunZoddifHoyJtrBDswshG
	xGe5Xh9qlV+Ii9rjddgj8o1J/+uiTbX2K2rKLrFZXaIASHCMEDVulAglX4WwnemUNp80cZgeRJN
	Z5HllWN9Dj1Rxf09RwjOPKPCzMqglDVnR3FyN4YrIjNmSCiiFQhCLEGXHOnN/apLOWBHQXBMtkE
	cmpi8cE9a0rbDEt/Fx82fqaagif7jVeGgvoMPr/Mg4hUnGiIsYW9wD+J8Wj0bvOqweOpgEQzRj7
	0kNA+TaljReUe8dIi+7bU6mb8UrLfgiboGtKeFzDqUkX0oGxghAa3J1Mt84M9BrvS7FZ4o15ZX0
	ufhExzOyQNQWbeC2SenupwBLNHbLbnxjqbiq32b909VLGS2Hk58rjg7P0k9e6sC43gL9VMbfzWP
	NQcPYvA2Q6yact7WMi7GJ2f5AQqV+3KrsWXAYwJvKIHPQ7XTd9UZ1r4stz2f/JJ/wklR4mVFCAT
	F9mnoFmjCWvzRrNmtv6krzyPk9D3dVg
X-Received: by 2002:a05:600c:c48f:b0:499:dbc0:370d with SMTP id 5b1f17b1804b1-499dc6eaca4mr163300205e9.2.1787843991237;
        Thu, 27 Aug 2026 08:19:51 -0700 (PDT)
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
Subject: [PATCH v8 19/20] xen/riscv: provide init_vuart()
Date: Thu, 27 Aug 2026 17:19:12 +0200
Message-ID: <906eee47f9e9da115209afe96b4efef9893346f1.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787843991-3C817AE4-3804E09F/10/73395122804
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
Changes in v3-v8:
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
2.55.0


