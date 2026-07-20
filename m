Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D19C44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:01:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367016.1616909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQK-0002Lw-Nt; Mon, 20 Jul 2026 16:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367016.1616909; Mon, 20 Jul 2026 16:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQJ-0002JK-TN; Mon, 20 Jul 2026 16:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1367016;
 Mon, 20 Jul 2026 16:00:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqQG-0001Zm-98
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqQF-00HThX-LH
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:51 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4621-e002-0a2a0a5209dd-0a2a4508cf58-38
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:51 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4633-f659-0a2a45080019-d155dd33cd86-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:51 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so9040675f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:51 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563251; x=1785168051; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnjPdWyeVMMtK/rO246vVnQEYvE09wVm6zsQIO2jAY8=;
        b=FIvzd/Xla4yTAsOLJDKo9+xkG4Nwkey9B3GL05ZY7/6ak4jgEMF+8pxUZPz5mLCW2k
         fA/CrZuEQyHJcHbgt0tx2czNrT809NAsWwVF1OSiSKqEoyRfq1cC9X8wLP4e69EWAeVh
         KgRe6df4fvl8ICH+E7gxJifFnEBdftOJcn0PfUdqriKluECnM22vrcS7etCWN34EoWJU
         +AsQUCIxRl4zqJ0sJntnN5o0KAFE95Rq0gKwtcyTE7K7cRSJowWkqaiaW4xMGdD2bvkY
         0jwUXRsenKHb4re0iMN3HFTZpRyN8aRjGL3jXB0lu+fJB3ujkm3wSwg9+Gg1th1Z88sL
         TGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563251; x=1785168051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnjPdWyeVMMtK/rO246vVnQEYvE09wVm6zsQIO2jAY8=;
        b=EAjpUBeTTHeZeVQHv3WESNflJ1eSKJgEyoc7amWIHMKjb/Pr8BNf5pABe2VSdsc4Hb
         TpPnvQfIMiIP7t2lWfnYGv3KOsMcOp1y2QD0UwaPOLvKt2Pu/1pfZl+OkKSdbbFpLemM
         6qnFBzMUOlLcnTF/pF3axzGsqokyFggYmiR9LTzNAsTNLWmHmf+UxIYoZCbqLijVkcll
         KOoPFS1pte/aQCnHisOQXTVM9xVTg8XnH/mUminPc4MIvSkPQ+NHMtmKSgjCQT/Ya4Vk
         +Y/sw0K4O/AzUTntFH64ASYrbg0LsHAlZdsoF8IJR18E85cKWa09UCAgo54fYYzWaPdO
         A/lQ==
X-Gm-Message-State: AOJu0YzwPsrGL1RumJa5pRyFdcYxUOLESMqaVcy3/pSw/ytehMus+sqf
	lc+L3JXG02938YgUGpvaVcyXZvv4Gk4ZE3GOawcqrDBeoScaNtoro2G8Z2R7ag==
X-Gm-Gg: AR+sD11pUVGY/b+1vmcMuiHr0b54bMWjJQ3IvjpSr4bzc6mEKiUDRCf+XP7chJBSHJ5
	9JF/P6A2YOse4yEKnimq342xUtxcD8FjqbIwTEV2MGCFWfyU/Z5ndePf4B1T3PGqUum2ISHiql7
	KWGAwTM7iMyklx/EhAag63v9Z2igo2ROik25GQAIhOQu60JcVCkUjNBIBlKk1Z4hq8MQy67TTfW
	wQOSSNCROxjmX+kmt15YT90CmGD0zexUFN0Xzo47wywHmHMG7cYt/jwZpUVIk3asieoSlm1PzZG
	pZOQ1aUbc92+2IEIv9m+ZxFUKIFyTrfu1XPROcWK4BEyoCNVAmJhJRkFNEcHDT6LxUizeTeF/w9
	e6gfwLyendbefJHmh0eDBrbh4VTraXaJ2gCaVU3J/c/DoUUoiWfehK+7bku3tcz+Dj21KAa3HZz
	oN7uzfvPzkNK3BeWebkaA0OHjSNoG2Gm+rgfBPbh85zIZ685c0xIsgQp6WVA==
X-Received: by 2002:a05:6000:1785:b0:47f:7b75:61a with SMTP id ffacd0b85a97d-47f7b75083amr3171928f8f.15.1784563251033;
        Mon, 20 Jul 2026 09:00:51 -0700 (PDT)
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
Subject: [PATCH v6 21/23] xen/riscv: provide init_vuart()
Date: Mon, 20 Jul 2026 18:00:02 +0200
Message-ID: <823515f11f566c54bc060ad68af838c0d3723b9c.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1784563251-CE14687B-542FBC1A/10/73395122804
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
Changes in v3-v6:
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


