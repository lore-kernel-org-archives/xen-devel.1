Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B37C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:09:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413316.1643616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JvF-0006gB-UG; Wed, 09 Sep 2026 15:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413316.1643616; Wed, 09 Sep 2026 15:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JvF-0006g0-R8; Wed, 09 Sep 2026 15:09:13 +0000
Received: by outflank-mailman (input) for mailman id 1413316;
 Wed, 09 Sep 2026 15:09:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4JvE-0006X6-MZ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:09:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JvE-007zEL-3V
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:09:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17692-2eae-0a2a0a5409dd-0a2a4503b4d4-34
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:09:12 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17697-fae8-0a2a45030019-d155da34e5a0-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:09:11 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c15e2dab83eso1042514866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:09:11 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:09:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966551; x=1789571351; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vye8DtWFQY9KBcaSdJnoE64blVyzkPlMXr9ggX+iVYM=;
        b=UqTVnUfhE7qWw5I9ygN5vrIRvv4W0CWHlOT98ZujTx5FBhLOVDcE8CFV+1fXCOAz0f
         wwBjDXUmgolF1LcioS4WUJx9vBtyvBEM66arlHae0NMTPRDqKo1jKnzv/X2PVStkx2sm
         ldTrxUiUrqnt5BHNtZ7LbErww2PWGezp5ZhcGvFB89u2FbZ7sncLxymAhFB8OR5KeuA8
         GmeN0M6ndrsYMR5YJ8pSv4LENLJzqBvRvhzJLKDw9vWOF85Zzzoln/Lm+5/3XeE8jKU/
         sgsOdcw0N/IlODq4szTYerg0RbrmLu1IHukxcC3k+Jud35dRvYwJA2we88TBdl9DhVLH
         6RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966551; x=1789571351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vye8DtWFQY9KBcaSdJnoE64blVyzkPlMXr9ggX+iVYM=;
        b=lZ7KLeYmXobiXyctbm71zRl/OhRgy1EFcm24jTeCACQpd3cEisN8hZIKa1f65/S7TG
         N5SLdfI8zmf/gb9W6nxTy8MX7DePc5GkQkXxIZV24ufRJWTD6oFmjNjtmy6w8uPgw7Uu
         mAP0mlErEYkonUR25sgoNQtI4meJWZHaOvlgGVmEF4P2UWFtA+TNhOFy/vXsE3WW9C6W
         Dy3xndXUi4hUe9ilvAO+ELSXpzXafQkZCokkAllvzxT0RtVZ8vR9FJkCHDcX1sUUrQgH
         5lZcqAudXPqw5SfHhn0vuGKm239NBOMe1qsIhi4PTTUyy797EYYalkpA7aU7XH8JoEA/
         UChA==
X-Gm-Message-State: AFuF++kgGKjd/4hd99UKPy99ffS6I2CuIkJp8w1YO5SFR/sQDEcTZdJZ
	e5cb8XUlq1wqoBEgz8gZuuYzkoP4wrfBodRPlO+bxdjGe2pa2VHJ0ncr73GS+wQV
X-Gm-Gg: AYBFou3xnaKbz5ZKW2ZygWeqoqq/syYOY9Ayxhpqei2lnOYNkTCzcSS6RgZwIsS6PL/
	09xNJ1n+aKOgZ7zZ3fYZ+6pxqM5EGxWDe2zT0t7gmtlHkDMXY5Cecd7WDPmFCFKDsqJHIlj1JXG
	eimRHtMS2uxj4FZK+3dckc7TH8SCD4StRILvPxnsJhgAwIcJZE2CAMeDOVsYOf3dh3ng+AA+5o4
	Sw8jPciS3QPM664D1jE9f248OQlTAeB8xxAT81XdP8G5BmXNsZAp6rzIDp1+pnrlBTLvkoyQ+Oz
	WiFJ/ZcfW7La4UmGtToVjTaau8OGEKWrXXgY021yu+iPXY/v+0FmC3UprqZvgOLxL6Hv/DrSpRW
	v7N04K2vBGATqVVVX+dvEsIklsCVpSW4PDfMZCfFBcOxc9fOCOif89hBHVi5PLSmT6+BK/jTGcr
	fmyohetMpyPiEwfkwRH4RyFgVEF4Pk6R5pvM1e9FEHJ97rtlNlZRtxPHYqn7SMIJgSeZwUATitW
	h1S
X-Received: by 2002:a17:907:c81a:b0:c21:726b:34eb with SMTP id a640c23a62f3a-c260c7ad2e2mr1393683466b.8.1788966551230;
        Wed, 09 Sep 2026 08:09:11 -0700 (PDT)
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
Subject: [PATCH v9 19/20] xen/riscv: provide init_vuart()
Date: Wed,  9 Sep 2026 17:07:37 +0200
Message-ID: <91853d1537d3222998d82fd1319631b0dc36a36c.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1788966551-6CCDB4E9-19B190E9/10/73395122804
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
Changes in v3-v9:
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


